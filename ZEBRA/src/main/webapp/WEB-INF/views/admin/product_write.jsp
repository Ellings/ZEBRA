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
	  	function writeBtn(){
	  		if(confirm("게시글을 저장하시겠습니까?")){
	  			write.submit();
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
                <h3>Product Registration</h3>
              </div>
     
            </div>

            <div class="clearfix"></div>

          
          

              <div class="col-md-6 col-sm-6  ">
                <div class="x_panel">
                 
                 
                 
                 <form action="product_write" name="write" method="post" enctype="multipart/form-data">
                  <div class="x_content" >

                    <table class="table table-bordered">
                      <tbody>
<!--                         <tr> -->
<!--                           <th scope="row">상품 번호</th> -->
<!--                           <td> -->
<%--                           ${pno} --%>
<%-- <%--                           	<input class="form-control" data-validate-length-range="6" data-validate-words="2"  type= "number"  value="${pno}" name="pno" placeholder="ex) 12"  /> --%> 
<!--                           </td>  -->
<!--                         </tr> -->
                       
                        <tr>
                          <th scope="row">카테고리<br>(women:10, home:11)</th>
                          <td>
                            <select name="pcode" >
		                        <option>-</option>
		                        <option>10</option>
		                        <option>11</option>    
                     		</select>
<!--                           	<input class="form-control" data-validate-length-range="6" data-validate-words="2"  type= "number" name="pcode" placeholder="ex) 1" /> -->
                          </td> 
                        </tr> 
                        
                        <tr>
                          <th scope="row">상품명</th>
                          <td>
                          	<input class="form-control" data-validate-length-range="6" data-validate-words="2"  type= "text" name="pname" placeholder="ex) pants "  />
                          </td> 
                        </tr>
                        
                        <tr>
                        <tr>
                          <th scope="row">판매 가격</th>
                          <td>
                          	 <input class="form-control" data-validate-length-range="6" data-validate-words="2"  type= "number" name="pprice" placeholder="ex) 100,000 "  />
                          </td> 
                        </tr>
                        
                        <tr>
                          <th scope="row">재고 수량</th>
                          <td>
                          	<input class="form-control" data-validate-length-range="6" data-validate-words="2"  type= "number" name="pstock" placeholder="ex) 15 "  />
                          </td> 
                        </tr>
                        
                        <tr>
                          <th scope="row">판매 개수</th> <!-- 상품 등록 시 상품 테이블에 null값이 안 들어가기 위해서! -->
                          <td>
                          0
<!--                           	<input class="form-control" data-validate-length-range="6" data-validate-words="2"  type= "number" name="psoldcount" placeholder="ex) 1 "  /> -->
                          </td> 
                        </tr>

                        <tr>
                          <th scope="row">색상</th>
                          <td>
                          	 <select name="pcolor" >
		                        <option>--</option>
		                        <option>black</option>
		                        <option>orange</option>    
		                        <option>pink</option>    
		                        <option>white</option>    
		                        <option>yellow</option>    
		                        <option>H</option>    
                     		</select>
<!--                           	<input class="form-control" data-validate-length-range="6" data-validate-words="2"  type= "text" name="pcolor" placeholder="ex) black "  /> -->
                          </td> 
                        </tr>

                        <tr>
                          <th scope="row">상품 사이즈</th>
                          <td>
                       		 <select name="psize" >
		                        <option>--</option>
		                        <option>S</option>
		                        <option>M</option>    
		                        <option>L</option>       
		                        <option>H</option>       
                     		</select>
<!--                           	<input class="form-control" data-validate-length-range="6" data-validate-words="2"  type= "text" name="psize" placeholder="ex) s " /> -->
                          </td> 
                        </tr>
                        <tr>
                          <th scope="row">기본 설명</th>
                          <td>
                          	<textarea class="form-control" name="pdescript" cols="50" rows="10" placeholder="ex) women t-shirt " ></textarea>
                          </td> 
                        </tr>
                        
                        <tr>
                          <th scope="row">메인 이미지</th>
                          <td>
                          	<input class="form-control" type="file"  name="pm1"   data-validate-minmax="10,100" >
                          </td> 
                        </tr>
                        <tr>
                          <th scope="row">상세 이미지1</th>
                          <td>
                          	<input class="form-control" type="file"  name="pd1"  data-validate-minmax="10,100" >
                          </td> 
                        </tr>
                        <tr>
                          <th scope="row">상세 이미지2</th>
                          <td>
                          	<input class="form-control" type="file"  name="pd2"  data-validate-minmax="10,100" >
                          </td> 
                        </tr>
                        <tr>
                          <th scope="row">상세 이미지3</th>
                          <td>
                          	<input class="form-control" type="file"  name="pd3"   data-validate-minmax="10,100" >
                          </td> 
                        </tr>
                        
                        
                        <hr>
     
    </table>
	<hr>

 <!-- 상품 등록하기 끝 -->
                                        <div class="ln_solid">
                                            <div class="form-group">
                                                <div class="col-md-6 offset-md-3">
                                                     <button type="button" class="write" onclick="writeBtn()">작성완료</button>
<!--                                                     <button type='button' class="btn btn-primary" onclick="javascript:location.href='product_list.do'">취소</button> -->
                                                    <button type='button' class="btn btn-primary" onclick="javascript:location.href='product_list'">취소</button>
<!--                                                     <button type='reset' class="btn btn-success">Reset</button> -->
                                                </div>
                                            </div>
                                        </div>                                      
                                    </form>
                                </div>
                                <!-- 야무지게 상품 등록 ~! 끝 -->
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