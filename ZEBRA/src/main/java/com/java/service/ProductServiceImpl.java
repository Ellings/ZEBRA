package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.java.dto.OrderDto;
import com.java.dto.ProductDto;
import com.java.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService{

   @Autowired
   ProductMapper productMapper;
   
   @Override//상품 관리 상품 리스트 상품 전체 가져오기
   public HashMap<String, Object> selectAll(int page, String category, String s_word) {
      
      HashMap<String, Object> map = new HashMap<>();
      //게시글 전체개수
      int listCount = productMapper.selectListCount(category, s_word);
      System.out.println("ProductServiceImpl listCount : " + listCount);;
      //최대페이지
      int maxPage = (int)Math.ceil((double)listCount/10); // 26/10 3개page
      int startPage = (int)((page-1)/10)*10 + 1; //1
      int endPage = startPage+10-1;
      int startRow = (page-1)*10+1;  //1page -> 1-10, 2page -> 11-20
      int endRow = startRow+10-1;
      //endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
      if(endPage>maxPage) endPage=maxPage;
      
   
      ArrayList<ProductDto> list = productMapper.selectAll(startRow, endRow, category,s_word);
      map.put("list", list);
      map.put("listCount", listCount);
      map.put("maxPage", maxPage);
      map.put("startPage", startPage);
      map.put("endPage", endPage);
      map.put("page", page);
      map.put("category", category);
      map.put("s_word", s_word);
      
      return map;
   }
   

   @Override//상품 관리 상품 뷰에서 상품 1개 가져오기
   public HashMap<String, Object> selectOne(int pno) {
      
      HashMap<String, Object> map = new HashMap<>();
      
      
      // 게시물 1개 가져오기 + 이전 게시물, 다음 게시물 가져오기 
      ProductDto preDto = productMapper.selectPreOne(pno);
      ProductDto pdto = productMapper.selectOne(pno);
      ProductDto nextDto = productMapper.selectNextOne(pno);
      map.put("prevDto", preDto);
      map.put("nextDto", nextDto);
      map.put("pdto", pdto);
      return map;
   }

   
   @Override //상품 관리 상품 등록 게시물 1개 저장
   public void insertOne(ProductDto pdto) {
      // 게시물 1개 저장
      productMapper.insertOne(pdto);
      
   }

   @Override //상품 관리 상품 수정 게시물 1개 수정하기 
   public void updateOne(ProductDto pdto) {
      // 게시물 1개 수정하기 
      productMapper.updateOne(pdto);
      
   }


   @Override //상품 관리 상품 삭제 게시물 1개 삭제하기 
   public void deleteOne(int pno) {
      // 게시물 1개 삭제하기
      productMapper.deleteOne(pno);
      
   }

    //==========================여기부터 상품 페이지===========================================
   
   @Override //상품 페이지에 상품 전체 가져오기
   public HashMap<String, Object> selectPageAll(int page, String s_word, String sorting,String pcolor) {
      //상품 페이지에 상품 전체 가져오기
      //결과를 담을 객체를 생성하고 이후 조회된 상품 리스트, 페이지 정보 등을 객체에 저장하여 반환 
	  HashMap<String, Object> map = new HashMap<>();
      //상품 페이지에서 넘버링 
	  //상품의 총 개수를 데이터 베이스로부터 조회. 
	  //productMapper는 데이터베이스와 상호작용하는 데이터 메퍼 클래스로 추정된다. 
	  //selectListCount는 해당 카테고리와 검색어를 기준으로 상품의 총 개수를 반환하는 함수
      int product_page_listCount = productMapper.selectproduct_page_listCount(s_word, pcolor, sorting);
      System.out.println("ProductServiceImpl product_page_listCount : " + product_page_listCount);
           
      //전체 상품 개수를 페이지 당 9개씩 보여줄 때 필요한 전체 페이지 수를 계산하기 
      int maxPage = (int)Math.ceil((double)product_page_listCount/9); // 67/9 8개 page
      int startPage = (int)((page-1)/9)*9 + 1; //현재 페이지에 해당하는 시작 페이지를 계산하기. 
      //페이지 당 9개씩 보여줄 때 현재 페이지의 시작 페이지가 된다. 
      //예를 들어 페이지가 1일 경우 시작페이지는 1이 된다. 
      
      //시작 페이지로부터 10개의 페이지를 더한 후 1을 빼서 현재 페이지 범위에서의 끝 페이지를 계산
      //예를 들어 시작 페이지가 1이라면 마지막 페이지는 10이 된다. 
      int endPage = startPage+10-1;
      
      //현재 페이지에 해당하는 시작 레코드 번호를 계산하기
      //페이지당 9개씩 보여줄 때 해당 페이지의 첫 번째 상품의 인덱스를 구하기 
      //예를 들어 페이지가 1일 경우에 startRow는 1이 된다. 
      int startRow = (page-1)*9+1;  //1page -> 1-9, 2page -> 10-18
      
      //시작 레코드 번호로 부터 9개의 상품을 가져올 때 마지막 상품의 인덱스를 계산
      //시작 startRow가 1이라면 endRow는 9가 된다.
      int endRow = startRow+9-1;
      
      //endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
      if(endPage>maxPage) endPage=maxPage;
      
      ArrayList<ProductDto> list1 = productMapper.selectBestAll();
      ArrayList<ProductDto> list = productMapper.selectPageAll(startRow, endRow, s_word, pcolor, sorting);
      map.put("list", list);
      map.put("list1", list1);
      map.put("product_page_listCount", product_page_listCount);
      map.put("maxPage", maxPage);
      map.put("startPage", startPage);
      map.put("endPage", endPage);
      map.put("page", page);
      map.put("s_word", s_word);
      map.put("pcolor", pcolor);
      map.put("sorting", sorting);
      
      
      
      return map;
      
   }
	      
	    
   

   @Override//상세 페이지에 상품 1개 가져오기 
   public HashMap<String, Object> selectPageOne(int pno) {
      HashMap<String, Object> map = new HashMap<>();
      ArrayList<ProductDto> list1 = productMapper.selectBestAll(); //베스트 
      map.put("list1", list1); //베스트 
      
      //조회수 1 증가 
      productMapper.updatePhitUp(pno);
      
      
      // 게시물 1개 가져오기 + 이전 게시물, 다음 게시물 가져오기 
      ProductDto pdto = productMapper.selectPageOne(pno);
      map.put("pdto", pdto);
      return map;
   }


   @Override //상품 페이지에서 ajax 검색하기 
   public ArrayList<ProductDto> selectSortAll(String s_word, Integer pprice, String sorting, String pcolor) {
	   
	   System.out.println("impl s_word" + s_word);
		  System.out.println("impl sorting" +  sorting);
		  System.out.println("impl pcolor" +  pcolor);
      ArrayList<ProductDto> list= productMapper.selectSortAll(s_word, pprice, sorting,pcolor);
      return list;
   }



   
   //홈 제품 

   @Override
   public HashMap<String, Object> selectHomeAll(int page) {
	   
		  HashMap<String, Object> map = new HashMap<>();
	    
	      int product_page_listCounthome = productMapper.selectproduct_page_listCounthome();
	      System.out.println("ProductServiceImpl product_page_listCounthome : " + product_page_listCounthome);
	      
	      //전체 상품 개수를 페이지 당 9개씩 보여줄 때 필요한 전체 페이지 수를 계산하기 
	      int maxPage = (int)Math.ceil((double)product_page_listCounthome/9); // 67/9 8개 page
	      int startPage = (int)((page-1)/9)*9 + 1; //현재 페이지에 해당하는 시작 페이지를 계산하기.  
	      int endPage = startPage+10-1;
	      int startRow = (page-1)*9+1;  //1page -> 1-9, 2page -> 10-18  
	      int endRow = startRow+9-1;
	      if(endPage>maxPage) endPage=maxPage;
      
	  ArrayList<ProductDto> list1 = productMapper.selectBestAll();
      ArrayList<ProductDto> list = productMapper.selectHomeAll(startRow, endRow);
      map.put("list", list);
      map.put("list1", list1);
      map.put("product_page_listCounthome", product_page_listCounthome);
      map.put("maxPage", maxPage);
      map.put("startPage", startPage);
      map.put("endPage", endPage);
      map.put("page", page);
  
      
      
      
      return map;
   }


   //====================================주문 관리========================================
   //주문 관리 페이지에 주문 전체 가져오기 
    @Override
	public HashMap<String, Object> selectOrderAll(int page, String ordercate, String OSTATUS) {
		HashMap<String, Object> map =new HashMap<>(); 
		int order_page_listCount = productMapper.selectorder_page_listCount(ordercate,OSTATUS);
		  System.out.println("ProductServiceImpl order_page_listCount : " + order_page_listCount);;
	      //최대페이지
	      int maxPage = (int)Math.ceil((double)order_page_listCount/10); // 26/10 3개page
	      int startPage = (int)((page-1)/10)*10 + 1; //1
	      int endPage = startPage+10-1;
	      int startRow = (page-1)*10+1;  //1page -> 1-10, 2page -> 11-20
	      int endRow = startRow+10-1;
	      //endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
	      if(endPage>maxPage) endPage=maxPage;
	      
	   
	      ArrayList<ProductDto> list = productMapper.selectOrderAll(startRow, endRow, ordercate,OSTATUS);
	      map.put("list", list);
	      map.put("order_page_listCount", order_page_listCount);
	      map.put("maxPage", maxPage);
	      map.put("startPage", startPage);
	      map.put("endPage", endPage);
	      map.put("page", page);
	      map.put("ordercate", ordercate);
	      map.put("OPAYMENT", OSTATUS);
	      
	      return map;
		
	}
    //주문 관리 페이지에서 주문 하나 가져오기
    @Override
    public HashMap<String, Object> selectOrderOne(int ONO) {
    	HashMap<String, Object> map = new HashMap<>();
//    	OrderDto preDto = productMapper.selectOrderPreOne(ONO);
    	OrderDto odto = productMapper.selectOrderOne(ONO);
//    	OrderDto nextDto = productMapper.selectOrderNextOne(ONO);
//    	map.put("preDto", preDto);
//	    map.put("nextDto", nextDto);
	    map.put("odto", odto);
    	return map;
    }


    //주문 관리에서 배송 상태 ajax 
	@Override
	public ArrayList<OrderDto> selectUPAjaxAll(OrderDto odto) {
		
		System.out.println("impl ONO : " + odto.getONO());
		System.out.println("impl OSTATUS : " + odto.getOSTATUS());
	
		
		ArrayList<OrderDto> list = productMapper.selectUPAjaxAll(odto);
		return list;
	}

 

	//====================================주문 관리========================================


   //=====================================메인 페이지======================================

	//메인 페이지에서 조회수순을 위한 서비스임플리
	@Override
	public ArrayList<ProductDto> selectphitAll() {
		ArrayList<ProductDto> list =productMapper.selectphitAll();
		return list;
	}


	//메인 페이지에서 베스트순을 위한 서비스 임플리 
	@Override
	public ArrayList<ProductDto> selectBestAll() {
		ArrayList<ProductDto> list1 = productMapper.selectBestAll();
		return list1;
	}   
	
	//=====================================메인 페이지======================================

   
	 //판매 개수 1 증가
   // orderMapper.updatePsoldcount(ONO);


}