package com.java.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.CartDTO;
import com.java.dto.FaqDto;
import com.java.dto.MemberDto;
import com.java.mapper.CartMapper;
import com.java.service.CartService;

@Controller
public class FController {
	@Autowired CartMapper cartMapper;
	@Autowired CartService cartService;
	@Autowired HttpSession session;

	@RequestMapping("/payment/checkout")
	public String checkout() {
		return "payment/checkout";
	}
	@RequestMapping("/member/register")
	public String register() {
		return "member/register";
	}
	
	@PostMapping("mypage/cart/add")
	@ResponseBody
	public String addCartPOST(CartDTO cart) {
		// 카트 등록		
		int result = cartService.addCart(cart);
		return result + "";
	}	
	
	// 장바구니 정보 리스트
	@GetMapping("mypage/cart/{MID}")
	public String cartPageGET(@PathVariable("MID") String MID, Model model) {	
		ArrayList<CartDTO> cartInfo = cartService.getCartList(MID);
		model.addAttribute("cartInfo",cartInfo);
		System.out.println("cartInfo : "+cartService.getCartList(MID));
		return "mypage/cart";
	}
	
	/* 장바구니 삭제 */
	@PostMapping("mypage/cartDelete")
	@ResponseBody
	public String cartDelete(CartDTO cdto) {		
		System.out.println("카트 삭제 게시물 번호: "+ cdto.getCartId());
		cartService.deleteCart(cdto.getCartId());
		return "success";	
	}	
	
	/* 장바구니 수량 수정 */
	@PostMapping("mypage/cart/update")
	public String updateCartPOST(CartDTO cart){	
		cartService.modifyCount(cart);		
		System.out.println("MID : "+cart.getMID());
		return "redirect:mypage/cart/"+cart.getMID();
	}
	
	
	@RequestMapping("/mypage/wishlist")
	public String wishlist() {
		return "mypage/wishlist";
	}
	@RequestMapping("/mypage/myaccount")
	public String myaccount(MemberDto member, Model model) {
		
		/* member.addAttribute("mdto",member); */
		return "mypage/myaccount";
	}
	@RequestMapping("/mypage/orderhistory")
	public String orderhistory() {
		if (session.getAttribute("sessionId")== null) {
			return "member/login";
		}
		return "mypage/orderhistory";
	}
	

	
}
