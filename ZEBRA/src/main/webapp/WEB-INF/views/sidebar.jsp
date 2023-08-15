<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css"
	href="https://www.66girls.co.kr/ind-script/optimizer.php?filename=tZVBUgQhDEX30249R1ZOeQQX7jxBOsQmNUCoJljj7UVn9AB2WFGQ5IX8CgGiZgampTfeG2RM6XyG2tcktETLCVrgJXCTrUC7SHl6BmrDUUNPDHUfKxlkLr0iXXDjh2F-BB9skmZF9xH-b2rCT-0GKzahnxSkOWvx490O_HhMp7HhUxd_pqkmk-oPjpwmUO9tMAGMmxQ0nqAwrv7QtZt5tuwfV69TFEgThB1u5E8dBt49JtY9Q-7jfbWo9S1KrVI2RzZp-RjhoqXSIWxkDHOqfh3z2pHbGHeKL8evu5X1UPy7qvko9vuz3UoLaPhN_QI&amp;type=css&amp;k=d49e6946efb0d8c3b008425c76a9e43709437f6e&amp;t=1684737283&amp;user=T" />
<script type="text/javascript">
$(document).ready(function(){    
 
    //커서 스크롤 이동  
	$("#gotobtm").click(function(){
		$("html, body").animate({scrollTop: $(document).height() }, 600);
	});
	$("#gototop").click(function(){
		$("html, body").animate({scrollTop: 0 }, 600);
	});    
	 
});
</script>

<div class="bottom_fixed_menu">
	<h1>
		<a href="/layout/index">
		<img src="../img/member/logo2.png"">
		</a>
	</h1>
	<ul>
		<li><a href="/mypage/orderhistory"><i class="xi-user"></i></a></li>
		<li><a href="/mypage/wishlist"><i class="xi-heart"></i></a></li> 
		<li><a href="/mypage/cart"><i class="xi-cart"></i></a></li>
		<li><a id="gototop"><i class="xi-angle-up-min"></i></a></li>	
		<li><a id="gotobtm"><i class="xi-angle-down-min"></i></a></li>
	</ul>
</div>

