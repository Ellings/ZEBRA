<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<!-- Mirrored from themewagon.github.io/aroma/category.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:10 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ZEBRA</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="icon" href="../img/logo2.png" type="image/png">
<link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../vendors/linericon/style.css">
<link rel="stylesheet"
   href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
   href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="../css/style.css">

<style>
.list{cursor: printer;}
.number-box {
   display: inline-block;
   width: 30px;
   height: 30px;
   line-height: 23px;
   color: #888;
   text-decoration: none;
   border: 1px #c0c0c0 solid;
   background: #fff;
   font-size: 15px;
   text-align: center;
}

.btnAreaList {
   display: flex;
   justify-content: center;
}

.allPageMoving1 {
   display: flex;
   align-items: center;
}

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
   
   
   function ajaxsort(){
       // 사용자가 선택한 컬러, 가격 정렬 및 검색 값을 가져오기.
     
       
     
       
       
	   $.ajax({
           url:"/product/sortingAjax",
           type:"post",
           data:
           {
            "pcolor":  $("input[name='radiocolor']:checked").val(),
            "sorting":  $("select[name='sorting']").val(),     
       	    "s_word":  $("input[name='s_word']").val(),
   
           },
           
           
    
           
           
           dataType:"json",
           success: function(result){
              console.log(result);
              alert("controller에서 데이터 받기 성공");
              console.log(result.length);
            var htmlData='';
             
          for(var i = 0; i <result.length; i++){
             
             var href="/product/product_detail?pno="+result[i].pno;
       
             htmlData += '<div class="col-md-6 col-lg-4">';
             htmlData += '<div class="card text-center card-product">';
             htmlData += '<div class="card-product__img">';
             htmlData += '<a href="'+href+'"><img class="card-img" src="/upload/'+result[i].pmainimg+'" style="width: 250px;" alt=""></a>';
             htmlData += '<ul class="card-product__imgOverlay">';
             htmlData += '<li><button>';
             htmlData += '<i class="ti-shopping-cart"></i>';
             htmlData += '</button></li>';
             htmlData += '<li><button>';
             htmlData += '<i class="ti-heart"></i> <!-- 찜 버튼 -->';
             htmlData += '</button></li></ul></div>';
             htmlData += '<div class="card-body">';
             htmlData += '<button class="image-button" id="image1" onclick="selectImage(\'image1\')"></button>';
             htmlData += '<button class="image-button" id="image2" onclick="selectImage(\'image2\')"></button>';
             htmlData += '<button class="image-button" id="image3" onclick="selectImage(\'image3\')"></button>';
             htmlData += '<h4 class="card-product__title">';
             htmlData += '<a href="/product/product_detail?pno=${product.pno}">'+result[i].pname+'</a>';
             htmlData += '</h4>';
             htmlData += '<p class="card-product__price">'+result[i].pprice+'원</p>';
             htmlData += '</div></div></div>';

             
          }
          
          

          $(".row1").html(htmlData);

              
           },//success
           error:function(){
              alert("데이터 받기 실패");
           }
        });//ajax
        
   }//ajaxsort
   
   function colorselelct() {
       alert("색상 필터를 선택하겠습니다.");
       ajaxsort();
   }//colorselelct  
   
   function PriceBtn(){
       alert("가격 선택을 하겠습니다.");
       ajaxsort();  
   }//PriceBtn
   function searchBtn() {
       alert("검색을 하겠습니다.");
       ajaxsort();     
   }//searchBtn

</script>
</head>
<body>
   <%@ include file="../top.jsp"%>

   <!-- ================ start banner area ================= -->
   <section class="blog-banner-area" id="category">
      <div class="container h-100">
         <div class="blog-banner">
            <div class="text-center">
               <h1>Shop Category</h1>
               <nav aria-label="breadcrumb" class="banner-breadcrumb"></nav>
            </div>
         </div>
      </div>
   </section>
   <!-- ================ end banner area ================= -->


   <!-- ================ category section start ================= -->
   <section class="section-margin--small mb-5">
      <div class="container">
         <div class="row">
            <div class="col-xl-3 col-lg-4 col-md-5">
               <div class="sidebar-categories">
                  
                
                  
                  <!-- 색상 필터 시작  -->
                  <div class="common-filter">
                     <div class="head">Color</div>
                     <form action="/product/product_page" name="color" method="post">
                        <style>
						#colorfilter {
						   column-count: 2; /* 두 개의 열로 나눔 */
						   column-gap: 1em; /* 열 사이의 간격 조절 */
						   padding-left: 10px;
						}
						</style>
						
						<!-- value : 선택 항목을이 가지는 고유 값. 여기에 지정한 값들을 onchange를 누르면 적용이 되도록 -->
                        <ul id="colorfilter">
                           <li class="filter-list" >
                           <input class="pixel-radio" type="radio" id="black"  name="radiocolor" value="black" onchange="colorselelct()"><label for="black">Black⬛<span>(29)</span></label>
                           </li>
                              
                           <li class="filter-list" >
                           <input class="pixel-radio" type="radio" id="orange"  name="radiocolor" value="orange" onchange="colorselelct()"><label for="orange">orange🟧<span>(29)</span></label>
                           </li>
                              
                           <li class="filter-list">
                           <input class="pixel-radio" type="radio" id="yellow"  name="radiocolor" value="yellow" onchange="colorselelct()"><label for="yellow">yellow🟨<span>(29)</span></label>
                           </li>
                              
                           <li class="filter-list">
                           <input class="pixel-radio" type="radio" id="pink"  name="radiocolor" value="pink" onchange="colorselelct()"><label for="pink">pink🩰<span>(29)</span></label>
                           </li>
                              
                           <li class="filter-list" >
                           <input class="pixel-radio" type="radio" id="white"  name="radiocolor" value="white" onchange="colorselelct()"><label for="white">white⬜<span>(29)</span></label>
                           </li>
                                  

                         	
                        </ul>
                     </form>
                     
        
                     
                  </div>
                  <!-- 색상 필터 끝  -->
                  
                  <!-- 가격 슬라이드 시작  -->
                  <div class="common-filter">
                     <div class="head">Price</div>
                     <div class="price-range-area">
                        <div id="price-range"></div>
                        <div class="value-wrapper d-flex">
                           <div class="price">Price:</div>
<!--                            <input type="range" min="1" max="10" value="1"> 개 -->
                           <span>$</span>
                           <div id="lower-value"></div>
                           <div class="to">to</div>
                           <span>$</span>
                           <div id="upper-value"></div>
                        </div>
                     </div>
                  </div>
                  <!-- 가격 슬라이드 끝  -->
               
               </div>
            </div>
             
             
            <div class="col-xl-9 col-lg-8 col-md-7">
               <!-- 상단 필터 바 시작 -->
               <div class="filter-bar d-flex flex-wrap align-items-center">
                            
                  <!-- 필터 바 가격 순 시작 -->       
                  <div class="sorting">
                  <form action="/product/product_page" name="price" method="post">
                  <!-- selectprice()를 통해 셀렉 시 바로 변경 되도록 -->
                     <select name="sorting" id="sorting" >
                        <option value="">select price</option>
                        <option  value="rowprice" onclick="PriceBtn()" >Low - High</option>
                        <option value="highprice"onclick="PriceBtn()" >High - Low</option>  
                     </select>
                     <div class="input-group-append">
                           <button type="button" onclick="PriceBtn()">
                              <i class="ti-search"></i>
                           </button>
                        </div>
                  </form>
                  </div>
                  
                  <!-- 필터 바 가격 순  끝 -->
                  

                  
                  
                  <!-- 필터 바 n개씩 보기 선택 시작 -->
                  <div class="sorting mr-auto" >
                 <select id="viewnum"  class="viewnum">
                   <option value="6">view 6</option>
                   <option value="9">view 9</option>
                   <option value="12">view 12</option>
                 </select>
            
                  </div>
                  <!-- 필터 바 n개씩 보기 선택 끝 -->
                  

                  <!-- s_word를 입력하는 뷰 검색  시작-->
                  <div>
                     <div class="input-group filter-bar-search"> 
                     <form action="/product/product_page" name="search" method="post">
                        <input type="text" name="s_word" style="height: 38px;" placeholder="Search" >
                        <div class="input-group-append">
                           <button type="button" onclick="searchBtn()">
                              <i class="ti-search"></i>
                           </button>
                        </div>   
                     </form>   
                     </div>
                  </div>
                  <!-- s_word를 입력하는 뷰 검색  끝-->
               </div>
            </div>
               <!-- 상단 필터 바 끝 -->
               
               <section class="lattest-product-area pb-40 category-list">
                  
                  <div class="row1">
               
               <!-- 상품 리스트  시작-->

               <c:forEach var="product" items="${list}" end="8">
                     <div class="col-md-6 col-lg-4">
                        <div class="card text-center card-product">
                           <div class="card-product__img">
                              <a href="/product/product_detail?pno=${product.pno}"><img class="card-img" src="/upload/${product.pmainimg}" style="width: 250px;" alt=""></a>
                              <ul class="card-product__imgOverlay">
                                 <li><button>
                                       <i class="ti-shopping-cart"></i> <!-- 장바구니 버튼 -->
                                    </button></li>
                                 <li><button>
                                       <i class="ti-heart"></i> <!-- 찜 버튼 -->
                                    </button></li>
                              </ul>
                           </div>
                           <div class="card-body">
                              <!-- 상품 색상 이미지 버튼 -->
                              <button class="image-button" id="image1" onclick="selectImage('image1')"></button>
                              <button class="image-button" id="image2" onclick="selectImage('image2')"></button>
                              <button class="image-button" id="image3" onclick="selectImage('image3')"></button>
                              <h4 class="card-product__title">
                                 <a href="/product/product_detail?pno=${product.pno}">${product.pname}</a>
                              </h4>
                              <p class="card-product__price"><fmt:formatNumber value="${product.pprice}" pattern="###,###원" /></p>
                           </div>
                        </div>
                     </div>
               </c:forEach>
                     
               <!-- 상품 리스트  끝-->      
                                          
                  </div>
      <div class="btnAreaList">
      <div class="allPageMoving1">
               
      <!-- 첫 페이지 이동 -->
       <c:if test="${page!=1 }">
         <a href= "/product/product_pagehome?page=1">
      <img src="../img/btn/btn_pre2.gif" alt="처음으로" />
<!--          <li class="first"></li>-->
      </a>      
       </c:if>
       <c:if test="${page==1 }">
<!--            <li class="first"></li> -->
      <img src="../img/btn/btn_pre2.gif" alt="처음으로" />
       </c:if>
      <!-- 이전 페이지 이동 -->
      <c:if test="${page>1 }">
      <a href="/product/product_pagehome?page=${page-1}">
      <img src="../img/btn/btn_pre1.gif" alt="앞페이지로" />
<!--       <li class="prev"></li> -->
      </a>
      </c:if>
      <c:if test="${page==1 }">
<!--          <li class="prev"></li> -->
     <img src="../img/btn/btn_pre1.gif" alt="앞페이지로" />
      </c:if>
      <!-- 페이지 리스트 -->
      <c:forEach begin="${startPage}" end="${endPage}" step="1" var="num">
         <c:if test="${num != page }">
         <a href="/product/product_pagehome?page=${num}">      
            <li class="num"><div class="number-box">${num}</div></li>
         </a>
         </c:if>
      <c:if test="${num == page }">
         <li class="num on"><div class="number-box">${num}</div></li>
      </c:if>
      </c:forEach>
      <!-- 다음 페이지 이동 -->
      <c:if test="${page<maxPage }">
        <a href="/product/product_pagehome?page=${page+1}">
<!--         <li class="next"></li> -->
        <img src="../img/btn/btn_next1.gif" alt="뒤페이지로" />
        </a> 
      </c:if>
      <c:if test="${page==maxPage }">
<!--          <li class="next"> -->
     <img src="../img/btn/btn_next1.gif" alt="뒤페이지로" />
      </c:if>
      <!-- 끝 페이지 이동 -->
      <c:if test="${page !=  maxPage }">
      <a href="/product/product_pagehome?page=${maxPage}">
      <img src="../img/btn/btn_next2.gif" alt="마지막페이지로" />
<!--       <li class="last"></li> -->
      </a>
      </c:if>
      <c:if test="${page ==  maxPage }">
      <img src="../img/btn/btn_next2.gif" alt="마지막페이지로" />
<!--       <li class="last"></li> -->
      </a>
      </c:if>
                  
                  
                  

                  
                  
                  </div>
               </div>
               </section>
               <!-- ================ category section end ================= -->
            </div>
         </div>
      </div>
  
 

   <%@ include file="../sidebar.jsp"%>
  
   <%@ include file="../best.jsp"%>
   <%@ include file="../footer.jsp"%>

   <script src="../vendors/jquery/jquery-3.2.1.min.js"></script>
   <script src="../vendors/bootstrap/bootstrap.bundle.min.js"></script>
   <script src="../vendors/skrollr.min.js"></script>
   <script src="../vendors/owl-carousel/owl.carousel.min.js"></script>
   <script src="../vendors/nice-select/jquery.nice-select.min.js"></script>
   <script src="../vendors/nouislider/nouislider.min.js"></script>
   <script src="../vendors/jquery.ajaxchimp.min.js"></script>
   <script src="../vendors/mail-script.js"></script>
   <script src="../js/main.js"></script>
</body>

<!-- Mirrored from themewagon.github.io/aroma/category.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:13 GMT -->
</html>