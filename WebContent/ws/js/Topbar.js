/*전역 변수 설정*/
var userPoint;
var userCoin;
var userGold;
var userAp;
$(document).ready(function(){
	$.ajaxSetup({cache:false});
	$.ajax({
		url:'./jsp/getUserInfo.jsp',
		data:"u_no="+window.localStorage['user_account']+"&ajax_call=Y&serial="+Math.floor(Math.random() * 100000000) + 1,
		headers:{ 'cache-control': "no-cache" },
		cache: false,
		type:'post',
		dataType:'json',
		success:function(data){			
			userPoint = data.user_point;
			userCoin = data.user_coin;
			userGold = data.user_gold;
			userAp = data.cur_ap;
			//Level Setting
			var user_level = new String(data.user_level);
			var levelArr=new Array;
			for(var i=0;i<user_level.length;i++){
				levelArr[i] = user_level.substr(i,1);
			}
			if(user_level.length == 1) {
				$("#user_level1").attr("src", "./images/Main/UI_Main_Number_0.png");
				$("#user_level2").attr("src", "./images/Main/UI_Main_Number_0.png");
				$("#user_level3").attr("src", "./images/Main/UI_Main_Number_"+levelArr[0]+".png");
			}
			if(user_level.length == 2) {
				$("#user_level1").attr("src", "./images/Main/UI_Main_Number_0.png");
				$("#user_level2").attr("src", "./images/Main/UI_Main_Number_"+levelArr[0]+".png");
				$("#user_level3").attr("src", "./images/Main/UI_Main_Number_"+levelArr[1]+".png");
			}
			if(user_level.length == 3) {
				$("#user_level1").attr("src", "./images/Main/UI_Main_Number_"+levelArr[0]+".png");
				$("#user_level2").attr("src", "./images/Main/UI_Main_Number_"+levelArr[1]+".png");
				$("#user_level3").attr("src", "./images/Main/UI_Main_Number_"+levelArr[2]+".png");
			}
			
			//Exp Setting
			exp_bar_length = Math.round(100*(data.user_exp/data.exp));
			for(var i in $("#user_exp")){
				$("#user_exp")[i].innerText='EXP '+data.user_exp+'/'+data.exp;
			}
			for(var i in $("[name=exp_bar]")){
				$("[name=exp_bar]")[i].width=exp_bar_length;
			}
			
			//AP
			for(var i in $("#cur_ap")){
				$("#cur_ap")[i].innerText=data.cur_ap+'/'+data.max_ap;
			}
			//WP
			for(var i in $("#cur_wp")){
				$("#cur_wp")[i].innerText=data.cur_wp+'/'+data.max_wp;
			}
			//battle_WP
			for(var i in $("#b_cur_wp")){
				$("#b_cur_wp")[i].innerText=data.cur_wp+'/'+data.max_wp;
			}
			
			if($("#user_wp").length > 0){
				$("#user_wp").val(data.cur_wp);
			}
			
			if($("#max_wp").length > 0){
				$("#max_wp").val(data.max_wp);
			}
			
			if($("#tut_nick").length > 0){
				$("#tut_nick").text(data.user_nickname);
			}
			//Main Page user_info Setting
			if($("#user_rank").length > 0){
				$("#main_img").attr("src", "./images/Main/cha_0"+data.user_img+".jpg");
				$("#user_nick").text(data.user_nickname);
				$("#user_rank").text(data.user_rank);
				$("#user_gold").text(data.user_gold);
				$("#user_coin").text(data.user_coin);
				$("#user_point").text(data.user_point);
			}
			//Draw Page Setting
			if($("#pointWrap").length > 0){
				$("#pointWrap").text("(소지가챠P : "+userPoint+"P)");
				$("#UserPoint").val(userPoint);
			}
			if($("#coinWrap").length > 0){
				$("#coinWrap").text("$ 소지코인: "+userCoin+"C $");
				$("#UserCoin").val(userCoin);
			}
			if($("#coinLack").length > 0){
				if(userCoin < 300){
					$("#coinLack").text("코인이 부족합니다!!");
				}else{
					$("#coinLack").text("");
				}
				if($("#goldWrap").length > 0){
					$("#goldWrap").text("$ 소지골드: "+userGold+"G $");
					$("#UserGold").val(data.user_gold);
				}
				if(userGold < 10000) {
					$("#goldLack").text("골드가 부족합니다!!");
				}else{
					$("#goldLack").text("");
				}
			}
			if($("#Usergold").length > 0){
				$("#Usergold").text(userGold);
			}
			if($("#gold_area").length > 0){
				$("#gold_area").text(data.user_gold);
			}
			if($("#coin_area").length > 0){
				$("#coin_area").text(data.user_coin);
			}
			if($("#point_area").length > 0){
				$("#point_area").text(data.user_point);
			}
			
			if($("#MergeUserGold").length > 0){
				$("#MergeUserGold").text("소지골드 : " +userGold+"G");
				$("#Usergold").val(userGold);
			}
			if($(".max_exp_area").length > 0){
				$(".max_exp_area").each(function(row){
					$(this).text(data.exp);
				});
				$(".max_exp_area").text(data.exp);
			}
			
		},
		error:function(){
			
		}
	});
	
	$("#search_val").focusin(function(){
		if($("#search_val").val() == "닉네임을 입력하세요."){
			$("#search_val").val("");
		}
	});
	
	$("#search_val").focusout(function(){
		if($("#search_val").val() == ""){
			$("#search_val").val("닉네임을 입력하세요.");
		}
	});
	/*resuzeContent();*/
});

		 
/*$("div[data-role='page']").live( "pageshow", function( event ){   
	resizeContent();
});

$(window).resize(function(){
	resizeContent();
});

function resizeContent(){
	var header_obj = $("div[data-role='header']"); // get object header
	var footer_obj = $("div[data-role='footer']"); // get object footer
	var browserHeight = document.documentElement.clientHeight; // get browser height
	
	//get header height
	var headerHeight = parseInt(header_obj.height()) + parseInt(header_obj.css("padding-bottom")) + parseInt(header_obj.css("padding-top")) + parseInt(header_obj.css("border-top-width")) + parseInt(header_obj.css("border-bottom-width"));
	
	//get footer height
	var footerHeight = parseInt(footer_obj.height()) + parseInt(footer_obj.css("padding-bottom")) + parseInt(footer_obj.css("padding-top")) + parseInt(footer_obj.css("border-bottom-width")) + parseInt(footer_obj.css("border-top-width"));
	
	//calculate content height
	var contentHeight = browserHeight - headerHeight - footerHeight;
	
	//set content size as browser's height minus fixed header and footer height.
	$("div[data-role='content']").css("height", contentHeight);
	$("#content").css("height", contentHeight);
}*/


/*function resizeContent(){
	var headerHeight = parseInt( $("div[data-role='header']").css( "height" ) );
	var footerHeight = parseInt( $("div[data-role='footer']").css( "height" ) );
	var contentHeight = screen.availHeight - headerHeight - footerHeight - 78; // 78 : iPhone bottom bar height (retina)
	$("div[data-role='content']").css( "height", contentHeight );
}*/
var MainUserData = function(){
	$("#user_rank").text(User_Detail.user_rank);
	$("#user_gold").text(User_Detail.user_gold);
	$("#user_coin").text(User_Detail.user_coin);
	$("#user_point").text(User_Detail.user_point);
};