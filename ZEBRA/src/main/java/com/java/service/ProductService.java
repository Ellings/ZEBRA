package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.OrderDto;
import com.java.dto.ProductDto;

public interface ProductService {

   //=================상품 관리 페이지=========================================
	
	
   //상품 관리 상품 리스트에 상품 전체 가져오기
   HashMap<String, Object> selectAll(int page, String category, String s_word);

   //상품 관리 상품 뷰에 상품 1개 가져오기 
   HashMap<String, Object> selectOne(int pno);

   //상품 관리 상품 1개 등록
   void insertOne(ProductDto pdto);

   //상품 관리 1개 수정
   void updateOne(ProductDto pdto);

   //상품 관리 1개 삭제하기 
   void deleteOne(int pno);

   //========================상품 페이지=============================== 
   
   //상품 페이지에 women 상품 전체 가져오기
   HashMap<String, Object> selectPageAll(int page, String s_word, String sorting, String pcolor);

   //상세 페이지에 상품 1개 가져오기 
   HashMap<String, Object> selectPageOne(int pno);

   //상품 페이지에 ajax 검색 (색상, 가격, 검색 ajax)
   ArrayList<ProductDto> selectSortAll(String s_word, Integer pprice, String sorting,String pcolor);
 
   //상품 페이지에 home 상품 전체 가져오기
   HashMap<String, Object> selectHomeAll(int page);

   //=================주문 관리 페이지===========================================
   //주문 관리 페이지에 주문 전체 가져오기 
   HashMap<String, Object> selectOrderAll(int page, String ordercate, String OSTATUS);

   //주문 관리 페이지에서 주문 하나 가져오기
   HashMap<String, Object> selectOrderOne(int ONO);    

   //주문 관리에서 배송 상태 ajax 
   ArrayList<OrderDto> selectUPAjaxAll(OrderDto odto);

   

   //=================메인 페이지===============================================
   
   //메인 페이지에서 조회수 순을 위한 리스트
   ArrayList<ProductDto> selectphitAll();

   //메인 페이지에서 판매 개수(베스트)순으로 리스트 
   ArrayList<ProductDto> selectBestAll();
   

   

   }

   
      
   

   

   