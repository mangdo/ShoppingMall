package com.phonemall.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.security.access.prepost.PreAuthorize;
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
import com.phonemall.service.S3Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/notice/*")
@RequiredArgsConstructor
@Controller
public class NoticeController {
	
	private final NoticeService service;
	private final S3Service s3service;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/register")
	public String toNoticePage() {
		log.info("Register Notice Form");
		return "/notice/register";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
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
				
		// make folder
		String uploadFolderPath = getFolder();

		UUID uuid = UUID.randomUUID();
		String uploadImageName = uuid.toString()+"_"+mainImage.getOriginalFilename();
		try {
			// original image save
			String s3Path = uploadFolderPath+"/"+uploadImageName;
			s3service.uploadFile(mainImage, s3Path);

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
	public String list(@RequestParam(required=false, defaultValue="1") Integer page, Model model) {
		log.info("Notice List");
		Criteria cri = new Criteria(page,6);
		int total = service.getTotal();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("notice",service.getList(cri));
		return "/notice/list";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
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
			// delete original image on s3
			s3service.deleteFile(image.getImage_uploadPath()+"/"+image.getImage_uuid()+"_"+image.getImage_name());
						
		}catch(Exception e) {
			log.error("delete file error"+e.getMessage());
		}
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/modify")
	public String modify(@RequestParam("notice_id") Long notice_id, Model model) {
		
		log.info("modify notice form");
		model.addAttribute("notice",service.get(notice_id));
		return "/notice/modify";
		
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
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
