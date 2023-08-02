<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="en"> <!-- <html lang="en" class="skrollr skrollr-desktop"> -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ZEBRA</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 사용 할때 $ 사용 하기위한 js  -->
<link rel="icon" href="../img/logo2.png" type="image/png">
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script src="../vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="../vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="../vendors/skrollr.min.js"></script>
<script src="../vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="../vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="../vendors/jquery.ajaxchimp.min.js"></script>
<script src="../vendors/mail-script.js"></script>
<script src="../js/main.js"></script>
<link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../vendors/linericon/style.css">
<link rel="stylesheet" href="../vendors/nouislider/nouislider.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/pretendard.css">
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript"> </script>
 <script>
if("${resultCode}"=="s_login" ){
	   alert("${sessionName}님! 로그인 되었습니다.");
}

//로그인 알림창
</script> 

</head>
<body>

	<%@ include file="../top.jsp"%>
	<main class="site-main">
<!-- 
style="height:500px;"  -->
		
		<!--================ Hero banner start =================-->
		<section class="hero-banner" >
		<img src= "../img/index/main11.png" ><!-- style= width:1480px height:250.677px; --> 
      <div class="container"> <!-- background: url("../img/index/main4.png")  -->
        <div class="row no-gutters align-items-center pt-60px">
          <div class="col-5 d-none d-sm-block">
           <!--  <div class="hero-banner__img">
              <img class="img-fluid" src="../img/index/main.jpgg" alt="">
            </div> -->
          </div>
          <div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
            <div class="hero-banner__content">
             <h4></h4>
              <h1></h1>
              <p></p>
             <!--  <a class="button button-hero" href="https://themewagon.github.io/aroma/index.html#">Browse Now</a>  -->
            </div>
          </div>
        </div>
      </div>
    </section>
    
		<!--================ Hero banner start =================-->

		<!--================ Hero Carousel start =================-->
		<section class="section-margin mt-0">
			<div class="owl-carousel owl-theme hero-carousel">
			
				<div class="hero-carousel__slide">
					<img src="../img/index/test1.png" alt="" class="img-fluid">
					<a href="/product/product_page" class="hero-carousel__slideOverlay">
						<h2> WOMEN  </h2>
						<p> Women Item </p>
					</a>
				</div>
				<div class="hero-carousel__slide">
					<img src="../img/index/test2.png" alt="" class="img-fluid">
					<a href="/product/product_page" class="hero-carousel__slideOverlay">
						<h2> Men </h2>
						<p>MenItem</p>
					</a>
				</div>
				<div class="hero-carousel__slide">
					<img src="../img/index/test3.png" alt="" class="img-fluid">
					<a href="/product/product_pagehome" class="hero-carousel__slideOverlay">
						<h2> HOME </h2>
						<p> Home Item </p>
					</a>
				</div>
			</div>
		</section>
		<!--================ Hero Carousel end =================-->

		<!-- ================ 상품 조회수순으로 정렬 시작 ================= -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro pb-60px">
					<p>Popular Item in the market</p>
					<h2>
						Trending<span class="section-intro__style"> Product </span>
					</h2>
				</div>
				<div class="row">
				
				<c:forEach var="product" items="${list}" end="7">
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<a href="/product/product_detail?pno=${product.pno}"><img class="card-img" src="/upload/${product.pmainimg}" style="width: 250px;" alt=""></a>
								<ul class="card-product__imgOverlay">
									<li><button>
											<i class="ti-shopping-cart"></i>
										</button></li>
									<li><button>
											<i class="ti-heart"></i>
										</button></li>
								</ul>
							</div>
							<div class="card-body">
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

					
				</div>
			</div>
		</section>
		<!-- ================ 상품 조회수순으로 정렬 끝 ================= -->


		<!-- ================ 홈 상품 페이지로 가는 네모 시작================= -->
		<section class="offer" id="parallax-1"
			data-anchor-target="#parallax-1"
			data-300-top="background-position: 20px 30px"
			data-top-bottom="background-position: 0 20px">
			<div class="container">
				<div class="row">
					<div class="col-xl-5">
						<div class="offer__content text-center">
							<h3> THE MOSTWE LOVE </h3>
							<h4> HOME & DECO </h4>
							<!-- <p>Shop Category</p> -->
							<a class="button button--active mt-3 mt-xl-4"
								href="/product/product_pagehome">SHOP HOME</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- ================ 홈 상품 페이지로 가는 네모 끝 ================= -->


	</main>
	<%@ include file="../sidebar.jsp"%>
	
	<%@ include file="../best.jsp"%>
	<%@ include file="../footer.jsp"%>
	
</body>

<!-- Mirrored from themewagon.github.io/aroma/index.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Jun 2023 06:56:03 GMT -->
</html>