package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.CommentDto;
import com.java.dto.FaqDto;
import com.java.mapper.FaqMapper;

@Service
public class FaqServiceImpl implements FaqService {

	
	@Autowired	FaqMapper faqMapper;
	@Override //게시글 전체 가져오기
	public ArrayList<FaqDto> selectFaqAll() {
		ArrayList<FaqDto> list = faqMapper.selectFaqAll();	
		
		return list;
	}
	
	@Override //게시글 1개 저장하기
	public void insertfaq(FaqDto faqdto) {
		faqMapper.insertfaq(faqdto);		
	}

	@Override //page가 있는 보드 리스트 전체 불러오기
	public HashMap<String, Object> selectboardAll(int page) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		int listCount = faqMapper.selectListAllCount();
		
		System.out.println("listCount : "+ listCount );
		// 최대페이지
		int maxPage = (int)Math.ceil((double)listCount/10); // 26/10 3개page
		int startPage = (int)((page-1)/10)*10 + 1;  //1
		int endPage = startPage+10-1;
		int startRow = (page-1)*10+1;  //1page -> 1-10, 2page -> 11-20
		int endRow = startRow+10-1;
		
		if(endPage>maxPage) endPage=maxPage;
		
		System.out.println("endPage : "+endPage);
		ArrayList<FaqDto> list = faqMapper.selectpageAll(startRow,endRow);
		
	
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("page", page);
		map.put("list", list);
		
		return map;
	}

	@Override//FAQ notice view 1개 게시물 작성하기
	
	public HashMap<String, Object> selectnoticeviewOne(int fno) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		// 게시글 1개, 이전글, 다음글 1개 가져오기
				FaqDto faqDto = faqMapper.selectOne(fno); //현재 게시글
				FaqDto prevDto = faqMapper.selectPrevOne(fno); //이전 게시글
				FaqDto nextDto = faqMapper.selectNextOne(fno); // 다음 게시글
				map.put("prevDto", prevDto);
				map.put("faqDto", faqDto);
				map.put("nextDto", nextDto);
		
		return map;
	}

	@Override //  게시글 삭제
	public void deleteOne(int fno) {
		faqMapper.deleteOne(fno);		
	}

	@Override // 게시글 수정-읽기
	public FaqDto selectupdate(int fno) {
		FaqDto faqDto = faqMapper.selectOne(fno); //현재 게시글
		return faqDto;
	}

	@Override // 게시글 수정 update
	public void insertupdate(FaqDto faqdto) {
		faqMapper.insertupdate(faqdto);		
	}

	@Override 	// admin  수정하기
	public void insertComment(CommentDto cdto) {
		faqMapper.insertComment(cdto);		
	}

	@Override // admin 댓글 입력 확인하기
	public CommentDto selectComment(int pno) {
		CommentDto cdto = faqMapper.selectComment(pno);
		return cdto;
	}

	@Override	//admin 댓글 삭제
	public void deleteComment(int pno) {
		faqMapper.deleteComment(pno);
	}

	@Override//admin 댓글 수정(
	public void updateComment(CommentDto cdto) {
		faqMapper.updateComment(cdto);
		
	}

	@Override 	// admin의 문의 답변 수정
	public void updatefqa(FaqDto faqdto) {
		faqMapper.updatefqa(faqdto);
		
	}
	

}
