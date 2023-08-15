<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title> ZEBRA </title>
<link rel="icon" href="/img/logo2.png" type="image/png">
<link rel="stylesheet" type="text/css" href="/css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="/css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="/css/content.css?v=Y" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/prototype/1.6.1.0/prototype.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/top_navi.js"></script>
<script type="text/javascript" src="/js/left_navi.js"></script>
<script type="text/javascript" src="/js/main.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.anchor.js"></script>
<script type="text/javascript"></script>
<script src="/js/main.js"></script>
<link rel="stylesheet" href="/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/vendors/linericon/style.css">
<link rel="stylesheet" href="/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="/vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="/css/style.css">
</head>

<style>
.orderTable .td_width_1_cart_info_td {
    padding: 0;
}

.quantity_modify_btn {
    border: none;
    margin-top: 4px;
}
</style>

<script>
/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
(function($) {	
	$(document).ready(function() {			
		/* 종합 정보 섹션 정보 삽입 */
		setTotalInfo();		
	});
		
	/* 체크여부에 따른 종합 정보 변화 */
	$(document).on("change", ".individual_cart_checkbox", function(){		
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td"));
	});
	
	/* 체크박스 전체 선택 */
	$(document).on("click", ".all_check_input", function(){		
		/* 체크박스 체크/해제 */
		if($(".all_check_input").prop("checked")){
			$(".individual_cart_checkbox").prop("checked", true);
		} else{
			$(".individual_cart_checkbox").prop("checked", false);
		}				
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td"));
	});
		
	/* 수량 수정 버튼 LINE 211 */
	$(document).on("click", ".quantity_modify_btn", function() {
		alert("수량이 변경되었습니다.");
		let cartId = $(this).data("cartid");
		let cartCount = $(this).parent("td").find("input").val();	
		/* 
		console.log({"cartId : "+cartId});
		console.log({"cartCount : "+cartCount});
		 */
		$(".update_cartId").val(cartId);
		$(".update_cartCount").val(cartCount);
		$(".quantity_update_form").submit();	
	});		
	
	/* 장바구니 삭제 버튼 */
	$(document).on("click", ".nbtnMini", function(e){
		alert("해당 상품을 삭제하였습니다.");
		e.preventDefault();
		const cartId = $(this).data("cartid");
		$(".delete_cartId").val(cartId);
		$(".quantity_delete_form").submit();
	});
		
/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){ 	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let finalTotalPrice = 0; 		// 최종 가격		
	
	$(".cart_info_td").each(function(index, element){
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){ // LINE 163 */
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").text().replace(/,/g, '').replace(' 원', ''));			
		// 총 갯수
		totalCount += parseInt($(element).find(".quantity_input_cart_info_td").val());					
		
	  } 		
	});
	
	console.log({"totalPrice" : totalPrice});
	console.log({"totalCount" : totalCount});	
	
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
	};	
		
}) (jQuery);
</script>

<body>

<%@ include file="../top.jsp"%>

  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shopping Cart</h1>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
 	<!--================ start Cart Area =================-->
 	<div id="allwrap">
	<div id="wrap">

	<div id="header">
	<!-- container -->
	<div id="container">
		<div id="outbox">		
			<div id="left">
				<div id="title">MY PAGE<span>마이페이지</span></div>				
				<ul>
					<li><a href="/mypage/orderhistory" id="leftNavi1">주문 내역</a></li>	
					<li><a href="/mypage/wishlist" id="leftNavi2">위시리스트</a></li>
					<li><a href="/mypage/cart" id="leftNavi3">장바구니</a></li>
					<li><a href="/mypage/myaccount" id="leftNavi4">내정보수정</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(4,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="mypage"></div>			
				

				<!-- 장바구니에 상품이 있을경우 -->
					<!-- 장바구니 상품 -->
					
					<h4>${sessionId}님의 장바구니 리스트</h4>
					<div class="orderDivNm">
						<table summary="장바구니에 담긴 상품들을 전체선택, 상품명, 가격/포인트, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">					
							<caption>장바구니 상품목록</caption>
							<colgroup>
							<col width="7%"/>
							<col width="*" />
							<col width="14%" class="tnone" />
							<col width="10%" class="tw14"/>
							<col width="14%" class="tw28"/>
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col">
								<!-- 체크박스 전체 여부 -->
									<div class="all_check_input_div">
										<input type="checkbox" class="all_check_input" checked="checked"/>
									</div>
								</th> 
								
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
								<th scope="col" class="tnone">주문</th>
							</thead>
							
							<tbody>
								<c:forEach items="${cartInfo}" var="ci"> <!-- 장바구니 정보 -->								
								<tr class="cart_info_td">
								
								<!-- 체크박스 -->
								<td>
									<input type="checkbox" class="individual_cart_checkbox" checked="checked"/>
								</td>
								
								<td class="left_cart_info_td">
									<p class="img"><img src="/upload/${ci.pmainimg}" alt="상품" width="66" height="66" /></p>
									<ul class="goods">
										<li>
											<a href="#" style="font-size:15px;">${ci.pname}</a>
										</li>
									</ul>
								</td>
								
								<td> <!-- 상품1 가격  -->
									<input type="text" class="individual_pprice_input" 
									value=<fmt:formatNumber value="${ci.pprice}" pattern="#,##0" /> 
									style="outline: none; border: none; width: 70px; text-align: right; vertical-align: middle; " readonly>원								
								</td>
								
								<td> <!-- <input type="number"> 수량 버튼  -->
									<input type="number" class="quantity_input_cart_info_td" min="1" max="999" 
									value="${ci.cartCount}" style="text-align: right;" name="ccontent" />
									<button type="button" class="quantity_modify_btn" data-cartId="${ci.cartId}">변경</button>									
								</td> 
								
								<td class="individual_totalPrice_input">
									<fmt:formatNumber value="${ci.pprice * ci.cartCount}" pattern="#,##0" /> 원
								</td>
								
								<td class="tnone">
									<ul class="order">	
										<li><a href="/payment/payment" class="obtnMini iw70">바로구매</a></li>
										<li><a href="" class="nbtnMini iw70" data-cartId="${ci.cartId}">상품삭제</a></li> 
									</ul>
								</td>
								</tr>		
								</c:forEach>
							</tbody>
						</table>
					</div>

					
					<div class="btnArea">
						<div class="bRight">
								<ul>
									<li><a href="#" class="selectbtn2">전체선택</a></li>
									<li><a href="#" class="selectbtn">선택수정</a></li>
									<li><a href="#" class="selectbtn2" data-cartId="${sessionId}">선택삭제</a></li>
								</ul>
						</div>
					</div>
					
					<!-- //장바구니 상품 -->
					
					<!-- 총 주문금액 -->
					<form action="/mypage/cart" name="search" method="post"> 
					<div class="amount">
						<h4>총 주문금액</h4>
						<ul class="info">	
						</ul>	
						<ul class="total">	
							<li class="money"><span><input type="text" id="finalTotalPrice_span"
							style="border: none; text-align: right; margin-right:right; vertical-align: middle; " readonly > 원</span></li>
						</ul>
					</div>
					</form>
					

					<div class="cartarea">
						<ul>
							<li><a href="#" class="ty1">선택상품 <span>주문하기</span></a></li>
							<li><a href="/payment/payment/${sessionId}" class="ty2">전체상품 <span>주문하기</span></a></li>
							<li class="last"><a href="/layout/index" class="ty3">쇼핑 <span>계속하기</span></a></li>
						</ul>
					</div>	
									 
					<!-- 수량 조정 form -->
					<form action="/update" class="quantity_update_form" method="post"> 
						<input type="hidden" name="cartId" class="update_cartId">
						<input type="hidden" name="cartCount" class="update_cartCount">
						<input type="hidden" name="memberId" value="${sessionId}">						
					</form>					
					
					<!-- 삭제 form -->
					<form action="/delete" method="post" class="quantity_delete_form">
						<input type="hidden" name="cartId" class="delete_cartId">
						<input type="hidden" name="memberId" value="${sessionId}">
					</form>
					
					<!-- 주문 form -->
					<form action="payment/payment/${sessionId}" method="get" class="order_form">		
					</form>

				<!-- //장바구니에 상품이 있을경우 -->

				<!-- 장바구니에 상품이 없을경우
					<div class="noting">
						<div class="point"><span class="orange">장바구니</span>에 담긴 상품이 없습니다.</div>

						<p>장바구니에 담긴 상품은 30일간만 보관됩니다.<br/>더 오래 보관하고 싶은 상품은 <u>위시리스트</u>에 담아주세요.</p>

						<a href="#">쇼핑 계속하기</a>
					</div>
				 //장바구니에 상품이 없을경우 -->

				</div>
			</div>
			<!-- //contents -->


<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
.ui-spinner-input{width:44px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
</style>

<script type="text/javascript">
$(function() {
	var spinner = $( ".spinner" ).spinner({ min: 1, max: 999 });
});

</script>



		</div>
	</div>
	<!-- //container -->

 	 <!--================End Cart Area =================-->

 <%@ include file="../footer.jsp"%>
 </body>