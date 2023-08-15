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
function delBtn(){
	//alert("삭제하기")

	if(confirm("게시글을 삭제하시겠습니까?")){
		location.href="faqDelete?fno=${faqDto.fno}";
	}

}

function updateBtn(){
	//alert("수정하기 버튼")
	location.href="notice_update?fno=${faqDto.fno}";
}

function admininsertBtn(){
	//alert("admin 등록하기")
	//alert( $("#ccontent").val())//내용 
	
	$.ajax({
		url:"/customer/admincommentinsert",
		type:"post",
		data:{"id":"${sessionId}" ,
			"fno":${faqDto.fno },
			"ccontent": $("#ccontent").val()
			},		
		success:function(data){
			location.reload(true);		
		},
		error:function(){
			alert("실패");
			
		}
	});
	
}

function adminupdateBtn(){
	//alert("admin 수정하기(update)")
	
	  $.ajax({
	url:"/customer/admincommentupdate",
	type:"post",
	data:{"id":"${sessionId}" ,
		"fno":${faqDto.fno },
		"ccontent": $("#ccontent").val()
		},	
	success:function(data){
		location.reload(true);	
	},
	error:function(){
		alert("실패");			
	}
});  
}

function admindelBtn(){
	//alert("admin 삭제하기 delete")
	//alert(${faqDto.fno })
	  $.ajax({
		url:"/customer/admincommentdelete",
		type:"post",
		data:{"id":"${sessionId}" ,
			"fno":${faqDto.fno },
			"ccontent": $("#ccontent").val()
			},	
		success:function(data){
			location.reload(true);	
		},
		error:function(){
			alert("실패");			
		}
	});  
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
					<li><a href="/customer/faqList" id="leftNavi3"> Q&A </a></li>		
					<li><a href="/customer/notice_view" id="leftNavi2"> 1:1문의 </a></li>			
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>

			<!-- contents -->
			<input type="hidden" id="insertck" >
			<div id="contents">
				<div id="customer">
					<h2><strong>문의글을 작성해주세요.</strong><span></span></h2>
					
					<div class="viewDivMt">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>${faqDto.ftitle }</li>
								</ul>
							</div>
							<div class="day">
								<p class="txt">작성일<span><fmt:formatDate pattern = "yyyy-MM-dd" value="${faqDto.fdate }"/></span></p>
							</div>
						</div>

						<div class="viewContents">
							${faqDto.fcontent }
							<br>
        					<c:if test="${faqDto.ffile != null }">
							<img src = "/upload/${faqDto.ffile }">
							</c:if>
						</div>
					</div>
					
					<!-- 관리자 답글달기 -->
					<c:if test="${sessionId == 'admin'}">
					
                    <div class="replyBox">
                        <ul>
                       
                            <li class="name">admin <span></span></li>
                            <li class="txt">
                            <c:if test="${cdto.cno!=null }">
                            <textarea class="replyType" name = "ccontent" id="ccontent">  ${cdto.ccontent }</textarea>	
                            <li class="btn">
                                <a onclick="adminupdateBtn()"  class="rebtn">수정</a>
                                <a onclick="admindelBtn()" class="rebtn">삭제</a>
                            </li>					     
						     </c:if>
						     <c:if test="${cdto.cno==null }">
                            <textarea class="replyType" name = "ccontent" id="ccontent">  </textarea>						     
                            <li class="btn">
                                <a onclick="admininsertBtn()"class="rebtn">등록</a>                              
                                <a onclick="admindelBtn()" class="rebtn">삭제</a>
                            </li>
						     </c:if>
                                                      
                            </li>
                        </ul>
                     </div>					
					
				      </c:if>
				       <c:if test="${sessionId != 'admin'}">
				      
                    <div class="replyBox">
                    <ul>
				       <c:if test="${cdto.cno!=null }">
				       ${cdto.ccontent }
				       </c:if>

				       <c:if test="${cdto.cno==null }">
                         답변: <br>
				     <img src="../img/btn/btn_next2.gif" >
				     아직 답변이 없습니다. 급한 문의 사항은 010-1234-5678으로 전화주세요.
				       </c:if>
                    </ul>
                     </div>
						</c:if>

					<!-- 이전다음글 -->
					<div class="pnDiv web">
						<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext" border="1" cellspacing="0">
							<caption></caption>

							
							<colgroup>
							<col width="100px" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th class="pre">PREV</th>
									<td><a href="/customer/notice_view?fno=${prevDto.fno}&page=${page}">${prevDto.ftitle}</a></td>
								</tr>

								<tr>
									<th class="next">NEXT</th>
									<td><a href="/customer/notice_view?fno=${nextDto.fno}&page=${page}">${nextDto.ftitle}</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->


					<!-- Btn Area -->
					<div class="btnArea btline">
						<div class="bRight">
							<ul>
								<c:if test = "${sessionId == faqDto.mid}">
								<li><a onclick="updateBtn()" class="nbtnbig mw">수정</a></li>								
								<li><a style="cursor:point" onclick="delBtn()" class="nbtnbig mw">삭제</a></li>
								</c:if>
								
								<li><a href="/customer/faqList" class="sbtnMini mw">목록</a></li>
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



</div>
</div>

<%@ include file="../footer.jsp"%>
</body>
<!-- Mirrored from themewagon.github.io/aroma/category.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:13 GMT -->
</html>