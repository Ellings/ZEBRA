package com.java.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
