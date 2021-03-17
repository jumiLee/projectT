<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	int user_account=1075;
%>
user_account : <%=user_account %> <br>
[공통] <br>
<a href="./ma_index.jsp" target="_blank">점검페이지</a> <br>
<a href="./user_main.jsp?user_account=<%=user_account%>" target="_blank">Main</a> <br>
<a href="./ma_error.jsp" target="_blank">Error page</a> <br>
<a href="./user_create.jsp?m_no=0&user_nm=0&user_img=0&user_level=2&ch_type=0&ch_id=0" target="_blank">사용자 생성</a> <br>
<a href="./user_link.jsp?user_account=&ch_type=0&ch_id=0" target="_blank">계정연동</a> <br>
<a href="./user_login_ap.jsp?m_no=40" target="_blank">사용자 로그인</a> <br>
<a href="./user_leave.jsp?user_account=<%=user_account%>&job_type=1" target="_blank">탈퇴신청</a> <br>
<a href="./user_leave.jsp?user_account=<%=user_account%>&job_type=2" target="_blank">탈퇴신청철회</a> <br>
<a href="./user_nickname.jsp?user_account=<%=user_account%>&user_nickname=test" target="_blank">닉네임 생성 및 변경 </a> <br>
<a href="./user_info_cnt.jsp?user_account=<%=user_account%>&job_type=1" target="_blank">사용자 몬스터수 조회  </a> <br>
<a href="./user_info_cnt.jsp?user_account=<%=user_account%>&job_type=2" target="_blank">사용자 장비수 조회  </a> <br>
<a href="./user_info_cnt.jsp?user_account=<%=user_account%>&job_type=3" target="_blank">사용자 친구수 조회  </a> <br>
<form name="f" action="user_char_create.jsp" method="post">
	user_account<input type="text" name="user_account">
	user_nickname<input type="text" name="user_nickname">
	mon_id<input type="text" name="mon_id">
	<input type="submit">
</form> 

<br>[요일던전] <br>
<a href="./dun_getList.jsp?user_account=<%=user_account%>&dun_type=1" target="_blank">요일던전조회</a> <br>
<a href="./dun_BattleStart.jsp?user_account=<%=user_account%>&job_type=1&dun_type=1&dun_id=1&dun_level=1" target="_blank">요일던전START</a> <br>
<a href="./dun_BattleEnd.jsp?user_account=<%=user_account%>&job_type=1&dun_type=1&dun_id=1&dun_level=1&attend_sn=1&bat_result=1" target="_blank">요일던전END</a> <br>
<a href="./dun_attendInit.jsp?user_account=<%=user_account%>&job_type=1&dun_type=1&dun_id=1" target="_blank">요일던전 초기화</a> <br>
<a href="./common_rivival.jsp?user_account=<%=user_account%>&job_type=1" target="_blank">요일던전이어하기 비용처리</a> <br>


<br>[이벤트] <br>
<a href="./evt_mgmtCoupon.jsp?user_account=<%=user_account%>&job_type=1&coupon_id=" target="_blank">쿠폰사용</a> <br>

<br>[퀘스트] <br>
<a href="./quest_rwd_list.jsp?user_account=<%=user_account%>&mon_id=15&user_mon_sn=1&quest_no=1" target="_blank">퀘스트보상조회</a> <br>
<a href="./quest_rwd_receive.jsp?user_account=<%=user_account%>&mon_id=15&user_mon_sn=1&quest_no=1" target="_blank">퀘스트보상받기</a> <br>

<br>[소켓] <br>
<a href="./item_MySocketList.jsp?user_account=<%=user_account%>&job_type=1" target="_blank">소켓장착 가능보석 리스트  </a> <br>
<a href="item_MySocketEquipList.jsp?user_account=<%=user_account%>&job_type=1&item_id=&item_uniqueID=" target="_blank">소켓장착 보석 리스트  </a> <br>
<a href="item_MySocketMgmt.jsp?user_account=<%=user_account%>&job_type=1&item_id=&item_uniqueID=&tre_id=&tre_id_sn=0&socket_pos=" target="_blank">소켓장착 </a> <br>
<a href="item_MySocketMgmt.jsp?user_account=<%=user_account%>&job_type=2&item_id=&item_uniqueID=&tre_id=&tre_id_sn=&socket_pos=" target="_blank">소켓빼기 </a> <br>
<a href="item_UniteSocket.jsp?user_account=<%=user_account%>&job_type=2&tre_id=&tre_array=" target="_blank">소켓합성</a> <br>
<a href="item_UniteSocketList.jsp?user_account=<%=user_account%>&tre_type=0" target="_blank">소켓합성 리스트  </a> <br>

<br>[룬] <br>
<a href="./item_MyRuneList.jsp?user_account=<%=user_account%>" target="_blank">보유룬리스트 </a> <br>
<a href="./item_RuneEquipList.jsp?user_account=<%=user_account%>&mon_id=1&user_mon_sn=1" target="_blank">룬장착리스트 </a> <br>
<a href="./mon_EquipRune.jsp?user_account=<%=user_account%>&job_type=1&mon_id=1&user_mon_sn=1&item_id=1110001&item_uniqueID=1&rune_pos=1" target="_blank">룬장착 </a> <br>
<a href="./item_Reinforce.jsp?user_account=<%=user_account%>&job_type=2&item_id=1110001&item_uniqueID=1&item_id=1110001&item_uniqueID=1&item_array=1:1|2:2|" target="_blank">룬강화</a> <br>
<a href="./item_Upgrade.jsp?user_account=<%=user_account%>&job_type=2&item_id=1110001&item_uniqueID=1&mtr_item_array=0|" target="_blank">룬승급</a> <br>


<br>[친구] <br>
<a href="./frd_shakeFrd.jsp?user_account=<%=user_account%>&frd_account=3&frd_ch_type=0&frd_ch_id=null" target="_blank">게임친구하트보내기  </a> <br>
<a href="./frd_shakeFrd.jsp?user_account=<%=user_account%>&frd_account=0&frd_ch_type=1&frd_ch_id=test" target="_blank">카톡친구하트보내기  </a> <br>
<a href="./frd_mgmtFrd.jsp?user_account=<%=user_account%>&frd_account=0&job_type=1&frd_ch_type=1&frd_ch_id=test" target="_blank">카톡친구신청 </a> <br>
<a href="./frd_mgmtFrd.jsp?user_account=<%=user_account%>&frd_account=0&job_type=5" target="_blank">친구삭제 </a> <br>

<br>[튜토리얼] <br>
<a href="./user_getTutStatus.jsp?user_account=<%=user_account%>" target="_blank">튜토리얼 상태 조회</a> <br>
<a href="./user_tutUpdate.jsp?user_account=<%=user_account%>&tut_status=0" target="_blank">튜토리얼 상태 업데이트</a> <br>

<br>[아이템] <br>
<a href="./item_getMyItemList.jsp?user_account=<%=user_account%>&job_type=1&item_type=0" target="_blank">나의소지아이템</a> <br>
<a href="./item_getMyItemList.jsp?user_account=<%=user_account%>&job_type=2&item_type=31" target="_blank">내 타입별 아이템 리스트</a> <br>
<a href="./item_getMyItemList.jsp?user_account=<%=user_account%>&job_type=3&item_type=9" target="_blank">내 카테고리별 아이템 리스트</a> <br>
<a href="./item_getCost.jsp?user_account=<%=user_account%>&item_id=3100005&item_uniqueID=824&job_type=1" target="_blank">아이템 강화비용조회</a> <br>
<a href="./item_Reinforce.jsp?user_account=<%=user_account%>&item_id=3100005&item_uniqueID=824&item_array=3100005:825|3100005:826|3100005:827|" target="_blank">아이템 강화</a> <br>
<a href="./item_Upgrade.jsp?user_account=<%=user_account%>&item_id=3100005&item_uniqueID=824&mtr_item_array=0|" target="_blank">아이템 승급</a> <br>
<a href="item_getUpgradeList.jsp?user_account=<%=user_account%>&item_id=5110001&item_uniqueID=2941" target="_blank">아이템 승급재료조회 </a> <br>
<a href="./mon_MymonEquip.jsp?user_account=<%=user_account%>&mon_id=&user_mon_sn=&item_id=3100005&item_uid=824&job_type=1" target="_blank">아이템 장착</a> <br>
<a href="./mon_MymonEquip.jsp?user_account=<%=user_account%>&mon_id=&user_mon_sn=&item_id=3100005&item_uid=824&job_type=2" target="_blank">아이템 장착해제</a> <br>
<a href="./mon_AutoEquip.jsp?user_account=<%=user_account%>&mon_id=99&user_mon_sn=1&item_id=9100005&job_type=3" target="_blank">아이템 자동장착</a> <br>
<a href="./item_MakeMtrList.jsp?user_account=<%=user_account%>" target="_blank">재료리스트</a> <br>
<a href="./item_getMstItemList.jsp?user_account=<%=user_account%>&job_type=1" target="_blank">재료리스트(상세)</a> <br>
<a href="./item_MyItemMgmt.jsp?user_account=<%=user_account%>&job_type=1&item_id=&item_uniqueID=0&item_cnt=1" target="_blank">아이템구매</a> <br>

<a href="./item_Make.jsp?user_account=<%=user_account%>&mtr_item_id=&mtr_item_uid=" target="_blank">아이템제조</a> <br>
<a href="./item_openSetItem.jsp?job_type=1&user_account=<%=user_account%>&item_id=&item_uniqueID=" target="_blank">세트아이템열기</a> <br>

<br>[출석체크] <br>
<a href="./attend_getList.jsp?user_account=<%=user_account%>&attend_type=1" target="_blank">출석체크 조회</a> <br>
<a href="./attend_getRwd.jsp?user_account=<%=user_account%>&job_type=2&attend_type=1&day_no=1" target="_blank">출석체크 보상수령</a> <br>

<br>[미션] <br>
<a href="./mis_start.jsp?user_account=<%=user_account%>&mis_id=1&mis_sub_id=5&add_mis_gold=0&frd_account=-1" target="_blank"> 미션 시작</a> <br>
<a href="./mis_reward.jsp?user_account=<%=user_account%>&mis_id=6&mis_sub_id=5" target="_blank"> 미션 보상조회</a> <br>
<a href="./mis_end.jsp?user_account=<%=user_account%>&mis_id=6&mis_sub_id=5&rwd_type=1&rwd_id=22&rwd_sub_id=0&frd_account=0&comp_degree=1" target="_blank"> 미션 완료 </a> <br>
<a href="./mis_end_fail.jsp?user_account=<%=user_account%>&mis_id=6&mis_sub_id=5&mis_gold=0&mis_exp=10&frd_account=0" target="_blank"> 미션 완료(실패) </a> <br>
<a href="./mis_battleBoss.jsp?user_account=<%=user_account%>&have_account=<%=user_account%>" target="_blank"> 미션보스조회 </a> <br>
<a href="./mis_mgmtBoss.jsp?user_account=<%=user_account%>&have_account=<%=user_account%>&clear_account=<%=user_account%>&boss_id=27&boss_cur_HP=3800" target="_blank"> 미션보스업데이트 </a> <br>
<a href="./common_getMonInfo.jsp?job_type=2&user_account=<%=user_account%>&bat_user_account=600" target="_blank">미션도움친구정보</a> <br>

<br>[돌발보스] <br>
<a href="./mis_battleBoss.jsp?user_account=<%=user_account%>&have_account=<%=user_account%>" target="_blank">미션돌발정보</a> <br>
<a href="./common_useAP.jsp?user_account=<%=user_account%>&job_type=1" target="_blank">미션돌발보스시작</a> <br>
<a href="./mis_mgmtBoss.jsp?user_account=<%=user_account%>&&have_account=<%=user_account%>&clear_account=<%=user_account%>&boss_id=&boss_cur_HP=" target="_blank">미션돌발보스 업데이트</a> <br>

<br>[몬스터] <br>
<a href="./mon_MymonListAll.jsp?user_account=<%=user_account%>" target="_blank">내 몬스터리스트(ALL)</a> <br>
<a href="./mon_MymonList.jsp?user_account=<%=user_account%>" target="_blank">내 몬스터리스트</a> <br>
<a href="./mon_getSkillList.jsp?user_account=<%=user_account%>&mon_id=26&user_mon_sn=4" target="_blank">내 몬스터 스킬 리스트</a> <br>
<a href="./mon_mgmtSkill.jsp?user_account=<%=user_account%>&job_type=1&mon_id=26&user_mon_sn=4&skill_id=1" target="_blank">내 몬스터 스킬 레벨업</a> <br>

<br>[업적] <br>
<a href="./achv_update.jsp?user_account=<%=user_account%>&achv_type=1&achv_id=1&achv_cnt=1" target="_blank"> 업적업데이트</a> <br>
<a href="./achv_kakao_update.jsp?user_account=<%=user_account%>&target_kakao_id=12345678901234567" target="_blank"> 카카오업적업데이트</a> <br>
<a href="./achv_rwd.jsp?user_account=<%=user_account%>&job_type=1&achv_type=1&achv_id=1" target="_blank"> 업적보상받기(개별)</a> <br>
<a href="./achv_rwd.jsp?user_account=<%=user_account%>&job_type=2&achv_type=1&achv_id=0" target="_blank"> 업적보상받기(일괄)</a> <br>

<br>[랭킹조회] <br>
<a href="./wd_getBossRank.jsp?user_account=<%=user_account%>" target="_blank"> 월드보스 랭킹조회</a> <br>
<a href="./bat_getMyRankInfo.jsp?user_account=<%=user_account%>&job_type=1" target="_blank">나의 랭킹 정보 (PvP)</a> <br>

<br>[랭킹보상조회] <br>
<a href="./achv_list.jsp?user_account=<%=user_account%>&job_type=5" target="_blank"> PVP 랭킹 보상조회</a> <br>
<a href="./achv_list.jsp?user_account=<%=user_account%>&job_type=6" target="_blank"> PVP 참여 보상조회</a> <br> 
<a href="./achv_list.jsp?user_account=<%=user_account%>&job_type=7" target="_blank"> 무한대전 랭킹 보상조회</a> <br>
<a href="./achv_list.jsp?user_account=<%=user_account%>&job_type=8" target="_blank"> 무한대전 참여 보상조회</a> <br> 
<a href="./achv_list.jsp?user_account=<%=user_account%>&job_type=9" target="_blank"> 월드보스 랭킹 보상조회</a> <br>
<a href="./achv_list.jsp?user_account=<%=user_account%>&job_type=10" target="_blank"> 월드보스 참여 보상조회</a> <br> 

<br>[무한대전] <br>
<a href="./infi_bat_start.jsp?user_account=<%=user_account%>&infi_id=1&bat_gold=100" target="_blank"> 무한대전 시작</a> <br>
<a href="./infi_bat_end.jsp?user_account=<%=user_account%>&infi_id=1&item_use_flag=2&bat_result=1&bat_score=100" target="_blank"> 무한대전 결과(성공)</a> <br>
<a href="./infi_bat_end.jsp?user_account=<%=user_account%>&infi_id=2&item_use_flag=2&bat_result=2&bat_score=100" target="_blank"> 무한대전 결과(패배)</a> <br>
<a href="./infi_revival.jsp?user_account=<%=user_account%>&infi_id=2" target="_blank"> 무한대전 연승유지</a> <br>
<a href="./bat_getMyRankInfo.jsp?user_account=<%=user_account%>&job_type=2" target="_blank"> 나의 랭킹 조회 </a> <br>

<br>[월드보스] <br>
<a href="./wd_getBossList.jsp?user_account=<%=user_account%>" target="_blank"> 월드보스전 시작</a> <br>
<a href="./wd_mgmtBoss.jsp?user_account=<%=user_account%>&boss_bat_id=&boss_mon_id=20&boss_cur_HP=" target="_blank"> 월드보스 결과 업데이트 </a> <br>
	
<br>[뽑기] <br>
<a href="./draw_mgmtGiftDraw.jsp?user_account=<%=user_account%>&draw_id=21" target="_blank">뽑기권사용</a> <br>
<a href="./draw_mgmtDraw.jsp?user_account=<%=user_account%>&draw_id=1" target="_blank">뽑기</a> <br>
<a href="./draw_list.jsp?user_account=<%=user_account%>" target="_blank">뽑기 리스트 조회 </a> <br>

<br>[메세지] <br>
<a href="./msg_mgmtMsg.jsp?user_account=<%=user_account%>&job_type=1&receive_sn=8&good_type=21" target="_blank">메세지 개별수신</a> <br>
<a href="./msg_receiveList.jsp?user_account=<%=user_account%>&job_type=1" target="_blank">메세지 조회</a> <br>

<br>[상점] <br>
<a href="./shop_PackageItemList.jsp?user_account=<%=user_account%>&job_type=4&item_category=12&item_type=121" target="_blank">패키지아이템리스트 </a> <br>
<a href="./shop_ItemTypeList.jsp?user_account=<%=user_account%>&draw_type_cd=4" target="_blank">상점가차아이템리스트 </a> <br>
<a href="./shop_ItemList.jsp?user_account=<%=user_account%>&job_type=3&item_category=1&item_type=0" target="_blank">소모품 아이템리스트 </a> <br>
<a href="./shop_ItemList.jsp?user_account=<%=user_account%>&job_type=3&item_category=2&item_type=0" target="_blank">골드 아이템리스트 </a> <br>
<a href="./shop_ItemList.jsp?user_account=<%=user_account%>&job_type=3&item_category=12&item_type=0" target="_blank">패키지 아이템리스트 </a> <br>
<a href="./item_MyItemMgmt.jsp?user_account=<%=user_account%>&job_type=9&item_id=1210001&item_cnt=1&item_uniqueID=0" target="_blank">패키지 아이템 구매 </a> <br>
<a href="./shop_coinList.jsp?user_account=<%=user_account%>&device_type=1&payment_type=2" target="_blank">코인충전 상점리스트 </a> <br>
<a href="./shop_reqPayment_t.jsp?user_account=<%=user_account%>&cash_id=1&device_type=1&ch_type=3&ch_id=1" target="_blank">(Tstore)결제요청  </a> <br>
<a href="./shop_mgmtCoin_t.jsp?user_account=<%=user_account%>&job_type=1&frd_account=0&cash_id=1&trade_cd=0&trade_no=1&trade_res_key=&signdata=" target="_blank">(Tstore)코인충전 </a> <br>
<a href="./shop_reqPayment_g.jsp?user_account=<%=user_account%>&cash_id=1&device_type=1&ch_type=2&ch_id=googletest55" target="_blank">(Google)결제요청  </a> <br>
<a href="./shop_mgmtCoin_g.jsp?user_account=<%=user_account%>&job_type=1&frd_account=0&cash_id=1&trade_cd=0&trade_no=1&order_no=0&security_key=&trade_res_key=" target="_blank">(Google)코인충전 </a> <br>

<a href="./shop_checkBuyCashProd.jsp?user_account=<%=user_account%>&job_type=3&cash_id=8&payment_type=2" target="_blank">상품구매가능체크 </a> <br>

<br>[도감] <br>
<a href="./mon_bookList.jsp?user_account=<%=user_account%>&mon_category=0" target="_blank">도감조회</a> <br>
<a href="./mon_bookRwd.jsp?user_account=<%=user_account%>&mon_category=1" target="_blank">도감보상</a> <br>

<br>[식후땡] <br>
<a href="./evt_getList.jsp?user_account=<%=user_account%>&rwd_category=5" target="_blank">식후땡 이력 조회</a> <br>
<a href="./evt_mgmtEvt.jsp?user_account=<%=user_account%>&rwd_category=5&rwd_category_value=1" target="_blank">식후땡 보상지급</a> <br>

<br>[보물리스트조회] <br>
<a href="./tre_getList.jsp?user_account=<%=user_account%>&tre_id=1" target="_blank">보물리스트조회</a> <br>

<br>[전투] <br>
<a href="./bat_monList.jsp?user_account=<%=user_account%>" target="_blank">PVP 전투리스트</a> <br>
<a href="./common_getMonInfo.jsp?job_type=1&user_account=<%=user_account%>&bat_user_account=600" target="_blank">PVP 전투대전상대 덱리스트</a> <br>
<a href="./bat_tre_monList.jsp?user_account=<%=user_account%>" target="_blank">보물 전투리스트</a> <br>
<a href="./bat_mgmtBatStart.jsp?user_account=<%=user_account%>&bat_user_account=600&job_type=1&use_item=0&bat_gold=0" target="_blank">전투시작</a> <br>
<a href="./bat_mgmtBatEnd.jsp?user_account=<%=user_account%>&bat_user_account=600&job_type=1&bat_result=1" target="_blank">전투종료</a> <br>

<br>[방어] <br>
<a href="./def_getList.jsp?user_account=<%=user_account%>" target="_blank">방어조회</a> <br>
<a href="./def_DefStart.jsp?user_account=<%=user_account%>&job_type=1&def_id=1" target="_blank">방어전투시작</a> <br>
<a href="./def_mgmtDef.jsp?user_account=<%=user_account%>&job_type=2&def_id=1&def_result=1" target="_blank">방어전투결과업데이트</a> <br>
<a href="./def_mgmtDef.jsp?user_account=<%=user_account%>&job_type=3&def_id=1" target="_blank">방어보상처리</a> <br>

<br>[친구] <br>
<a href="./frd_getFrdList.jsp?user_account=<%=user_account%>&job_type=1" target="_blank"> 나의친구목록</a> <br>
<a href="./frd_getFrdList.jsp?user_account=<%=user_account%>&job_type=1" target="_blank"> 나의친구목록</a> <br>
<a href="./frd_getFrdList.jsp?user_account=<%=user_account%>&job_type=3" target="_blank"> 요청온 친구목록</a> <br>
