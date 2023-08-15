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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function submitBtn(){
	
	
	
	faqFrm.submit();
		
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
					<h1>1:1문의 </h1>
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
				<div id="title2">CUSTOMER<span>고객센터</span></div>
				<ul>				
					<li><a href="/customer/faqList" id="leftNavi3">Q&A</span></a></li>		
					<li><a href="/customer/notice_view" id="leftNavi2">1:1문의</a></li>	
						
				</ul>			
			</div><script type="text/javascript">initSubmenu(2,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>1:1문의</strong><span>지브라에 궁금하신 사항을 남겨주시면 답변해드립니다.</span></h2>
					
							<form action = "/customer/notice_update" name="faqFrm" method ="post" enctype="multipart/form-data" >					<div class="checkMt">
							<input type=hidden name="fno" value="${fdto.fno }">
						<table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>1:1문의</caption>
							<colgroup>
							<col width="19%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>분류</span></th>
									
									<td>
									<c:if test = "${fdto.fcategory =='전체' }">
										<select name="fcategory" >
											<option value="전체" selected>전체</option>
											<option value="상품">상품</option>
											<option value="회원가입">회원가입</option>
											<option value="주문">주문</option>
										</select>
									</c:if>
									<c:if test = "${fdto.fcategory =='주문' }">
										<select name="fcategory" >
											<option value="전체" >전체</option>
											<option value="상품">상품</option>
											<option value="회원가입">회원가입</option>
											<option value="주문" selected>주문</option>
										</select>
									</c:if>
									<c:if test = "${fdto.fcategory =='상품' }">
										<select name="fcategory" >
											<option value="전체" >전체</option>
											<option value="상품" selected>상품</option>
											<option value="회원가입">회원가입</option>
											<option value="주문" >주문</option>
										</select>
									</c:if><c:if test = "${fdto.fcategory =='회원가입' }">
										<select name="fcategory" >
											<option value="전체" >전체</option>
											<option value="상품">상품</option>
											<option value="회원가입" selected >회원가입</option>
											<option value="주문" >주문</option>
										</select>
									</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>제목</span></th>
									<td>
										<input type="text" name="ftitle" class="wlong"  value="${fdto.ftitle }" />
									</td>
								</tr>
								<tr>
									<th scope="row"><span>상세 내용</span></th>
									<td>
										<textarea name ="fcontent" class="tta" > ${fdto.fcontent }</textarea>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>첨부파일</span></th>
									<td>
									${fdto.ffile }
									<br>
										<input type="file" name = "file" class="fileType" />
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>																
								<li><a href="/customer/faqList" class="nbtnbig">취소</a></li>
								<li><a onclick="submitBtn()" class="sbtnMini">확인</a></li>
								
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
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