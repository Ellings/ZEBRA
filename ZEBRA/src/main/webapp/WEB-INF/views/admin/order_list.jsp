<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

     <title>🛒 주문 관리 🛒</title>

    <!-- Bootstrap -->
    <link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
    
    <link href="/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/build/css/custom.min.css" rel="stylesheet">
  </head>
  <body class="nav-md">
  <script type="text/javascript">	
	function searchBtn() {
	  // 1. 선택된 배송 상태를 가져옵니다.
	  var selectedStatus = document.getElementById("ordercate").value;

	 
	  console.log("선택된 배송 상태: " + selectedStatus);
	  
		search.submit();
	}
	
	
	</script> 
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
                <h3>✅ 🛒 Order List 🛒 ✅</h3>
              </div>

<!-- 			 셀렉해서 검색하기 시작 -->
              <div class="title_right" >
                <div id="selectbutton" class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search" style="right: -160px;">
                  <form action="/admin/order_list" name="search" method="post">
	                  <select name="ordercate" id="ordercate">
				        <option value="">-- 배송 상태 --</option>
				        <option value="prepare">상품 준비중</option>
				        <option value="shipping">배송 중</option>
				        <option value="completed">배송 완료</option>
				        <option value="ordercancel">주문 취소</option>
				        <option value="confirmaion">구매 확정</option>
				        
				      </select>
<!--                   검색 시작 -->
                  
                    <span class="input-group-btn">
                      <button  type="button" onclick="searchBtn()" data-toggle="tooltip" title="배송 상태 검색을 해보세요!">검색</button>
                    </span>
                 
<!--                   검색 끝 -->
                    </form>
                </div>
              </div>
            </div>
<!-- 		    셀렉해서 검색하기 끝 -->
		

            <div class="clearfix"></div>

            <div class="row">
         

			<!-- 테이블 시작 -->
              <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">

                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                            <div class="card-box table-responsive">
                   
			                    <table id="datatable-buttons" class="table table-striped table-bordered" style="width:100%">
			                      <thead>
			                        <tr>
			                          <th>주문 번호</th>
			                          <th>수령자 이름</th>
			                          <th>주문 날짜</th>
			                          
			                          <th>배송 상태</th>
			                          <th>결제 방법</th>
			                        </tr>
			                      </thead>
			
			
			                      <tbody>   
				                     <c:forEach var ="zebraorder" items="${list}"> 
										<tr>
											<td>${zebraorder.ONO}</td>
											<td ><a href="order_view?ONO=${zebraorder.ONO}&page=${page}&ordercate=${ordercate}">${zebraorder.ONAME}</a></td>
											<td><fmt:formatDate value="${zebraorder.ODATE}" pattern="yyyy-MM-dd"  /></td>			
											<td>${zebraorder.OSTATUS}</td>
											<td >${zebraorder.OPAYMENT}</td>
										</tr>
									</c:forEach>                
			                      </tbody>
			                    </table>
                 		  </div>
                		</div>
              		</div>
							<!-- 하단 페이징  시작-->
							<div class="dataTables_paginate paging_simple_numbers" id="datatable-responsive_paginate">
						     		<ul class="pagination">
						    	<!-- 첫 페이지 이동 -->
						    	<c:if test="${page!=1 }">
 						      <a href= "/admin/order_list?page=1&ordercate=${ordercate}"><li class="paginate_button previous disabled"></li></a> 
<%--						      <a href= "/admin/order_list?page=1&ordercate=${ordercate}"><img src="../img/btn/btn_pre2.gif" alt="처음으로" /></a>--%>
						    	</c:if>
						    	<c:if test="${page==1 }">
						  			<li class="paginate_button active"></li>
						    	</c:if>
						      <!-- 이전 페이지 이동 -->
						      <c:if test="${page>1 }">
						      <a href="/admin/order_list?page=${page-1}&ordercate=${ordercate}"><li class="paginate_button previous disabled"></li></a>
						      </c:if>
						      <c:if test="${page==1 }">
						      	<li class="prev"></li>
						      </c:if>
						      <!-- 페이지 리스트 -->
						      <c:forEach begin="${startPage}" end="${endPage}" step="1" var="num">
						      	<c:if test="${num != page }">
							      <a href="/admin/order_list?page=${num}&ordercate=${ordercate}">      
							     	 <li class="paginate_button "><div>${num}</div></li>
							      </a>
						      	</c:if>
						      <c:if test="${num == page }">
						      	<li class="paginate_button"><div>${num}</div></li>
						      </c:if>
						      </c:forEach>
						      <!-- 다음 페이지 이동 -->
						      <c:if test="${page<maxPage }">
							     <a href="/admin/order_list?page=${page+1}&ordercate=${ordercate}"><li class="paginate_button"></li></a> 
						      </c:if>
						      <c:if test="${page==maxPage }">
						      	<li class="paginate_button">
						      </c:if>
						      <!-- 끝 페이지 이동 -->
						      <c:if test="${page !=  maxPage }">
						      <a href="/admin/order_list?page=${maxPage}&ordercate=${ordercate}">
						      <li class="paginate_button next"></li>
						      </a>
						      </c:if>
						      <c:if test="${page ==  maxPage }">
						      <li class="paginate_button next"></li>
						      </a>
						      </c:if>
						      
						    </ul>
						    </div>
						
							<!-- 하단 페이징  끝-->
            	</div>
               </div>
             </div>
			<!-- 테이블 끝 -->
			
          

              
            </div> <!-- row -->
          </div>
        </div>
        <!-- /page content -->

     
      </div>
    </div>

    <!-- jQuery -->
    <script src="/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
   <script src="/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="/vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="/vendors/datatables.net-buttons/js/buttons5.min.js"></script>
    <script src="/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="/vendors/jszip/dist/jszip.min.js"></script>
    <script src="/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="/vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/build/js/custom.min.js"></script>

  </body>
</html>