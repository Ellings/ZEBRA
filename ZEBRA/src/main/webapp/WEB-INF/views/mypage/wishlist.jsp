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
					<h1>Wish List</h1>
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
					<li><a href="/mypage/orderhistory" id="leftNavi1">주문 내역</a></li>	
					<li><a href="/mypage/wishlist" id="leftNavi2">위시리스트</a></li>
					<li><a href="/mypage/cart" id="leftNavi3">장바구니</a></li>
					<li><a href="/mypage/myaccount" id="leftNavi4">내정보수정</a></li>				
				</ul>			
			</div><script type="text/javascript">initSubmenu(4,0);</script>
			<!-- contents -->
			<div id="contents">
				<div id="mypage">
				<!-- 장바구니에 상품이 있을경우 -->
					<!-- 장바구니 상품 -->
					<h3>위시리스트에 담긴 상품</h3>
					<div class="orderDivNm">
						<table summary="위시리스트에 담긴 상품들을 전체선택, 상품명, 가격/포인트, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>위시리스트 상품목록</caption>
							<colgroup>
							<col width="7%"/>
							<col width="*" />
							<col width="14%" class="tnone" />
							<col width="10%" class="tw14"/>
							<col width="14%" class="tw28"/>
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col"><input type="checkbox" /></th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
								<th scope="col" class="tnone">주문</th>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" /></td>
									<td class="left">
										<p class="img"><img src="../images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>

										<ul class="goods">
											<li>
												<a href="#">쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p</a>
											</li>
										</ul>
									</td>
									<td class="tnone">1,123,400 원</td>
									<td><input type="number" min="1" max="999" value="1" /></td>
									<td>1,123,400 원</td>
									<td class="tnone">
										<ul class="order">	
											<li><a href="#" class="obtnMini iw70">바로구매</a></li>
											<li><a href="#" class="nbtnMini iw70">상품삭제</a></li>
										</ul>
									</td>
								</tr>
								
								<tr>
									<td><input type="checkbox" /></td>
									<td class="left">
										<p class="img"><img src="../images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>

										<ul class="goods">
											<li>
												<a href="#">쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p</a>
											</li>
										</ul>
									</td>
									<td class="tnone">1,123,400 원</td>
									<td><input type="number" min="1" max="999" value="1" /></td>
									<td>1,123,400 원</td>
									<td class="tnone">
										<ul class="order">	
											<li><a href="#" class="obtnMini iw70">바로구매</a></li>
											<li><a href="#" class="nbtnMini iw70">상품삭제</a></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a href="#" class="selectbtn">전체선택</a></li>
								<li><a href="#" class="selectbtn2">선택수정</a></li>
								<li><a href="#" class="selectbtn2">선택삭제</a></li>
							</ul>
						</div>
					</div>
					<!-- //장바구니 상품 -->
					

					<!-- 총 금액 -->
					<div class="amount">
						<h4>총 금액</h4>
						<ul class="info">		
						</ul>						
						<ul class="total">							
							<li class="money"><span>1,134,810</span> 원</li>
						</ul>
					</div>
					<!-- //총 주문금액 -->

					<div class="cartarea">
						<ul>
							<li><a href="#" class="ty1">선택상품 <span>주문하기</span></a></li>
							<li><a href="#" class="ty2">전체상품 <span>주문하기</span></a></li>
							<li class="last"><a href="#" class="ty3">쇼핑 <span>계속하기</span></a></li>
						</ul>
					</div>

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
	</div>
</div>
</div>
</div>


<%@ include file="../footer.jsp"%>
</body>
<!-- Mirrored from themewagon.github.io/aroma/category.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:13 GMT -->
</html>