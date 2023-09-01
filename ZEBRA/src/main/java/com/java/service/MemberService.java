package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.MemberDto;

public interface MemberService {


	//=================관리자 로그인 확인하기========================
	MemberDto selectLogin(MemberDto memberDto);	
	//=================관리자 로그인 확인하기========================
	
	// 회원 테이블 전체 가져오기
	HashMap<String, Object> selectAll(String s_word, String category);
	
	// 최고 구매 고객 정보 가져오기
	ArrayList<MemberDto> selectBest(MemberDto mdto);

	// 종류별 회원 정보 가져오기
	int[] selectMemberAll();
	
	// 회원 정보 1개 가져오기
	HashMap<String, Object> selectOne(String MID);

	// 회원 정보 1개 저장하기
	void insertOne(MemberDto mdto);
	
	// 회원 정보 1개 수정하기
	void updateOne(MemberDto mdto);
	
	// 회원 정보 1개 삭제하기
	void deleteOne(String MID);	
	
	/* 주문자 정보 */
	public MemberDto getMemberInfo(String MID);
	
	// CSV 정보 가져오기
	ArrayList<MemberDto> selectAll();	
	
	
	// 회원 로그인
	String selectLoginMember(String MID, String MPASSWORD);
	
	//id 중복 검사 
	MemberDto selectId(String MID);
	
	//id search- idEmaiCheck
	MemberDto selectIdEmail(String MNAME,String MEMAIL);
	
    //신규 회원 가입
	String insertMember(MemberDto member);


		
}