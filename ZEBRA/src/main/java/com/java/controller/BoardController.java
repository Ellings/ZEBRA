package com.java.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.java.dto.BoardDto;
import com.java.dto.CommentDto;
import com.java.dto.ProductDto;
import com.java.service.BoardService;
import com.java.service.ProductService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	HttpSession session;
	@Autowired
	ProductService productService;
	
	@RequestMapping("/product/product_detail")
	public String product_detail(int pno, Model model) {
		//상품 번호의 값을 왜 디폴드 값으로 1을 했는가 ? 
		System.out.println("product_detail pno  : " + pno );
		
		//상품 1개 가져오기 
		HashMap<String, Object> map = productService.selectPageOne(pno);
		ArrayList<ProductDto> list1 = productService.selectBestAll();//베스트 
	    model.addAttribute("list1", map.get("list1")); //베스트
		model.addAttribute("pdto", map.get("pdto"));
		
		//상품 뷰 페이지에서 하단에 목록을 만들기 위한 넘버링과 이 상품이 상품 목록에서 어디 페이지에 있는 지에 대해
		//상품 1개가져오기
		ProductDto pdto = boardService.selectOne(pno);
		
		//하단댓글 모두가져오기
		ArrayList<CommentDto> comList = boardService.selectComAll(pno);
		model.addAttribute("pdto1",pdto);
		model.addAttribute("comList",comList);

		return "product/product_detail";
	}
	
	
	@RequestMapping("/board/commentInsert")
	@ResponseBody
	public CommentDto commentInsert(CommentDto comDto) {
		System.out.println("ajax 넘어온 데이터 1 : "+comDto.getCcontent());
		System.out.println("ajax 넘어온 데이터 1 : "+comDto.getCpw());
		//하단댓글 저장, 1개 가져오기
		CommentDto cdto = boardService.commentInsert(comDto);
		
		return cdto;
	}
	
	@RequestMapping("/board/commentDelete")
	@ResponseBody
	public String commentDelete(int cno) {
		System.out.println("ajax 넘어온 데이터 : "+ cno);
		//하단댓글 1개삭제
		boardService.commentDelete(cno);
		
		String result="success";
		return result;
	}
	
	
	@RequestMapping("/board/commentUpdateSave") //댓글수정저장
	@ResponseBody
	public CommentDto commentUpdateSave(CommentDto comDto) {
		System.out.println("BoardController commentUpdateSave : "+comDto.getCcontent());
		
		//하단댓글 수정저장
		CommentDto cdto = boardService.commentUpdateSave(comDto);
		//String result="success";
		return cdto;
	}
	
}