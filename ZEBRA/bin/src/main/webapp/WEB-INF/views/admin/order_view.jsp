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
		  alert("배송 상태를 수정합니다.");
		  //alert(${odto.ONO});
		  
		  $.ajax({
			 url:"/admin/updateAjax",
			 type:"post",
			 data:  {"OSTATUS":$("select[name='OSTATUS']").val(),
				 	"ONO" :${odto.ONO},
		           },
		           
			 dataType:"json",
			 success:function(data){
				  
				 console.log("data:"+data);
//                   alert("controller에서 데이터 받기 성공");
                  alert("배송 상태 수정 완료");
				
				 
				 
				
                  location.reload(true);//새로 고침
				 
			 },
			 error:function(){
				 alert("데이터 받기 실패!!");
			 }
		  });
	
		 
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
                <h3>Order View</h3>
              </div>

              
            </div>

            <div class="clearfix"></div>

          
          

              <div class="col-md-6 col-sm-6  ">
                <div class="x_panel">
                
                  <div class="x_content" >

                    <table class="table table-bordered">
                      
                      <tbody>
                        <tr>
                          <th scope="row">주문 번호</th>
                          <td>${odto.ONO}</td> 
                        </tr>
                        <tr>
                          <th scope="row">물품 번호</th>
                          <td>${odto.PNO}</td> 
                        </tr> 
                        <tr>
                          <th scope="row">회원 아이디</th>
                          <td>${odto.MID}</td> 
                        </tr>
                        <tr>
                        <tr>
                          <th scope="row">주문 수량</th>
                          <td>${odto.OAMOUNT}</td> 
                        </tr>
                        <tr>
                          <th scope="row">전체 결제 금액</th>
                          <td>${odto.OTOPRICE}</td> 
                        </tr>
                          
                        <tr>
                          <th scope="row">수령자 이름</th>
                          <td>${odto.ONAME}</td> 
                        </tr>
                        <tr>
                          <th scope="row">수령자 휴대 번호1(앞 번호)</th>
                          <td>${odto.OHP1}</td> 
                        </tr>
                        <tr>
                          <th scope="row">수령자 휴대 번호2(중간 번호)</th>
                          <td>${odto.OHP2}</td> 
                        </tr>
                        <tr>
                          <th scope="row">수령자 휴대 번호3(뒷 번호)</th>
                          <td>${odto.OHP3}</td> 
                        </tr>
                        <tr>
                          <th scope="row">수령자 우편 번호</th>
                          <td>${odto.OZIP}</td> 
                        </tr>
                        <tr>
                          <th scope="row">수령자 주소1</th>
                          <td>${odto.OADDR1}</td> 
                        </tr>
                        <tr>
                          <th scope="row">수령자 주소2</th>
                          <td>${odto.OADDR2}</td> 
                        </tr>
                        <tr>
                          <th scope="row">수령자 유선 번호1(앞 번호)</th>
                          <td>${odto.ORHP1}</td> 
                        </tr>
                        <tr>
                          <th scope="row">수령자 유선 번호2(중간 번호)</th>
                          <td>${odto.ORHP2}</td> 
                        </tr>
                        <tr>
                          <th scope="row">수령자 유선 번호3(뒷 번호)</th>
                          <td>${odto.ORHP3}</td> 
                        </tr>      
                        <tr clss="ordercate">
                           
                          <th scope="row">배송 상태</th>
                          
                          <td> 
                          
                          	<select id="OSTATUS" name="OSTATUS" onchange="updateBtn()" >
                               <option >${odto.OSTATUS}</option>
                               <option value="상품 준비 중" >상품 준비 중</option>
                               <option value="배송 중" >배송 중</option>
                               <option value="배송 완료" >배송 완료</option>
                               <option value="주문 취소" >주문 취소</option>
                               <option value="구매 확정" >구매 확정</option>
                            </select>    
                     		   <button  type="button" onclick="updateBtn()" >수정하기</button>
                        </td> 
                        </tr>
                          	
                        
                        <tr>
                          <th scope="row">주문자 배송 요구 사항</th>
                          <td>${odto.OWANT}</td> 
                        </tr>
                        <tr>
                          <th scope="row">결제 방법</th>
                          <td>${odto.OPAYMENT}</td>                 
                        </tr>
                        <tr>
                          <th scope="row">결제 완료 여부</th>
                          <td><span>${odto.OCOMPLETE}</span></td> 
                        </tr>
                        <tr>
                          <th scope="row">주문 날짜</th>
                          <td>${odto.ODATE}</td> 
                        </tr>
                       
                        
                     
                      </tbody>
                    </table>
    <div class="button-wrapper">
      <button type="button" class="cancel" onclick="javascript:location.href='order_list'">주문 목록으로 돌아가기</button>
    </div>

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
