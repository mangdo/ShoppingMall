package com.phonemall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.phonemall.domain.CartVO;
import com.phonemall.domain.CouponUserVO;
import com.phonemall.domain.CouponVO;
import com.phonemall.domain.Criteria;
import com.phonemall.domain.PageDTO;
import com.phonemall.domain.WishListVO;
import com.phonemall.service.CouponService;
import com.phonemall.service.ProductService;
import com.phonemall.service.UserService;
import com.phonemall.service.WishListService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
public class CouponsController {
	
	@Setter(onMethod_=@Autowired)
	private CouponService couponservice;
	
	
	@GetMapping("/myCoupon")
	public String list(Model model,Principal principal) throws ParseException {
		log.info("goto coupon");
		String email = principal.getName();
		
		//get coupons list(coupons can be invalid, but appears as expired or used)
		List<CouponUserVO> list=couponservice.getCouponList(email);
		
		//compare date with end date, if date is overdue, used part will be expired
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date Today = sdf.parse(sdf.format(cal.getTime()));
		
		for (int i = 0; i < list.size(); i++) {
			int compare = Today.compareTo(list.get(i).getEndDate());
			if(compare > 0) {
				list.get(i).setUsed("�Ⱓ ����");
			}
		}
		
		model.addAttribute("list",list);
		log.info(list);
		return "/mypage/myCoupons";
	}
	
	@RequestMapping(value="/searchAndInsertCoupon" , method = {RequestMethod.GET, RequestMethod.POST})
	public String searchAndInsertCoupon(HttpServletResponse response,HttpServletRequest request,String coupon_code,Principal principal,CouponUserVO CouponUservo, Model model,RedirectAttributes rttr) throws ParseException, IOException {

		//search Coupon with coupon_code
        CouponVO couponVO = couponservice.searchCoupon(coupon_code);
		
        
        //if Coupon code is invalidate
        if (couponVO==null) {
        	rttr.addFlashAttribute("msg", "FAIL");
    	    return "redirect:/mypage/myCoupon";
        }
        
		//email
		String user_email = principal.getName();
		
		//search coupon_id
		int coupon_id = couponVO.getCoupon_id();
		
		//today date
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date StartDate = sdf.parse(sdf.format(cal.getTime()));
        //Coupon Start Date + duration = Coupon End Date 
        int duration = couponVO.getDuration();
		cal.add(Calendar.DATE, duration);
		Date EndDate = sdf.parse(sdf.format(cal.getTime()));	
		
		//Set Variables and insert coupon into user_coupon
		CouponUservo.setUser_email(user_email);
		CouponUservo.setCoupon_id(coupon_id);
		CouponUservo.setStartDate(StartDate);
		CouponUservo.setEndDate(EndDate);
		CouponUservo.setUsed("��� ����");
		
		System.out.println(CouponUservo);
		log.info(CouponUservo);
		couponservice.insertCoupon(CouponUservo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
	    return "redirect:/mypage/myCoupon";
	    
	}

}