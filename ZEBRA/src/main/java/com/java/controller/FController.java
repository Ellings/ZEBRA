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
