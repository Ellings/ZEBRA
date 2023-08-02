
package com.java.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.CommentDto;
import com.java.dto.FaqDto;
import com.java.service.FaqService;


@Controller
public class FaqController {	
	
	@Autowired HttpSession session; 
	
	@Autowired FaqService faqService;
	
	// admin 댓글 등록하기
	@PostMapping("customer/admincommentinsert")
	@ResponseBody
	public String admincommentinsert(String id, String ccontent, int fno, FaqDto faqdto) {
		
		System.out.println(faqdto.getFno());
		System.out.println(id);
		System.out.println(ccontent);
		
		
		 CommentDto cdto = new CommentDto();
		 cdto.setPno(fno);
		 cdto.setCcontent(ccontent);
		 cdto.setMid(id);
		 
		 faqService.insertComment(cdto);
		 faqdto.setFqa(0);
		 faqService.updatefqa(faqdto);// 문의 답변 수정
		 
		return "success";
	}
	// admin 댓글 삭제
	@PostMapping("/customer/admincommentdelete")
	@ResponseBody
	public String admincommentdelete(FaqDto faqdto) {
		
		System.out.println("댓글 삭제 게시물 번호: "+faqdto.getFno());
		faqdto.setFqa(1); // 삭제했을 경우 문의로 수정
		 faqService.updatefqa(faqdto);// 문의 답변 수정
		 
		faqService.deleteComment(faqdto.getFno());
		return "success";
	}
	
	// admin 댓글 수정하기
	@PostMapping("/customer/admincommentupdate")
	@ResponseBody
	public String admincommentupdate(FaqDto faqdto, String ccontent) {
		
		System.out.println("댓글수정내용: ccontent:"+ccontent);
		System.out.println("댓글수정버튼 :"+faqdto.getFno());
		
		CommentDto cdto =faqService.selectComment(faqdto.getFno());
		System.out.println("cdto.getccontent:"+cdto.getCcontent()); //기존에 있던 댓글 출력
		
		//admin 댓글 수정 후 faq에서 문의 답변 수정 확인 가능
		 faqdto.setFqa(0);
		 faqService.updatefqa(faqdto);// 문의 답변 수정
		
		cdto.setCcontent(ccontent);
		faqService.updateComment(cdto);
		return "success";
	}
	
	
	
	//FAQ(게시판)
	@RequestMapping("/customer/faqList")
	public String faqList(@RequestParam(defaultValue ="1")int page,Model model) {
		
	//게시글 전체 가져오기
	HashMap<String,Object> map = faqService.selectboardAll(page);
	model.addAttribute("list",map.get("list"));	
	model.addAttribute("page",map.get("page"));
	model.addAttribute("listCount",map.get("listCount"));
	model.addAttribute("startPage",map.get("startPage"));
	model.addAttribute("endPage",map.get("endPage"));
	model.addAttribute("maxPage",map.get("maxPage"));
	
	return "customer/faqList";
	}
		 
	//FAQ notice_write 글쓰기
	@GetMapping("/customer/notice_Write")
	public String notice_Write() {
		return "customer/notice_Write";
	}
	
	//FAQ notice_write 글쓰기 
	@PostMapping("/customer/notice_Write")
	public String notice_Write(FaqDto faqdto,@RequestPart MultipartFile file)throws Exception {
		
		String id ="";
		if(session.getAttribute("sessionId")==null){
				return "member/login";
		}
		id = (String)session.getAttribute("sessionId");
		
		System.out.println("컨faqwrite faq.fcategory:"+faqdto.getFcategory());
		System.out.println("컨faqwrite .ftitle: "+faqdto.getFtitle());
		System.out.println("컨faqwrite .fcontent: "+faqdto.getFcontent());
		/*
		 * fdto.setBfile(fileName); faqService.insertOne(fdto);
		 */
		
		// 게시글 1개저장
		String fileName = "";
		
		//파일이 있는 경우
		if (!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();
			UUID uuid = UUID.randomUUID(); //랜덤숫자생성
			fileName = uuid + "_" + ori_fileName; //변경파일이름 - 중복방지
			String uploadUrl = "c:/upload/"; //파일업로드 위치
			File f = new File(uploadUrl + fileName);
			file.transferTo(f); // 파일저장
		}
		
		//System.out.println("faq.ffile: "+faqdto.getFfile());
		System.out.println("faq.ffilename: "+fileName);
		
		//로그인한 상태
		faqdto.setMid(id); 
		faqdto.setFfile(fileName); 
		
		faqService.insertfaq(faqdto);
		
		return "redirect:faqList";
	}//notice_Write
	
		
	//FAQ notice view 1개 게시물 작성하기
	@RequestMapping("/customer/notice_view")
	public String notice_view(@RequestParam(defaultValue ="1")int page, @RequestParam(defaultValue ="2")int fno, Model model) {
		
		HashMap<String, Object> map = faqService.selectnoticeviewOne(fno);
		
		model.addAttribute("faqDto",map.get("faqDto"));
		model.addAttribute("prevDto",map.get("prevDto"));
		model.addAttribute("nextDto",map.get("nextDto"));
		model.addAttribute("page",page);
		
		
		 // admin 댓글 입력 확인하기
		int pno=fno;
		CommentDto cdto = faqService.selectComment(pno);
		model.addAttribute("cdto",cdto);
		
		
		return "customer/notice_view";
		
	}
	
	
	//삭제하기
	@RequestMapping("/customer/faqDelete")
	public String faqDelete(int fno) {
		
		//System.out.println("삭제할 게시글 번호: "+fno);
		faqService.deleteOne(fno);
		return "redirect:faqList";
	}
	
	
	//FAQ //게시글 수정 update
		@PostMapping("/customer/notice_update")
		public String notice_update(FaqDto faqdto,@RequestPart MultipartFile file)throws Exception {
				
				String id ="";
				if(session.getAttribute("sessionId")==null){
						return "member/login";
				}
				id = (String)session.getAttribute("sessionId");
				
				System.out.println("수정하기faq.fcategory:"+faqdto.getFcategory());
				System.out.println("수정하기faq.ftitle: "+faqdto.getFtitle());
				System.out.println("수정하기faq.fcontent: "+faqdto.getFcontent());
				/*
				 * fdto.setBfile(fileName); faqService.insertOne(fdto);
				 */
				
				// 게시글 1개저장
				String fileName = "";
				
				//파일이 있는 경우
				if (!file.isEmpty()) {
					String ori_fileName = file.getOriginalFilename();
					UUID uuid = UUID.randomUUID(); //랜덤숫자생성
					fileName = uuid + "_" + ori_fileName; //변경파일이름 - 중복방지
					String uploadUrl = "c:/upload/"; //파일업로드 위치
					File f = new File(uploadUrl + fileName);
					file.transferTo(f); // 파일저장
				}
				
				//System.out.println("faq.ffile: "+faqdto.getFfile());
				System.out.println("faq.ffilename: "+fileName);
				
				//로그인한 상태
				faqdto.setMid(id); 
				faqdto.setFfile(fileName); 
				
				faqService.insertupdate(faqdto);
				
				return "redirect:faqList";
			
		
		}
		
		//FAQ notice update(수정하기)
				@GetMapping("/customer/notice_update")
				public String notice_update(int fno, Model model) {
					
					FaqDto fdto = faqService.selectupdate(fno);
					model.addAttribute("fdto",fdto);
					
					return "customer/notice_update";
				}
			
	

} //notice_View
