package com.java.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.FaqDto;
import com.java.dto.MemberDto;
import com.java.service.MemberService;
@Controller

public class MemberController {	


	@Autowired HttpSession session;
	
	@Autowired MemberService memberService;
	
	//회원가입1
	@GetMapping("/member/register")
	public String register() {
		return "member/register";
	}	
	// 회원가입 2
	@GetMapping("/member/register02")
	public String register02() {
		return "member/register02";
	}
	// 회원가입 3	
	@GetMapping("/member/register03")
	public String register03() {
		return "member/register03";
	}	
	//test	
	
	
	
	//회원정보수정
	@GetMapping("/member/register04")
	public String register04( Model model) {		
		String MID = (String)session.getAttribute("sessionId");
		System.out.println(MID);
		HashMap<String, Object> map = memberService.selectOne(MID);

		MemberDto member = (MemberDto)map.get("mdto");
		
		/*
		 * System.out.println("이름 : " + member.getMNAME()); System.out.println("성별 : " +
		 * member.getMGENDER()); System.out.println("아이디 : " + member.getMID());
		 * System.out.println("패스워드 : " + member.getMPASSWORD());
		 * System.out.println("생일 : " + member.getMBIRTH());
		 * System.out.println("생일 : " + member.getMZIP());
		 * System.out.println("생일 : " + member.getMADDR1());
		 * System.out.println("생일 : " + member.getMADDR2());
		 */
		
		//폰
				//  String MPHONE = member.getMPHONE(); 
				 // String[] phone = MPHONE.split("-");
				//  System.out.println("phone1 : "+phone1);
				/*
				 * System.out.println("phone2 : "+phone2);
				 * System.out.println("phone3 : "+phone3); 
				 * member.setMPHONE(phone[0]);
				 * member.setMPHONE(phone[1]); 
				 * member.setMPHONE(phone[2]);
				 */
				 
		
		//생일
			//  String MBIRTH = member.getMPBIRTH(); 
			 // String[] birth = MBIRTH.split("-");
			//  System.out.println("birth1 : "+phone1);
			/*
			 * System.out.println("birth2 : "+phone2);
			 * System.out.println("birth3 : "+phone3); 
			 * member.setMBIRTH(birth[0]); //SET을 수정해야할 것 같아...
			 * member.setMBIRTH(birth[1]); 
			 * member.setMBIRTH(birth[2]);
			 */
		  
		  
		  //메일
		 // member.setMEMAIL1("1"); member.setMEMAIL2("1"); member.setMEMAIL3("1"); // 가입 NAME 비교 하기
		 
		

		//주소 수정하기
		
		//  String MPHONE = member.getMPHONE(); 
		 // String[] phone = MPHONE.split("-");
		//  System.out.println("phone1 : "+phone1);
		/*
		 * System.out.println("phone2 : "+phone2);
		 * System.out.println("phone3 : "+phone3); 
		 * member.setMPHONE(phone[0]);
		 * member.setMPHONE(phone[1]); 
		 * member.setMPHONE(phone[2]);
		 */
		
		 
		
		

		model.addAttribute("member",member);
		return "member/register04";
	}	
	
	
	@PostMapping("/member/register04")
	public String memberupdate(MemberDto member, Model model) {
		
		// MemberDto mdto = memberService.memberupdate(member);
		
		return "member/register04";
	}	

	//ID search
	@GetMapping("/member/idsearch")
	public String idsearch() {
		return "member/idsearch";
	}
	// START SUN //	
	


		
	 // id search - 이름 & 이메일 검사  
	  @PostMapping("/member/idEmailCheck")  
	  @ResponseBody 
	  public String checkIdEmail(String MNAME, String MEMAIL) {
	  System.out.println("id search - 이름 & 이메일 checkID : " + MNAME);
	  System.out.println("id search - 이름 & 이메일 checkMAIL : " + MEMAIL);
	  
	  MemberDto mdto = memberService.selectIdEmail(MNAME, MEMAIL); 
	  if (mdto != null) { 
		  return mdto.getMID(); 
		  }else{ 
			 return "fail"; 
		  		} 
	  }
			
	// 신규 회원 가입 및 등록
	@PostMapping("/member/register02")
	public String register02(MemberDto member, Model model) {
		System.out.println("이름 : " + member.getMNAME());
		System.out.println("성별 : " + member.getMGENDER());
		System.out.println("아이디 : " + member.getMID());
		System.out.println("패스워드 : " + member.getMPASSWORD());
		
		//Email 가져오기
		String mail1 = member.getMEMAIL1();
		String mail2 = member.getMEMAIL2();
		//String mail3 = member.getMEMAIL3();
		String email ="";		
		if(mail2!="") {
			email = mail1+"@"+mail2;			
		}	
		member.setMEMAIL(email);		
		System.out.println("이메일 : " + member.getMEMAIL());
		System.out.println("이메일수신여부 : " + member.getMAGREE());
		
		//MPHONE 가져오기
		String phone1 = member.getMPHONE1();
		String phone2 = member.getMPHONE2();
		String phone3 = member.getMPHONE3();
		
		String phone = phone1+"-"+phone2+"-"+phone3;			
		//System.out.println("phone123 더한값: "+phone); 		
		member.setMPHONE(phone);
		System.out.println("휴대폰 : " + member.getMPHONE());
		
		//생년월일 가져오기			
		String birth1 = member.getMBIRTH1();
		String birth2 = member.getMBIRTH2();
		String birth3 = member.getMBIRTH3();	  			 
		
		//String birthstr = birth1.substring(2);

		String birth = birth1 + "/" + birth2 + "/" + birth3;
		//System.out.println("birstr완료: "+birth);
		
		member.setMBIRTH(birth);
		System.out.println("생년월일 : " + member.getMBIRTH());		
		
		//주소 가져오기
		 String MZIP = member.getMZIP();
		 String MADDR1 = member.getMADDR1();
		 String MADDR2 = member.getMADDR2();
		 String MADDR = MZIP+MADDR1+MADDR2;
		 member.setMADDR(MADDR);
		 System.out.println("우편번호: "+member.getMZIP());
		 System.out.println("전체주소: "+member.getMADDR());
		 
		
		String result = memberService.insertMember(member);
		
		if (result == "success") {
			System.out.println("가입 성공 ");
			return "member/register03";
		} else {
			System.out.println("가입 실패 ");
			return "member/register02";
		}
	}

	// id 중복 검사
	@PostMapping("/member/idCheck")
	@ResponseBody
	public String checkId(String MID) {
		System.out.println("아이디 중복검사 checkID : " + MID);

		MemberDto mdto = memberService.selectId(MID);
		if (mdto == null) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 로그인
	@GetMapping("/member/login")
	public String login() {
		return "member/login";
	}

	// 로그인 오버로딩 , 다른 메소드 , 로그인 버튼을 눌렀을때 post로 들어옴
	@PostMapping("/member/login")
	public String login(String MID, String MPASSWORD, Model model) {
		System.out.println("controller MID : " + MID);
		System.out.println("controller MPASSWORD : " + MPASSWORD);

	/// 회원 1명 가져오기(로그인)
		/* MemberDto mdto = memberService.selectOne(id,pw); */
		String resultCode = memberService.selectLoginMember(MID, MPASSWORD);
		if (resultCode.equals("s_login")) {
			// System.out.println("resultCode: "+resultCode);
			return "redirect:/layout/index?resultCode=" + resultCode;
		} else {
			model.addAttribute("resultCode", resultCode); // f_login
			System.out.println("controller resultCode2 : " + resultCode);
		}
		return "member/login";// 여는 페이지
	}

	// 로그아웃
	@RequestMapping("/member/logout") // 로그아웃 링크 주소 url 찾아가는 주소
	public String logout(Model model) {
		// 섹션 전체삭제
		session.invalidate();
		return "redirect:/layout/index"; // redirect 이 주소로 다시 찾아라 / 여는 페이지
	}

	

	// END SUN //
		
}