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
<link rel="stylesheet" href="/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/vendors/linericon/style.css">
<link rel="stylesheet" href="/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="/vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="/css/style.css">
<script>
    function writeBtn(){
    	if(confirm("주문 및 결제를 하시겠습니까?")){
    		write.submit();
    	}
    }    
</script>

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
					<h1>Order/Payment</h1>					         
				</div>
			</div>
    	</div>	
    	</section>
	<!-- ================ end banner area ================= -->
<div id="header">
	<!-- GNB -->
	<div id="gnb">
		<div id="top">
		</div>
		<script type="text/javascript">initTopMenu();</script>
	</div>
	<!-- //GNB -->

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
												<a href="#" style="font-size:15px; ">${ci.pname}</a>
											</li>
										</ul>
									</td>
									<td class="tnone" >
										<input type="text" class="individual_pprice_input" 
										value=<fmt:formatNumber value="${ci.pprice}" pattern="#,##0" /> 
										style="outline: none; border: none; width: 70px; text-align: right; vertical-align: middle;" readonly>원
									</td>
									
									<td>
										<input type="number" class="quantity_input_cart_info_td" min="1" max="999" 
										value="${ci.cartCount}" style="outline: none; border: none; text-align: right; " readonly />개								
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
			<!-- 수령인 정보 입력 -->
			<form action="/payment/confirmation" name="write" method="post" enctype="multipart/form-data">
					<h3 class="dep">
						수령인 정보 입력
					</h3>
					<div class="checkDiv">
						<table summary="수령인 정보 입력할 수 있는 란으로 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 입력 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>수령인 정보 입력</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름</span></th>
									<td><input type="text" class="w134" name="ONAME" /></td>
			                        <input type="hidden" class="w134" name="MID" value="${MID}" />
								</tr>
								<tr>
									<th scope="row"><span>주소</span></th>
										<td>
										<input type="text" name="OZIP" id="sample6_postcode" placeholder="우편번호">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" name="OADDR1" id="sample6_address" placeholder="주소"><br>
										<input type="text" name="OADDR2" id="sample6_detailAddress" placeholder="상세주소">
										
										<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script>
										    function sample6_execDaumPostcode() {
										        new daum.Postcode({
										            oncomplete: function(data) {
										                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
										
										                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
										                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										                var addr = ''; // 주소 변수
										                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										                    addr = data.roadAddress;
										                } else { // 사용자가 지번 주소를 선택했을 경우(J)
										                    addr = data.jibunAddress;
										                }
										                // 우편번호와 주소 정보를 해당 필드에 넣는다.
										                document.getElementById('sample6_postcode').value = data.zonecode;
										                document.getElementById("sample6_address").value = addr;
										                // 커서를 상세주소 필드로 이동한다.
										                document.getElementById("sample6_detailAddress").focus();
										            }
										        }).open();
										    }
										</script>
								</tr>
								<tr>
									<th scope="row"><span>휴대폰 번호</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="OHP1">
													<option value="010" selected="selected">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>    
													<option value="019">019</option>    
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" name="OHP2"/> <span class="valign">-</span>&nbsp;</li>
											<li class="r10"><input type="text" class="w74" maxlength="4" name="OHP3"/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>유선번호</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="ORHP1">
													<option value="02" selected="selected">02</option>
													<option value="031">031</option>
													<option value="032">032</option>
													<option value="033">033</option>
													<option value="041">041</option>
													<option value="042">042</option>
													<option value="043">043</option>
													<option value="051">051</option>
													<option value="052">052</option>
													<option value="053">053</option>
													<option value="054">054</option>
													<option value="055">055</option>
													<option value="061">061</option>
													<option value="062">062</option>
													<option value="063">063</option>
													<option value="064">064</option>
													<option value="070">070</option>
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" name="ORHP2"/> <span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" name="ORHP3"/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>배송시 <u>요구사항</u></span></th>
									<td><textarea class="demandtta" name="OWANT"></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //수령인 주소 입력 -->


			<!-- 결제 금액 -->
					<h3 class="dep">결제 금액</h3>
					<div class="checkDiv">
						<table summary="쿠폰 및 포인트를 입력 또는 확인 할 수 있는 란으로 총 주문금액, 배송비, 쿠폰할인, 포인트 사용, 총 결제금액 순으로 입력 또는 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<colgroup>
							<col width="22%" class="tw30" />
							</colgroup>
							<tbody>
									<th scope="row"><span>총 결제금액</span></th>
									<td>
										<ul class="pta">
											<li><span class="valign"><strong>1,133,810 원</strong></li>
										</ul>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
			<!-- //결제 금액 -->
			<!-- 결제수단 선택 -->
					<h3 class="dep">결제수단 선택</h3>
					<div class="checkDiv">
						<table summary="신용카드 결제, 실시간 계좌이체, 가상계좌, 가상계좌(에스크로), 무통장 입금 순으로 결제수단을 선택하실 수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>결제수단 선택</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>결제수단</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="radio" id="method01" name="OPAYMENT" value="신용카드 결제" checked="checked" /><label for="method01">신용카드 결제</label>
											</li>
											<li>
												<input type="radio" id="method03" name="OPAYMENT" value="무통장 입금"/><label for="method03">무통장 입금</label>
											</li>
											<li>
												<input type="radio" id="method04" name="OPAYMENT" value="간편 결제"/><label for="method04">간편 결제</label>
												<input type="hidden" class="w134" name="OSTATUS" value="상품 준비 중" />
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
							
						</table>
					</div>
				<!-- //결제수단 선택 -->

					<div class="disnone method01"><!-- 신용카드 -->
						<p class="orderalert"><strong>[신용카드]</strong> 온라인상에서 소유하신 신용카드를 통해, 전자결제를 진행합니다.</p>
					</div>
					<div class="disnone method05"><!-- 무통장 입금 -->
						<p class="orderalert"><strong>[무통장 입금]</strong> 쇼핑몰의 대표 계좌로 구매대금을 직접 송금합니다.</p>
					<div class="disnone method02"><!-- 간편 결제 -->
						<p class="orderalert"><strong>[간편 결제]</strong> 간편 결제를 진행합니다.</p>
					</div>
			</div>	

						
				
					

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="orderCenter">
							<ul>
								<li><a href="#" class="nbtnbig iw0140" onclick="javascript:location.href='payment'">뒤로가기</a></li>
								<li><a href="#" class="sbtnMini iw0140" onclick="writeBtn()">주문 / 결제</a></li>								
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
				


				</div>
			</div>
			<!-- //maxcontents -->


<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	// select, radio - display check

	// 1 Step Radio
	var firstchk = $("input:radio[name=method]:checked").attr("id");
	$("div." + firstchk).css("display","block");
	$("input:radio[name=method]").click(function(){
		var divchk = $(this).attr("id");		
		$(".disnone").css("display","none");
		$("div." + divchk).css("display","block");
	});
	
	// 2 Step 영수증 Select
	var firstselect = $("select[name=receiptChk] option:selected").attr("value");
	$("div." + firstselect).css("display","block");
	$("select[name=bank]").css("width","125px");
	$("select[name=receiptChk]").css("width","112px");
	$("select[name=receiptChk]").change(function() {
        $(".receipt").css("display","none");
        if($(this).val() == "none"){ $(".receipt").css("display","none"); }
        else if($(this).val() == "individual"){ $(".individual").css("display","block"); }
		else{ $(".corporate").css("display","block"); }

		var firstindi = $("input:radio[name=individual]:checked").attr("id");
		var firstcorp = $("input:radio[name=corporate]:checked").attr("id");
		$("ul." + firstindi).css("display","block");		
		$("ul." + firstcorp).css("display","block");
    });
	
	// 3-1 Step 발급방식 - 개인
	var firstindi = $("input:radio[name=individual]:checked").attr("id");
	$("ul." + firstindi).css("display","block");
	$("input:radio[name=individual]").click(function(){
		var divchk = $(this).attr("id");
		$(".inform").css("display","none");
		$("ul." + divchk).css("display","block");
	});

	// 3-2 Step 발급방식 - 사업자
	var firstcorp = $("input:radio[name=corporate]:checked").attr("id");
	$("ul." + firstcorp).css("display","block");
	$("input:radio[name=corporate]").click(function(){
		var divchk = $(this).attr("id");
		$(".inform").css("display","none");
		$("ul." + divchk).css("display","block");
	});





	// layer popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
		var couponCheck = 760;
	}else{
		var layerCheck = 320;
		var couponCheck = 320;
	}

	$(".addressBtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : layerCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});

	$(".nbtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : couponCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			$('#fancybox-wrap').css('top','400px');
			$('html,body').animate({ scrollTop: 400 }, 500);
			});
		}
	});


});
</script>


		</div>
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