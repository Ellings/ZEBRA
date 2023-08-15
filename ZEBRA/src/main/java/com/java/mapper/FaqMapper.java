package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.CommentDto;
import com.java.dto.FaqDto;

@Mapper
public interface FaqMapper {

	//게시글 전체 가져오기
	ArrayList<FaqDto> selectFaqAll();
	
	//게시글 1개 저장하기
	void insertfaq(FaqDto faqdto);

	//게시글 리스트 전체 게시물 수
	int selectListAllCount();

	//게시글 해당 페이지 가져오기
	ArrayList<FaqDto> selectpageAll(int startRow, int endRow);

	//현재 게시글
	FaqDto selectOne(int fno);
	
	//이전 게시글
	FaqDto selectPrevOne(int fno);
	
	//다음 게시글
	FaqDto selectNextOne(int fno);
	
	//게시글 1개 삭제
	void deleteOne(int fno);
	
	//게시글 수정 update
	void insertupdate(FaqDto faqdto);
	
	// admin 코멘트 입력
	void insertComment(CommentDto cdto);

	// admin 댓글 입력 확인하기
	CommentDto selectComment(int pno);

	// admin 댓글 삭제
	void deleteComment(int pno);

	//admin 댓글 수정(
	void updateComment(CommentDto cdto);

	// admin의 문의 답변 수정
	void updatefqa(FaqDto faqdto);

	



}
