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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
					<h1>My Account</h1>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
<div id="allwrap">
<div id="wrap">

	<div id="header">
	<!-- container -->
	<div id="container">
		<div id="outbox">		
			<div id="left">
				<div id="title">MY PAGE<span>마이페이지</span></div>
				<ul>
					<li><a href="/mypage/orderhistory" id="leftNavi2">주문 내역</a></li>	
					<li><a href="/mypage/wishlist" id="leftNavi1">위시리스트</a></li>
					<li><a href="/mypage/cart" id="leftNavi1">장바구니</a></li>
					<li><a href="/mypage/myaccount" id="leftNavi3">내정보수정</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(4,0);</script>
			<!-- contents -->
			<div id="contents">
					<div class="memberbd">
					<form action="/mypage/updateMyForm"  name="updateFrm" method="get" >
					
						<table summary="이름, 아이디, 비밀번호, 비밀번호 확인, 이메일, 이메일수신여부, 주소, 휴대폰, 유선전화, 생년월일 순으로 회원가입 정보를 수정할수 있습니다." class="memberWrite" border="1" cellspacing="0">
							<caption>회원가입 수정</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="name"><span>이름  </span></th>
									<td>김슬기</td>
								</tr>
								<tr>
								<th scope="row"><span>성별 </span></th>
								<td>
								  <ul class="baseQues">
								    <li><input type="radio" name="gender" id="solar" class="radio_t" checked="checked"/><label for="solar">남성</label>
								    </li>
								    <li><input type="radio" name="gender" id="lunar" class="radio_t"/><label for="lunar">여성</label>
									  </c:if>
								
									  
									  <input type="radio" name="gender" id="solar" class="radio_t" checked="checked"/><label for="solar">남성</label>
								    </li>
								    <li>
								      <input type="radio" name="gender" id="lunar" class="radio_t"/><label for="lunar">여성</label>
								  </c:if>
								    </li>
								  </ul>
								</td>
								</tr>
								<tr>
									<th scope="row"><label for="id">아이디 </label></th>
									<td>${member.sessionId }</td>
								</tr>
								<!--================ START 비밀번호 비교 확인 =================-->						
								<script type="text/javascript">
								  function pwKey(){				
								  	let pw1 = $("#joinPw").val();					 					  
								 	 if(pw1 == $("#joinPw2").val()){
									  $("#pwKeyText").html("<span class='mvalign black'>* 비밀번호가 일치입니다.</span>");
								  	 }else{
									  $("#pwKeyText").html("<span class='mvalign orange'>* 비밀번호가 일치하지 않습니다.</span>");
								     }
								  	  console.log($("#joinPw2").val());
								 		return false;
								  	 }//pwKey
								</script>			
								<!--================ END 비밀번호 비교 확인 =================-->		
								<tr>
									<th scope="row"><span>비밀번호 </span></th>
									<td>
										<ul class="pta">
											<li class="r10"><input type="password" name="MPASSWORD" id="joinPw" class="w134" /></li>
											<li style="padding:10px 0 0 0;"><span class="mvalign2">※ 영문/숫자/특수문자 혼용 4~20자까지 사용가능합니다.</span></li>											
										</ul>
									</td>
								</tr>
								
								
								<tr>
									<th scope="row"><span>비밀번호 변경  </span></th>
									<td><a href="password_change.html" class="nbtnMini iw86">비밀번호 변경</a></td>
								</tr>
								<tr>
									<th scope="row"><span>이메일</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" name="MEMAIL1" id="joinEmail1" value="${member.MEMAIL }" required />
											
												<class="w134" /></li>
											<li><span class="valign">&nbsp;@&nbsp;</span></li>
											<li class="r10"><input type="text" class="w134" /></li>
											<li>
												<select id="emailList">
													<option value="#" selected="selected">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="nate.com">nate.com</option>    
													<option value="yahoo.co.kr">yahoo.co.kr</option>    
													<option value="paran.com">paran.com</option>    
													<option value="empal.com">empal.com</option>    
													<option value="hotmail.com">hotmail.com</option>    
													<option value="korea.com">korea.com</option>    
													<option value="lycos.co.kr">lycos.co.kr</option>    
													<option value="dreamwiz.com">dreamwiz.com</option>    
													<option value="hanafos.com">hanafos.com</option>    
													<option value="chol.com">chol.com</option>    
													<option value="gmail.com">gmail.com</option>    
													<option value="empas.com">empas.com</option>
												</select>&nbsp;&nbsp;&nbsp;
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>이메일 수신여부  </span></th>
									<td>
										<p>지브라에서 진행되는 이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까?</p>
										<ul class="question">
											<li>
												<input type="radio" name="receive" id="receive_yes" class="radio_t" checked="checked"/><label for="receive_yes">예</label>
											</li>
											<li>
												<input type="radio" name="receive" id="receive_no" class="radio_t"/><label for="receive_no">아니오</label>
											</li>
										</ul>
										<p class="gray">* 거래관련 정보는 고객님의 거래안전을 위하여 이메일 수신거부와 관계없이 발송됩니다.</p>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>휴대폰  </span></th>
									<td>
										<ul class="pta">
											<li>
												<select>
													<option value="010" selected="selected">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>    
													<option value="019">019</option>    
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" /> <span class="valign">-</span>&nbsp;</li>
											<li class="r10"><input type="text" class="w74" maxlength="4" /></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>생년월일</span></th>
									<td>
										<ul class="pta">
											<li>
												<select>
													<option value="${member.MBIRTH}" selected="selected">${member.MBIRTH}</option>
													<script type="text/javascript">
													<![CDATA[
														for(var i=1940; i<=2014; i++){
															document.write("<option value=''>" + i + "년"+ "</option>");	
														};
													]]>
													</script>
												</select>
											</li>
											<li>&nbsp;<span class="valign"></span>&nbsp;&nbsp;&nbsp;</li>
											<li>
												<select>
													<option value='' selected="selected">월</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=12; i++){
															if(i<10){
																document.write("<option value=''>0" + i + "월"+"</option>");
															}else{
																document.write("<option value=''>" + i + "월"+ "</option>");
															};
														};
													//]]>
													</script>
												</select>
											</li>
											<li>&nbsp;<span class="valign"></span>&nbsp;&nbsp;&nbsp;</li>
											<li>
												<select>
													<option value='' selected="selected">일</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=31; i++){
															if(i<10){
																document.write("<option value=''>0" + i + "일"+"</option>");
															}else{
																document.write("<option value=''>" + i + "일"+ "</option>");
															};
														};
													//]]>
													</script>
												</select>
											</li>
											<li class="r20">&nbsp;<span class="valign"></span></li>
											<li class="pt5">
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
							</table>
						</div>
						

					</div>

					
					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>
								<li><a href="#" class="nbtnbig">취소하기</a></li>
								<li><a style="cursor: pointer;" onclick="updateBtn()" class="sbtnMini">수정하기</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->

<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />


				</form> 
				</div>
			</div>
			<!-- //contents -->
		</div>
	</div>
	<!-- //container -->
</div>
</div>

<%@ include file="../footer.jsp"%>
</body>
<!-- Mirrored from themewagon.github.io/aroma/category.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:13 GMT -->
</html>