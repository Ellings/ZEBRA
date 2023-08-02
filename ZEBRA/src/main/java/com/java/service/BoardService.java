package com.java.service;

import java.util.ArrayList;

import com.java.dto.CommentDto;
import com.java.dto.ProductDto;

public interface BoardService {

	// 물품 총 개수 가져오기
	int selectProductCount();
	
	//게시글 1개가져오기
	ProductDto selectOne(int pno);

	//하단댓글 전체가져오기
	ArrayList<CommentDto> selectComAll(int pno);

	//하단댓글 저장
	CommentDto commentInsert(CommentDto comDto);

	//하단댓글 1개삭제
	void commentDelete(int cno);

	//하단댓글 수정저장
	CommentDto commentUpdateSave(CommentDto comDto);

}