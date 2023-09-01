package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.MemberDto;
import com.java.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	HttpSession session;
	@Autowired
	MemberMapper memberMapper;

	//=========================관리자 로그인======================================
   @Override
   public MemberDto selectLogin(MemberDto memberDto) {
      MemberDto mdto = memberMapper.selectLogin(memberDto); 
      return mdto;
   }
	   

	//=========================관리자 로그인======================================
	
	
	// 회원 테이블 전체 가져오기
	@Override
	public HashMap<String, Object> selectAll(String s_word, String category) {
		HashMap<String, Object> map = new HashMap<>();
				
		// 회원 정보 전체 가져오기
		ArrayList<MemberDto> list = memberMapper.selectAll(s_word, category);
		map.put("list", list);	
		map.put("s_word", s_word);
		System.out.println("s_word : "+s_word); // 값 잘 들어오는지 test 필수
		return map;
	}
	
	// 최고 구매 고객 정보 가져오기
	@Override
	public ArrayList<MemberDto> selectBest(MemberDto mdto) {
		ArrayList<MemberDto> list = memberMapper.selectBest(mdto);
		System.out.println("list : "+list);
		return list;
	}
	
	@Override // 종류별 회원 정보 가져오기
	public int[] selectMemberAll() {
		int allCount = memberMapper.selectMemberCount();
		int maleCount = memberMapper.selectMaleCount();
		int femaleCount = memberMapper.selectFemaleCount();
		int totalOrder = memberMapper.sumTotalorder();
		int totalPay = memberMapper.sumTotalpay();
		int totalPay3 = memberMapper.sumTotalpay3();
		int totalPay4 = memberMapper.sumTotalpay4();
		int totalPay5 = memberMapper.sumTotalpay5();
		int totalPay6 = memberMapper.sumTotalpay6();
		int totalPay7 = memberMapper.sumTotalpay7();
		int totalPay8 = memberMapper.sumTotalpay8();
		System.out.println("allCount : "+allCount);
		System.out.println("maleCount : "+maleCount);
		System.out.println("FemaleCount : "+femaleCount);
		
		int[] counts = {allCount, maleCount, femaleCount, totalOrder, totalPay, totalPay3, totalPay4, totalPay5, totalPay6, totalPay7, totalPay8};
	    return counts;
	}	
	
	@Override
	// 회원 정보 1개 가져오기
	public HashMap<String, Object> selectOne(String MID) {
		 HashMap<String, Object> map = new HashMap<>();
		 MemberDto mdto = memberMapper.selectOne(MID);
	     map.put("mdto", mdto);
		 return map;
	}	

	@Override
	// 회원 정보 1개 저장하기
	public void insertOne(MemberDto mdto) {
		System.out.println("member_Write : "+mdto);
		memberMapper.insertOne(mdto);
	}
	
	@Override
	// 회원 정보 1개 수정하기
	public void updateOne(MemberDto mdto) {
		memberMapper.updateOne(mdto);
	}
	
	@Override
	// 회원 정보 1개 삭제하기
	public void deleteOne(String MID) {
		memberMapper.deleteOne(MID);		
	}
	
	@Override
	public ArrayList<MemberDto> selectAll() {
		// CSV 정보 가져오기
		ArrayList<MemberDto> list = memberMapper.selectAll();
		return list;
	}
	
	@Override
	// 주문자 정보
	public MemberDto getMemberInfo(String MID) {
		return memberMapper.getMemberInfo(MID);
	}
	
	
	
	@Override // 회원 로그인
	public String selectLoginMember(String MID, String MPASSWORD) {
		String resultCode = "";

		MemberDto mdto = memberMapper.selectLoginMember(MID, MPASSWORD);
		if (mdto != null) {
			session.setAttribute("sessionId", mdto.getMID());
			session.setAttribute("sessionName", mdto.getMNAME());

			System.out.println("mdto.getMID:"+mdto.getMID());
			resultCode = "s_login";
		} else {
			resultCode = "f_login";
		}
		return resultCode;
	}

	

	@Override //id 중복 검사
	public MemberDto selectId(String MID) {		
		MemberDto mdto = memberMapper.selectId(MID);
		return mdto;
	}

	@Override//신규 회원 가입 및 등록
	public String insertMember(MemberDto member) {
		MemberDto mdto = memberMapper.selectId(member.getMID());
		if (mdto == null ) {
			memberMapper.insertMember(member);
			return "success";
		}else {
			return "fail";
		}
	}

	@Override // IDSerach - idEmailSearch 검사
	public MemberDto selectIdEmail(String MNAME, String MEMAIL) {
		MemberDto mdto = memberMapper.selectIdEmail(MNAME, MEMAIL);
		return mdto;
	}



}