<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="http://ajax.googleapis.com/ajax/libs/prototype/1.6.1.0/prototype.js" type="text/javascript"></script>
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

<script>
(function($) {	
	$(document).ready(function() {			
		/* 종합 정보 섹션 정보 삽입 */
		/* setTotalInfo();	 */
		
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
			/* function setTotalInfo(){ */		
			let totalPrice = 0;				// 총 가격
			let totalCount = 0;				// 총 갯수
			let finalTotalPrice = 0; 		// 최종 가격		
			
			$(".cart_info_td").each(function(index, element){
				/* if($(element).find(".individual_cart_checkbox").is(":checked") === true){ */			
				// 총 가격
				totalPrice += parseInt($(element).find(".individual_totalPrice_input").text().replace(/,/g, '').replace(' 원', ''));							
				// 총 갯수
				totalCount += parseInt($(element).find(".quantity_input_cart_info_td").val());					
				console.log({"totalPrice" : totalPrice});
				console.log({"totalCount" : totalCount});
				/* } */					
			});
			
			/* 최종 가격 */
			finalTotalPrice = totalPrice;
			console.log({"finalTotalPrice" : finalTotalPrice});	
			
			/* 값 삽입 */
			// 총 가격
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			// 총 갯수
			$(".totalCount_span").text(totalCount);
			// 최종 가격
			$("#finalTotalPrice_span").val(finalTotalPrice.toLocaleString());
			
		});
	}) (jQuery);
</script>

</head>
<body>
<%@ include file="../top.jsp"%>
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1> Order confirmation  </h1>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
	<!-- ================ strat order confirmation area ================= -->
<div id="allwrap">
<div id="wrap">
	
	<div id="header">	
		<!-- container -->
	<div id="container">
		<div id="outbox">		
			
			<!-- maxcontents -->
			<div id="maxcontents">
				<div id="mypage">
					<h2><strong>주문/결제</strong></h2>
					
					<!-- 주문 상품 -->
					<h3 class="dep">주문 제품 확인</h3>
					<div class="orderDivNm">
						<table summary="주문 제품 확인 게시판으로 상품명, 가격, 수량, 합계순으로 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>주문 제품 확인</caption>
							<colgroup>
							<col width="*" />
							<col width="16%" class="tnone" />
							<col width="14%" />
							<col width="16%" class="tw28"/>
							</colgroup>
							<thead>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
							</thead>
							
							
							<tbody>
								<c:forEach items="${cartInfo}" var="ci"> <!-- 장바구니 정보 -->	
								<tr class="cart_info_td">
									<td class="left">
										<p class="img"><img src="/upload/${ci.pmainimg}" alt="상품" width="66" height="66" /></p>
										
										<ul class="goods">
											<li>
												<a href="#" style="font-size:15px;">${ci.pname}</a>
											</li>
										</ul>
									</td>
									<td class="tnone" >
										<input type="text" class="individual_pprice_input" 
										value=<fmt:formatNumber value="${ci.pprice}" pattern="#,##0" /> 
										style="outline: none; border: none; width: 70px; text-align: right; " readonly>원
									</td>
									
									<td>
										<input type="number" class="quantity_input_cart_info_td" min="1" max="999" 
										value="${ci.cartCount}" style="outline: none; border: none; text-align: right;" readonly />개								
									</td>
									
									<td class="individual_totalPrice_input">
										<fmt:formatNumber value="${ci.pprice * ci.cartCount}" pattern="#,##0" /> 원
									</td>
									
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
					<div class="poroductTotal">
						<ul>	
							<li>총 합계 
								<input type="text" id="finalTotalPrice_span" 
								style="border: none; text-align: right; margin-right:10px; background: transparent;
								font-size: 20px; font-weight: bold; vertical-align: middle;" readonly> 원
							</li>
						</ul>
					</div>
					<!-- //주문 상품 -->
			<!-- 수령인 정보확인 -->
					<h3 class="dep">수령인 정보</h3>
					<div class="checkDiv">
						<table summary="수령인 정보를 이름, 주소, 이메일, 휴대폰 번호, 전화번호, 배송시 요구사항 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>수령인 정보확인</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름</span></th>
									<td colspan="3">${odto1.ONAME}</td>
								</tr>

								<tr>
									<th scope="row" rowspan="2"><span>주소</span></th>
									<td rowspan="2">${odto1.OZIP}<br/>${odto1.OADDR1}<br/>${odto1.OADDR2}</td>
									<th scope="row"><span>휴대폰 <u>번호</u></span></th>
									<td>${odto1.OHP1}-${odto1.OHP2}-${odto1.OHP3}</td>
								</tr>

								<tr>
									<th scope="row"><span>유선<u>번호</u></span></th>
									<td>${odto1.ORHP1}-${odto1.ORHP2}-${odto1.ORHP3}</td>
								</tr>

								<tr>
									<th scope="row"><span>배송시 <u>요구사항</u></span></th>
									<td colspan="3">${odto1.OWANT}</td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //주문자 정보확인 -->
			<!-- 주문 정보 확인 -->
					<h3 class="dep">주문 정보</h3>
					<div class="checkDiv">
						<table summary="주문정보를 주문번호, 결제수단, 주문일, 입금은행, 요구사항, 입금자 명 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>주문 정보</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>주문번호</span></th>
									<td>${odto1.ONO}</td>
									<th scope="row"><span>결제수단</span></th>
									<td>${odto1.OPAYMENT}</td>
								</tr>
								<tr>
									<th scope="row"><span>요구사항</span></th>
									<td>${odto1.OWANT}</td>
									<th scope="row"><span>입금자 <u>명</u></span></th>
									<td>${odto1.ONAME}</td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //주문 정보 확인 -->






					<!-- Btn Area -->
					<div class="radion_btn" style="display: flex; justify-content: center;">
					<ul>
						<li><a href="/layout/index" class="nbtnbig iw0140">쇼핑계속하기</a></li>
					</ul>
					</div>
					<!-- //Btn Area -->


				</div>
			</div>
			<!-- //maxcontents -->


		</div>
	</div>
	<!-- //container -->

</div>
</div>
<!-- ================ end order confirmation area ================= -->

<%@ include file="../footer.jsp"%>
</body>
<!-- Mirrored from themewagon.github.io/aroma/category.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:13 GMT -->
</html>