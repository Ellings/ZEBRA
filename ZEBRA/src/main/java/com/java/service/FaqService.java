package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.java.dto.CommentDto;
import com.java.dto.FaqDto;

@Service
public interface FaqService {

	//게시글 전체 가져오기
	ArrayList<FaqDto> selectFaqAll();

	//게시글 1개 저장하기
	void insertfaq(FaqDto faqdto);
	
	//page가 있는 보드 리스트 전체 불러오기
	HashMap<String, Object> selectboardAll(int page);

	//notice view 1개 게시물 작성하기
	HashMap<String, Object> selectnoticeviewOne(int fno);
	
	// 게시글 삭제
	void deleteOne(int fno);

	//게시글 수정하기-읽기
	FaqDto selectupdate(int fno);
	
	//게시글 수정 update
	void insertupdate(FaqDto faqdto);

	// admin 
	void insertComment(CommentDto cdto);

	// admin 댓글 입력 확인하기
	CommentDto selectComment(int pno);

	//admin 댓글 삭제
	void deleteComment(int pno);
	
	//admin 댓글 수정(
	void updateComment(CommentDto cdto);

	// admin의 문의 답변 수정
	void updatefqa(FaqDto faqdto);
	
}
