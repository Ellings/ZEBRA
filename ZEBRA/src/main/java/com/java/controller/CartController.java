package com.java.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.CartDTO;
import com.java.service.CartService;

@Controller
public class CartController {
	
	@Autowired CartService cartService;
	
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
	
	/* 장바구니 수량 수정 */
	@PostMapping("/update")
	public String updateCartPOST(CartDTO cart, HttpSession session){	
		cartService.modifyCount(cart);			
		String sessionId = (String) session.getAttribute("sessionId");		
		System.out.println("sessionId : "+sessionId);	
		return "redirect:mypage/cart/"+sessionId;
	}	
	
	/* 장바구니 삭제 */
	@PostMapping("/delete")
	public String cartDelete(CartDTO cart, HttpSession session) {	
		cartService.deleteCart(cart.getCartId());		
		System.out.println("카트 삭제 게시물 번호: "+ cart.getCartId());
		String sessionId = (String) session.getAttribute("sessionId");	
		System.out.println("sessionId : "+sessionId);
		return "redirect:mypage/cart/"+sessionId;
	}	
	
}
