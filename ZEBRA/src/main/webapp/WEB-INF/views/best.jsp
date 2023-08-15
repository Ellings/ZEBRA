<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ================ BEST SELELLERS section start ================= -->
<section class="section-margin calc-60px">
		
		
	<div class="container">
		
		<!-- 위에 제목  -->
		<div class="section-intro pb-60px">
<<<<<<< HEAD
			<p>Best Product는 상품 판매 수를 반영한 순위입니다</p>
			<h2>
				Best <span class="section-intro__style">Product</span>
=======
			<p>Popular Item in the market</p>
			<h2>
				Best <span class="section-intro__style">Sellers</span>
>>>>>>> branch 'master' of https://github.com/Ellings/ZEBRA.git
			</h2>
		</div>
		<!-- 위에 제목  -->
		
		<!-- 베스트 셀러 상품 시작-->
		<div class="row">

		<c:forEach var="product" items="${list1}" end="3">
			<div class="col-md-6 col-lg-4 col-xl-3">	
				<div class="card text-center card-product">
					
					<!-- 마우스 호버링 장바구니 카트와 찜 버튼이 있는 곳 시작-->
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
					<!-- 마우스 호버링 장바구니 카트와 찜 버튼이 있는 곳 끝-->
					
					<!-- best 제품 중 상품 1개의 정보 시작-->
					<div class="card-body">
						<h4 class="card-product__title">
							<a href="/product/product_detail?pno=${product.pno}">${product.pname}</a>
						</h4>
						
						<p class="card-product__price"><fmt:formatNumber value="${product.pprice}" pattern="###,###원" /></p>
					</div>
					<!-- best 제품 중 상품 1개의 정보 끝-->
					
					
				</div>
			</div>
		</c:forEach>
		<!-- 베스트 셀러 상품 끝-->

		
	

		
		
		</div> <!-- class = row -->
	</div>
</section>
<!-- ================ BEST SELELLERS  section end ================= -->