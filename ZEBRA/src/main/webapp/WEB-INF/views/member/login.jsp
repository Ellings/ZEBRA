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
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 사용 할때 $ 사용 하기위한 js  -->
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
<link rel="stylesheet" href="../css/login.css">
<script type="text/javascript"></script> 
<script>
function loginBtn(){
		if($("#MID").val()=="" || $("#MPASSWORD").val()==""){
		alert("아이디 또는 패스워드를 입력하셔야 로그인이 가능합니다.");
			$("#MID").focus();
			return false;
		}
		loginFrm.submit();
		
}//loginBtn

//로그인 알림창
</script>
 <!-- START 로그인 중복 검사  --> 
<script type="text/javascript">
function joinBtn(){
// alert("가입버튼을 클릭");
console.log($('#joinName').val());
console.log($('#joinId').val());
console.log($('#joinPw').val());
console.log($('#joinPhone').val());
console.log( $(":input:radio[name=gender]:checked").val());
console.log($("input[type=checkbox][name=hobby]:checked").val());
}
</script>

</head>
<body>
<%@ include file="../top.jsp"%>	
  
  <!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Login</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================ start Login Box Area =================-->
	<!-- container -->
	<div id="container">
		<div id="location"></div>

		<div id="outbox">
			<div id="left">
				<div id="title2">
					MEMBERSHIP<span>멤버쉽</span>
				</div>
				<ul>
					<li><a href="/member/login" id="leftNavi1">로그인</a></li>
					<li><a href="/member/register" id="leftNavi2">회원가입</a></li>
					<li><a href="/member/idsearch" id="leftNavi3">아이디<span>비밀번호
								찾기</span></a></li>
				</ul>
			</div>
			<script type="text/javascript">	initSubmenu(1, 0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="member">

					<h3>회원 로그인</h3>
					<div class="informbox">
						<div class="inform">
							<form action="/member/login" method="post" name="loginFrm">
								<ul>
									<li><input type="text" class="loginType" name="MID"	id="MID" onfocus="this.className='mfocus'"
										onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='mfocusnot'}"
										style="ime-mode: inactive;" /></li>
									<li><input type="password" class="passType"	name="MPASSWORD" id="MPASSWORD"
										onfocus="this.className='mfocus'"
										onblur="if (this.value.length==0) {this.className='passType'}else {this.className='mfocusnot'}"
										style="ime-mode: inactive;" /></li>
							    </ul>

								<div class="btn">
									<a onclick="loginBtn()" style="cursor: pointer;" class="sbtn">로그인</a>
								</div>
								<div class="point">
									<p>아이디와 비밀번호를 잊으셨나요?</p>
									<a href="/member/idsearch" class="nbtn">아이디/비밀번호 찾기</a>
								</div>
								<div class="point">
									<a href="/admin/login" class="nbtn">관리자 로그인 페이지</a>
								</div>
								
							</form>
						</div>
					</div>
					</div>
				</div>
				<!-- //contents -->
			</div>
		</div>
		<!-- //container -->

		<!--================End Login Box Area =================-->

		<%@ include file="../footer.jsp"%>
</body>

<!-- Mirrored from themewagon.github.io/aroma/login by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:25 GMT -->
</html>