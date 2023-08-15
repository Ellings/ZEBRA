<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title> ZEBRA </title>
<link rel="icon" href="../img/logo2.png" type="image/png">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
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
</head>
<body>
<%@ include file="../top.jsp"%>

  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Member registration completed</h1>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  
 <!--================Login Box Area =================-->
	<!-- container -->
	<div id="container">
		<div id="outbox">		
			<div id="left">
				<div id="title2">MEMBERSHIP<span>멤버쉽</span></div>	
				<br>			
				<ul>
					<li><a href="/member/login" id="leftNavi1">로그인</a></li>	
					<li><a href="/member/register" id="leftNavi2">회원가입</a></li>
				
				</ul>			
			</div><script type="text/javascript">initSubmenu(4,0);</script>


			<!-- contents -->
			<div id="contents" >
				<div id="member" >
					
						<!-- STEP -->
					<div class="stepWrap">
						
						<div class="step">
							<a href="">
								<p class="web">STEP 01</p>
								<p class="txt">약관 동의</p>
							</a>
						</div>

						<div class="step">
							<a href="">
								<p class="web">STEP 02</p>
								<p class="txt"><span>회원정보</span> <span>입력</span></p>
							</a>
						</div>

						<div class="step stepon">
							<a href="">
								<p class="web">STEP 03</p>
								<p class="txt"><span>회원가입</span> <span>완료</span></p>
								<p class="ck"><img src="../img/member/bg_step.png" alt="현재위치" /></p>
							</a>
						</div>
					</div>
					<!-- //STEP -->	
					<!-- //STEP -->
			<!-- //Step box End -->
		<div class="celebrate">	
						<div class="img"><img src="#" alt="" /></div>
						<p class="thx">감사합니다. <span>회원가입이 완료되었습니다.</span></p>
						<p class="txt">
							저희 가족이 되어주셔서 감사합니다.<br/>
							가입 시 입력하신 이메일로 가입 완료 메일이 전송되었습니다.<br/>
							언제나 고객님께 즐겁고 소중한 시간이 되도록 최선을 다 하겠습니다.<br/><br/>
							
						</p>
					</div>

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>
								<li><a href="/layout/index" class="nbtnbig">메인으로</a></li>
								<li><a href="/member/login" class="sbtnMini">로그인</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->


				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->
	<!--================End Login Box Area =================-->

<%@ include file="../footer.jsp"%>
</body>
<!-- Mirrored from themewagon.github.io/aroma/category.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:13 GMT -->
</html>