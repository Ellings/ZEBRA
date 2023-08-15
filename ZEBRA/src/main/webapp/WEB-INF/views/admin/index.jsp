<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title>ZEBRA</title>
    <link rel="icon" href="../img/logo2.png" type="image/png">

    <!-- Bootstrap -->
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/build/css/custom.min.css" rel="stylesheet">
  </head>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
     
   <style>
   
   .media .profile_thumb {
  padding: 0;
}
   
  .best { /* LINE 279  */
  border: 1px solid;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  padding: 10px 25px;
  background-size: cover; /* 배경 이미지 크기 조절 */
  }
  
  /* 이미지 경로를 바꾸어 사용할 클래스들 */
  .best1 {
    background-image: url("/img/best/best1.jpg");
  }

  .best2 {
    background-image: url("/img/best/best2.jpg");
  }

  .best3 {
    background-image: url("/img/best/best3.jpg");
  }
  
  .best4 {
    background-image: url("/img/best/best4.jpg");
  }
  
  .best5 {
    background-image: url("/img/best/best5.jpg");
  }
  
}

   </style>
     
   <script>
      function boardBtn(){ // 152번째 줄
			
			$.ajax({
				url:"/admin/indexAjax", 
				type:"post",
				data:{},
				dataType:"json",
				success:function(data){
					console.log("data : "+data);
					console.log("data[0][2] : "+data[0][2]);
					console.log("data[1] : "+data[1]);				
										 
					// 받아온 데이터를 count 클래스를 갖는 div 요소 내에 넣음
	                $("#count1").text(data[0][0]); // 총 회원수
	                $("#count2").text(data[0][1]);
	                $("#count3").text(data[0][2]); // 총 여자 회원수
	                $("#count4").text("₩" + data[0][4].toLocaleString()); // 총 매출액
	                $("#count5").text(data[0][3].toLocaleString()); // 총 구매수
	                $("#count6").text(data[0][5]); // 3월
	                $("#count7").text(data[0][6]); // 4월
	                $("#count8").text(data[0][7]); // 5월
	                $("#count9").text(data[0][8]); // 6월
	                $("#count10").text(data[0][9]); // 7월
	                $("#count11").text(data[0][10]); // 8월
	                $("#count12").text(data[1]); // 총 물품수
					  
				},
				error:function(){
					alert("데이터 받기 실패!");
				}
			});	
      };			
	</script>

  <body class="nav-md">
  
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
			  <!--이미지 오류 -->
              </div>
              <div class="profile_info">
                <span>환영합니다,</span>
                <h2>${sessionName}님</h2>                
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
          <!-- top tiles -->
          <div class="col-md-12" style="display: inline-block;" >          
          <div class="tile_count">
              <div class="col-md-1 col-sm-4  tile_stats_count">            
              <span class="count_top"><i class="fa fa-user"></i> 총 회원수</span>
              <div class="count" id="count1"> ${allCount} </div>              
              <span class="count_bottom"><i class="green">4% </i> 지난 달 대비</span>
            </div>
            
            <div class="col-md-1 col-sm-4  tile_stats_count">              
              <span class="count_top"><i class="fa fa-user"></i> 남자 회원수</span>
              <div class="count green" id="count2"> ${maleCount} </div>               
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> 지난 달 대비</span>
            </div>
            
            <div class="col-md-1 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 여자 회원수</span>
              <div class="count red" id="count3"> ${FemaleCount} </div>
              <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> 지난 달 대비</span>
            </div>
            
            <div class="col-md-1 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 총 상품수</span>
              <div class="count" id="count12"> ${allProductCount} </div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> 지난 달 대비</span>
            </div>
            
            <div class="col-md-1 col-sm-4  tile_stats_count" style="margin-right:20px">
              <span class="count_top"><i class="fa fa-clock-o"></i> 총 구매수</span>
              <div class="count" id="count5"><fmt:formatNumber value="${totalOrder}" pattern="#,##0" /></div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> 지난 달 대비</span>
            </div>
            
            <div class="col-md-3 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 총 매출액</span>
              <div class="count" id="count4">₩<fmt:formatNumber value="${totalPay}" pattern="#,##0" /></div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> 지난 달 대비</span>
            </div>
           
          </div>
        </div>
        
          <!-- /top tiles -->
          <div class="row">
            <div class="col-md-12 col-sm-12 ">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-6">
                    <h3 style="display: inline-block;">수익 현황 <small><small>월별 총 매출</small></small></h3> 
                       
                    <button onclick="boardBtn()" style="font-size:15px; width: 60px; height: 30px; margin-left:6px;" class="ti-shopping-cart">AJAX</button> 
                    
                  </div>
                </div>

                <div class="col-md-9 col-sm-9 ">
                  
            <div> <!-- Chart.js 그래프 시작 -->
			  <canvas width="300" height="400" id="myChart"></canvas>	
			</div>						
			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>			
			<script>
			  const ctx = document.getElementById('myChart');					
			  new Chart(ctx, {
			    data: {
			      labels: ['3월', '4월', '5월', '6월', '7월', '8월'],
			      datasets: [{
			    	type: 'bar',
			        label: '바 데이터',
			        backgroundColor: [
			        	'rgba(255, 0, 0, 0.1)',     // Red, 컬러 세기 0.1
			            'rgba(0, 0, 255, 0.1)',     // Blue, 컬러 세기 0.1
			            'rgba(255, 255, 0, 0.1)',   // Yellow, 컬러 세기 0.1
			            'rgba(0, 128, 0, 0.1)',     // Green, 컬러 세기 0.1
			            'rgba(128, 0, 128, 0.1)',   // Purple, 컬러 세기 0.1
			            'rgba(255, 165, 0, 0.1)'    // Orange, 컬러 세기 0.1			        	
			        ], 
			        data: [${totalPay3}, ${totalPay4}, ${totalPay5}, ${totalPay6}, ${totalPay7}, ${totalPay8}],
			        borderWidth: 1,
			        pointBackgroundColor: 'transparent', // 점의 색상을 투명으로 설정
			        fill: {
			            target: 'origin',
			            above: 'rgba(26, 187, 150, 0.1)' // 흐릿한 배경 컬러 설정
			        }
			      },
			      {
			          type: 'line', // 라인 그래프 데이터셋
			          label: '라인 데이터',
			          backgroundColor: "rgba(26, 187, 156, 0.5)",
			          data: [${totalPay3}, ${totalPay4}, ${totalPay5}, ${totalPay6}, ${totalPay7}, ${totalPay8}], // 라인 그래프 데이터
			          borderColor: 'rgba(26, 187, 156, 0.5)', // 라인 색상 설정
			          borderWidth: 2,
			          fill: false, // 라인 그래프 내부를 채우지 않음
			          tension: 0.3,
			          pointRadius: 5, // 점의 반지름 설정
			          pointStyle: 'rectRot' // 점 모양을 별로 설정
			      } // 라인 그래프
			      ] // datasets
			    },
			    options: {
			    	maintainAspectRatio: false,
			      scales: {
			        x: { // x축 스케일에 대한 설정 추가
			              grid: {
			                drawOnChartArea: false // 그래프 영역 아래에 그리드 라인이 표시되지 않도록 설정
			              },
			           },
			        y: {
			        	 display: false,
			             beginAtZero: true
			           }
			        },
			        plugins: {
			            filler: { // 그래프 아래에 흐릿한 배경 컬러 적용
			              propagate: true
			        	}
			      }
			    }
			  });
			</script> <!-- Chart.js 그래프 끝 -->
                  
                </div>
                
                <div class="col-md-3 col-sm-3 ">
                      <div>
                        <div class="x_title">
                          <h2>최고 구매 고객</h2>
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
                        <ul class="list-unstyled top_profiles scroll-view">
                          <li class="media event">
                            <a class="pull-left border-aero profile_thumb">
                            
                              <img class="best best1">
                              
                            </a>
                            <div class="media-body">  
                              <a class="title" href="#">${list1.get(0).getMNAME()}</a>
                              <p><strong>₩<fmt:formatNumber value="${list1.get(0).getMTOTAL_PAY()}" pattern="#,##0" /> </strong> / ${list1.get(0).getMPHONE()}</p>
                              <p> <small>총 ${list1.get(0).getMTOTAL_ORDER()}회 결제</small>
                              </p>
                            </div>
                          </li>
                          <li class="media event">
                            <a class="pull-left border-green profile_thumb">
                             <img class="best best2">
                            </a>
                            <div class="media-body">
                              <a class="title" href="#">${list1.get(1).getMNAME()}</a>
                              <p><strong>₩<fmt:formatNumber value="${list1.get(1).getMTOTAL_PAY()}" pattern="#,##0" /> </strong> / ${list1.get(1).getMPHONE()}</p>
                              <p> <small>총 ${list1.get(1).getMTOTAL_ORDER()}회 결제</small>
                              </p>
                            </div>
                          </li>
                          <li class="media event">
                            <a class="pull-left border-blue profile_thumb">
                              <img class="best best3">
                            </a>
                            <div class="media-body">
                              <a class="title" href="#">${list1.get(2).getMNAME()}</a>
                              <p><strong>₩<fmt:formatNumber value="${list1.get(2).getMTOTAL_PAY()}" pattern="#,##0" /> </strong> / ${list1.get(2).getMPHONE()}</p>
                              <p> <small>총 ${list1.get(2).getMTOTAL_ORDER()}회 결제</small>
                              </p>
                            </div>
                          </li>
                          <li class="media event">
                            <a class="pull-left border-aero profile_thumb">
                              <img class="best best4">
                            </a>
                            <div class="media-body">
                              <a class="title" href="#">${list1.get(3).getMNAME()}</a>
                              <p><strong>₩<fmt:formatNumber value="${list1.get(3).getMTOTAL_PAY()}" pattern="#,##0" /> </strong> / ${list1.get(3).getMPHONE()}</p>
                              <p> <small>총 ${list1.get(3).getMTOTAL_ORDER()}회 결제</small>
                              </p>
                            </div>
                          </li>
                          <li class="media event">
                            <a class="pull-left border-green profile_thumb">
                              <img class="best best5">
                            </a>
                            <div class="media-body">
                              <a class="title" href="#">${list1.get(4).getMNAME()}</a>
                              <p><strong>₩<fmt:formatNumber value="${list1.get(4).getMTOTAL_PAY()}" pattern="#,##0" /> </strong> / ${list1.get(4).getMPHONE()}</p>
                              <p> <small>총 ${list1.get(4).getMTOTAL_ORDER()}회 결제</small>
                              </p>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>

                <div class="clearfix"></div>
              </div>
            </div>

          </div>
          <br />
<!-- 
          <div class="row">


            <div class="col-md-4 col-sm-4 ">
              <div class="x_panel tile fixed_height_320">
                <div class="x_title">
                  <h2>주문 수</h2>
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
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>8월</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 66%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>123k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>

                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>7월</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 45%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>53k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>6월</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>23k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>5월</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 5%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>3k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>4월</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 2%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>1k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  
                   <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>3월</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 2%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>1k</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>

                </div>
              </div>
            </div>

            <div class="col-md-4 col-sm-4 ">
              <div class="x_panel tile fixed_height_320 overflow_hidden">
                <div class="x_title">
                  <h2>상품별 주문 수요</h2>
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
                  <table class="" style="width:100%">
                    <tr>
                      <th style="width:37%;">
                        <p>Top 5</p>
                      </th>
                      <th>
                        <div class="col-lg-7 col-md-7 col-sm-7 ">
                          <p class="">Device</p>
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 ">
                          <p class="">Progress</p>
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <td>
                        <canvas class="canvasDoughnut" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
                      </td>
                      <td>
                        <table class="tile_info">
                          <tr>
                            <td>
                              <p><i class="fa fa-square blue"></i>IOS </p>
                            </td>
                            <td>30%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square green"></i>Android </p>
                            </td>
                            <td>10%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square purple"></i>Blackberry </p>
                            </td>
                            <td>20%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square aero"></i>Symbian </p>
                            </td>
                            <td>15%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square red"></i>Others </p>
                            </td>
                            <td>30%</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>


            <div class="col-md-4 col-sm-4 ">
              <div class="x_panel tile fixed_height_320">
                <div class="x_title">
                  <h2>매출 목표</h2>
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
                  <div class="dashboard-widget-content">
                    <ul class="quick-list">
                      <li><i class="fa fa-calendar-o"></i><a href="#">Settings</a>
                      </li>
                      <li><i class="fa fa-bars"></i><a href="#">Subscription</a>
                      </li>
                      <li><i class="fa fa-bar-chart"></i><a href="#">Auto Renewal</a> </li>
                      <li><i class="fa fa-line-chart"></i><a href="#">Achievements</a>
                      </li>
                      <li><i class="fa fa-bar-chart"></i><a href="#">Auto Renewal</a> </li>
                      <li><i class="fa fa-line-chart"></i><a href="#">Achievements</a>
                      </li>
                      <li><i class="fa fa-area-chart"></i><a href="#">Logout</a>
                      </li>
                    </ul>

                    <div class="sidebar-widget">
                        <h4>Profile Completion</h4>
                        <canvas width="150" height="80" id="chart_gauge_01" class="" style="width: 160px; height: 100px;"></canvas>
                        <div class="goal-wrapper">
                          <span id="gauge-text" class="gauge-value pull-left">0</span>
                          <span class="gauge-value pull-left">%</span>
                          <span id="goal-text" class="goal-value pull-right">100%</span>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
          </div>
            </div>
          </div>
         
         -->

    <!-- jQuery -->
    <script src="/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="/vendors/Flot/jquery.flot.js"></script>
    <script src="/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="/vendors/Flot/jquery.flot.time.js"></script>
    <script src="/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="/vendors/moment/min/moment.min.js"></script>
    <script src="/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/build/js/custom.min.js"></script>
	
  </body>
</html>