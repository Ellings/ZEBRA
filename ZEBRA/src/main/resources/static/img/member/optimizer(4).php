$(function(){ 
    if($(".menuCategory > li").length==0){
         $(".menuCategory").hide();
    };
});
$(window).on('load', function() {
    if($(".category_best .prdList > li").length >= 7){
        $(".category_best").addClass("active");
        var recommendSlide = new Swiper('.category_best .swiper-container', {
            loop:true,
            slidesPerView: 6,
            slidesPerGroup: 1,
            spaceBetween: 12,
            autoplay: {
                delay: 5000,
            },
            speed: 1500,
            pagination: {
                el: ".category_best .swiper-pagination",
                clickable:true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '">' + '<span class="fill">' + (index + 1) + '</span>' + "</span>";
                },
            },
            navigation: {
                nextEl: ".category_best .swiper-button-next",
                prevEl: ".category_best .swiper-button-prev",
            },
        });
    }else{
		$(".category_best .prdList").addClass("center");
    }
});
/**
 * 조건별 검색 기능 스크립트
 */
$(function()
{
    var sParentElement = 'select.SecondSelect';
    $('select.FirstSelect').on('change', function()
    {
        var iGroupNo = $(this).find('option:selected').val();
        if (iGroupNo > 0) {
            $.ajax({
                url : '/product/provider/selectsearch.xml?GroupNo=' + iGroupNo,
                dataType : 'text',
                success : function(data){
                    if ( window.DOMParser ) {
                        tmp = new DOMParser();
                        xml = tmp.parseFromString( data , "text/xml" );
                    } else {
                        xml = new ActiveXObject( "Microsoft.XMLDOM" );
                        xml.async = "false";
                        xml.loadXML( data );
                    }

                    $(sParentElement).html('');
                    getOptionElement('','-세부항목선택-').appendTo(sParentElement);
                    var nodes = $(xml).find('searchkey');
                    for ( var x = 0 ; x < nodes.length ; x++) {
                        getOptionElement($(nodes[x]).find('search_value').text(),$(nodes[x]).find('search_value').text()).appendTo(sParentElement);
                    }
                }
            });
        }
    });
    $('a.SelectSearch').on('click', function()
    {
        var sGroup = $('select.FirstSelect').val();
        var sItem = $('select.SecondSelect').val();
        if (!sGroup) {
            alert('조건을 선택해 주세요.');
            return false;
        }
        if (!sItem) {
            alert('세부 항목을 선택해 주세요.');
            return false;
        }
        location.href = document.location.href.split('?')[0].split(document.domain)[1] + '?' + sSSUrl + '&sGroup=' + sGroup + '&sItem=' + sItem;
    });

    function getOptionElement(sVal, sTitle)
    {
        return $("<option value='" + sVal + "'>" + sTitle + "</option>");
    }
});
/**
 * 움직이는 배너 Jquery Plug-in
 * @author  cafe24
 */

(function($){

    $.fn.floatBanner = function(options) {
        options = $.extend({}, $.fn.floatBanner.defaults , options);

        return this.each(function() {
            var aPosition = $(this).position();
            var jbOffset = $(this).offset();
            var node = this;

            $(window).on('scroll', function() {
                var _top = $(document).scrollTop();
                _top = (aPosition.top < _top) ? _top : aPosition.top;

                setTimeout(function () {
                    var newinit = $(document).scrollTop();

                    if ( newinit > jbOffset.top ) {
                        _top -= jbOffset.top;
                        var container_height = $("#wrap").height();
                        var quick_height = $(node).height();
                        var cul = container_height - quick_height;
                        if(_top > cul){
                            _top = cul;
                        }
                    } else {
                        _top = 0;
                    }

                    $(node).stop().animate({top: _top}, options.animate);
                }, options.delay);
            });
        });
    };

    $.fn.floatBanner.defaults = {
        'animate'  : 500,
        'delay'    : 500
    };

})(jQuery);

/**
 * 문서 구동후 시작
 */
$(function(){
    $('#banner:visible, #quick:visible').floatBanner();

    //placeholder
    $(".ePlaceholder input, .ePlaceholder textarea").each(function(i){
        var placeholderName = $(this).parents().attr('title');
        $(this).attr("placeholder", placeholderName);
    });
    /* placeholder ie8, ie9 */
    $.fn.extend({
        placeholder : function() {
            //IE 8 버전에는 hasPlaceholderSupport() 값이 false를 리턴
           if (hasPlaceholderSupport() === true) {
                return this;
            }
            //hasPlaceholderSupport() 값이 false 일 경우 아래 코드를 실행
            return this.each(function(){
                var findThis = $(this);
                var sPlaceholder = findThis.attr('placeholder');
                if ( ! sPlaceholder) {
                   return;
                }
                findThis.wrap('<label class="ePlaceholder" />');
                var sDisplayPlaceHolder = $(this).val() ? ' style="display:none;"' : '';
                findThis.before('<span' + sDisplayPlaceHolder + '>' + sPlaceholder + '</span>');
                this.onpropertychange = function(e){
                    e = event || e;
                    if (e.propertyName == 'value') {
                        $(this).trigger('focusout');
                    }
                };
                //공통 class
                var agent = navigator.userAgent.toLowerCase();
                if (agent.indexOf("msie") != -1) {
                    $(".ePlaceholder").css({"position":"relative"});
                    $(".ePlaceholder span").css({"position":"absolute", "padding":"0 4px", "color":"#878787"});
                    $(".ePlaceholder label").css({"padding":"0"});
                }
            });
        }
    });

    $(':input[placeholder]').placeholder(); //placeholder() 함수를 호출

    //클릭하면 placeholder 숨김
    $('body').on('click', '.ePlaceholder span', function(){
        $(this).hide();
    });

    //input창 포커스 인 일때 placeholder 숨김
    $('body').on('focusin', '.ePlaceholder :input', function(){
        $(this).prev('span').hide();
    });

    //input창 포커스 아웃 일때 value 가 true 이면 숨김, false 이면 보여짐
    $('body').on('focusout', '.ePlaceholder :input', function(){
        if (this.value) {
            $(this).prev('span').hide();
        } else {
            $(this).prev('span').show();
        }
    });

    //input에 placeholder가 지원이 되면 true를 안되면 false를 리턴값으로 던져줌
    function hasPlaceholderSupport() {
        if ('placeholder' in document.createElement('input')) {
            return true;
        } else {
            return false;
        }
    }
});

/**
 *  썸네일 이미지 엑박일경우 기본값 설정
 */
$(window).on('load', function() {
    $("img.thumb,img.ThumbImage,img.BigImage").each(function($i,$item){
        var $img = new Image();
        $img.onerror = function () {
            $item.src="//img.echosting.cafe24.com/thumb/img_product_big.gif";
        }
        $img.src = this.src;
    });
    //디스카운트 체크
    checkDiscount();
});

/**
 *  tooltip
 */
$('.eTooltip').each(function(i){
    $(this).find('.btnClose').attr('tabIndex','-1');
});
//tooltip input focus
$('.eTooltip').find('input').on('focus', function() {
    var targetName = returnTagetName(this);
    targetName.siblings('.ec-base-tooltip').show();
});
$('.eTooltip').find('input').on('focusout', function() {
    var targetName = returnTagetName(this);
    targetName.siblings('.ec-base-tooltip').hide();
});
function returnTagetName(_this){
    var ePlacename = $(_this).parent().attr("class");
    var targetName;
    if(ePlacename == "ePlaceholder"){ //ePlaceholder 대응
        targetName = $(_this).parents();
    }else{
        targetName = $(_this);
    }
    return targetName;
}

/**
 *  eTab
 */
$("body").on("click", ".eTab a", function(e){
    // 클릭한 li 에 selected 클래스 추가, 기존 li에 있는 selected 클래스는 삭제.
    var _li = $(this).parent("li").addClass("selected").siblings().removeClass("selected"),
    _target = $(this).attr("href"),
    _siblings = $(_target).attr("class"),
    _arr = _siblings.split(" "),
    _classSiblings = "."+_arr[0];

    //클릭한 탭에 해당하는 요소는 활성화, 기존 요소는 비활성화 함.
    $(_target).show().siblings(_classSiblings).hide();


    //preventDefault 는 a 태그 처럼 클릭 이벤트 외에 별도의 브라우저 행동을 막기 위해 사용됨.
    e.preventDefault();
});



//window popup script
function winPop(url) {
    window.open(url, "popup", "width=300,height=300,left=10,top=10,resizable=no,scrollbars=no");
}
/**
 * document.location.href split
 * return array Param
 */
function getQueryString(sKey)
{
    var sQueryString = document.location.search.substring(1);
    var aParam       = {};

    if (sQueryString) {
        var aFields = sQueryString.split("&");
        var aField  = [];
        for (var i=0; i<aFields.length; i++) {
            aField = aFields[i].split('=');
            aParam[aField[0]] = aField[1];
        }
    }

    aParam.page = aParam.page ? aParam.page : 1;
    return sKey ? aParam[sKey] : aParam;
};

$(function(){
    // tab
    $.eTab = function(ul){
        $(ul).find('a').on('click', function(){
            var _li = $(this).parent('li').addClass('selected').siblings().removeClass('selected'),
                _target = $(this).attr('href'),
                _siblings = '.' + $(_target).attr('class');
            $(_target).show().siblings(_siblings).hide();
            return false
        });
    }
    if ( window.call_eTab ) {
        call_eTab();
    };
});
function setRate(_this,_custom_price,_selling_price,_discounted_price){
	//console.log(_custom_price,_selling_price,_discounted_price)
	var $this=_this;
	var custom_price=_custom_price;
	if(custom_price==''||custom_price==0){
		custom_price=_selling_price;    //소비자가를 출력하지 않는경우 소비자가에 판매가를 넣어줌
	}
	var selling_price=_selling_price;
	var discounted_price=_discounted_price;
	if(selling_price){
		var rate=100-Math.round(selling_price/custom_price*100);            
	}
	if(discounted_price){
		var rate=100-Math.round(discounted_price/custom_price*100);
	}
	if(rate>0){
		$this.find('.RNW_per').addClass('on').find('.per').html(rate+'<i>%</i>');
	}
}
    
function checkDiscount(){
	setTimeout(function(){
		$('.RNW_rate').each(function(){
			var $this=$(this);
			var data_arr=$this.attr('data-price').split('^');
			var custom_price=data_arr[0].replace(/,/gi,'');
			var selling_price=data_arr[1].replace(/,/gi,'');
			var discounted_price=$this.find('.priceWrap.sale').text().split('(')[0].replace(/,/gi,'').replace('원','');
			setRate($this,custom_price,selling_price,discounted_price);       
		});
	}, 1500);
}

// 할인율  DB_prd_rate.js
$(document).ready(function(){    
    //상품페이지
    $('.RNW_rate').each(function(){
        var $this=$(this);
        var data_arr=$this.attr('data-price').split('^');
        var custom_price=data_arr[0].replace(/,/gi,'');
        var selling_price=data_arr[1].replace(/,/gi,'');
        var discounted_price=$this.find('.priceWrap.sale').text().split('(')[0].replace(/,/gi,'').replace('원','');
        setRate($this,custom_price,selling_price,discounted_price);       
    });    
    

    //커서 스크롤 이동  
	$("#gotobtm").click(function(){
		$("html, body").animate({scrollTop: $(document).height() }, 600);
	});
	$("#gototop").click(function(){
		$("html, body").animate({scrollTop: 0 }, 600);
	});
    
	 
});




(function($){
    $.fn.extend({
        center: function() {
            this.each(function() {
                var
                    $this = $(this),
                    $w = $(window);
                $this.css({
                    position: "absolute",
                    top: ~~(($w.height() - $this.outerHeight()) / 2) + $w.scrollTop() + "px",
                    left: ~~(($w.width() - $this.outerWidth()) / 2) + $w.scrollLeft() + "px"
                });
            });
            return this;
        }
    });
    $(function() {
        var $container = function(){/*
    <div id="modalContainer">
        <iframe id="modalContent" scroll="0" scrolling="no" frameBorder="0"></iframe>
    </div>');
    */}.toString().slice(14,-3);
        $('body')
        .append($('<div id="modalBackpanel"></div>'))
        .append($($container));
        function closeModal () {
            $('#modalContainer').hide();
            $('#modalBackpanel').hide();
        }
        $('#modalBackpanel').on('click',closeModal);
        zoom = function ($piProductNo, $piCategoryNo, $piDisplayGroup) {
            var $url = '/product/image_zoom.html?product_no=' + $piProductNo + '&cate_no=' + $piCategoryNo + '&display_group=' + $piDisplayGroup;
            $('#modalContent').attr('src', $url);
            $('#modalContent').on("load",function(){
                $(".header .close",this.contentWindow.document.body).on("click", closeModal);
            });
            $('#modalBackpanel').css({width:$("body").width(),height:$("body").height(),opacity:.4}).show();
            $('#modalContainer').center().show();
        }
    });
})(jQuery);
$(function(){
    if (typeof(EC_SHOP_MULTISHOP_SHIPPING) != "undefined") {
        var sShippingCountryCode4Cookie = 'shippingCountryCode';
        var bShippingCountryProc = false;

        // 배송국가 선택 설정이 사용안함이면 숨김
        if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingCountrySelection === false) {
            $('.xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist').hide();
            $('.xans-layout-multishoplist .xans-layout-multishoplistmultioption .xans-layout-multishoplistmultioptioncountry').hide();
        } else {
            $('.thumb .xans-layout-multishoplistitem').hide();
            var aShippingCountryCode = document.cookie.match('(^|;) ?'+sShippingCountryCode4Cookie+'=([^;]*)(;|$)');
            if (typeof(aShippingCountryCode) != 'undefined' && aShippingCountryCode != null && aShippingCountryCode.length > 2) {
                var sShippingCountryValue = aShippingCountryCode[2];
            }

            // query string으로 넘어 온 배송국가 값이 있다면, 그 값을 적용함
            var aHrefCountryValue = decodeURIComponent(location.href).split("/?country=");

            if (aHrefCountryValue.length == 2) {
                var sShippingCountryValue = aHrefCountryValue[1];
            }

            // 메인 페이지에서 국가선택을 안한 경우, 그 외의 페이지에서 셋팅된 값이 안 나오는 현상 처리
            if (location.href.split("/").length != 4 && $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val()) {
                $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a .ship span").text(" : "+$(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist option:selected").text().split("SHIPPING TO : ").join(""));

                if ($("#f_country").length > 0 && location.href.indexOf("orderform.html") > -1) {
                    $("#f_country").val($(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val());
                }
            }
            if (typeof(sShippingCountryValue) != "undefined" && sShippingCountryValue != "" && sShippingCountryValue != null) {
                sShippingCountryValue = sShippingCountryValue.split("#")[0];
                var bShippingCountryProc = true;

                $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val(sShippingCountryValue);
                $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a .ship span").text(" : "+$(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist option:selected").text().split("SHIPPING TO : ").join(""));
                var expires = new Date();
                expires.setTime(expires.getTime() + (30 * 24 * 60 * 60 * 1000)); // 30일간 쿠키 유지
                document.cookie = sShippingCountryCode4Cookie+'=' + $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val() +';path=/'+ ';expires=' + expires.toUTCString();
                if ($("#f_country").length > 0 && location.href.indexOf("orderform.html") > -1) {
                    $("#f_country").val(sShippingCountryValue).change();
                }
            }
        }
        // 언어선택 설정이 사용안함이면 숨김
        if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingLanguageSelection === false) {
            $('.xans-layout-multishopshipping .xans-layout-multishopshippinglanguagelist').hide();
            $('.xans-layout-multishoplist .xans-layout-multishoplistmultioption .xans-layout-multishoplistmultioptionlanguage').hide();
        } else {
            $('.thumb .xans-layout-multishoplistitem').hide();
        }

        // 배송국가 및 언어 설정이 둘 다 사용안함이면 숨김
        if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShipping === false) {
            $(".xans-layout-multishopshipping").hide();
            $('.xans-layout-multishoplist .xans-layout-multishoplistmultioption').hide();
        } else if (bShippingCountryProc === false && location.href.split("/").length == 4) { // 배송국가 값을 처리한 적이 없고, 메인화면일 때만 선택 레이어를 띄움
            var sShippingCountryValue = $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val();
            $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val(sShippingCountryValue);
            $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a .ship span").text(" : "+$(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist option:selected").text().split("SHIPPING TO : ").join(""));
            // 배송국가 선택을 사용해야 레이어를 보이게 함
            if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingCountrySelection === true) {
                $(".xans-layout-multishopshipping").show();
            }
        }

        $(".xans-layout-multishopshipping .close").on("click", function() {
            $(".xans-layout-multishopshipping").hide();
        });

        $(".xans-layout-multishopshipping .ec-base-button a").on("click", function() {
            var expires = new Date();
            expires.setTime(expires.getTime() + (30 * 24 * 60 * 60 * 1000)); // 30일간 쿠키 유지
            document.cookie = sShippingCountryCode4Cookie+'=' + $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val() +';path=/'+ ';expires=' + expires.toUTCString();

            // 도메인 문제로 쿠키로 배송국가 설정이 안 되는 경우를 위해 query string으로 배송국가 값을 넘김
            var sQuerySting = (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingCountrySelection === false) ? "" : "/?country="+encodeURIComponent($(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val());

            location.href = '//'+$(".xans-layout-multishopshipping .xans-layout-multishopshippinglanguagelist").val()+sQuerySting;
        });
        $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a").on("click", function() {
            $(".xans-layout-multishopshipping").show();
        });
    }
});
$(document).ready(function(){
    
    var myElement = document.querySelector(".move");
	var headroom = new Headroom(myElement, {
	  "offset": 0,
	  "tolerance": 5,
	  "classes": {
		//"initial": "headroom",
		"pinned": "slideDown",
		"unpinned": "slideUp"
	  }
	});
	headroom.init(); 
    
    setInterval(function(){
        $('.joinAnimation').stop(true,true).animate({'right' : -90}).animate({'right':-95});	
    },700);
    
    //전체메뉴보기
	$(".menuAllBtn").click(function(){
        $(this).toggleClass("open");
        $(".allMenu").fadeToggle();
    });


	var topBannerNum = $('.topBanner .swiper-slide').length ;

	$(".topBanner").each(function () {
		var topBannerId = $(this).attr("id");
		if (topBannerNum > 0){		
			if (getCookie(topBannerId) != "topDone") {
				$("#" + topBannerId).show();
				$('#container').css('padding-top','200px');
				topBannerTime();
			}	
		} else {
			$(".topBanner").hide();
		}
	});

	$("#topBanner .top_btn").click(function(e) {
		var topBannerId = $(this).parents("#topBanner").attr("id");
		setCookie(topBannerId, "topDone", 1 );
		$(this).parents("#topBanner").hide();		
		$('#container').css('padding-top','141px');
	});	


	$('.topBanner .swiper-slide').each(function(){
		var checkShow = $(this).attr('data-check');
		var popupStartDt = moment($(this).attr('data-start')); // 시작일
		var popupEndDt = moment($(this).attr('data-end')); ///종료일
		var nowTime = moment();
		
		if(checkShow == 'Y'){
			if(nowTime > popupStartDt && nowTime < popupEndDt){ 

			}else{
				$(this).remove();
				if($('#topBanner').find('swiper-slide').length == 0){
					$('#topBanner').remove();
					$('#container').css('padding-top','141px');
				}
			}
		}
	});

	
	if (topBannerNum > 1){		
		var topBanner = new Swiper(".topBanner .swiper-container", {
			loop:true,
			direction: "vertical",
			speed:1000,
			autoplay: {
				delay: 5000,
				disableOnInteraction: false,
			},
			height:59,
		});
	} 

    //상단 서치 아이콘
	$(".top_Search").click(function(){
        $(this).toggleClass("on");
        $(".xans-layout-searchheader").fadeToggle();
    });
    
	

});


function setCookie(name, value, expiredays) {
	var today = new Date();
	today.setDate(today.getDate() + expiredays);

	document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + ';'
}

function getCookie(name) {
	var cName = name + "=";
	var x = 0;
	while (x <= document.cookie.length)
	{
		var y = (x + cName.length);
		if (document.cookie.substring(x, y) == cName)
		{
			if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
				endOfCookie = document.cookie.length;
			return unescape(document.cookie.substring(y, endOfCookie));
		}
		x = document.cookie.indexOf(" ", x) + 1;
		if (x == 0)
			break;
	}
	return "";
}




function topBannerTime(){
	var checkShow = $('#topBanner').attr('data-check')
	var popupStartDt = moment($('#topBanner').attr('data-start')); // 시작일
	var popupEndDt = moment($('#topBanner').attr('data-end')); ///종료일
	var nowTime = moment();

	if(checkShow == 'Y'){		
		if(nowTime > popupStartDt && nowTime < popupEndDt){      
			$('#topBanner').show();
		}else{
			$('#topBanner').hide();
		}
	}
}


/* cate_no board_no 표시 관련 */
function getParameterByName(url,name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(url);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
};


function getParameterByName2(url,name){
	var bg_url = url.split('/');
	if(bg_url[1] == 'board' && name == 'board_no' && parseInt(bg_url[3])){
		return bg_url[3];
	}else if(bg_url[1] == 'article' && name == 'board_no' && parseInt(bg_url[3])){
		return bg_url[3];
	}else if(bg_url[1] == 'category' && name == 'cate_no' && parseInt(bg_url[3])){
		return bg_url[3];
	}else if(bg_url[1] == 'product' && name == 'cate_no' && parseInt(bg_url[3])){
		return bg_url[3];
	}else {
		return "";
	}
}

var sUrl = document.location.pathname+document.location.search;

$(document).ready(function(){
    var $d1_wrap = $('.d1_wrap');
    var $d1_list = $d1_wrap.find('.d1');
    var len = $d1_list.length;
	var curUrl = document.location.pathname+document.location.search;

	var currIndex = getParameterByName(curUrl,'cate_no') || getParameterByName2(curUrl,'cate_no');	

    $.ajax({
        url : '/exec/front/Product/SubCategory',
        dataType: 'json',
        success: function(aData) {
            if (aData == null || aData == 'undefined') {
                return;
            }
            $.each(aData, function(index, key) {
                var $d1 = $d1_wrap.find('.d1[data-param$="=' + key.parent_cate_no + '"]');

                if ($d1.length > 0) {
                    var _index = $d1_list.index($d1);

                    if ($d1.hasClass('hsn') === false) {
                        $d1.addClass('hsn');

						if (key.parent_cate_no == currIndex)
						{
	                        $d1.append('<div   class="d2_wrap on"><dl></dl></div>' );
						} 
						else
						{
	                        $d1.append('<div   class="d2_wrap"><dl></dl></div>' );
						}
                    }

                    $d1.find('.d2_wrap dl').append('<dd data-parent-param="'+ key.parent_cate_no +'" data-cate_no="'+key.cate_no+'"  data-param="'+key.param+'" class="d2"><a href="/product/list.html'+key.param+'">'+key.name+'</a></dd>');
	                    return;
                }

                var $d2 = $d1_wrap.find('.d2[data-param$="=' + key.parent_cate_no + '"]');
                if ($d2.length > 0) {
                    if ($d2.hasClass('hsn') === false) {
                        $d2.addClass('hsn');
                        $d2.append('<dl class="d3_wrap"></dl>');
                    }
                    $d2.find('.d3_wrap').append('<dd data-param="'+key.param+'" class="d3"><a href="/product/list.html'+key.param+'">'+key.name+'</a></dd>');
                    return;
                }

                var $d3 = $d1_wrap.find('.d3[data-param$="=' + key.parent_cate_no + '"]');
                if ($d3.hasClass('hsn') === false) {
                    $d3.addClass('hsn');
                    $d3.append('<dl class="d4_wrap"></dl>');
                }
                $d3.find('.d4_wrap').append('<dd data-param="'+key.param+'" class="d4"><a href="/product/list.html'+key.param+'">'+key.name+'</a></dd>');
            });

            category_cotrol();
        }
    });


	$('.nav a').each(function( index ) {
		pIndex = getParameterByName(location.search,'cate_no') || getParameterByName2(sUrl,'cate_no');
		mypIndex = getParameterByName( $(this).attr('href') ,'cate_no') || getParameterByName2($(this).attr('href'),'cate_no');
		if( pIndex == mypIndex ){
			$(this).addClass('active');
		};
	});

});


function category_cotrol(){

	(function(){
		var $this=$('#side_nav');
		var $d1=$this.find('.d1');
		var $d2=$this.find('.d2');
        var $d3=$this.find('.d3');


		$('.d2_wrap dd').each(function( index ) {
			uindex = getParameterByName(sUrl,'cate_no') || getParameterByName2(sUrl,'cate_no');	
			ctindex =  $(this).attr('data-cate_no');
			if( uindex == ctindex ){
				$(this).parent().parent().addClass('on');
				$(this).children("a").addClass('active');
			};
		});
	})();
    
}

//gnb 메뉴가림
$('#header .nav li a').each(function() {
    var a_index = $(this).html();   
    if( a_index == 'SlgTho 슬토' || a_index == '통통사이즈' || a_index == '66운동복' || a_index == '파자마' || a_index == 'SET ITEM' || a_index == '바캉스룩' || a_index == '육육베이직' || a_index == '씨씨룩' || a_index == '몬스터진' || a_index == '레이디라벨' || a_index == 'BOY&GIRL' ){
        $(this).parent().addClass('displaynone');
    };
});

