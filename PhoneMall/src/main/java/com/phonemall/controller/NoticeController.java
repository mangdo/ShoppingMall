package com.phonemall.controller;


import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.NoticeImageVO;
import com.phonemall.domain.NoticeVO;
import com.phonemall.domain.PageDTO;
import com.phonemall.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/notice/*")
@Controller
@Log4j
@AllArgsConstructor
public class NoticeController {
	
	private NoticeService service;
	
	@GetMapping("/register")
	public String toNoticePage() {
		log.info("Register Notice Form");
		return "/notice/register";
	}
	
	@PostMapping("/register")
	public String regitser(NoticeVO notice, RedirectAttributes rttr, MultipartFile noticeImage) {
				
		if(noticeImage!=null && !noticeImage.isEmpty()) {
			NoticeImageVO image = imageFolderSave(noticeImage);
			log.info("Register Notice image "+ image);
			notice.setNotice_image(image);
		}
		
		service.register(notice);
		rttr.addFlashAttribute("result", notice.getNotice_id());
		return "redirect:/notice/list";
	}
	
	// year/month/day folder create
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	
	private NoticeImageVO imageFolderSave(MultipartFile mainImage) {
		
		String uploadFolder = "c:\\phoneMall\\upload";
		
		// make folder
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		UUID uuid = UUID.randomUUID();
		String uploadImageName = uuid.toString()+"_"+mainImage.getOriginalFilename();
		try {
			// original image save
			File saveImage = new File(uploadPath, uploadImageName);
			mainImage.transferTo(saveImage);

			// productImageVO create
			return new NoticeImageVO(uuid.toString(), uploadFolderPath.toString().replace("\\", "/"), mainImage.getOriginalFilename(), null);

		}catch(Exception e){
			log.error(e.getMessage());
			return null;
		}
	}
		
		
	@GetMapping("/get")
	public String get(@RequestParam("notice_id") Long notice_id, Model model) {
		log.info("Get Notice");
		model.addAttribute("notice",service.get(notice_id));
		return "/notice/get";
	}
	
	@GetMapping("/list")
	public String list(@RequestParam(required=true,defaultValue="1") Integer page, Model model) {
		log.info("Notice List");
		Criteria cri = new Criteria(page,6);
		int total = service.getTotal();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("notice",service.getList(cri));
		return "/notice/list";
	}
	
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/remove")
	public String remove(@RequestParam("notice_id") Long notice_id, RedirectAttributes rttr) {
		log.info("remove notice "+notice_id);
		NoticeImageVO image = service.getImage(notice_id);
		if(service.remove(notice_id)){
			// delete image Files
			
			log.info("image ?, "+image);
			if(image==null) 
				return "redirect:/notice/list";
			deleteFile(image);
		}
				
		rttr.addFlashAttribute("result","success");
		return "redirect:/notice/list";
	}
	
	private void deleteFile(NoticeImageVO image) {
		log.info("delete imageFile");
		try {
			Path file = Paths.get("C:\\phoneMall\\upload\\"+
					image.getImage_uploadPath().replace("/", "\\")+"\\"+image.getImage_uuid()+"_"+image.getImage_name());
			String path = "C:\\phoneMall\\upload\\"+
					image.getImage_uploadPath().replace("/", "\\")+"\\"+image.getImage_uuid()+"_"+image.getImage_name();
			log.info(path);
			Files.deleteIfExists(file);
		}catch(Exception e) {
			log.error("delete file error"+e.getMessage());
		}
	}
	
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/modify")
	public String modify(@RequestParam("notice_id") Long notice_id, Model model) {
		
		log.info("modify notice form");
		model.addAttribute("notice",service.get(notice_id));
		return "/notice/modify";
		
	}
	
	@PostMapping("/modify")
	public String modify(RedirectAttributes rttr, NoticeVO notice, MultipartFile noticeImage) {
		log.info("modify notice : "+notice);
		
		if(noticeImage!=null && !noticeImage.isEmpty()) {
			
			// delete origin image
			NoticeImageVO originImage = service.getImage(notice.getNotice_id());
			if(originImage != null) {
				log.info("origin notice iamge , "+originImage);
				deleteFile(originImage);
			}
			// update new image
			NoticeImageVO image = imageFolderSave(noticeImage);
			log.info("Register new Notice image "+ image);
			notice.setNotice_image(image);
		}
		
		if(service.modify(notice)) {
			rttr.addFlashAttribute("result","succes");
		}
		
		return "redirect:/notice/list";
	}
	
}
