<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<!-- Mirrored from themewagon.github.io/aroma/singleproduct by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:13 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ZEBRA</title>
<link rel="stylesheet" href="../css/360f749e5e2c173f.css" data-n-p="">
<link rel="preload" href="../vendors/118f4578a1d7588b.css" as="style">
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/content.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="icon" href="../img/logo2.png" type="image/png">
<link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../vendors/linericon/style.css">
<link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../css/style.css">

<style>
.image-button {
	display: inline-block;
	margin: 0;
	width: 34px;
	height: 34px;
	padding: 2px;
	border: 1px solid transparent;
	border-radius: 50%;
}

.image-button.selected {
	border-color: #000;
}

#image1 {
	background-image: url('../img/member/image_1_1.jpg');
}

#image2 {
	background-image: url('../img/member/image_3_2.jpg');
}

#image3 {
	background-image: url('../img/member/image_3_4.jpg');
}
</style>

<script>
   function selectImage(imageId) {
      var imageButtons = document.getElementsByClassName('image-button');
      for (var i = 0; i < imageButtons.length; i++) {
         imageButtons[i].classList.remove('selected');
      }
      document.getElementById(imageId).classList.add('selected');
   }
</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 코멘트 버튼을 자동으로 클릭합니다.
        const commentButton = document.getElementById("home-tab");
        commentButton.click();
    });
</script>

<script>
//입력된 수량을 받는 변수
(function($) {
	$(document).ready(function() {
		let quantity = $("#sst").val(); // 218번째 줄
		console.log({"quantity" : quantity}); // 출력 테스트
	});
}) (jQuery);

// 서버로 전송할 데이터
const form = {
		MID : '${sessionId}',
		pno : '${pdto.pno}',
		cartCount : ''
}
console.log(form.MID); // 출력 테스트
console.log(form.pno); // 출력 테스트
console.log(form.cartCount); // 출력 테스트

// 장바구니 추가 버튼 LINE 236
function cartCtn() {
		//alert("Test") // 테스트		
		form.cartCount = $("#sst").val(); 
		$.ajax({
			url: '/mypage/cart/add',
			type: 'POST',
			data: form,
			success: function(result){
				cartAlert(result);					
				console.log(form.MID); // 출력 테스트
				console.log(form.pno); // 출력 테스트
				console.log({"cartCount" : form.cartCount}); // 출력 테스트
			}
		})
	};
	
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}
	
/* 
바로구매 버튼 
$(".btn_buy").on("click", function(){
	let cartCount = $(".input-text").val();
	$(".order_form").find("input[name='orders[0].cartCount']").val(cartCount);
	$(".order_form").submit();
});
 */
 
</script>


</head>
<body>

<!-- 주문 form -->
<form action="product/product_detail/${sessionId}" method="get" class="order_form">
	<input type="hidden" name="orders[0].pno" value="${pdto.pno}">
	<input type="hidden" name="orders[0].cartCount" value="">
</form>

	<%@ include file="../top.jsp"%>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="blog">
		<input type="hidden" name="pno" value="${pno}"> <input
			type="hidden" name="page" value="${page }"> <input
			type="hidden" name="category" value="${category }"> <input
			type="hidden" name="s_word" value="${s_word }">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Single</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb"></nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->
	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="/upload/${pdto.pdetailimg1}" style="width: 100%;" alt="">
						</div>
						<div class="single-prd-item">
                     		<img class="img-fluid" src="/upload/${pdto.pdetailimg2}" style="width: 100%;" alt="">
                  		</div>
                  		<div class="single-prd-item">
                     		<img class="img-fluid" src="/upload/${pdto.pdetailimg3}" style="width: 100%;" alt="">
                  		</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${pdto.pname}</h3>
						<h2><fmt:formatNumber value="${pdto.pprice}" pattern="###,###원" /></h2>
						<p>${pdto.pdescript}</p>
						<div class="size">
							<h4>Size</h4>
							<label for="s_size">
								<button class="btn btn-primary" type="button"
									style="background-color: white; color: black; border: 1px solid gray;">S</button>
								<input type="radio" id="s_size" name="size"
								style="display: none;">
							</label> 
							<label for="m_size">
								<button class="btn btn-primary" type="button"
									style="background-color: white; color: black; border: 1px solid gray;">M</button>
								<input type="radio" id="m_size" name="size"
								style="display: none;">
							</label> 
							<label for="l_size">
								<button class="btn btn-primary" type="button"
									style="background-color: white; color: black; border: 1px solid gray;">L</button>
								<input type="radio" id="l_size" name="size"
								style="display: none;">
							</label> 
							
						</div>
						<br>

						<button class="image-button" id="image1"
							onclick="selectImage('image1')"></button>
						<button class="image-button" id="image2"
							onclick="selectImage('image2')"></button>
						<button class="image-button" id="image3"
							onclick="selectImage('image3')"></button>
						<br>

						<div class="product_count">
							<label for="qty">Quantity:</label> 	
							
							<!-- 수량 버튼 -->
							<input type="number" name="quantity_input" id="sst" size="2" min="1"  maxlength="12" value="1" title="Quantity:"
								class="input-text qty">&nbsp;&nbsp;
								<a class="button primary-btn" href="/payment/payment/aaa">Buy Now</a>								
						</div>
												
						<div class="card_area d-flex align-items-center">
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-link"></i></a>
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
							<!-- 장바구니 버튼 LINE 104 -->
							<a class="icon_btn" href="../mypage/cart/${sessionId}" onclick="cartCtn()"><i class="lnr lnr lnr-cart"></i></a> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">Comments</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">Review</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<div class="replyWrite">
						<script>
                      //1. 댓글추가 저장
                      function commentBtn(){
                         if("${sessionId}"==""){
                            alert("로그인을 하셔야 댓글입력이 가능합니다.");
                            location.href="/member/login";
                            return false;
                         }
                         
                         if($(".replyType").val().length<3){
                            alert("3글자 이상 입력하셔야 등록가능합니다.");
                            return false;
                         }
                         alert("댓글 저장합니다.");
                         //ajax구문
                         $.ajax({
                            url:"/board/commentInsert",
                            type:"post",
                            data:{"mid":"${sessionId}", //${sessionId}를 사용함.
                                 "pno":"${pdto1.pno}",
                                 "ccontent":$(".replyType").val(),
                                 "cpw":$(".replynum").val()
                            },
                            success:function(data){
                               var dataHtml="";
                               alert("댓글 저장 성공");
                               //하단댓글 1개 가져오기
                               //하단에 댓글추가코드
                               dataHtml += "<ul id='"+ data.cno +"'>";
                               dataHtml += "<li class='name'>"+ data.mid +"<span>&nbsp&nbsp[ "+ moment(data.cdate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
                               dataHtml += "<li class='txt'>"+ data.ccontent +"</li>";
                               dataHtml += "<li class='btn'>";
                               dataHtml += "<a onclick=\"updateBtn("+data.cno+",'"+data.mid+"','"+data.cdate+"','"+data.ccontent+"')\" class='rebtn'>수정</a>&nbsp";
                               dataHtml += "<a onclick=\"deleteBtn("+data.cno+")\" class='rebtn'>삭제</a>";
                               dataHtml += "</li>";
                               dataHtml += "</ul>";
                               
                               $(".replyBox").prepend(dataHtml);  //prepend(위),append(아래),html(모두삭제후 추가)
                               
                               //글자삭제
                               $(".replyType").val("");
                               $(".replynum").val("");
                               
                               //총개수 수정
                               var cnum = Number($("#cnum").text())+1;
                               $("#cnum").text(cnum);
                               
                               
                            },
                            error:function(){
                               alert("실패");
                            }
                         });//ajax
                         
                      }// 댓글저장 끝-->
                      
                      // <-- 2. 삭제버튼
                      function deleteBtn(cno){
                         if(confirm("댓글을 삭제하시겠습니까?")){
                            $.ajax({
                               url:"/board/commentDelete",
                               type:"post",
                               data:{"cno":cno }, // 댓글번호
                               success:function(data){
                                  alert("댓글이 삭제되었습니다.");
                                  $("#"+cno).remove();  // 삭제
                                  //총개수 수정
                                  var cnum = Number($("#cnum").text())-1;
                                  $("#cnum").text(cnum);
                               },
                               error:function(){
                                  alert("실패");
                               }
                            });//ajax
                         }//if
                      }//삭제버튼 -->
                      
                      
                      //3. 댓글수정저장
                      function updateSave(cno){
                         //alert(cno);
                         //alert($("#updateTxt").val());
                         //alert($("#updatePw").val());
                         
                         if(confirm("댓글수정을 저장하시겠습니까?")){
                            $.ajax({
                                url:"/board/commentUpdateSave",
                                type:"post",
                                data:{ "cno":cno,
                                      "cpw":$("#updatePw").val(),
                                      "ccontent":$("#updateTxt").val() }, 
                                success:function(data){
                                   alert("댓글수정 저장되었습니다.");
                                   
                                   var dataHtml="";
                                   
                                   //댓글화면 변경
                                  dataHtml += "<li class='name'>"+ data.mid +"<span>&nbsp&nbsp[ "+ moment(data.cdate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
                                  dataHtml += "<li class='txt'>"+ data.ccontent +"</li>";
                                  dataHtml += "<li class='btn'>";
                                  dataHtml += "<a onclick=\"updateBtn("+data.cno+",'"+data.mid+"','"+data.cdate+"','"+data.ccontent+"')\" class='rebtn'>수정</a>&nbsp";
                                  dataHtml += "<a onclick=\"deleteBtn("+data.cno+")\" class='rebtn'>삭제</a>";
                                  dataHtml += "</li>";
                                   $("#"+cno).html(dataHtml);
                                   
                                },
                                error:function(){
                                   alert("실패");
                                }
                             });//ajax
                         }//if
                         
                         
                      }//댓글수정저장
                      
                      // 4. 댓글수정 폼
                      function updateBtn(cno,mid,cdate,ccontent){
                         if(confirm("댓글을 수정하시겠습니까?")){
                            
                           let dataHtml="";
                           
                           dataHtml += "<li class='name'>"+mid+"&nbsp;<span>["+cdate+"]</span>";
                           dataHtml += "&nbsp;&nbsp;&nbsp;&nbsp;비밀번호&nbsp;&nbsp;<input type='password' class='replynum' id='updatePw' />";
                           dataHtml += "</li>";
                           dataHtml += "<li class='txt'>";
                           dataHtml += "<textarea class='replyType' id='updateTxt'>"+ccontent+"</textarea>";
                           dataHtml += "</li>";
                           dataHtml += "<li class='btn'>";
                           dataHtml += "<a onclick=\"updateSave("+cno+")\" class='rebtn'>저장</a>&nbsp;";
                           dataHtml += "<a onclick=\"cancelBtn("+cno+",'"+mid+"','"+cdate+"','"+ccontent+"')\" class='rebtn'>취소</a>";
                           dataHtml += "</li>";
                       
                           $("#"+cno).html(dataHtml); 
                           
                         }//if
                      }// 업데이트 -->
                      
                      function cancelBtn(cno,mid,cdate,ccontent){
                         alert("댓글 수정을 취소하셨습니다.");
                         
                         var dataHtml="";
                       
                       //댓글화면 변경
                       dataHtml += "<li class='name'>"+ mid +"<span>&nbsp&nbsp[ "+ moment(cdate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
                       dataHtml += "<li class='txt'>"+ ccontent +"</li>";
                       dataHtml += "<li class='btn'>";
                       dataHtml += "<a onclick=\"updateBtn("+cno+",'"+mid+"','"+cdate+"','"+ccontent+"')\" class='rebtn'>수정</a>&nbsp";
                       dataHtml += "<a onclick=deleteBtn("+cno+") class='rebtn'>삭제</a>";
                       dataHtml += "</li>";
                       
                       $("#"+cno).html(dataHtml);
                         
                      }
                      
                      
                    </script>
						<ul>
							<li class="in">
								<p class="txt">
									총 <span class="orange" id="cnum">${comList.size()}</span> 개의
									댓글이 달려있습니다.
								</p>
								<p class="password">
									비밀번호&nbsp;&nbsp;<input type="password" class="replynum" />
								</p> <textarea class="replyType"></textarea>
							</li>
							<li class="btn"><a onclick="commentBtn()" class="replyBtn"
								style="color: white">등록</a></li>
						</ul>
						<p class="ntic">※ 비밀번호를 입력하시면 댓글이 비밀글로 등록 됩니다.</p>
					</div>

					<div class="replyBox">
						<c:forEach var="comDto" items="${comList }">
							<ul id="${comDto.cno}">
								<li class="name">${comDto.mid}<span>[
										${comDto.cdate} ]</span></li>
								<%--비밀글 노출 --%>
								<c:if test="${sessionId != comDto.mid && comDto.cpw !=null }">
									<li class="txt"><span class="orange">※ 비밀글입니다.</span></li>
								</c:if>
								<c:if test="${!(sessionId != comDto.mid && comDto.cpw !=null) }">
									<li class="txt">${comDto.ccontent }</li>
								</c:if>

								<%-- 자신의 댓글이 아닌경우 버튼노출 안됨 --%>
								<c:if test="${sessionId == comDto.mid }">
									<li class="btn"><a
										onclick="updateBtn(${comDto.cno},'${comDto.mid }','${comDto.cdate}','${comDto.ccontent}')"
										class="rebtn">수정</a> <a onclick="deleteBtn(${comDto.cno})"
										class="rebtn">삭제</a></li>
								</c:if>
							</ul>
						</c:forEach>
					</div>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="checkTable" style="border: 1px solid #d5d5d5;"
							border="1" cellspacing="0">
							<colgroup>
								<col width="19%" class="tw30" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>평점</span></th>
									<td>
										<ul class="pta">
											<li><input type="radio" name="appraisal" id="starFive"
												checked="checked" /> <label for="starFive" class="star">
													<img src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" />
											</label></li>
											<li><input type="radio" name="appraisal" id="starFour" />
												<label for="starFour" class="star"> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" />
											</label></li>
											<li><input type="radio" name="appraisal" id="starThree" />
												<label for="starThree" class="star"> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" />
											</label></li>
											<li><input type="radio" name="appraisal" id="startwo" />
												<label for="startwo" class="star"> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" />
											</label></li>
											<li><input type="radio" name="appraisal" id="starOne" />
												<label for="starOne" class="star"> <img
													src="../img/ico/ico_star.gif" alt="별점" />
											</label></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>제목</span></th>
									<td><input type="text" class="wlong" /></td>
								</tr>
								<tr>
									<th scope="row"><span>내용</span></th>
									<td><textarea class="tta"></textarea></td>
								</tr>
							</tbody>
						</table>
						<!-- Btn Area -->
						<div class="btnArea">
							<div class="bCenter">
								<ul>
									<li><a href="#" class="sbtnMini">확인</a></li>
									<li><a onclick="parent.$.fancybox.close();"
										href="javascript:;" class="nbtnbig">취소</a></li>
								</ul>
							</div>
						</div>
						<!-- //Btn Area -->
						<!-- 상품리뷰 -->
						<div class="accordion">
							<ul>
								<!-- 반복 -->
								<li>
									<div class="headArea">
										<div class="subject">
											<a href="javascript:;" class="accbtn">사이즈가 딱 맞아서 정말 좋아요!!</a>
										</div>
										<div class="writer">[kimsun**]</div>
										<div class="day">
											<p>2023-04-10</p>
											<p>
												<img src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" />
													<img
													src="../img/ico/ico_star.gif" alt="별점" />
													<img
													src="../img/ico/ico_star.gif" alt="별점" />
											</p>
										</div>
									</div>
								<!-- //반복 -->

								<li>
									<div class="headArea">
										<div class="subject">
											<a href="javascript:;" class="accbtn">저렴한 가격에 좋은 상품을 사서 좋습니다.</a>
										</div>
										<div class="writer">[munji****]</div>
										<div class="day">
											<p>2023-02-02</p>
											<p>
												<img src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" />
											</p>
										</div>
									</div>
								<li>
									<div class="headArea">
										<div class="subject">
											<a href="javascript:;" class="accbtn">제가 원하던 스타일과 디자인이어서 다른 색상도 주문하였습니다. </a>
										</div>
										<div class="writer">[kimyu****]</div>
										<div class="day">
											<p>2022-10-26</p>
											<p>
												<img src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" /> <img
													src="../img/ico/ico_star.gif" alt="별점" />
													<img
													src="../img/ico/ico_star.gif" alt="별점" />
											</p>
										</div>
									</div>
									</div>
								</li>

							</ul>
						</div>

						<div class="btnAreaList">
							<!-- 페이징이동1 -->
							<div class="allPageMoving1">

								<a href="#" class="n"><img src="../img/btn/btn_pre2.gif"
									alt="처음으로" /></a><a href="#" class="pre"><img
									src="../img/btn/btn_pre1.gif" alt="앞페이지로" /></a> <strong>1</strong>
								<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a
									href="#">5</a> <a href="#" class="next"><img
									src="../img/btn/btn_next1.gif" alt="뒤페이지로" /></a><a href="#"
									class="n"><img src="../img/btn/btn_next2.gif" alt="마지막페이지로" /></a>

							</div>
							<!-- //페이징이동1 -->
						</div>
						<!-- //상품리뷰 -->

					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->


	<%@ include file="../sidebar.jsp"%>
	<%@ include file="../best.jsp"%>
	<%@ include file="../footer.jsp"%>

	<script src="../vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="../vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="../vendors/skrollr.min.js"></script>
	<script src="../vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="../vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="../vendors/jquery.ajaxchimp.min.js"></script>
	<script src="../vendors/mail-script.js"></script>
	<script src="../js/main.js"></script>


</body>

<!-- Mirrored from themewagon.github.io/aroma/singleproduct by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:14 GMT -->
</html>