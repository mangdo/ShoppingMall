package com.phonemall.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.phonemall.domain.CartVO;
import com.phonemall.domain.CouponUserVO;
import com.phonemall.domain.Criteria;
import com.phonemall.domain.PageDTO;
import com.phonemall.domain.PurchaseVO;
import com.phonemall.domain.WishListVO;
import com.phonemall.domain.KakaoPayPurchaseVO;
import com.phonemall.service.KakaoPayService;
import com.phonemall.service.CartService;
import com.phonemall.service.CouponService;
import com.phonemall.service.ProductService;
import com.phonemall.service.PurchaseService;
import com.phonemall.service.UserService;
import com.phonemall.service.WishListService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/purchase/*")
public class CartController {
	
	
	@Setter(onMethod_=@Autowired)
	private CartService cartservice;
		
	@Setter(onMethod_=@Autowired)
	private CouponService couponservice;
	
	@Setter(onMethod_=@Autowired)
	private PurchaseService purchaseservice;
	
	@Setter(onMethod_=@Autowired)
	private KakaoPayService kaKaoPayService;
	
	@PostMapping("/insertCart")
	public String insertCart(CartVO cartVO,Principal principal,HttpServletRequest request,
            RedirectAttributes rttr) {
		
		String email = principal.getName();
		long product_id = cartVO.getProduct_id();
		String color = cartVO.getProduct_color();
		
		//check product is already in cart(parameter: color, product)
		int count = cartservice.readCart(email, product_id,color);
		
		//if product is not in cart
		//else product is already in cart
		if(count == 0) {
			cartVO.setUser_email(email);
			
			//set total_price by multiplying quantity and price
			int total_price = cartVO.getProduct_qty() * cartVO.getProduct_price();
			cartVO.setTotal_price(total_price);
			cartservice.insertCart(cartVO);
			
			//alert message
			rttr.addFlashAttribute("insertmsg", "SUCCESS");
		}
		else {
			rttr.addFlashAttribute("insertmsg", "FAIL");
		}
		//go to previous page
	    String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	
	@RequestMapping(value="/checkout" , method = {RequestMethod.GET, RequestMethod.POST})
	public String tocheckOut(Model model,Principal principal, int discount_value, int coupon_id) {
		String email = principal.getName();
		List<CartVO> list=cartservice.ListCart(email);
		log.info(list);
		int total_money = cartservice.sumTotalMoney(email);
		model.addAttribute("list",list);
		model.addAttribute("total_money",total_money);
		model.addAttribute("discount_value",discount_value);
		model.addAttribute("discount_result",total_money - discount_value);
		model.addAttribute("coupon_id",coupon_id);
		
		return "/purchase/checkout";
	}
	
	@PostMapping("/orderInsert")
	public String insertOrder(Principal principal,PurchaseVO purchaseVO,RedirectAttributes rttr, KakaoPayPurchaseVO kakaoPayPurchaseVO) throws ParseException{
		
		//insert Today into order data
		Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date purchaseDate = sdf.parse(sdf.format(cal.getTime()));
		purchaseVO.setPurchaseDate(purchaseDate);
		
		//use random number to make purchase_id
		 Random rand = new Random();
	     rand.setSeed(System.currentTimeMillis());
	     Long purchase_id = (long) rand.nextInt(100000);
	     purchaseVO.setPurchase_id(purchase_id);
	     
		//insert payment method(not decided)
		purchaseVO.setPaymentMethod("KaKao Pay");
		purchaseservice.insertBuyData(purchaseVO);
		
		// pay in KakaoPay
		kakaoPayPurchaseVO.setPurchase_id(purchase_id);
		kakaoPayPurchaseVO.setUser_email(principal.getName());
		return "redirect:" + kaKaoPayService.kakaoPayReady(kakaoPayPurchaseVO);
		
	}
	
	@RequestMapping("orderComplete")
	public String toOrderComplete(@RequestParam(value = "purchase_id") Long purchase_id, Model model, Principal principal) {
		
		// kakaoPay���� �� ���и� �����Ͽ� ���� �Ϸ��� insert order, cart delete
		purchaseservice.insertCompleteOrder(purchase_id, principal.getName());
		cartservice.deleteAllCart(principal.getName());
		
		List<PurchaseVO> list = purchaseservice.getListById(purchase_id);
		
		PurchaseVO purchaseVO = list.get(0);
		int discount_amount = purchaseVO.getTotal_money()-purchaseVO.getDiscount_result();
		
		//to prevent payment fail, coupon updates not used -> used in this controller payment step
		int coupon_id = purchaseVO.getUsed_coupon();
		String email = principal.getName();
		
		//coupon used part changes into "used" (previously "unused")
		if(coupon_id!=0) {
			couponservice.updateUsedCoupon(email, coupon_id);
		}
		
		model.addAttribute("purchaseList",list);
		model.addAttribute("discount_amount",discount_amount);
		model.addAttribute("orderList",purchaseservice.ListOrder(purchase_id));
		return "/purchase/orderComplete";
	}
	
	
	
	@RequestMapping("/viewCart")
	public String list(Model model,Principal principal,@ModelAttribute(value = "msg") String msg,@RequestParam(value = "couponID_input",defaultValue="0") int couponID_input,@RequestParam(value = "discount_amount",defaultValue="0") int discount_amount,RedirectAttributes rttr,@RequestParam(value = "discount_result",defaultValue="0") int discount_result) {
		log.info("goto cart");
		String email = principal.getName();
		List<CartVO> list=cartservice.ListCart(email);
		
		//show products in cart
		if(list.size()==0) {
			model.addAttribute("total_money",0);
			model.addAttribute("emptyCart","��ٱ��ϰ� ������ϴ�");
			model.addAttribute("discount_result",0);
			List<CouponUserVO> coupon_list=couponservice.getValidList(email);
			model.addAttribute("coupon_list",coupon_list);
			return "/purchase/viewCart";
			
		}
		
		//count total money
		//logic is (total money = previous total - discount(coupon amount))
		int total_money = cartservice.sumTotalMoney(email);
		model.addAttribute("total_money",total_money);
		model.addAttribute("discount",discount_amount);
		model.addAttribute("couponID_input", couponID_input);
		if(discount_amount==0) {
			model.addAttribute("discount_result",total_money);
		}else {
			model.addAttribute("discount_result",discount_result);
		}
		
		//show coupon list(only valid coupons)
		model.addAttribute("list",list);
		List<CouponUserVO> coupon_list=couponservice.getValidList(email);
		model.addAttribute("coupon_list",coupon_list);
		return "/purchase/viewCart";
	}
	
	
	@PostMapping("/couponApply")
	public String apply(Model model,HttpServletResponse response,HttpServletRequest request,RedirectAttributes rttr,Principal principal,int price_limit,int CouponID, int discount) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView("/purchase/viewCart"));
		
		int discount_amount = discount;
		String email = principal.getName();
		
		//total amount of products in cart
		int total_money = cartservice.sumTotalMoney(email); 
		
		//reset discount result
		int discount_result = 0;
		
		//logic: if total money is zero, do nothing
		if(total_money == 0) {
			return "redirect:/purchase/viewCart";	
		}
		
		//if total money is less than price limit, send alert and notify can't use coupon
		//else discount apply, amount is rounded
		if(total_money < price_limit) {
			rttr.addFlashAttribute("couponmsg","FAIL");
			return "redirect:/purchase/viewCart";	
		}
		else {
			if(discount_amount<=100) {
				discount_result = (int) Math.round(total_money - (total_money*(discount * 0.01)));
				discount_amount = (int) Math.round(total_money*(discount * 0.01));
			}
			
			else {
				discount_result = total_money - discount;
			}
			int couponID_input = CouponID;
			
			//convey needed values to complete order by redirect Attribute
			rttr.addAttribute("discount_result",discount_result);
			rttr.addAttribute("discount_amount",discount_amount);
			rttr.addAttribute("couponID_input",couponID_input);
			rttr.addFlashAttribute("couponmsg","SUCCESS");
			return "redirect:/purchase/viewCart";	
		}
	}
	
	
	@PostMapping("/deleteCart")
	@ResponseBody
	public ModelAndView deleteWishList(CartVO cartVO,Principal principal) {
		String email = principal.getName();

		cartVO.setUser_email(email);
		cartservice.deleteCart(cartVO);		
		
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView("/purchase/viewCart"));
		return mav;	
	}
	
	@RequestMapping("/cartPreview")
	@ResponseBody
	public Map<String, Object> cartPreviewlist(Principal principal) {
		log.info("cart preview");

		String email = principal.getName();
		List<CartVO> list=cartservice.ListCart(email);
		
		if(list.size()==0) {
			log.info("empty cart");
			return null;
		}
		int total_money = cartservice.sumTotalMoney(email);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total_money",total_money);
		map.put("list", list);
		
		return map;
	}
	
}
