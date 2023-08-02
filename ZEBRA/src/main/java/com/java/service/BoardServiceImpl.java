package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.BoardDto;
import com.java.dto.CommentDto;
import com.java.dto.ProductDto;
import com.java.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;

	@Override // 상품 총 개수 가져오기
	public int selectProductCount() {
		int allProductCount = boardMapper.selectProductCount();
		return allProductCount;
	}
	
	@Override //상품 1개가져오기
	public ProductDto selectOne(int pno) {
		ProductDto pdto1 = boardMapper.selectOne(pno);
		return pdto1;
	}

	@Override //하단댓글 전체가져오기
	public ArrayList<CommentDto> selectComAll(int pno) {
		ArrayList<CommentDto> comList = boardMapper.selectComAll(pno);
		
		return comList;
	}

	@Override //하단댓글 저장
	public CommentDto commentInsert(CommentDto comDto) {
		//하단댓글저장 후
		boardMapper.commentInsert(comDto);
		System.out.println("BoardServiceImpl comDto cno :"+ comDto.getCno());
		System.out.println("BoardServiceImpl comDto cdate :"+ comDto.getCdate());
		//하단댓글 1개가져오기
		CommentDto cdto = boardMapper.selectComOne(comDto);
		
		return  cdto;
	}

	@Override //하단댓글 1개삭제
	public void commentDelete(int cno) {
		boardMapper.commentDelete(cno);
		
	}

	@Override //하단댓글 수정저장
	public CommentDto commentUpdateSave(CommentDto comDto) {
		//1개 수정
		boardMapper.commentUpdateSave(comDto);
		//1개 가져오기
		CommentDto cdto =  boardMapper.selectComOne(comDto);
		
		return cdto;
	}

	
}