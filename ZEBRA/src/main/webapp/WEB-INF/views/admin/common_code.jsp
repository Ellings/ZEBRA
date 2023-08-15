<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                
                <!-- 사용하는 사이드 바 시작-->
                <ul class="nav side-menu">
                  <li><a href="/admin/index"><i class="fa fa-bar-chart"></i> Chart </a>
                    <ul class="nav child_menu">
                    </ul>
                  </li>
                  <li><a><i class="fa fa-shopping-cart"></i> Product Control <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
<!--                       <li><a href="/admin/form">General Form</a></li> -->
<!--                       <li><a href="/admin/form_validation">Form Validation</a></li> -->
<!--                       <li><a href="/admin/form_wizards">Form Wizard</a></li> -->
<!--                       <li><a href="/admin/form_upload">Form Upload</a></li> -->
<!--                       <li><a href="/admin/form_buttons">Form Buttons</a></li> -->
                      <li><a href="/admin/product_list">상품 관리</a></li>
                      <li><a href="/admin/order_list">주문 관리</a></li>
<!--                       <li><a href="/admin/order_view">주문 뷰</a></li> -->
                    </ul>
                  </li>
                  <li><a><i class="fa fa-user"></i> Member Control <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
<!--                       <li><a href="/admin/general_elements">General Elements</a></li>  -->
<!--                       <li><a href="/admin/media_gallery">Media Gallery</a></li> -->
<!--                       <li><a href="/admin/icons">Icons</a></li> -->
<!--                       <li><a href="/admin/glyphicons">Glyphicons</a></li> -->
<!--                       <li><a href="/admin/widgets">Widgets</a></li>   -->
                      <li><a href="/admin/member_table">회원 관리</a></li>  
                    </ul>
                  </li>

<!--                   <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a> -->
<!--                     <ul class="nav child_menu"> -->
<!--                       <li><a href="/admin/tables">Tables</a></li> -->
<!--                       <li><a href="/admin/tables_dynamic">Table Dynamic</a></li> -->
<!--                     </ul> -->
<!--                   </li> -->
<!--                   <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a> -->
<!--                     <ul class="nav child_menu"> -->
<!--                       <li><a href="/admin/chartjs">Chart JS</a></li> -->
<!--                       <li><a href="/admin/chartjs2">Chart JS2</a></li> -->
<!--                       <li><a href="/admin/morisjs">Moris JS</a></li> -->
<!--                       <li><a href="/admin/echarts">ECharts</a></li> -->
<!--                     </ul> -->
<!--                   </li> -->
                </ul>
                <!-- 사용하는 사이드 바 끝 -->
              </div>
              
              <!-- 사용하지 않는 사이드 바 시작-->
<!--               <div class="menu_section"> -->
<!--                 <ul class="nav side-menu"> -->
<!--                   <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a> -->
<!--                     <ul class="nav child_menu"> -->
<!--                       <li><a href="/admin/projects">Projects</a></li> -->
<!--                       <li><a href="/admin/project_detail">Project Detail</a></li> -->
<!--                       <li><a href="/admin/profile">Profile</a></li> -->
<!--                     </ul> -->
<!--                   </li> -->
<!--                   <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a> -->
<!--                     <ul class="nav child_menu"> -->
<!--                       <li><a href="/admin/page_403">403 Error</a></li> -->
<!--                       <li><a href="/admin/page_404">404 Error</a></li> -->
<!--                       <li><a href="/admin/page_500">500 Error</a></li> -->
<!--                       <li><a href="/admin/login">Login Page</a></li> -->
<!--                       <li><a href="/admin/pricing_tables">Pricing Tables</a></li> -->
<!--                     </ul> -->
<!--                   </li> -->
<!--                 </ul> -->
<!--               </div> -->
              <!-- 사용하지 않는 사이드 바 끝-->

            </div>
            <!-- sidebar menu -->
              
              
            <!-- 사이드 하단에 버튼 메뉴 우린 사용 안 하지만 냅둠~-->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- 사이드 하단에 버튼 메뉴 우린 사용 안 하지만 냅둠~-->
          