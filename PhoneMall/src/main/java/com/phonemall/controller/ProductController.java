package com.phonemall.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phonemall.domain.ProductVO;
import com.amazonaws.util.IOUtils;
import com.phonemall.domain.Criteria;
import com.phonemall.domain.PageDTO;
import com.phonemall.domain.ProductColorListVO;
import com.phonemall.domain.ProductImageVO;
import com.phonemall.service.ProductService;
import com.phonemall.service.S3Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/product/*")
@RequiredArgsConstructor
public class ProductController {
	
	private final ProductService service;
	private final S3Service s3service;
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		
		log.info("/list"+cri);
		model.addAttribute("list",service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		// recent product
		model.addAttribute("recentList", service.getRecentList(3));
		
		return "/product/list";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/register")
	public String register() {
		return "/product/register";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/register")
	public String register(ProductVO product, RedirectAttributes rttr, MultipartFile mainImage, MultipartFile[] subImage) {
		
		List<ProductImageVO> imagelist = new ArrayList<>();
		log.info(product.getProduct_id());
		if(mainImage!=null && !mainImage.isEmpty()) {
			imageFolderSave(mainImage, imagelist, "mainImage");
		}
		
		for(MultipartFile multipartFile : subImage) {
			if(!multipartFile.isEmpty()) {
				imageFolderSave(multipartFile, imagelist, "subImage");
			}
		}
		
		product.setProduct_imageList(imagelist);
		log.info("regiter : "+ product);
		service.register(product);
		
		rttr.addFlashAttribute("result", product.getProduct_id());
		// use RedirectAttributes to transmit with new product id
		
		return "redirect:/product/list";
	}
	
	
	// year/month/day folder create
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	
	private void imageFolderSave(MultipartFile image, List<ProductImageVO> imagelist, String imageType) {
		
		// make folder
		String uploadFolderPath = getFolder();

		UUID uuid = UUID.randomUUID();
		String uploadImageName = uuid.toString()+"_"+image.getOriginalFilename();
		
		try {
			String s3Path = uploadFolderPath+"/"+uploadImageName;
			s3service.uploadFile(image, s3Path);
			
			if(imageType.equals("mainImage")) {
				
				String thumbs3Path = uploadFolderPath+"/s_"+uploadImageName;
				s3service.uploadThumbFile(image, thumbs3Path);
			}
			
			// productImageVO create for DB
			imagelist.add(new ProductImageVO(uuid.toString(), uploadFolderPath.toString().replace("\\", "/"), image.getOriginalFilename(), imageType, null));

		}catch(Exception e){log.error(e.getMessage());}
	}
	
	
	@GetMapping({"/get"})
	public String get(@RequestParam("product_id") Long product_id, Model model) {
		
		log.info("/get");
		ProductVO vo = service.get(product_id);
		model.addAttribute("product",vo);
		model.addAttribute("relatedList", service.getRelatedList(product_id, vo.getProduct_brand()));
		
		return "/product/get";
		
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping({"/modify"})
	public String modify(@RequestParam("product_id") Long product_id, Model model) {
		
		log.info("/modify");
		model.addAttribute("product",service.get(product_id));
		return "/product/modify";
		
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modify")
	public String modify(ProductVO product, RedirectAttributes rttr, MultipartFile newMainImage, MultipartFile[] newSubImage) {
		log.info("modify : "+product);
		
		List<ProductImageVO> newImagelist = new ArrayList<>();
		
		// original image list
		product.getProduct_imageList().forEach(image->{
			if(image.getImage_type().contains("deleteMain")) {
				// deleted main image in server folder
				deleteFile(image);
				
			}else if(image.getImage_type().contains("deleteSub")) {
				// deleted sub image in server folder
				deleteFile(image);
				
			}else { // if not deleted, keep data
				newImagelist.add(image);
			}
		});
		
		if(newMainImage!=null && !newMainImage.isEmpty()) 
			imageFolderSave(newMainImage, newImagelist, "mainImage");
		
		for(MultipartFile multipartFile : newSubImage) {
			if(!multipartFile.isEmpty()) {
				imageFolderSave(multipartFile, newImagelist, "subImage");
			}
		}
				
		product.setProduct_imageList(newImagelist);
		
		if(service.modify(product)) 
			rttr.addFlashAttribute("result","succes");
		
		return "redirect:/product/list";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/remove")
	public String remove(@RequestParam("product_id") Long product_id, RedirectAttributes rttr) {
		log.info("remove product "+product_id);
		List<ProductImageVO> imageList = service.getImageList(product_id);
		if(service.remove(product_id)) {
			
			// delete image Files
			if(imageList==null || imageList.size()==0) 
				return "redirect:/product/list";
			
			imageList.forEach(image->{
				deleteFile(image);
			});
				
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/product/list";
	}
	
	
	private void deleteFile(ProductImageVO image) {
		log.info("delete imageFile");
		try {
			// delete original image on s3
			s3service.deleteFile(image.getImage_uploadPath()+"/"+image.getImage_uuid()+"_"+image.getImage_name());
			
			// delete thumbnail image on s3
			if(image.getImage_type().contains("mainImage")) {
				s3service.deleteFile(image.getImage_uploadPath()+"/s_"+image.getImage_uuid()+"_"+image.getImage_name());
			}
		}catch(Exception e) {
			log.error("delete file error"+e.getMessage());
		}
	}

	
	@GetMapping(value="/getColorList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductColorListVO>> getAttachList(Long product_id){
		
		log.info("getColorList " + product_id);
		return new ResponseEntity<>(service.getColorList(product_id),HttpStatus.OK);
	}
	
	
	// image data transmit
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("fileName: "+ fileName);
		
		//File file = new File("c:\\phoneMall\\upload\\"+fileName);
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			// MIME regardless of extention
			//header.add("Content-Type", Files.probeContentType(file.toPath()));
			//result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		
			// read from S3
			URL url = new URL(s3service.getFileURL(fileName));
			HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
			InputStream fileIS = urlConn.getInputStream();
			
			// MIME regardless of extention
			header.add("Content-Type", URLConnection.guessContentTypeFromStream(fileIS));
			
			result = new ResponseEntity<>(IOUtils.toByteArray(fileIS), header, HttpStatus.OK);
		
		} catch(IOException e) {
			log.info("wrong file path");
		}
		return result;
	}
	
	// quickViewModal JSON data transmit
	@GetMapping("/quickView")
	@ResponseBody
	public ProductVO getQuickView(Long product_id) {
		
		log.info("quick View data, " + product_id);
		return service.getQuickView(product_id);
	}
}
