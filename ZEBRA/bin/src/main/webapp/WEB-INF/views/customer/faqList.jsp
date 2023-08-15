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
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
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

</head>
<body>
<%@ include file="../top.jsp"%>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1> Q&A </h1>
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
			</div><script type="text/javascript">initSubmenu(3,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong></strong><span></span></h2>
					
					<div class="faqTab">
						<ul>
							<li><a href="#" class="on">전체</a></li>	
							<table summary="NO, 제목, 등록일, 조회수 순으로 공지사항을 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
							<colgroup>
							<col width="8%" />
							<col width="8%"  />
							<col width="10%"  />
							<col width="35%"  />
							<col width="10" />
							<col width="19%" />
							</colgroup>
							<thead>
								<th scope="col"> NO</th>
								<th scope="col"> Q&A</th>
								<th scope="col"> 분류</th>
								<th scope="col"> 제목</th>
								<th scope="col"> 이름 </th>
								<th scope="col"> 날짜 </th>
							</table>	
						</ul>						
					</div>	
					
					
					
					<!-- FAQ -->
					<div class="faqList">
					
					
					
						<ul>
							<!-- list -->
							<c:forEach var="FAQ" items="${list }"> <!-- 컨트롤러의 list -->
							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question">
										<div class="blet1">${FAQ.fno }</div>
										<c:if test="${FAQ.fqa ==1 }">										
											<div class="blet">문의</div>										
										</c:if>
										<c:if test="${FAQ.fqa ==0 }">										
											<div class="blet">답변</div>										
										</c:if>
										
										<div class="category">${FAQ.fcategory  }</div>
										
										
										<div class="title">
										<a href="notice_view?fno=${FAQ.fno }&page=${page}"> ${FAQ.ftitle }</a></div>
										<div class="category1">${FAQ.mid }</div>
										<div class="category2">
										<fmt:formatDate pattern = "yyyy-MM-dd" value="${FAQ.fdate }"/>
										
										</div>       								
        
									</div>
								</a>
  
								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(010-1234-5678)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>
							  </c:forEach>
							<!-- //list -->												
							
						</ul>
					</div>
					<!-- //FAQ -->						

					<div class="btnAreaList">
						<div class="bwright">
							<ul>
								<li><a href="/customer/notice_Write" class="sbtnMini">글쓰기</a></li>
							</ul>
						</div>
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

					      <!-- 첫페이지 이동 -->
						 <c:if test="${page != 1 }">
							<a href="/customer/faqList?page=1" class="n">
							<img src="../img/btn/btn_pre2.gif" alt="처음으로"/></a>
						</c:if>
      					<c:if test="${page == 1 }">
      						<img src="../img/btn/btn_pre2.gif" alt="처음으로"/>
					     </c:if>					     
					     
					      <!-- 이전페이지 이동 -->
					      <c:if test="${page>1}">
							<a href="/customer/faqList?page=${page-1}" class="pre">
							<img src="../img/btn/btn_pre1.gif" alt="앞페이지로"/></a>					      
					      </c:if>
					      <c:if test="${page==1}">
					        <img src="../img/btn/btn_pre1.gif" alt="앞페이지로"/></a>
					      </c:if>
      
					      <!-- 페이지리스트 -->
					      <c:forEach begin="${startPage}" end="${endPage}" step="1" var="num">
					        <c:if test="${num != page }">
						        <a href="/customer/faqList?page=${num}">${num}</a>
					        </c:if>
					        <c:if test="${num == page }">
					          <strong> ${num}</strong>
					        </c:if>
					      </c:forEach>
      
					      <!-- 다음페이지 이동 -->
					      <c:if test="${page<maxPage}">
					        <a href="/customer/faqList?page=${page+1}"  class="next">
					        <img src="../img/btn/btn_next1.gif" alt="뒤페이지로"/></a>
					        
					      </c:if>
					        
					      <c:if test="${page==maxPage }">
					        <img src="../img/btn/btn_next1.gif" alt="뒤페이지로"/>
					      </c:if>
						      <!-- 끝페이지 이동 -->
						      <c:if test="${page != maxPage }">
							      <a href="/customer/faqList?page=${maxPage}" class="n"><img src="../img/btn/btn_next2.gif" alt="마지막페이지로"/></a>
					        
						      </c:if>
						      <c:if test="${page == maxPage }">
					        <img src="../img/btn/btn_next2.gif" alt="마지막페이지로"/>
							     
						      </c:if>
						    </ul>
						
						</div>
						
						<!-- //페이징이동1 -->
					</div>

					<div class="searchWrap">
						<div class="search">
							<ul>
								<li class="web"><img src="../img/btn/txt_search.gif" alt="search" /></li>
								<li class="se">
									<select>
										<option value="" />제목</option>
									</select>
								</li>
								<li><input type="text" class="searchInput" /></li>
								<li class="web"><a href="#"><img src="../img/btn/btn_search.gif" alt="검색" /></a></li>
								<li class="mobile"><a href="#"><img src="../img/btn/btn_search_m.gif" alt="검색" /></a></li>
							</ul>
						</div>
					</div>

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