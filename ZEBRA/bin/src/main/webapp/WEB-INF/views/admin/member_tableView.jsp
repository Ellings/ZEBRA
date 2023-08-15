<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  
  <style>
  	h1{
   		 text-align: center;
	}
	
	.memberTable {
		width: 100%;
	    margin-top: 25px;
	    text-align: center;
	}
		
	.text {	
		text-align: right; 
		width: 49%; 
		padding-right: 80px;
		font-size: 20px;
		font-weight: bold;
	}
	
	.textbox {
		width: 51%; 
		text-align: left; 
		padding-left: 0px;
		font-size: 16px;
	}
	
	.option {
		text-align: center;
		margin-top: 25px;
		margin-bottom: 25px;
	}
  </style>
  
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
   
  <script>
    /* 수정 기능  */
    function updateMtn(){
    	if(confirm("게시글을 수정하시겠습니까?")){
    		update.submit();    	
    	}
    }
    
    /* 삭제 기능  */
    function deleteMtn(){
  	  if(confirm("게시글을 삭제하시겠습니까?")){
  		  location.href="memberDelete?MID=${mdto.MID}";
  	  }
    }    
    
  </script>
	
  </head>

  <body class="nav-md">
    <div class="container body ">
      <div class="main_container ">
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
            <div class="page-title">
            </div>

                <div class="x_panel">                               
					
				<h1>회원 정보 수정</h1>
				<hr></hr>
				<form action="member_tableView" name="update" method="post">
					<table class="memberTable">
					<tr>
		                <td class="text">아이디</td>
		                <td class="textbox">${mdto.MID}</td>
					    <input type="hidden" id="id" name="MID" value="${mdto.MID}" >
		            </tr>		            
		            
		            <tr>
		                <td class="text">이름</td>
		                <td class="textbox"><input type="text" id="name" name="MNAME" value="${mdto.MNAME}"></td>
		            </tr>
		            
		            <tr>
		                <td class="text">핸드폰</td>
		                <td class="textbox"><input type="text" id="phone" name="MPHONE" value="${mdto.MPHONE}"></td>
		            </tr>		           
		            
		            <tr>
		                <td class="text">이메일</td>
		                <td class="textbox"><input type="text" id="email" name="MEMAIL" value="${mdto.MEMAIL}"></td>
		            </tr>
		            </table>
		            
		            <div class="option">
		            	<input type="button" value="수정하기" onclick="updateMtn()" style="font-size: 17px; margin-right: 6px;">
		            	<input type="button" value="삭제하기" onclick="deleteMtn()" style="font-size: 17px; margin-right: 6px; margin-left: 6px;">	
		            	<input type="button" value="이전으로" onclick="javascript:location.href='../admin/member_table'" style="font-size: 17px; margin-left: 6px;">
                  </div>
                  </form>
                </div>
              </div>
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