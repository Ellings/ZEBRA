package com.java.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.MemberDto;
import com.java.service.BoardService;
import com.java.service.MemberService;

@Controller
public class AdminController {
   @Autowired MemberService memberService;
   @Autowired BoardService boardService;
   @Autowired HttpSession session;

   
   //로그인을 해야 인덱스로 가도록 정리하기
   @RequestMapping("/admin/index")
   public String index(MemberDto mdto, String loginCheck, Model model) {
	  ArrayList<MemberDto> list1 = memberService.selectBest(mdto);
	  model.addAttribute("list1", list1);
	  System.out.println("no1NAME : "+list1.get(0).getMNAME()); // 매출 1위의 사람 이름 조회
      model.addAttribute("loginCheck", loginCheck); //로그인 성공 여부
      int[] list = memberService.selectMemberAll();     
      int allProductCount = boardService.selectProductCount();
      model.addAttribute("allCount", list[0]);
      model.addAttribute("maleCount", list[1]);
      model.addAttribute("FemaleCount", list[2]);
      model.addAttribute("allProductCount", allProductCount);
      model.addAttribute("totalOrder", list[3]);
      model.addAttribute("totalPay", list[4]);
      model.addAttribute("totalPay3", list[5]);
      model.addAttribute("totalPay4", list[6]);
      model.addAttribute("totalPay5", list[7]);
      model.addAttribute("totalPay6", list[8]);
      model.addAttribute("totalPay7", list[9]);
      model.addAttribute("totalPay8", list[10]);
      
      if(session.getAttribute("sessionId")!=null) {
    	  
      if(session.getAttribute("sessionId").equals("admin")) {
         return "admin/index";
      }//로그인을 성공하면 인덱스 페이지로 가줘
      return "admin/login"; //보안을 위한 세션 
    	  //그렇지 않으면 로그인 페이지에 남아줘
      }
      
         return "admin/login";
   }   
   
   //관리자 로그인 getMapping
   @GetMapping("/admin/login")
   public String login() {
      
      return "admin/login";

   }
   
   //관리자 로그인 PostMapping
   @PostMapping("/admin/login")
   public String  login(String MID, String MPASSWORD, MemberDto memberDto, Model model) {
      System.out.println("memberDto 1 : "+ memberDto.getMID());
      System.out.println("memberDto 2 : "+ memberDto.getMPASSWORD());
      MemberDto mdto = memberService.selectLogin(memberDto);
      if(mdto!=null) {
         System.out.println("memberDto 1 : "+ mdto.getMID());
         System.out.println("memberDto 2 : "+ mdto.getMPASSWORD());
         
         session.setAttribute("sessionId", mdto.getMID());
         session.setAttribute("sessionName", mdto.getMNAME());
         model.addAttribute("loginCheck", "success");
         if(mdto.getMID().equals("admin")&& mdto.getMPASSWORD().equals("1234")) {
         
            System.out.println("session"+ session.getAttribute("sessionId"));
//            return "redirect:/admin/index";
         return "redirect:/admin/index?loginCheck=success";
         }
         
         return "redirect:/layout/index";
         
      }else {
         model.addAttribute("loginCheck", "fail");
         return "/member/login";
      }
   }
   
   //관리자 로그아웃
   @RequestMapping("/admin/logout")
   public String logout() {   
      session.invalidate(); //session 모두 삭제
      return "redirect:/layout/index";
   }
   
   // ajax로 종류별 회원 정보 가져오기
   @PostMapping("/admin/indexAjax")
   @ResponseBody // 데이터로 넘겨줌 -> return으로
   public int[][] indexAjax(Model model) { // data를 받음   
     int[] list = memberService.selectMemberAll();
     int allProductCount = boardService.selectProductCount();
     
     int[][] memberNproduct = new int[2][];
     memberNproduct[0] = list;
     memberNproduct[1] = new int[] { allProductCount };
     System.out.println("list :"+list);
     return memberNproduct; // function(data)로 넘김
   }
   
   
   // 회원 테이블 전체 가져오기
   @RequestMapping("/admin/member_table")
   public String member_table(@RequestParam(defaultValue = "") String s_word, String category, Model model) {
     System.out.println("AdminController member_table category : "+category);
     HashMap<String,Object> map = memberService.selectAll(s_word, category);
     model.addAttribute("list",map.get("list"));
     model.addAttribute("listCount",map.get("listCount"));
     model.addAttribute("s_word",map.get("s_word"));
     model.addAttribute("category",map.get("category"));
     return "admin/member_table";
   }      
      
   // 회원 정보 1개 가져오기
   @RequestMapping("/admin/member_tableView")
   public String member_tableView(@RequestParam(defaultValue = "aannesdg")String MID, Model model) {
      HashMap<String, Object> map = memberService.selectOne(MID);
      model.addAttribute("mdto", map.get("mdto"));   
      System.out.println("mdto : "+map.get("mdto"));
      return "admin/member_tableView";
   }
   
   @GetMapping("/admin/member_Write")
   public String member_Write() {
      return "admin/member_Write";
   }
   
   // 회원 정보 1개 저장하기
   @PostMapping("/admin/member_Write")
   public String doMemberWrite(MemberDto mdto, Model model) throws Exception {
      memberService.insertOne(mdto);
      System.out.println("MCODE :"+mdto.getMCODE());
      return "redirect:member_table";
   }

   // 회원 정보 1개 수정하기
   @PostMapping("/admin/member_tableView") 
   public String memberUpdate(MemberDto mdto, String MID, Model model) throws Exception { 
      memberService.updateOne(mdto);      
      System.out.println("MID :"+mdto.getMID());
      System.out.println("MNAME :"+mdto.getMNAME());      
      return "redirect:/admin/member_table";
   }   
   
   // 회원 정보 1개 삭제하기     
   @RequestMapping("/admin/memberDelete")
   public String boardDelete(String MID) {
      memberService.deleteOne(MID);
      return "redirect:/admin/member_table";
   }
   
   // CSV 다운로드
   @GetMapping("/admin/csv/download")
   public void downloadCSV(HttpServletResponse response) throws IOException {
       response.setContentType("text/csv");
       response.setHeader("Content-Disposition", "attachment; filename=\"data.csv\"");
       
       ArrayList<MemberDto> list = memberService.selectAll();

       // 문자 인코딩 설정
       response.setCharacterEncoding("MS949");
       
       StringBuilder csvContent = new StringBuilder();
       csvContent.append("MID,MNAME,MGENDER,MPHONE,MEMAIL,MJOINDAY,MTOTAL_PAY,MTOTAL_ORDER\n");

       for (MemberDto mdto : list) {
           csvContent.append("\"").append(mdto.getMID()).append("\",");
           csvContent.append("\"").append(mdto.getMNAME()).append("\",");
           csvContent.append("\"").append(mdto.getMGENDER()).append("\",");
           csvContent.append("\"").append(mdto.getMPHONE()).append("\",");
           csvContent.append("\"").append(mdto.getMEMAIL()).append("\",");
           csvContent.append("\"").append(mdto.getFormattedJoinDay()).append("\",");
           csvContent.append("\"").append(mdto.getMTOTAL_PAY()).append("\",");
           csvContent.append("\"").append(mdto.getMTOTAL_ORDER()).append("\"\n");
           
       }

       response.getWriter().write(csvContent.toString());
   }
   
   
   @RequestMapping("/admin/chartjs")
   public String chartjs() {
      
      return "admin/chartjs";
   }
   @RequestMapping("/admin/chartjs2")
   public String chartjs2() {
      
      return "admin/chartjs2";
   }
   
   
   @RequestMapping("/admin/echarts")
   public String echarts() {
      
      return "admin/echarts";
   }
   
   
   @RequestMapping("/admin/form_buttons")
   public String form_buttons() {
      
      return "admin/form_buttons";
   }
   
   
   @RequestMapping("/admin/form_upload")
   public String form_upload() {
      
      return "admin/form_upload";
   }
   
   @RequestMapping("/admin/form_validation")
   public String form_validation() {
      
      return "admin/form_validation";
   }
   
   @RequestMapping("/admin/form_wizards")
   public String form_wizards() {
      
      return "admin/form_wizards";
   }
   
   @RequestMapping("/admin/form")
   public String form() {
      
      return "admin/form";
   }
   
   @RequestMapping("/admin/general_elements")
   public String general_elements() {
      
      return "admin/general_elements";
   }
   
   @RequestMapping("/admin/glyphicons")
   public String glyphicons() {
      
      return "admin/glyphicons";
   }
   
   @RequestMapping("/admin/icons")
   public String icons() {
      
      return "admin/icons";
   }
   
   
   @RequestMapping("/admin/map")
   public String map() {
      
      return "admin/map";
   }
   
   @RequestMapping("/admin/media_gallery")
   public String media_gallery() {
      
      return "admin/media_gallery";
   }   
      
   @RequestMapping("/admin/morisjs")
   public String morisjs() {
      
      return "admin/morisjs";
   }
   
   @RequestMapping("/admin/page_403")
   public String page_403() {
      
      return "admin/page_403";
   }
   
   @RequestMapping("/admin/page_404")
   public String page_404() {
      
      return "admin/page_404";
   }
   
   @RequestMapping("/admin/page_500")
   public String page_500() {
      
      return "admin/page_500";
   }
   
   @RequestMapping("/admin/pricing_tables")
   public String pricing_tables() {
      
      return "admin/pricing_tables";
   }
   
   @RequestMapping("/admin/profile")
   public String profile() {
      
      return "admin/profile";
   }
   
   @RequestMapping("/admin/project_detail")
   public String project_detail() {
      
      return "admin/project_detail";
   }
   
   @RequestMapping("/admin/projects")
   public String projects() {
      
      return "admin/projects";
   }
   
   @RequestMapping("/admin/tables_dynamic")
   public String tables_dynamic() {
      
      return "admin/tables_dynamic";
   }
   
   @RequestMapping("/admin/tables")
   public String tables() {
      
      return "admin/tables";
   }
   
   @RequestMapping("/admin/widgets")
   public String widgets() {
      
      return "admin/widgets";
   }
   
   @RequestMapping("/admin/xx")
   public String xx() {
      
      return "admin/xx";
   }
   
   
   
   
} 