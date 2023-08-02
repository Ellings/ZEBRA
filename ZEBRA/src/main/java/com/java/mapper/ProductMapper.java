package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.OrderDto;
import com.java.dto.ProductDto;

@Mapper
public interface ProductMapper {

   //상품 관리에서 상품 리스트 상품 전체 가져오기
   ArrayList<ProductDto> selectAll(int startRow, int endRow, String category, String s_word);

   //상품 관리에서 상품 뷰 상품 1개 가져오기 
   ProductDto selectOne(int pno);

   //상품 관리 상품 이전 상품
   ProductDto selectPreOne(int pno);
   
   //상품 관리 상품 다음 상품
   ProductDto selectNextOne(int pno);
   //상품 관리 상품 전체 개수 
   int selectListCount(String category, String s_word);


   //상품 관리 상품 1개 등록하기 
   void insertOne(ProductDto pdto);

   //상품 관리 상품 1개 수정하기 
   void updateOne(ProductDto pdto);

   //상품 관리 상품 1개 삭제하기 
   void deleteOne(int pno);

   //==============================여기부터 상품 페이지==============================================
   //상품 페이지에서 women 상품 전체 가져오기
   ArrayList<ProductDto> selectPageAll(int startRow, int endRow, String s_word, String sorting, String pcolor);

   //상세 페이지에서 상품 1개 가져오기 
   ProductDto selectPageOne(int pno);

   //상품 관리 상품 조회수 1 증가 
   void updatePhitUp(int pno);


   //상품 페이지에 ajax 검색 (색상, 가격, 검색 ajax)
   ArrayList<ProductDto> selectSortAll(String s_word, Integer pprice, String sorting,String pcolor);
   
   //상품 페이지에서 home 상품 전체 가져오기 
   ArrayList<ProductDto> selectHomeAll(int startRow, int endRow);

   //상품 페이지에서 상품  총 개수를 반환하기 위한 함수 (women)
   int selectproduct_page_listCount(String s_word, String pcolor, String sorting);
   //상품 페이지에서 상품  총 개수를 반환하기 위한 함수(home)
   int selectproduct_page_listCounthome();
   

   
   
   //===================================주문 관리===============================================
   //주문 관리에서 주문 총 개수를 반환하기 위한 함수
   int selectorder_page_listCount(String ordercate, String OSTATUS);

   //주문 관리에서 주문 리스트 주문 전체 가져오기 
   ArrayList<ProductDto> selectOrderAll(int startRow, int endRow, String ordercate, String OSTATUS);

   //주문 관리 주문 1개 가져오기
   OrderDto selectOrderOne(int ONO);

   //주문 관리에서 배송 상태 ajax 
   ArrayList<OrderDto> selectUPAjaxAll(OrderDto odto);
   
   


   //===================================주문 관리===============================================
   //메인 페이지에서 조회수를 위한 리스트 
   ArrayList<ProductDto> selectphitAll();
   
   //메인 페이지에서 베스트순을 위한 리스트 
   ArrayList<ProductDto> selectBestAll();





}