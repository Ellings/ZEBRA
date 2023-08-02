<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title> ZEBRA </title>
<link rel="icon" href="../img/logo2.png" type="image/png">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no">
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<script type="text/javascript"></script>
<link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../vendors/linericon/style.css">
<link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="../css/style.css">
<!-- <script type="text/javascript">

</head>
<body>
<%@ include file="../top.jsp"%>
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1> ID SEARCH </h1>
				</div>
			</div>
    </div>
	</section>
  <!-- ================ end banner area ================= -->
  
  <!--================Login Box Area =================-->
	<div id="allwrap">
	<div id="wrap">
	
		<div id="header">
		<!-- container -->
		<div id="container">
		
			<div id="outbox">		
				<div id="left">

					<div id="title2">MEMBERSHIP<span>멤버쉽</span></div>
				<ul>	
				<li><a href="/member/login" id="leftNavi1">로그인</a></li>
					<li><a href="/member/register" id="leftNavi2">회원가입</a></li>
					<li><a href="member/idsearch" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>				
				</ul>			
			</div><script type="text/javascript">initSubmenu(3,0);</script>
				
			<!-- contents -->
			<div id="contents">
				<div id="member">
					
		<!--=============START 이름,EMAIL 중복 체크 Area ==============-->
					<script type="text/javascript">
					function checkIdEmailBtn(){
				 	//alert("idsearch 클릭");
					 	console.log($('#idEmck').val());
				
					    $.ajax({
					      url:"/member/idEmailCheck",
					      type:"post",
					      data:{"MNAME":$('#joinName').val(),
					    	   "MEMAIL":$('#joinEmail').val() },
					      success:function(data){
					    	 console.log(data); 
					    	 if(data=="fail")
					    		 alert("존재하지 않는 회원입니다.")
					         else{
					        	 alert("id: "+data)
					         }	 
						    },//success
						   error:function(){
						      alert("이름과 이메일을 확인해주세요 : 사용이 불가합니다.");	  
						   }//error
						});//ajax 				
						
					}//checkIdEmailBtn
					</script>
 		<!--=============END 이름,EMAIL 중복 체크 Area ==============-->	 
					<h2><strong></strong><span>회원님께서 가입하신 아이디와 이메일을 검색하세요.</span></h2>
					<h3>아이디 찾기</h3>
					<div class="informbox">
						<div class="inform">							
							<ul>
								<li><input type="text" class="nameType" name="MNAME" id="joinName" placeholder="이름" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='nameType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" /></li>
								<li class="r10"><input type="hidden" id="idEmck" ></li>
								<li><input type="text" class="emailType" name="MEMAIL" id="joinEmail"  placeholder="이메일" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='emailType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" /></li>
								<li class="btn"><a onclick="checkIdEmailBtn()" class="gbtn"> 아이디 찾기 </a></li>
							</ul>
						</div>
					</div>																
		<!-- ================ start 이메일 인증 임시 비밀번호 area ================= -->	
					<script type="text/javascript">		
					   let tempcode="";
					    function emailView(){
						  //alert("이름과 이메일을 입력한 후 인증코드 발송을 클릭하세요.");
						 //  $(".memberbd").css("display","block");
					   }
			 
					   function emailBtn(){
						//   alert("임시번호를 발송합니다.");
						 //  alert($("#mem_name").val());
						 //  alert($("#mem_email").val());
						   
						   $.ajax({
							   url:"/email/emailSend",
							   type:"post",
							   data:{"MNAME":$("#mem_name").val(),
								     "MEMAIL":$("#mem_email").val()
								   	 },
							   success:function(data){
								   alert("이메일이 발송되었습니다. 임시 비밀번호를 확인해주세요.");
								  // console.log(data);
								   //임시비밀번호
								   tempcode=data;
								   $("#mem_name").attr("readonly",true);
							   },
							   error:function(){
								   alert("실패");
							   }
						   }); //ajax						   
					   }//
					</script>
		<!-- ================ end 이메일 인증 임시 비밀번호 area ================= -->			 
					<!-- 이메일인증 코드 생성 -->
					<h3>비밀번호 이메일 인증 코드 입력</h3>
					<div class="informbox">
						<div class="inform">						  			   
							<ul>
								<li><input type="text" placeholder="이름" class="emailType" name="MNAME" id="mem_name" /></li>
								<li class="r10"><input type="text" style="left:50px;" class="emailType" placeholder="이메일"  name="EMAIL" id="mem_email" /></li>
								<li><a onclick="emailBtn()" style="cursor: pointer;"   class="gbtn"> 임시 비밀번호 발송 </a></li>
							</ul>								
								<li class="pt5"><span class="mvalign">입력하신 이메일로 인증코드가 발송됩니다. 인증코드를 아래에 입력해주세요.</span></li>
						</div>
					</div>
				
					</div>
				</div>

			</div>
			</div>
			<!-- //contents -->
		</div>
		</div>
	<!-- //container -->	

	<!--================End  Box Area =================-->

 <%@ include file="../footer.jsp"%>
</body>
<!-- Mirrored from themewagon.github.io/aroma/category.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:13 GMT -->
</html>