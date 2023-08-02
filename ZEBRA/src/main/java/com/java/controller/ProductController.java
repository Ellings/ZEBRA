package com.java.controller;

import java.io.File;
import java.io.ObjectInputStream.GetField;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

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

import com.java.dto.BoardDto;
import com.java.dto.OrderDto;
import com.java.dto.ProductDto;
import com.java.service.ProductService;

@Controller
public class ProductController {

   @Autowired
   ProductService productService; 
   
   // 상품 관리 상품 목록
   @RequestMapping("/admin/product_list")
   public String product_list(@RequestParam(defaultValue = "1") int page, 
         String category , String s_word, Model model) {
      System.out.println("ProductController product_list category : " + category);
      //상품 페이지의 디폴트 값을 1로 해서
      //상품 전체 가져오기
      HashMap<String, Object> map = productService.selectAll(page,category,s_word);
      
      model.addAttribute("list", map.get("list")); //상품 목록을 담고 있는 모델의 속성 
      model.addAttribute("page" ,map.get("page")); //상품 목록의 번호를 나타냄 
      model.addAttribute("listCount" ,map.get("listCount"));//상품 목록 전체 개수를 나타내는 모델의 속성 
      model.addAttribute("startPage" ,map.get("startPage"));//시작 페이지 
      model.addAttribute("endPage" ,map.get("endPage")); //끝 페이지 
      model.addAttribute("maxPage" ,map.get("maxPage")); //상품 최대 페이지 수 
      model.addAttribute("category" ,map.get("category")); //상품의 카테고리를 나타냄 특정 카테고리의 상품 목록을 읽기 위해 준비해 둔 것 
      model.addAttribute("s_word" ,map.get("s_word")); //사용자가 상품 목록을 검색하면 그 검색어에 맞는 상품들이 나오는 것 
      System.out.println("product_list category :" + model.getAttribute(category));
      System.out.println("product_list page :" + model.addAttribute(page));
      
      return "admin/product_list";
   }//product_list
   
   //상품 관리 상품 1개 가져오기 
   @RequestMapping("/admin/product_view")
   public String product_view(
         //pno 매개변수가 명시되지 않았다면 pno는 기본값으로 설정된 1을 가지도록.
         //product_view 메서드를 호출할 때 pno 값이 전달되지 않으면 1로 초기화.
         @RequestParam(defaultValue = "1") 
         int pno,
         int page, String category, String s_word,  Model model) {
      //상품 번호의 값을 왜 디폴드 값으로 1을 했는 가 ? 
      System.out.println("product_view pno  : " + pno );
      System.out.println("product_view page  : " + page );
      //상품 1개 가져오기 
      HashMap<String, Object> map = productService.selectOne(pno);
      model.addAttribute("pdto", map.get("pdto"));
      model.addAttribute("prevDto", map.get("prevDto"));
      model.addAttribute("nextDto", map.get("nextDto"));
      model.addAttribute("category", category);
      model.addAttribute("s_word", s_word);
      model.addAttribute("page", page);
  
      //상품 뷰 페이지에서 하단에 목록을 만들기 위한 넘버링과 이 상품이 상품 목록에서 어디 페이지에 있는 지에 대해
      return "admin/product_view";
   }//product_view
   
   //상품 관리 상품 등록하기  get
   @GetMapping("/admin/product_write")
   public String product_write() {
      
      return "admin/product_write";
   }
   
   //상품 관리 상품 등록하기 post
   @PostMapping("/admin/product_write")
   public String product_Write(ProductDto pdto,
         @RequestPart("pm1") MultipartFile pmainimg,
         @RequestPart("pd1") MultipartFile pdetailimg1,
         @RequestPart("pd2") MultipartFile pdetailimg2,
         @RequestPart("pd3") MultipartFile pdetailimg3,
   
         Model model) throws Exception{

      
      //상품 관리 상품 1개 등록하기 
      String new_pmainimg =""; //파일 등록을 위한 변수 설정
      
      if(!pmainimg.isEmpty()) {    
      String ori_fileName = pmainimg.getOriginalFilename(); //실제 파일 이름
      //UUID uuid = UUID.randomUUID(); //랜덤 숫자가 생성 
      new_pmainimg = ori_fileName; //변경 파일 이름 - 중복 방지
      String uploadUrl = "c:/upload/";//파일 업로드 위치 
      File f = new File(uploadUrl+new_pmainimg); 
      pmainimg.transferTo(f);//파일 저장
      }

      System.out.println("doproduct_write pfile1: "+ new_pmainimg);
      pdto.setPmainimg(new_pmainimg);//pmainimg
      
      
      
      String new_pdetailimg1=""; //파일 등록을 위한 변수 설정
      if(!pdetailimg1.isEmpty()) {    
         String ori_fileName = pdetailimg1.getOriginalFilename(); //실제 파일 이름
         //UUID uuid = UUID.randomUUID(); //랜덤 숫자가 생성 
         new_pdetailimg1= ori_fileName; //변경 파일 이름 - 중복 방지
         String uploadUrl = "c:/upload/";//파일 업로드 위치 
         File f = new File(uploadUrl+new_pdetailimg1); 
         pdetailimg1.transferTo(f);//파일 저장
      }
      
      System.out.println("doproduct_write pdfile1: "+ new_pdetailimg1);
      pdto.setPdetailimg1(new_pdetailimg1);
      
      String new_pdetailimg2=""; //파일 등록을 위한 변수 설정
      if(!pdetailimg2.isEmpty()) {    
         String ori_fileName = pdetailimg2.getOriginalFilename(); //실제 파일 이름
         //UUID uuid = UUID.randomUUID(); //랜덤 숫자가 생성 
         new_pdetailimg2= ori_fileName; //변경 파일 이름 - 중복 방지
         String uploadUrl = "c:/upload/";//파일 업로드 위치 
         File f = new File(uploadUrl+new_pdetailimg2); 
         pdetailimg2.transferTo(f);//파일 저장
      }
      
      System.out.println("doproduct_write pdfile2: "+ new_pdetailimg2);
      pdto.setPdetailimg2(new_pdetailimg2);
      
      String new_pdetailimg3=""; //파일 등록을 위한 변수 설정
      if(!pdetailimg3.isEmpty()) {    
         String ori_fileName = pdetailimg3.getOriginalFilename(); //실제 파일 이름
         //UUID uuid = UUID.randomUUID(); //랜덤 숫자가 생성 
         new_pdetailimg3= ori_fileName; //변경 파일 이름 - 중복 방지
         String uploadUrl = "c:/upload/";//파일 업로드 위치 
         File f = new File(uploadUrl+new_pdetailimg1); 
         pdetailimg3.transferTo(f);//파일 저장
      }
      
      System.out.println("doproduct_write pdfile3: "+ new_pdetailimg3);
      pdto.setPdetailimg3(new_pdetailimg3);
      

      productService.insertOne(pdto);
      
      return "redirect:product_list";
   }//product_write post
   
   
   //상품 관리 상품 수정하기 get
   @GetMapping("/admin/product_update") //product_update에 있는 뷰 페이지가 열림
   //위 경로에 대한 get요청을 처리하는 핸들러 메서드 
   public String product_update(int pno, 
         int page, 
         String category, 
         String s_word, 
         Model model) {
      //파라미터 값을 받는 메서드를 정의한다. 
      System.out.println("product_update page get : "+ page );
      System.out.println("product_update pno get : "+ pno );
      
      HashMap<String, Object> map= productService.selectOne(pno);
      //프로덕트 서비스를 사용해서 pno에 해당하는 상품 정보를 조회하기 이 조회된 값을 map에 저장해준다. 
      model.addAttribute("pdto", map.get("pdto"));//pdto에 해당되는 값을 추가해준다. 
      model.addAttribute("category", category);
      model.addAttribute("s_word", s_word);
      model.addAttribute("page", page);
      return "admin/product_update";
       //get요청을 통해 페이지를 열 때 필요한 데이터를 준비해서 해당 페이지를 반환하는 기능을 수행한다. 데이터는 상품 정보, 카테고리, 검색어, 페이지 번호 등이 포함되어있다.
      
   }//product_update get 
   
   
   //상품 관리 상품 수정하기 post
   @PostMapping("/admin/product_update") //boardUpdate에 저장하기 
   public String product_update(ProductDto pdto, 
         @RequestPart(name="pm1",required = false) MultipartFile pmainimg,
         @RequestPart(name="pd1",required = false) MultipartFile pdetailimg1,
         @RequestPart(name="pd2", required = false) MultipartFile pdetailimg2,
         @RequestPart(name="pd3",required = false) MultipartFile pdetailimg3,
      
         int page,
         String category, 
         String s_word,
         Model model)throws Exception {
	   
	   
	   
   
         
//         System.out.println("product_update getpno pdto" + pdto.getPno());
//         System.out.println("product_update getpcode pdto" + pdto.getPcode());

	   System.out.println("product_update Pimg1  :   " +pmainimg);
         System.out.println("product_update Pdetailimg1  :   " + pdetailimg1);
      
      
         //파일이 있을 경우에 파일 저장 
         if(!pmainimg.isEmpty()) {    
            String ori_fileName = pmainimg.getOriginalFilename();//실제 파일 이름
            //UUID uuid = UUID.randomUUID(); //랜덤 숫자가 생성 
            String new_pmainimg = ori_fileName; //변경 파일 이름 - 중복 방지
            String uploadUrl = "c:/upload/";//파일 업로드 위치 
            File f = new File(uploadUrl+new_pmainimg); 
            pmainimg.transferTo(f); //파일 저장    
            pdto.setPmainimg(new_pmainimg);
           
            
         }
         
         
         if(!pdetailimg1.isEmpty()) {    
            String ori_fileName = pdetailimg1.getOriginalFilename();//실제 파일 이름
            //UUID uuid = UUID.randomUUID(); //랜덤 숫자가 생성 
            String new_pdetailimg1 =ori_fileName; //변경 파일 이름 - 중복 방지
            String uploadUrl = "c:/upload/";//파일 업로드 위치 
            File f = new File(uploadUrl+new_pdetailimg1); 
            pdetailimg1.transferTo(f); //파일 저장    
            pdto.setPdetailimg1(new_pdetailimg1);
           
         }
         if(!pdetailimg2.isEmpty()) {    
            String ori_fileName = pdetailimg2.getOriginalFilename();//실제 파일 이름
            //UUID uuid = UUID.randomUUID(); //랜덤 숫자가 생성 
            String new_pdetailimg2 = ori_fileName; //변경 파일 이름 - 중복 방지
            String uploadUrl = "c:/upload/";//파일 업로드 위치 
            File f = new File(uploadUrl+new_pdetailimg2); 
            pdetailimg2.transferTo(f); //파일 저장    
            pdto.setPdetailimg2(new_pdetailimg2);
            
         }
         if(!pdetailimg3.isEmpty()) {    
            String ori_fileName = pdetailimg3.getOriginalFilename();//실제 파일 이름
            //UUID uuid = UUID.randomUUID(); //랜덤 숫자가 생성 
            String new_pdetailimg3 =ori_fileName; //변경 파일 이름 - 중복 방지
            String uploadUrl = "c:/upload/";//파일 업로드 위치 
            File f = new File(uploadUrl+new_pdetailimg3); 
            pdetailimg3.transferTo(f); //파일 저장    
            pdto.setPdetailimg3(new_pdetailimg3);
            
         }
         
         
         
       
         
         
         System.out.println("product_update post page: " + page);
         System.out.println("product_update post pmainimg: " + pdto.getPmainimg());
         productService.updateOne(pdto);
         s_word = URLEncoder.encode(s_word, "utf-8"); //수정 후 목록으로 돌아오지 않은 이유는 한글이 지원되지 않았었기 때문
//         return "redirect:product_list";
         return "redirect:product_list?page="+page+"&category="+category+"&s_word="+s_word ;
   }//product_update post
   
       //상품 관리 상품 삭제하기 
      @RequestMapping("/admin/product_delete")
      public String product_delete(int pno) {
         productService.deleteOne(pno);
         return "redirect:product_list";
      }
      
      
      
      
      
      
      //==============================================주문 관리 ============================================================
      
      //주문 관리 페이지에 주문 전체 가져오기  
      @RequestMapping("/admin/order_list")
      public String order_list(@RequestParam(defaultValue = "1") int page,
      String ordercate, String OSTATUS, Model model ) {
    	 
    	  System.out.println("order_list controller OSTATUS: " + OSTATUS);
    	  HashMap<String, Object> map= productService.selectOrderAll(page, ordercate, OSTATUS);
    	  model.addAttribute("list", map.get("list"));
    	  model.addAttribute("page", map.get("page"));
    	  model.addAttribute("order_page_listCount", map.get("order_page_listCount"));
    	  model.addAttribute("startPage", map.get("startPage"));
    	  model.addAttribute("endPage", map.get("endPage"));
    	  model.addAttribute("maxPage", map.get("maxPage"));
    	  model.addAttribute("ordercate", map.get("ordercate"));
    	  model.addAttribute("OSTATUS", map.get("OSTATUS"));
    	  System.out.println("controller order_list page : " +model.addAttribute(page));
	  
    	  return "admin/order_list";
      }
      
      //주문 관리 페이지에서 주문 하나 가져오기
      @RequestMapping("/admin/order_view")
      public String order_view( 
    		  int ONO,
      int page, String ordercate, String OSTATUS,  Model model) {
    	  System.out.println("controller order_view ON0: "+ ONO);
    	  System.out.println("controller order_view page: "+ page);
    	  //주문 1개 가져오기 
    	  HashMap<String, Object> map = productService.selectOrderOne(ONO);
          model.addAttribute("odto", map.get("odto"));
//          model.addAttribute("prevDto", map.get("prevDto"));
//          model.addAttribute("nextDto", map.get("nextDto"));
          model.addAttribute("ordercate", ordercate);
          model.addAttribute("OSTATUS", OSTATUS);
          model.addAttribute("page", page);
      
    	  return "admin/order_view";
    	 
      }
      
    
      //주문 관리에서 배송 상태 ajax 
	  	@PostMapping("/admin/updateAjax")
	  	@ResponseBody
	  	public ArrayList<OrderDto> updateAjax(
	  			OrderDto odto ,int ONO) {
	  	 
	  		
	  		System.out.println("ProductController aJax OSTATUS : "+ odto.getOSTATUS());
	  		System.out.println("ProductController aJax OSTATUS : "+ odto.getONO());
	  		System.out.println("ProductController aJax ordercate : "+ ONO);
	  		odto.setOno(ONO); //ono를 강제로 값  넣기? 
	  		
	  		//주문 여러개 가져오기 
	  		ArrayList<OrderDto> list= productService.selectUPAjaxAll(odto); //mapper데이터 List 가져옴. 여러 개 
	  	
	  	
	  		return list;
	  	}
      
      
      
      //==============================================주문 관리 ============================================================
      
      
      
      
      
      
      
      
      
      
      
      
      
}