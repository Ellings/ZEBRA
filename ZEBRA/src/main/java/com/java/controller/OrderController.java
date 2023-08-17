package com.java.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.dto.CartDTO;
import com.java.dto.OrderDto;
import com.java.dto.OrderPageDTO;
import com.java.service.CartService;
import com.java.service.MemberService;
import com.java.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CartService cartService;
	
	
	
	@GetMapping("/payment/payment/{MID}")
	public String payment(@PathVariable("MID") String MID, Model model) {
		ArrayList<CartDTO> cartInfo = cartService.getCartList(MID);
		model.addAttribute("MID",MID);
		model.addAttribute("cartInfo",cartInfo);
		System.out.println("cartInfo : "+cartService.getCartList(MID));
		return "payment/payment";
	}
	
	//수령자 정보 저장하기
	@PostMapping("/payment/payment/{MID}")
	public String payment(OrderDto odto, Model model) {
		
		 //핸드폰 번호 가져오기
		 String OHP1 = odto.getOHP1();
		 String OHP2 = odto.getOHP2();
		 String OHP3 = odto.getOHP3();
		 String OHP = "";
		 OHP = OHP1+"-"+OHP2+"-"+OHP3;
		 odto.setOHP(OHP);
		 
		 
		 //유선번호 가져오기
		 String ORHP1 = odto.getORHP1();
		 String ORHP2 = odto.getORHP2();
		 String ORHP3 = odto.getORHP3();

		 String ORHP = ORHP1+"-"+ORHP2+"-"+ORHP3;
		 odto.setORHP(ORHP);
		 
		 //주소 가져오기
		 String OZIP = odto.getOZIP();
		 String OADDR1 = odto.getOADDR1();
		 String OADDR2 = odto.getOADDR2();
		 String OADDR = OZIP+OADDR1+OADDR2;
		 odto.setOADDR(OADDR);
		 
		 return "payment/payment";
	}
	

	@RequestMapping("/payment/confirmation")
	public String confirmation(OrderDto odto, Model model, String MID) {
		
		System.out.println("MID : "+MID);
		orderService.insertOne(odto);
		System.out.println("ono getONO : "+ odto.getONO());
		OrderDto odto1 = orderService.selectOne(odto.getONO());
		model.addAttribute("odto1", odto1);
		model.addAttribute("MID",MID);
		odto.setMID(MID);
		System.out.println("odto에 저장된 MID 값: " + odto.getMID());
		
		ArrayList<CartDTO> cartInfo = cartService.getCartList(MID);
		
		System.out.println(cartInfo.get(0).getMID());
		System.out.println(cartInfo.get(0).getCartId());
		
		CartDTO cdto = new CartDTO();
		
		// MID와 cartID를 통해 ONO를 지정해주는 for 문
		for (int i = 0; i < cartInfo.size(); i++) {
		cdto.setONO(odto.getONO());
		cdto.setMID(cartInfo.get(i).getMID());
		cdto.setCartId(cartInfo.get(i).getCartId());
		cartService.updateONO(cdto);
		}
		
		model.addAttribute("MID",MID);
		model.addAttribute("cartInfo",cartInfo);
		System.out.println("cartInfo : "+cartService.getCartList(MID));
		
		 
	return "payment/confirmation"; 
	}
	 	 
}