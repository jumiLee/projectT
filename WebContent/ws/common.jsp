<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Enumeration param = request.getParameterNames();
String strParam = ""; 
while(param.hasMoreElements()) { 
    String name = (String)param.nextElement(); 
    String value = request.getParameter(name); 
    strParam += name + "=" + value + "&"; 
}

String ImgUrl = request.getContextPath()+"/test";
String ua = request.getHeader("User-Agent").toLowerCase();
System.out.println("ua:" + ua);
%>	
	<title>몬스터왕국</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user_scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta http-equiv='cache-control' content='no-cache'>
	<meta http-equiv='expires' content='0'>
	<meta http-equiv='pragma' content='no-cache'>
	 
	<link rel="stylesheet" href="http://code.jquery.com/mobile/latest/jquery.mobile.css">
	<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/latest/jquery.mobile.js"></script>
	
	<link rel="stylesheet" href="./css/jquery.mobile.fixedToolbar.polyfill.css">
	<link rel="stylesheet" href="./css/main.css" />
	
	
	
	<script src="./js/jquery.mobile.fixedToolbar.polyfill.js"></script>
	<script src="./js/iscroll4.js"></script>
	<script src="./js/GlobalMove.js"></script>
	
	<%if(ua.contains("iphone")||ua.contains("ipad")||ua.contains("ipod")){%>
	<script src="./js/cordova.ios.js"></script>
	<script src="./js/applicationPreferences.js"></script>
	<%}else{%>
	<script src="./js/cordova-1.6.1.js"></script>
	<%}%>
	
	<script type="text/javascript" src="./js/inappbilling.js"></script>
	<script type="text/javascript" src="./js/InAppPurchaseManager.js"></script>
	<script src="./js/Topbar.js"></script>
	<script src="http://cdn.pubnub.com/pubnub-3.4.min.js"></script>
	<script type="text/javascript">
	var ErrMsg = "네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.";
	var filter = "win16|win32|win64|mac";
	/* Iscroll 설정 */
	var myScroll, height;
 	function loaded(){
		myScroll = new iScroll('iscroll', {
			useTransform: false,
			bounce: false,
			onBeforeScrollStart: function(e) {
				var target = e.target;
				while (target.nodeType != 1) target = target.parentNode;
				if(target.tagName != 'SELECT' && target.tagName != 'INPUT' && target.tagName != 'TEXTAREA' && target.tagId != 'Stage')
					e.preventDefault();
			},
			onRefresh: function(){
				//키패드 활성화시 onRefresh 이벤트가 발생하며, wrapper의 높이를 재설정하면 됩니다.
				//iscroll.style.height = window.innerHeight-100+"px";
			}
		});
	}
	
	document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
		
	//document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 2000); }, false);
	window.addEventListener('load', function () { setTimeout(loaded, 200); }, false);
	
	if (navigator.userAgent.indexOf('iPhone') != -1) {
		window.addEventListener("load", function () {
            setTimeout(function () { scrollTo(0, 1); height = window.innerHeight; }, 0)
        }, false);
        window.addEventListener("scroll", onScroll);
    }
	
	function onScroll() {
        if (height != window.innerHeight) { // User restored the URL bar
        	document.getElementsByTagName("footer")[0].style.bottom = "0";
            document.getElementById("iscroll").style.bottom = "60px";
            myScroll.refresh();
            window.removeEventListener("scroll", onScroll);
        }
    }
	
	function IsMobile(){
		if( navigator.platform  ){
		    if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
				return true;
		    }else{
		    	return false;
		    }
		}
	}

	function PopUp_System_Msg(msg){
		if( navigator.platform  ){
		    if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
		    	navigator.notification.alert(msg,0,"Mondeath","확인");
		    }else{
		    	alert(msg);
		    }
		}
	}

	function Confirm_Proc(msg, callBack){
		if( navigator.platform  ){
		    if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
		    	navigator.notification.confirm(msg, callBack, "Mondeath", "아니요,예");
		    }else{
		    	if(confirm(msg)){
		    		return true;
		    	}else{
		    		return false;
		    	}
		    }
		}
	}
	
	
	var mobile_yn = IsMobile();
	
	
	/* confirm 확인/취소 => 예/아니오 변경 (Only for IE) */
	/* function confirm(str){
		for(; str.indexOf("\n")!=-1;){
			str = str.replace("\n","");
		}
		
		execScript('n = msgbox("'+str+'", "4132")', "vbscript");
		return(n == 6);
	} */
	
        /* var myScroll, height;
        window.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
        window.addEventListener('DOMContentLoaded', setTimeout(function () { loaded(); }, 200), false);
        if (navigator.userAgent.indexOf('iPhone') != -1) {
            window.addEventListener("load", function () {
                setTimeout(function () { scrollTo(0, 1); height = window.innerHeight; }, 0)
            }, false);
            window.addEventListener("scroll", onScroll);
        }
        function loaded() {
            myScroll = new iScroll('iscroll', {
            	
            });
            
        }
        function onScroll() {
            if (height != window.innerHeight) { // User restored the URL bar
                document.getElementsByTagName("footer")[0].style.bottom = "0";
                document.getElementById("iscroll").style.bottom = "30px";
                myScroll.refresh();
                window.removeEventListener("scroll", onScroll);
            }
        } */
        
        /* 다이얼로그 닫기 */
        var dgclose = function(){
        	$('.ui-dialog').dialog('close');
        };
        
        /* Device 세팅 관련 */
        function onLoad() {
        	//alert("aa");
            document.addEventListener("deviceready", onDeviceReady, false);
        }

        function onDeviceReady() {

            document.addEventListener("backbutton", onBackKeyDown, false);
            
            if( navigator.platform  ){
        	    if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
        			var isios=(/(ipod|iphone|ipad)/i).test(navigator.userAgent);
        			if(isios){
        				/* navigator.notification.alert("ios InAppPurchaseManager Start",0,"Mondeath","확인");
        	            window.plugins.inAppPurchaseManager.requestProductData("prod_01", function(productId, title, description, price) {
        	                                                                   console.log("productId: " + productId + " title: " + title + " description: " + description + " price: " + price);
        	                                                                   window.plugins.inAppPurchaseManager.makePurchase(productId, 1);
        	                                                                   }, function(id) {
        	                                                                   console.log("Invalid product id: " + id);
        	                                                                   }
        	                                                                   );
        	            
        	            navigator.notification.alert("ios InAppPurchaseManager End",0,"Mondeath","확인"); */
        	            
        	            
        	         // unlock product                       
        	    	/* 	window.plugins.inAppPurchaseManager.onPurchased = function(transactionIdentifier, productId, transactionReceipt) {
        	    		console.log('purchased: ' + productId);
        	    		
        	    			window.plugins.applicationPreferences.set(productId, true, function() {
        	    														unlockProduct(productId);
        	    													  });
        	    		}; */


        	    		// restore products	
        	    		/* window.plugins.inAppPurchaseManager.onRestored = function(transactionIdentifier, productId, originalTransactionReceipt) {
        	    			window.plugins.applicationPreferences.set(productId, true, function() {
        	    													  unlockProduct(productId);
        	                                                            //  $('#popupPadded h2').removeClass('loader');
        	    														  $('.restore-purchases-btn').hide();
        	    														  $('.restore-purchases-btn-complete').fadeIn();
        	                                                          
        	                                                                $('.purchase-message').hide();
        	                                                                $('.purchase-message-complete').show();
        	                                                          
        	    													  });
        	    			console.log('restored: ' + productId);
        	    		}; */

        	    		// onFailed	
        	    		/* window.plugins.inAppPurchaseManager.onFailed = function(errno, errtext) {
        	    			console.log('failed: ' + errtext);
        	                              
        	    		}; */
        	            
        	            
        				// Product prod_01                      
        			    window.plugins.inAppPurchaseManager.requestProductData("prod_01", function(productId, title, description, price) {
        			                                                           console.log("productId: " + productId + " title: " + title + " description: " + description + " price: " + price);
        			         // verify product has already been purchases and unlock                                                   
        			         var productIds1 = ["prod_01"];

        			         for (var i = 0; i < productIds1.length; i++) {
        			         var productId = productIds1[i];
        			         window.plugins.applicationPreferences.get(productId, function(result) {
        			                                                   if (result) {
        			                                                   unlockProduct(productId);
        			                                                   console.log("restart unlocked: " + productId);
        			                                                     }
        			                                                   });
        			                 }
        			            }, 

        			         function(id) {
        			         console.log("Invalid product id: " + id);
        			    });
        			}
        	    }
        	}
        }
        
        function onBackKeyDown() {
        	
            navigator.notification.confirm('게임을 종료하시겠습니까?', onBackKeyDownMsg, '게임 종료', '취소, 종료');

        }

        function onBackKeyDownMsg(button) {

            if(button == 2) {

                navigator.app.exitApp();

            }

        }
        
        /* $("[data-role=page]").live("pageshow",function(event) { 
        	$.mobile.showPageLoadingMsg();
        }); */
        
     // jQuery.PUBNUB.subscribe( args, callback )
        jQuery.PUBNUB.subscribe({
            channel : 'my_channel'
        }, function(message) {
            // Show Message
            console.log(message);
        } );
        
        
     // jQuery.PUBNUB.publish( args, callback )
        jQuery.PUBNUB.publish( {
            channel : 'my_channel',
            message : { 'my_var' : 'some text data' }
        });
     
     function goBack(RtnUrl){
    	$.mobile.showPageLoadingMsg('c','loading...');
    	location.href = RtnUrl;
     };
     
     function successHandler (result){ 
//         alert("SUCCESS: \r\n"+result );
      };
      
      function successHandler2(result){ 
//        alert("SUCCESS: \r\n"+result );
		if(result != "In app billing supported"){
			$.ajax({
				url:"./jsp/MgmtCash.jsp?u_no="+window.localStorage['user_account'],
				cache: false,
				data:"prod_id="+result,
					type:'post',
				dataType:'json',
				success:function(data){
					PopUp_System_Msg('충전 되었습니다.');
					location.reload();
				},
				error:function(){
					PopUp_System_Msg(ErrMsg);
				}
			});
		}
     }; 

      function errorHandler (error){ 
//         alert("ERROR: \r\n"+error ); 
      }; 

      /* In-app Billing */
      // Click on init button
      function init(){
          // Initialize the billing plugin
//          alert("빌링 시작");
          inappbilling.init(successHandler, errorHandler); 
      };

      // Click on purchase button
      function purchase(prod_id){
          // make the purchase
          alert("아이템 구매를 시작합니다.");
          inappbilling.init(successHandler, errorHandler);
          
          if(prod_id == 1){        	  
        	  inappbilling.purchase(successHandler2, errorHandler, 'prod_01');
          }
          if(prod_id == 2){
        	  inappbilling.purchase(successHandler2, errorHandler, 'prod_02');
          }
          if(prod_id == 3){
        	  inappbilling.purchase(successHandler2, errorHandler, 'prod_03');
          }
          if(prod_id == 4){
        	  inappbilling.purchase(successHandler2, errorHandler, 'prod_04');
          }
          if(prod_id == 5){
        	  inappbilling.purchase(successHandler2, errorHandler, 'prod_05');
          }
          
//          inappbilling.purchase(successHandler2, errorHandler, 'android.test.purchased'); 

      };

      // Click on ownedProducts button
      function ownedProducts(){
          // Initialize the billing plugin
          inappbilling.getOwnItems(successHandler, errorHandler); 

      };

      
	</script>