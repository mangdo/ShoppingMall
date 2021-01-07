package com.phonemall.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.phonemall.domain.Criteria;
import com.phonemall.domain.PageDTO;
import com.phonemall.domain.ProductColorListVO;
import com.phonemall.domain.ProductImageVO;
import com.phonemall.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;
//import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	
	@Setter(onMethod_=@Autowired)
	private ProductService service;
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		
		log.info("/list");
		model.addAttribute("list",service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		return "/product/list";
	}
	
	@PostMapping("/register")
	public String register(ProductVO product, RedirectAttributes rttr, MultipartFile[] uploadImage) {
		
		
		
		// 이미지 파일저장
		String uploadFolder = "c:\\phoneMall\\upload";
		
		// make folder
		File uploadPath = new File(uploadFolder, getFolder());
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		List<ProductImageVO> imagelist = new ArrayList<>();
		for(MultipartFile multipartFile : uploadImage) {
			//log.info("upload file Name: " + multipartFile.getOriginalFilename());
			
			UUID uuid = UUID.randomUUID();
			String uploadImageName = uuid.toString()+"_"+multipartFile.getOriginalFilename();
			
			try {
				// 원본이미지 저장
				File saveImage = new File(uploadPath, uploadImageName);
				multipartFile.transferTo(saveImage);
				
				// 섬네일 이미지 생성, 저장
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadImageName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 270, 300);
				thumbnail.close();
				log.info(new ProductImageVO(uuid.toString(), uploadPath.toString(), uploadImageName, "main_image",product.getProduct_id()));
				
				// productImageVO생성
				imagelist.add(new ProductImageVO(uuid.toString(), uploadPath.toString(), multipartFile.getOriginalFilename() , "main_image",product.getProduct_id()));

			}catch(Exception e) {
				log.error(e.getMessage());
				log.error(e.toString());
			}
		}
		product.setProduct_imageList(imagelist);
		log.info("regiter : "+ product);
		service.register(product);
		rttr.addFlashAttribute("result", product.getProduct_id());
		//새롭게 등록된 게시물의 번호를 같이 전달하기위해 RedirectAttributes사용
		
		//if(product.getProduct_colorList() != null) {
		//	product.getProduct_colorList().forEach(colorList->log.info(colorList));
		//}

		return "redirect:/product/list";
		//등록작업이 끝난후 다시 목록화면으로 이동
	}
	
	// 년/월/일 폴더 생성 함수
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	@GetMapping({"/get"})
	public String get(@RequestParam("product_id") Long product_id, Model model) {
		
		log.info("/get");
		model.addAttribute("product",service.get(product_id));
		return "/product/get";
		
	}
	
	@GetMapping({"/modify"})
	public String modify(@RequestParam("product_id") Long product_id, Model model) {
		
		log.info("/modify");
		model.addAttribute("product",service.get(product_id));
		return "/product/modify";
		
	}
	
	@PostMapping("/modify")
	public String modify(ProductVO product, RedirectAttributes rttr) {
		log.info("modify : "+product);
		
		if(service.modify(product)) {
			rttr.addFlashAttribute("result","succes");
		}
		
		return "redirect:/product/list";

	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("product_id") Long product_id, RedirectAttributes rttr) {
		log.info("remove product "+product_id);
		if(service.remove(product_id)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/product/list";
	}
	
	@GetMapping("/register")
	public String register() {
		return "/product/register";
	}
	
	@GetMapping(value="/getColorList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductColorListVO>> getAttachList(Long product_id){
		
		log.info("getColorList " + product_id);
		return new ResponseEntity<>(service.getColorList(product_id),HttpStatus.OK);
	}
	
}
