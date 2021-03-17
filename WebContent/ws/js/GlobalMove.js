
var goUserfirstPage = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "./jsp/getUserFirstPage.jsp?u_no="+window.localStorage['user_account']+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goHome = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "main.jsp?u_no="+window.localStorage['user_account']+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
//	window.open( "main.jsp?page_id="+Math.floor(Math.random() * 100000000) + 1,"_self");
};
var goBattle = function(no){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Battle_Treasure_1.jsp?list="+no+"&u_no="+window.localStorage['user_account'];
};
var goGeneralBattle = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Battle_General_1.jsp?u_no="+window.localStorage['user_account']+"&job_code=1&tre_id=0&tre_sub_id=0&bat_rs=0";
};
var goPrevBattle = function(bat_rs){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Battle_Prev_1.jsp?u_no="+window.localStorage['user_account']+"&job_code=3&tre_id=0&tre_sub_id=0&bat_rs="+bat_rs;
};
var goPrevBattle_Treasure = function(user_account, user_nick, bat_mon_id, bat_mon_sn){
	$.mobile.showPageLoadingMsg('c','loading...');
	var RtnUrl = $("#curr_url").val();
	location.href = "Battle_Prev_Treasure.jsp?u_no="+window.localStorage['user_account']+"&user_account="+user_account+"&user_nick="+user_nick+"&RtnUrl="+RtnUrl+"&bat_mon_id="+bat_mon_id+"&bat_mon_sn="+bat_mon_sn;
};
var goBattleRs = function(job, bat_user_acc, bat_mon_id, bat_mon_sn, tre_id, tre_sub_id){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Battle_Result.jsp?u_no="+window.localStorage['user_account']+"&job_code="+job+"&bat_user_acc="+bat_user_acc+"&bat_mon_id="+bat_mon_id+"&bat_mon_sn="+bat_mon_sn+"&tre_id="+tre_id+"&tre_sub_id="+tre_sub_id+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goAllies = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Allies_Main.jsp?u_no="+window.localStorage['user_account']+"&status_cd=1";
};
var goAllies_Pending = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Allies_Main_Pending.jsp?u_no="+window.localStorage['user_account']+"&status_cd=2&type=2";
};
var goAllies_Appli = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Allies_Main_Appli.jsp?u_no="+window.localStorage['user_account']+"&status_cd=2&type=1";
};
var goAllies_Rank = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Allies_Rank.jsp?u_no="+window.localStorage['user_account']+"&job=2&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goShop = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Shop_Coin.jsp?u_no="+window.localStorage['user_account'];
};
var goShop_Gold = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Shop_Gold.jsp?u_no="+window.localStorage['user_account'];
};
var goShop_MyItem = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Shop_MyItem.jsp?u_no="+window.localStorage['user_account'];
};
var goMission = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Mission_Main.jsp?u_no="+window.localStorage['user_account'];
};
var goMission2 = function(mis_id, userlv, open_flag){
	var filter = "win16|win32|win64|mac";
	if(open_flag == 2){
		if( navigator.platform  ){
		    if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
		    	var isios=(/(ipod|iphone|ipad)/i).test(navigator.userAgent);
				if(isios){
					navigator.notification.alert("미션이 활성화 되지 않았습니다.\r이전 미션을 모두 완료 하셔야 활성화 됩니다.",0,"Mondeath","확인");
//					alert("미션이 활성화 되지 않았습니다.\r이전 미션을 모두 완료 하셔야 활성화 됩니다.");
				}else{
					navigator.notification.alert("미션이 활성화 되지 않았습니다.\r이전 미션을 모두 완료 하셔야 활성화 됩니다.",0,"Mondeath","확인");
				}
		    }else{
		    	alert("미션이 활성화 되지 않았습니다.\r이전 미션을 모두 완료 하셔야 활성화 됩니다.");
		    }
		}
		return;
	}else{
		$.mobile.showPageLoadingMsg('c','loading...');
		location.href = "Mission_Sub.jsp?u_no="+window.localStorage['user_account']+"&mis_id="+mis_id;
	}
};
var goMonMarket = function(type){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "MonMarket.jsp?u_no="+window.localStorage['user_account']+"&type="+type;
};
var goMonster = function(type){
	$.mobile.showPageLoadingMsg('c','loading...');
	if(type == null){
		type = 0;
	}
	location.href = "Monster.jsp?u_no="+window.localStorage['user_account']+"&type="+type+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goMonInfo = function(mon_id, user_mon_sn){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "MonsterInfo.jsp?u_no="+window.localStorage['user_account']+"&mon_id="+mon_id+"&user_mon_sn="+user_mon_sn+"&stat=1&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goMonSell_Rs = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "UserMonSell_Rs.jsp?u_no="+window.localStorage['user_account'];
};
var goGachya = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Draw.jsp?u_no="+window.localStorage['user_account']+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goTreasure = function(){
	alert("보물 페이지 준비중.");
};
var goMerge1 = function(type){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Merge1.jsp?u_no="+window.localStorage['user_account']+"&stat=1&type="+type;
};
var goMerge2 = function(id, sn){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Merge2.jsp?u_no="+window.localStorage['user_account']+"&stat=1&sel_mon_id="+id+"&sel_mon_sn="+sn;
};
var goMerge3 = function(basic_id, basic_sn, id_sn){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Merge3.jsp?u_no="+window.localStorage['user_account']+"&stat=1&mon_id="+basic_id+"&user_mon_sn="+basic_sn+"&sel_mon_arr="+id_sn;
};
var goMerge4 = function(id, sn, sel_mon){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Merge4.jsp?u_no="+window.localStorage['user_account']+"&basic_id="+id+"&basic_sn="+sn+"&sel_mon="+sel_mon;
};
var goBattle_Treasure2 = function(tre_id, type){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Battle_Treasure_2.jsp?u_no="+window.localStorage['user_account']+"&tre_id="+tre_id+"&list="+type;
};
var goBattle_Treasure3 = function(bat_user_acc, bat_mon_id, bat_mon_sn, tre_id, sub_id){
	$.mobile.showPageLoadingMsg('c','loading...');
	var RtnUrl = $("#curr_url").val();
	location.href = "Battle_Treasure_3.jsp?u_no="+window.localStorage['user_account']+"&bat_user_acc="+bat_user_acc+"&bat_mon_id="+bat_mon_id+"&bat_mon_sn="+bat_mon_sn+"&tre_id="+tre_id+"&tre_sub_id="+sub_id+"&RtnUrl="+RtnUrl;
};
var goBattle_Practical = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Battle_Practical.jsp?u_no="+window.localStorage['user_account'];
};
var goBattle_General2 = function(bat_user_acc, bat_mon_id, bat_mon_sn){
	$.mobile.showPageLoadingMsg('c','loading...');
	var RtnUrl = $("#curr_url").val();
	location.href = "Battle_General_2.jsp?u_no="+window.localStorage['user_account']+"&bat_user_acc="+bat_user_acc+"&bat_mon_id="+bat_mon_id+"&bat_mon_sn="+bat_mon_sn+"&RtnUrl="+RtnUrl;
};
var goBattle_Prev2 = function(bat_user_acc, bat_mon_id, bat_mon_sn){
	$.mobile.showPageLoadingMsg('c','loading...');
	var RtnUrl = $("#curr_url").val();
	location.href = "Battle_Prev_2.jsp?u_no="+window.localStorage['user_account']+"&bat_user_acc="+bat_user_acc+"&bat_mon_id="+bat_mon_id+"&bat_mon_sn="+bat_mon_sn+"&RtnUrl="+RtnUrl;
};
var goCoinCharge = function(){
	//ErrDialog('코인 충전 준비중 입니다.');
	//navigator.notification.alert("코인 충전 준비중 입니다.",0,"DEN_KOR","확인");
//	alert("코인 충전 준비중 입니다.");
	$.mobile.showPageLoadingMsg('c','loading...');
	var RtnUrl = $("#curr_url").val();
	location.href = "CoinCharge.jsp?u_no="+window.localStorage['user_account']+"&RtnUrl="+RtnUrl;
	/*if( navigator.platform  ){
	    if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
	    	var isios=(/(ipod|iphone|ipad)/i).test(navigator.userAgent);
			if(isios){
				if(confirm("충전 하시겠습니까?")){
					$.ajax({
						url:'./jsp/MgmtCash.jsp',
						cache: false,
						type:'post',
						dataType:'json',
						success:function(data){			
							alert("충전 되었습니다.");
							location.reload();
						},
						error:function(){
							alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.");
						}
					});
				}
			}else{
				navigator.notification.confirm("충전 하시겠습니까?", RtnConfirm, "Mondeath", "예,아니오");
				function RtnConfirm(button){
					if(button == 1){
						$.ajax({
							url:'./jsp/MgmtCash.jsp',
							cache: false,
							type:'post',
							dataType:'json',
							success:function(data){
								navigator.notification.alert("충전 되었습니다.",0,"Mondeath","확인");
								location.reload();
							},
							error:function(){
								navigator.notification.alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.",0,"Mondeath","확인");
							}
						});
					}
				};
			}
	    }else{
	    	if(confirm("충전 하시겠습니까?")){
	    		$.ajax({
	    			url:'./jsp/MgmtCash.jsp',
	    			cache: false,
	    			type:'post',
	    			dataType:'json',
	    			success:function(data){			
	    				alert("충전 되었습니다.");
	    				location.reload();
	    			},
	    			error:function(){
	    				alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.");
	    			}
	    		});
	    	}
	    }
	}*/

};
var goMail_Receive = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Message_Receive.jsp?u_no="+window.localStorage['user_account']+"&msg_sr_cd=1";
};
var goMail_Send = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Message_Send.jsp?u_no="+window.localStorage['user_account']+"&msg_sr_cd=2";
};
var goMail_Save = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Message_Save.jsp?u_no="+window.localStorage['user_account']+"&msg_sr_cd=3";
};
var goSearchfrd = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	var search_val = $("#search_val").val();
	location.href = "Allies_Main_Search.jsp?u_no="+window.localStorage['user_account']+"&search_yn=Y&search_val="+search_val;
};
var goRecofrd = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Allies_Main_Search.jsp?u_no="+window.localStorage['user_account']+"&search_yn=Y";
};
var goAllyRequest = function(account){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "AllyRequest.jsp?u_no="+window.localStorage['user_account']+"&account="+account+"&mon_yn=Y";
};
var goAppfrd = function(frd_account){
	$.mobile.showPageLoadingMsg('c','loading...');
	var filter = "win16|win32|win64|mac";
	if( navigator.platform ){
		if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
			var isios=(/(ipod|iphone|ipad)/i).test(navigator.userAgent);
			if(isios){
				$.ajax({
					url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=1&frd_account="+frd_account,
					cache: false,
					type:'post',
					dataType:'json',
					success:function(data){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert(data.msg,0,"Mondeath","확인");
//						alert(data.msg);
						goAllies_Appli();
					},
					error:function(){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.",0,"Mondeath","확인");
//						alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.");
					}
				});
			}else{
				$.ajax({
					url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=1&frd_account="+frd_account,
					cache: false,
					type:'post',
					dataType:'json',
					success:function(data){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert(data.msg,0,"Mondeath","확인");
						goAllies_Appli();
					},
					error:function(){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.",0,"Mondeath","확인");
					}
				});
			}	//end isios
		}else{
			$.ajax({
				url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=1&frd_account="+frd_account,
				cache: false,
				type:'post',
				dataType:'json',
				success:function(data){
					$.mobile.hidePageLoadingMsg();
					alert(data.msg);
					goAllies_Appli();
				},
				error:function(){
					$.mobile.hidePageLoadingMsg();
					alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.");
				}
			});
		}	//end filter.indexOf
	}	//end navigator.platform
};
var goAgreefrd = function(frd_account){
	$.mobile.showPageLoadingMsg('c','loading...');
	var filter = "win16|win32|win64|mac";
	if( navigator.platform ){
		if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
			var isios=(/(ipod|iphone|ipad)/i).test(navigator.userAgent);
			if(isios){
				$.ajax({
					url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=2&frd_account="+frd_account,
					cache: false,
					type:'post',
					dataType:'json',
					success:function(data){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert(data.msg,0,"Mondeath","확인");
//						alert(data.msg);
						goAllies_Pending();
					},
					error:function(){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.",0,"Mondeath","확인");
//						alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.");
					}
				});
			}else{
				$.ajax({
					url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=2&frd_account="+frd_account,
					cache: false,
					type:'post',
					dataType:'json',
					success:function(data){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert(data.msg,0,"Mondeath","확인");
						goAllies_Pending();
					},
					error:function(){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.",0,"Mondeath","확인");
					}
				});
			}	//end isios
		}else{
			$.ajax({
				url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=2&frd_account="+frd_account,
				cache: false,
				type:'post',
				dataType:'json',
				success:function(data){
					$.mobile.hidePageLoadingMsg();
					alert(data.msg);
					goAllies_Pending();
				},
				error:function(){
					$.mobile.hidePageLoadingMsg();
					alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.");
				}
			});
		}	//end filter.indexOf
	}	//end navigator.platform
};
var goRejectfrd = function(frd_account){
	$.mobile.showPageLoadingMsg('c','loading...');
	var filter = "win16|win32|win64|mac";
	if( navigator.platform ){
		if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
			var isios=(/(ipod|iphone|ipad)/i).test(navigator.userAgent);
			if(isios){
				$.ajax({
					url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=3&frd_account="+frd_account,
					cache: false,
					type:'post',
					dataType:'json',
					success:function(data){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert(data.msg,0,"Mondeath","확인");
//						alert(data.msg);
						goAllies_Pending();
					},
					error:function(){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.",0,"Mondeath","확인");
//						alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.");
					}
				});
			}else{
				$.ajax({
					url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=3&frd_account="+frd_account,
					cache: false,
					type:'post',
					dataType:'json',
					success:function(data){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert(data.msg,0,"Mondeath","확인");
						goAllies_Pending();
					},
					error:function(){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.",0,"Mondeath","확인");
					}
				});
			}	//end isios
		}else{
			$.ajax({
				url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=3&frd_account="+frd_account,
				cache: false,
				type:'post',
				dataType:'json',
				success:function(data){
					$.mobile.hidePageLoadingMsg();
					alert(data.msg);
					goAllies_Pending();
				},
				error:function(){
					$.mobile.hidePageLoadingMsg();
					alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.");
				}
			});
		}	//end filter.indexOf
	}	//end navigator.platform
};
var goAppliCancelfrd = function(frd_account){
	$.mobile.showPageLoadingMsg('c','loading...');
	var filter = "win16|win32|win64|mac";
	if( navigator.platform ){
		if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
			var isios=(/(ipod|iphone|ipad)/i).test(navigator.userAgent);
			if(isios){
				$.ajax({
					url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=4&frd_account="+frd_account,
					cache: false,
					type:'post',
					dataType:'json',
					success:function(data){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert(data.msg,0,"Mondeath","확인");
//						alert(data.msg);
						goAllies_Appli();
					},
					error:function(){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.",0,"Mondeath","확인");
//						alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.");
					}
				});
			}else{
				$.ajax({
					url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=4&frd_account="+frd_account,
					cache: false,
					type:'post',
					dataType:'json',
					success:function(data){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert(data.msg,0,"Mondeath","확인");
						goAllies_Appli();
					},
					error:function(){
						$.mobile.hidePageLoadingMsg();
						navigator.notification.alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.",0,"Mondeath","확인");
					}
				});
			}	//end isios
		}else{
			$.ajax({
				url:"./jsp/MgmtFriend.jsp?u_no="+window.localStorage['user_account']+"&job_code=4&frd_account="+frd_account,
				cache: false,
				type:'post',
				dataType:'json',
				success:function(data){
					$.mobile.hidePageLoadingMsg();
					alert(data.msg);
					goAllies_Appli();
				},
				error:function(){
					$.mobile.hidePageLoadingMsg();
					alert("네트워크가 불안하여 연결이 지연중입니다.\r잠시 후 다시 시도해 주세요.");
				}
			});
		}	//end filter.indexOf
	}	//end navigator.platform
};
var goAlliesInfo = function(frd_account){
	$.mobile.showPageLoadingMsg('c','loading...');
	var RtnUrl = $("#curr_url").val();
	location.href = "UserInfo.jsp?u_no="+window.localStorage['user_account']+"&account="+frd_account+"&mon_yn=Y&RtnUrl="+RtnUrl+"";
};
var goWriteMsg = function(frd_acc, frd_nm){
	$.mobile.showPageLoadingMsg('c','loading...');
	if(frd_nm == null){
		location.href = "Message_Write.jsp?u_no="+window.localStorage['user_account']+"&frd_acc="+frd_acc+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
	}else{
		location.href = "Message_Write.jsp?u_no="+window.localStorage['user_account']+"&frd_acc="+frd_acc+"&frd_nm="+frd_nm+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
	}
};
function ErrDialog(msg){
	$("#errorMsg").html(msg);
	$.mobile.changePage($("#errorAlert"),{transition:"pop",role:"dialog",rel:"popup"});
	return;
}
var goDec_Formation = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	var RtnUrl = $("#curr_url").val();
	location.href = "Dec_Fomation.jsp?u_no="+window.localStorage['user_account']+"&RtnUrl="+RtnUrl+"page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goDec_monList = function(tab){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Dec_monList.jsp?u_no="+window.localStorage['user_account']+"&tab="+tab+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goNotice = function(){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Notice.jsp?u_no="+window.localStorage['user_account']+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goUser_item = function(type, mon_id, mon_sn){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "User_item.jsp?u_no="+window.localStorage['user_account']+"&item_type="+type+"&mon_id="+mon_id+"&mon_sn="+mon_sn+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goStrengthen1 = function(type){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Strengthen1.jsp?u_no="+window.localStorage['user_account']+"&stat=1&type="+type+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goStrengthen2 = function(mon_id, mon_sn){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Strengthen2.jsp?u_no="+window.localStorage['user_account']+"&sel_mon_id="+mon_id+"&sel_mon_sn="+mon_sn+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goStrengthen3 = function(basic_id, basic_sn, id_sn){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Strengthen3.jsp?u_no="+window.localStorage['user_account']+"&stat=1&mon_id="+basic_id+"&user_mon_sn="+basic_sn+"&sel_mon_arr="+id_sn;
};
var goStrengthen4 = function(id, sn, sel_mon, item_id){
	$.mobile.showPageLoadingMsg('c','loading...');
	if(item_id != null){
		location.href = "Strengthen4.jsp?u_no="+window.localStorage['user_account']+"&basic_id="+id+"&basic_sn="+sn+"&sel_mon="+sel_mon+"&item_id="+item_id+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
	}else{
		location.href = "Strengthen4.jsp?u_no="+window.localStorage['user_account']+"&basic_id="+id+"&basic_sn="+sn+"&sel_mon="+sel_mon+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
	}
};
var goEvolution1 = function(type){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Evolution1.jsp?u_no="+window.localStorage['user_account']+"&job=6&stat=1&type="+type+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goEvolution2 = function(mon_id, mon_sn){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Evolution2.jsp?u_no="+window.localStorage['user_account']+"&mon_id="+mon_id+"&mon_sn="+mon_sn+"&page_id="+Math.floor(Math.random() * 100000000) + 1;
};
var goTreasure1 = function(no){
	$.mobile.showPageLoadingMsg('c','loading...');
	location.href = "Treasure1.jsp?u_no="+window.localStorage['user_account']+"&list="+no;
};
var goTreasure2 = function(tre_id, type){
	$.mobile.showPageLoadingMsg('c','loading...');
	var RtnUrl = $("#curr_url").val();
	location.href = "Treasure2.jsp?u_no="+window.localStorage['user_account']+"&tre_id="+tre_id+"&list="+type+"&RtnUrl="+RtnUrl;
};