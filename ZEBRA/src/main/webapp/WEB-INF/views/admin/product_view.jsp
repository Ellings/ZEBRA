<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
   <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/build/css/custom.min.css" rel="stylesheet">
  <script type="text/javascript">
  	function updateBtn(){
  		if(confirm("주문 내역 상태를 수정하시겠습니까?")){
  			update.submit();
  		}
  	}
  	
    
	function deleteBtn(){
		if(confirm("상품을 삭제하시겠습니까?")){
			location.href= "product_delete?pno=${pdto.pno}";
		}
	}
  </script>

  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="production/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>John Doe</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <%@ include file="common_code.jsp" %>

          
          </div>
        </div>

      <%@ include file="top_common.jsp" %>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Product View</h3>
              </div>
    
            </div>

            <div class="clearfix"></div>

          
          

              <div class="col-md-6 col-sm-6  ">
                <div class="x_panel">
                  
                  <div class="x_content" >

                    <table class="table table-bordered" >
                      
                      <tbody >
                        <tr>
                          <th scope="row">상품명</th>
                          <td><span>${pdto.pname}</span></td> 
                        </tr>
                        <tr>
                          <th scope="row">상품 번호</th>
                          <td>
                          	<span>${pdto.pno}</span>
                          </td> 
                        </tr> 
                        <tr>
                          <th scope="row">상품 설명</th>
                          <td>
                          	<span>${pdto.pdescript}</span>
                          </td> 
                        </tr> 
                        <tr>
                          <th scope="row">상품 재고</th>
                          <td>
                          	<span>${pdto.pstock}</span>
                          </td> 
                        </tr> 
                        <tr>
                          <th scope="row">판매 개수</th>
                          <td>
                          	<span>${pdto.psoldcount}</span>
                          </td> 
                        </tr> 
                        <tr>
                        <tr>
                          <th scope="row">색상</th>
                          <td>
                          	<span>${pdto.pcolor}</span>
                          </td> 
                        </tr> 
                        <tr>
                        <tr>
                          <th scope="row">판매 사이즈</th>
                          <td>
                          	<span>${pdto.psize}</span>
                          </td> 
                        </tr> 
                        <tr>
                          <th scope="row">메인 이미지</th>
                          <td><span><img src="/upload/${pdto.pmainimg}" style="width: 100px;" alt="" /></span></td> 
                        </tr>
                        <tr>
                        <tr>
                          <th scope="row">상세 이미지1</th>
                          <td><span><img src="/upload/${pdto.pdetailimg1}" style="width: 100px;" alt="" /></span></td> 
                        </tr>
                        <tr>
                          <th scope="row">상세 이미지2</th>
                          <td><span><img src="/upload/${pdto.pdetailimg2}" style="width: 100px;" alt="" /></span></td> 
                        </tr>
                          <th scope="row">상세 이미지3</th>
                          <td><span><img src="/upload/${pdto.pdetailimg1}" style="width: 100px;" alt="" /></span></td> 
                        </tr>
                          <hr>
    </table>
    <table class="table table-bordered">
    	
      <tr>
        <td><strong>이전 상품</strong> <span class="separator">|</span> </span> <a href="/admin/product_view?pno=${nextDto.pno }&page=${page}&category=${category}&s_word=${s_word}">  ${nextDto.pname } </a></td>
      </tr>
      <tr>
        <td><strong>다음 상품</strong> <span class="separator">|</span> <a href="/admin/product_view?pno=${prevDto.pno }&page=${page}&category=${category}&s_word=${s_word}"> ${prevDto.pname}</a></td>
      </tr>
 
    </table>
	<hr>


	
<%--     <a href="product_list?page=${page}"><div class="list" >목록</div></a> --%>
<%--     <a onclick="deleteBtn(${pdto.pno})" style="cursor: pointer;" ><div class="rebtn">삭제</div></a> --%>
<%--     <a href="product_update?pno=${pdto.pno}&page=${page}"><div class="list">수정</div></a> --%>
<%--     <a onclick="updateBtn(${pdto.pno})"><div class="rebtn">수정</div>></a> --%>



<a href="product_list?page=${page}">
  <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" >목록</button>
</a>


<a href="product_update?pno=${pdto.pno}&page=${page}">
  <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" >수정</button>	
</a>


<a onclick="deleteBtn(${pdto.pno})" style="cursor: pointer;">
  <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" >삭제</button>
</a>







</section>
</body>
</html>
                      </tbody>
                    </table>
   

                  </div>
                </div>
              </div>

              <div class="clearfix"></div>

              
                    
							
						
                
               
           
        
        
        <!-- /page content -->

      
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
   <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
  </body>
</html>
