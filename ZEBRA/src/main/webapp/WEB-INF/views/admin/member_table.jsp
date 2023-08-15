<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>ZEBRA</title>
    <link rel="icon" href="../img/logo2.png" type="image/png">

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
  
  <script>
	  /* 검색 기능 */
      function searchBtn(){		  
    	  if($("#s_word").val()) {
   	    search.submit();
      }
  </script>
  
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index" class="site_title"><i class="fa fa-paw"></i> <span>ZEBRA</span></a>
            </div>

            <div class="clearfix"></div>
			
            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="production/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>환영합니다,</span>
          	      <h2>멋쟁이 얼룩말님</h2>
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
            
            <form action="/admin/member_table" name="search" method="post"> 
              <div class="title_left">
                <h3><a href="/admin/member_table">Users <small>현재 가입자 목록</small></a></h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                  
                    <!-- 검색창에 카테고리 추가 -->
                    <select name="category" id="category">
			          <option value="all">아이디+이름</option>
			          <option value="MID">아이디</option>
			          <option value="MNAME">이름</option>
			        </select>
			        
                    <input type="text" class="form-control" name="s_word" id="s_word" value="${s_word}" size="16">
                    <span class="input-group-btn">                   
                    
                      <button class="btn btn-secondary" type="submit" onclick="searchBtn()">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
              </form>
            </div>

            <div class="clearfix"></div>            

              <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원 목록<small>Users</small></h2>
                    
                    <!-- 등록 페이지로 이동  -->
                    <a href="/admin/member_Write"><input type="button" value="등록" class="write" style="font-size: 13px; margin-top: 2px; margin-left: 15px;"></a>
                    
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Settings 1</a>
                            <a class="dropdown-item" href="#">Settings 2</a>
                          </div>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                            <div class="card-box table-responsive">
                            <p class="text-muted font-13 m-b-30">
                     		회원 아이디를 누르면 수정, 삭제가 가능합니다.   
                  			</p>
					
					<!-- 데이터 시작  -->
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%"> 
                      <thead>
                        <tr>
                          <th>아이디</th>
                          <th>이름</th>
                          <th>핸드폰</th>
                          <th>가입 날짜</th>
                          <th>총 결제금액</th>
                          <th>총 결제횟수</th>
                          <th>이메일</th>
                        </tr>
                      </thead>
                      <tbody>
                      
                      <c:forEach var="mdto" items="${list}"> <!-- var는 변수 공간, list를 cdto에 넣어라 -->
						<tr>
						  <td><a href="/admin/member_tableView?MID=${mdto.MID}" style="text-decoration: underline">${mdto.MID}</a></td> <!-- 수정/삭제 페이지로 이동 -->
						  <td>${mdto.MNAME }</td>
						  <td>${mdto.MPHONE }</td> 						  
						  <td>${mdto.formattedJoinDay }</td>	
						  <td>${mdto.MTOTAL_PAY }</td>
						  <td>${mdto.MTOTAL_ORDER }</td>
						  <td>${mdto.MEMAIL }</td>			
						</tr>
					  </c:forEach>
                      
                     
                      </tbody>
                    </table>
                  
                  </div>
                </div>
              </div>
            </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
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