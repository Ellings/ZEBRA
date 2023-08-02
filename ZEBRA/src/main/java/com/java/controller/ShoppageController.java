package com.java.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.ProductDto;
import com.java.service.ProductService;

@Controller
public class ShoppageController {

   @Autowired
   ProductService productService;
   
 //상품을 검색하는 검색 ajax 
   @PostMapping("/product/sortingAjax")
   @ResponseBody //ajax를 사용하기 위한 것. 데이터를 넘겨주는 어노테이션이다. 
   public ArrayList<ProductDto> sortingAjax(
      String s_word, Integer pprice, String sorting, String pcolor, Model model){
	  System.out.println("s_word" + s_word);
	  System.out.println("sorting" +  sorting);
	  System.out.println("pcolor" +  pcolor);
	  
	  
      
     ArrayList<ProductDto> list = productService.selectSortAll(s_word, pprice, sorting,pcolor);
    
      
      //검색어에 맞는 상품들 가져오기 
      return list;
   }
   

   
   
   //상품 페이지에 상품 전체 가져오기  -women-
   @RequestMapping("/product/product_page")
   public String product_page(@RequestParam(defaultValue = "1") int page, 
      String s_word, String sorting, String pcolor, Model model) {
	   
	  
//      System.out.println("ShoppageController product_page sorting : " + sorting);
      //상품 페이지의 디폴트 값을 1로 해서
      //상품 페이지에 상품 전체 가져오기
      HashMap<String, Object> map = productService.selectPageAll(page,s_word,sorting,pcolor); 
      ArrayList<ProductDto> list1 = productService.selectBestAll(); //베스트
      //selectPageAll 상품 페이지에 상품 데이터를 전체 가져와주기
      model.addAttribute("list", map.get("list")); //상품 목록을 담고 있는 모델의 속성 
      model.addAttribute("list1", map.get("list1")); //베스트 순
      model.addAttribute("page" ,map.get("page")); //상품 목록의 번호를 나타냄 
      model.addAttribute("product_page_listCount" ,map.get("product_page_listCount"));//상품 목록 전체 개수를 나타내는 모델의 속성 
      model.addAttribute("startPage" ,map.get("startPage"));//시작 페이지 
      model.addAttribute("endPage" ,map.get("endPage")); //끝 페이지 
      model.addAttribute("maxPage" ,map.get("maxPage")); //상품 최대 페이지 수 
      model.addAttribute("sorting" ,map.get("sorting")); //상품의 카테고리를 나타냄 특정 카테고리의 상품 목록을 읽기 위해 준비해 둔 것 
      model.addAttribute("pcolor" ,map.get("pcolor")); //상품의 카테고리를 나타냄 특정 카테고리의 상품 목록을 읽기 위해 준비해 둔 것 
      model.addAttribute("s_word" ,map.get("s_word")); //사용자가 상품 목록을 검색하면 그 검색어에 맞는 상품들이 나오는 것 
//      System.out.println("product_page sorting :" + model.getAttribute(sorting));
//      System.out.println("product_page page :" + model.addAttribute(page));
      
      return "product/product_page";
   }//product_page
   
   
   //상품 페이지 상품 전체 가져오기 -home-
   @RequestMapping("/product/product_pagehome")
   public String product_pagehome(@RequestParam(defaultValue = "1") int page, 
		    Model model) {
	   
	  
      //상품 페이지에 상품 전체 가져오기
      HashMap<String, Object> map = productService.selectHomeAll(page);   
      ArrayList<ProductDto> list1 = productService.selectBestAll(); //베스트 
      //selectPageAll 상품 페이지에 상품 데이터를 전체 가져와주기
      model.addAttribute("list", map.get("list")); //상품 목록을 담고 있는 모델의 속성 
      model.addAttribute("list1", map.get("list1")); //베스트 
      model.addAttribute("page" ,map.get("page")); //상품 목록의 번호를 나타냄 
      model.addAttribute("product_page_listCounthome" ,map.get("product_page_listCounthome"));//상품 목록 전체 개수를 나타내는 모델의 속성 
      model.addAttribute("startPage" ,map.get("startPage"));//시작 페이지 
      model.addAttribute("endPage" ,map.get("endPage")); //끝 페이지 
      model.addAttribute("maxPage" ,map.get("maxPage")); //상품 최대 페이지 수 
   
//      System.out.println("product_page sorting :" + model.getAttribute(sorting));
//      System.out.println("product_page page :" + model.addAttribute(page));
      
      return "product/product_pagehome";
   }//product_page

   //메인 페이지에서 조회수 순
	@RequestMapping("/layout/index")
	public String index(@RequestParam(defaultValue = "none") String resultCode,
			Model model) {
		ArrayList<ProductDto> list = productService.selectphitAll();
		ArrayList<ProductDto> list1 = productService.selectBestAll();
		
		model.addAttribute("list",list);
		model.addAttribute("list1",list1);
		model.addAttribute("resultCode",resultCode);
		return "layout/index";	
	}

   
}