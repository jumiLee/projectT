<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T26";
String bat_user_account = request.getParameter("bat_user_account");

//몬스터 관련
	int tot_cnt ; 
	tot_cnt = 0;
	Map<String, Object> map = null;
	List<Map<String, Object>> list = null;
	
//skill 관련
	ResultSet rs_sk = null;
	PreparedStatement pstmt_sk = null;
	int tot_sk_cnt; 
	tot_sk_cnt = 0;
	Map<String, Object> map_sk = null;
	List<Map<String, Object>> list_sk = null;
	String sk_mon_id ; String sk_user_mon_sn ;
	
//장착 관련
	ResultSet rs_eq = null;
	PreparedStatement pstmt_eq = null;
	int tot_eq_cnt; int equip_cnt ;
	tot_eq_cnt = 0; equip_cnt = 0;
	Map<String, Object> map_eq = null;
	List<Map<String, Object>> list_eq = null;
	String eq_mon_id ; String eq_user_mon_sn ; String eq_item_id; String eq_item_uniqueID;
	
//소켓 마스터 관련
	ResultSet rs_sok = null;
	PreparedStatement pstmt_sok = null;
	int tot_sok_cnt; 
	tot_sok_cnt = 0; 
	Map<String, Object> map_sok = null;
	List<Map<String, Object>> list_sok = null;
	String sok_item_id;	

//나의 소켓 정보 관련
	ResultSet rs_my_sok = null;
	PreparedStatement pstmt_my_sok = null;
	int tot_my_sok_cnt; 
	tot_my_sok_cnt = 0; 
	Map<String, Object> map_my_sok = null;
	List<Map<String, Object>> list_my_sok = null;	
	String my_sok_item_id ="0";	String my_sok_item_uniqueid  ="0";
	
//몬스터 종합 정보 
	Map<String, Object> map_total = null;
	List<Map<String, Object>> list_total = null;
	list_total = new ArrayList<Map<String, Object>>();
	String mon_id ; String user_mon_sn ;

	String result_packet = ""	;
	
	
	
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
//System.out.println ("/////////// mon_MymonList  /////////// ");	
	//몬스터 정보
		sql.append(" Call abn_getMonList (4, " + bat_user_account + ", null,null) \n");
		//System.out.println ("monster:" + sql.toString());
		  
		pstmt = Conn.prepareStatement(sql.toString());
		rs = pstmt.executeQuery();
		list = new ArrayList<Map<String, Object>>();
		
	//몬스터 스킬 정보	
		sql.setLength(0);
		sql.append(" Call abn_getMonSkill (1, " + bat_user_account + ", null,null) \n");
		//System.out.println ("skill:" + sql.toString());
		pstmt_sk = Conn.prepareStatement(sql.toString());
		rs_sk 	 = pstmt_sk.executeQuery();
		list_sk = new ArrayList<Map<String, Object>>();
		
	//몬스터 장착 정보	
		sql.setLength(0);
		sql.append(" Call abn_getMonEquip (1, " + bat_user_account + ", null,null) \n");
		//System.out.println ("equip:" + sql.toString());
		pstmt_eq = Conn.prepareStatement(sql.toString());
		rs_eq 	 = pstmt_eq.executeQuery();	
		list_eq = new ArrayList<Map<String, Object>>();
		
		
	//몬스터 장착아이템 소켓 마스터 정보
		sql.setLength(0);
		sql.append(" Call abn_getSocketTreasureList (7, " + bat_user_account + ", null,null,null,null) \n");
		//System.out.println ("Socket:" + sql.toString());
		pstmt_sok = Conn.prepareStatement(sql.toString());
		rs_sok 	 = pstmt_sok.executeQuery();	
		list_sok = new ArrayList<Map<String, Object>>();	
		
	//몬스터 장착아이템 소켓 정보	
		sql.setLength(0);
		sql.append(" Call abn_getSocketTreasureList (3, " + bat_user_account + ", null,null,null,null) \n");
		//System.out.println ("Socket:" + sql.toString());
		pstmt_my_sok = Conn.prepareStatement(sql.toString());
		rs_my_sok 	 = pstmt_my_sok.executeQuery();	
		list_my_sok = new ArrayList<Map<String, Object>>();	
		
		
	//Save monster info Map 
		while(rs.next()){
			map = new HashMap();
			//user_mon_sn|mon_id|mon_level|mon_type|max_exp|mon_exp|HP|cur_HP|carry_flag|mon_nm|ATT_STR|DEF_STR|STR_cnt|win_cnt|lose_cnt|deck_flag|rare_degree|mon_BP
			
			//map.put("mon_cnt"		, rs.getInt("mon_cnt"));
			map.put("mon_id"		, rs.getInt("mon_id"));
			map.put("user_mon_sn"	, rs.getInt("user_mon_sn"));
			map.put("mon_level"		, rs.getInt("mon_level"));
			map.put("mon_type"		, rs.getInt("mon_type"));
			map.put("max_exp"		, rs.getInt("max_exp"));
			map.put("mon_exp"		, rs.getInt("mon_exp"));
			map.put("HP"			, rs.getInt("HP"));
			map.put("cur_HP"		, rs.getInt("cur_HP"));
			map.put("carry_flag"	, rs.getInt("carry_flag"));
			map.put("mon_nm"		, rs.getString("mon_nm"));
			map.put("ATT_STR"		, rs.getInt("ATT_STR"));
			map.put("DEF_STR"		, rs.getInt("DEF_STR"));
			map.put("STR_cnt"		, rs.getInt("STR_cnt"));
			map.put("win_cnt"		, rs.getInt("win_cnt"));
			map.put("lose_cnt"		, rs.getInt("lose_cnt"));
			map.put("deck_flag"		, rs.getInt("deck_flag"));
			map.put("mon_rare_degree", rs.getInt("mon_rare_degree"));
			map.put("mon_BP"		, rs.getInt("mon_BP"));
			map.put("check_flag"	, rs.getInt("check_flag"));
			
			list.add(map);
			tot_cnt++;
			
			
			//webClient.sayToServer (tot_cnt + " 내 몬스터");
		}

	//Save monster skill info Map 	
		while(rs_sk.next()){
			map_sk = new HashMap();
			//skill_cnt|skill_id|skill_nm|skill_cooltime|skill_desc
			map_sk.put("skill_cnt"		, rs_sk.getInt("skill_cnt"));
			map_sk.put("mon_id"			, rs_sk.getInt("mon_id"));
			map_sk.put("user_mon_sn"	, rs_sk.getInt("user_mon_sn"));
			map_sk.put("skill_id"		, rs_sk.getInt("skill_id"));
			map_sk.put("skill_nm"		, rs_sk.getString("skill_nm"));
			map_sk.put("skill_cooltime"	, rs_sk.getInt("skill_cooltime"));
			map_sk.put("skill_desc"		, rs_sk.getString("skill_desc"));
			
			 
			
			list_sk.add(map_sk);
			tot_sk_cnt ++;
		}

	//Save monster Equip info Map 	
		while(rs_eq.next()){
			map_eq = new HashMap();
			/* item_cnt|item_id|item_uid|item_img_no|item_type|item_name|item_price|item_value|
			ATT|DEF|HP|SP|abnormal|speedup_all|speedup|exp_up|critical_up|reinforce_up|limit_lv|item_period_flag|item_period|remain_time(s)| */
			
			map_eq.put("equip_cnt"		, rs_eq.getInt("equip_cnt"));
			map_eq.put("mon_id"			, rs_eq.getInt("mon_id"));
			map_eq.put("user_mon_sn"	, rs_eq.getInt("user_mon_sn"));
			map_eq.put("item_id"		, rs_eq.getInt("item_id"));
			map_eq.put("item_uniqueID"	, rs_eq.getInt("item_uniqueID"));
			map_eq.put("item_type"		, rs_eq.getInt("item_type"));
			map_eq.put("item_nm"		, rs_eq.getString("item_nm"));
			map_eq.put("item_img_no"	, rs_eq.getInt("item_img_no"));
			
			map_eq.put("rare_degree"	, rs_eq.getInt("rare_degree"));
			map_eq.put("item_usage"		, rs_eq.getInt("item_usage"));
			map_eq.put("item_cnt"		, rs_eq.getInt("item_cnt"));
			map_eq.put("item_desc"		, rs_eq.getString("item_desc"));
			map_eq.put("item_price"		, rs_eq.getInt("item_price"));
			
			map_eq.put("item_value"		, rs_eq.getInt("item_value"));
			map_eq.put("item_att"		, rs_eq.getInt("item_att"));
			map_eq.put("item_def"		, rs_eq.getInt("item_def"));
			map_eq.put("HP"				, rs_eq.getInt("HP"));
			map_eq.put("SP"				, rs_eq.getInt("SP"));
			
			map_eq.put("abnormal"		, rs_eq.getInt("abnormal"));
			map_eq.put("speedup_all"	, rs_eq.getInt("speedup_all"));
			map_eq.put("speedup"		, rs_eq.getInt("speedup"));
			map_eq.put("exp_up"			, rs_eq.getInt("exp_up"));
			map_eq.put("critical_up"	, rs_eq.getInt("critical_up"));
			
			map_eq.put("reinforce_up"	, rs_eq.getInt("reinforce_up"));
			map_eq.put("limit_lv"		, rs_eq.getInt("limit_lv"));
			map_eq.put("item_period_flag"	, rs_eq.getInt("item_period_flag"));
			map_eq.put("item_period"	, rs_eq.getInt("item_period"));
			map_eq.put("remain_time"	, rs_eq.getInt("remain_time"));
			map_eq.put("class"			, rs_eq.getInt("class")); 
			
			map_eq.put("item_grade"		, rs_eq.getInt("item_grade"));  
			map_eq.put("item_level"		, rs_eq.getInt("item_level"));  		
			map_eq.put("item_exp"		, rs_eq.getInt("item_exp"));  		
			map_eq.put("item_rfc_flag"	, rs_eq.getInt("item_rfc_flag"));  
			map_eq.put("item_rfc_mtr_flag"	, rs_eq.getInt("item_rfc_mtr_flag")); 
			map_eq.put("target_exp"			, rs_eq.getInt("target_exp"));
			map_eq.put("socket_equip_flag"	, rs_eq.getInt("socket_equip_flag"));
			
			
			list_eq.add(map_eq);
			
			tot_eq_cnt ++;
		}

		//Save item socket master info Map 	
		while(rs_sok.next()){
			map_sok = new HashMap();
			//item_socket_cnt|socket_pos|socket_type|
			map_sok.put("item_id"		, rs_sok.getInt("item_id"));
			map_sok.put("socket_pos"	, rs_sok.getInt("socket_pos"));
			map_sok.put("tre_type"		, rs_sok.getInt("tre_type"));
			
			list_sok.add(map_sok);
			tot_sok_cnt ++;
		}

		//Save my socket info Map 	
		while(rs_my_sok.next()){
			map_my_sok = new HashMap();
			//item_setSocket_cnt|item_id|item_uniqueID|my_socket_pos|tre_id|tre_id_sn|tre_type|tre_level|tre_img_no|tre_nm|tre_hp|tre_att|tre_def|tre_critical_up|tre_miss_up|
				map_my_sok.put("item_id"		, rs_my_sok.getInt("item_id"));
				map_my_sok.put("item_uniqueID"	, rs_my_sok.getInt("item_uniqueID"));
				map_my_sok.put("socket_pos"		, rs_my_sok.getInt("socket_pos"));
				map_my_sok.put("tre_id"			, rs_my_sok.getInt("tre_id"));
				map_my_sok.put("tre_id_sn"		, rs_my_sok.getInt("tre_id_sn"));
				map_my_sok.put("tre_type"		, rs_my_sok.getInt("tre_type"));
				map_my_sok.put("tre_level"		, rs_my_sok.getInt("tre_level"));
				map_my_sok.put("tre_img_no"		, rs_my_sok.getInt("tre_img_no"));
				map_my_sok.put("tre_nm"			, rs_my_sok.getString("tre_nm"));
				map_my_sok.put("hp"				, rs_my_sok.getInt("hp"));
				map_my_sok.put("att"			, rs_my_sok.getInt("att"));
				map_my_sok.put("def"			, rs_my_sok.getInt("def"));
				map_my_sok.put("critical_up"	, rs_my_sok.getInt("critical_up"));
				map_my_sok.put("miss_up"		, rs_my_sok.getInt("miss_up"));
				
				list_my_sok.add(map_my_sok);
				tot_my_sok_cnt ++;
			}


	//각 list 데이터를 가지고 패킷 규격에 따라 만들기. 
		
		//몬스터 정보 List 개수
		int moncnt =0;
		for(int i=0;i<list.size();i++){
				moncnt++;
		}
		result_packet += moncnt +"|";
		
		//몬스터 정보 List
		for(int i=0;i<list.size();i++){
			
			mon_id 		= list.get(i).get("mon_id").toString();
			user_mon_sn = list.get(i).get("user_mon_sn").toString();
			
			//total_cnt|user_mon_sn|mon_id|mon_level|mon_type|max_exp|mon_exp|HP|cur_HP|carry_flag|mon_nm|ATT_STR|DEF_STR|STR_cnt|win_cnt|lose_cnt|deck_flag|mon_rare_degree|mon_BP
			result_packet +=  	user_mon_sn+"|" + 
								mon_id +"|"+
								list.get(i).get("mon_level").toString() 	+"|"+
								list.get(i).get("mon_type").toString() 		+"|"+
								list.get(i).get("max_exp").toString() 		+"|"+
								list.get(i).get("mon_exp").toString() 		+"|"+
								list.get(i).get("HP").toString() 			+"|"+
								list.get(i).get("cur_HP").toString() 		+"|"+
								list.get(i).get("carry_flag").toString() 	+"|"+
								list.get(i).get("mon_nm").toString() 		+"|"+
								list.get(i).get("ATT_STR").toString() 		+"|"+
								list.get(i).get("DEF_STR").toString() 		+"|"+
								list.get(i).get("STR_cnt").toString() 		+"|"+
								list.get(i).get("win_cnt").toString() 		+"|"+
								list.get(i).get("lose_cnt").toString() 		+"|"+
								list.get(i).get("deck_flag").toString() 	+"|"+
								list.get(i).get("mon_rare_degree").toString()+"|"+
								list.get(i).get("mon_BP").toString() 		+"|"+
								list.get(i).get("check_flag").toString() 	+"|";
			
					
		//몬스터 스킬정보 List 개수
			int skcnt =0;
			for(int sk=0;sk<list_sk.size();sk++){
				sk_mon_id		= list_sk.get(sk).get("mon_id").toString();
				sk_user_mon_sn	= list_sk.get(sk).get("user_mon_sn").toString();
				
				if (mon_id.equals(sk_mon_id) && user_mon_sn.equals(sk_user_mon_sn) ) {
					skcnt++;
				}
			}
			result_packet += skcnt +"|";
		//몬스터 스킬정보 List
			for(int sk=0;sk<list_sk.size();sk++){
				sk_mon_id		= list_sk.get(sk).get("mon_id").toString();
				sk_user_mon_sn	= list_sk.get(sk).get("user_mon_sn").toString();
				
				if (mon_id.equals(sk_mon_id) && user_mon_sn.equals(sk_user_mon_sn) ) {
					//System.out.println(mon_id + "/" + user_mon_sn + "===" +  sk_mon_id + "/" + sk_user_mon_sn + "========");	
					//skill_cnt|skill_id|skill_nm|skill_cooltime|skill_desc
					result_packet += 	list_sk.get(sk).get("skill_id").toString() 			+"|"+
										list_sk.get(sk).get("skill_nm").toString() 			+"|"+
										list_sk.get(sk).get("skill_cooltime").toString()	+"|"+
										list_sk.get(sk).get("skill_desc").toString() 		+"|";
				}
			}//end sk for
			
		//몬스터 장착정보 List 개수
			int eqcnt =0;
			for(int eq=0;eq<list_eq.size();eq++){
				eq_mon_id		= list_eq.get(eq).get("mon_id").toString();
				eq_user_mon_sn	= list_eq.get(eq).get("user_mon_sn").toString();
				
				if (mon_id.equals(eq_mon_id) && user_mon_sn.equals(eq_user_mon_sn) ) {
					eqcnt++;
				}
			}
			result_packet += eqcnt + "|";
			
		//몬스터 장착정보 List
			for(int eq=0;eq<list_eq.size();eq++){
				
				eq_mon_id		= list_eq.get(eq).get("mon_id").toString();
				eq_user_mon_sn	= list_eq.get(eq).get("user_mon_sn").toString();
				eq_item_id= list_eq.get(eq).get("item_id").toString();
				eq_item_uniqueID= list_eq.get(eq).get("item_uniqueID").toString();
				
				if (mon_id.equals(eq_mon_id) && user_mon_sn.equals(eq_user_mon_sn) ) {
					/* item_cnt|item_id|item_uid|item_img_no|item_type|item_name|item_price|item_value|
					ATT|DEF|HP|SP|abnormal|speedup_all|speedup|exp_up|critical_up|reinforce_up|limit_lv|item_period_flag|item_period|remain_time(s)| */
					result_packet += 	list_eq.get(eq).get("item_id").toString() 		+"|"+
										list_eq.get(eq).get("item_uniqueID").toString() +"|"+
							 			list_eq.get(eq).get("item_type").toString() 	+"|"+
							 			list_eq.get(eq).get("item_nm").toString() 		+"|"+
							 			list_eq.get(eq).get("item_img_no").toString() 	+"|"+							 			
							 			list_eq.get(eq).get("rare_degree").toString() 	+"|"+
										list_eq.get(eq).get("item_usage").toString() 	+"|"+
										list_eq.get(eq).get("item_cnt").toString() 		+"|"+
										list_eq.get(eq).get("item_desc").toString() 	+"|"+
										list_eq.get(eq).get("item_price").toString() 	+"|"+										
										list_eq.get(eq).get("item_value").toString() 	+"|"+
										list_eq.get(eq).get("item_att").toString() 		+"|"+
										list_eq.get(eq).get("item_def").toString() 		+"|"+
										list_eq.get(eq).get("HP").toString() 			+"|"+
										list_eq.get(eq).get("SP").toString() 			+"|"+					
										list_eq.get(eq).get("abnormal").toString() 		+"|"+
										list_eq.get(eq).get("speedup_all").toString() 	+"|"+
										list_eq.get(eq).get("speedup").toString() 		+"|"+
										list_eq.get(eq).get("exp_up").toString() 		+"|"+
										list_eq.get(eq).get("critical_up").toString() 	+"|"+
							 			list_eq.get(eq).get("reinforce_up").toString() 	+"|"+
							 			list_eq.get(eq).get("limit_lv").toString() 		+"|"+
							 			list_eq.get(eq).get("item_period_flag").toString() 	+"|"+
							 			list_eq.get(eq).get("item_period").toString() 		+"|"+
							 			list_eq.get(eq).get("remain_time").toString() 		+"|"+
							 			list_eq.get(eq).get("class").toString() 		+"|"+							 			
										list_eq.get(eq).get("item_grade").toString() 	+"|"+
										list_eq.get(eq).get("item_level").toString() 	+"|"+
										list_eq.get(eq).get("item_exp").toString() 		+"|"+
										list_eq.get(eq).get("item_rfc_flag").toString() +"|"+
										list_eq.get(eq).get("item_rfc_mtr_flag").toString() +"|"+
										list_eq.get(eq).get("target_exp").toString() +"|"+
										list_eq.get(eq).get("socket_equip_flag").toString()	+"|";
					
				//
				
					//몬스터 장착아이템 소켓마스터정보 List 개수
					
					int sok_cnt =0;
					
					for(int socket=0; socket<list_sok.size(); socket++){
						sok_item_id = list_sok.get(socket).get("item_id").toString();
					
						if (eq_item_id.equals(sok_item_id)) {
							sok_cnt++;
						}
					}
					result_packet += sok_cnt + "|";
					//item_socket_cnt|socket_pos|socket_type|my_socket_pos|tre_id|tre_id_sn|tre_type|tre_level|tre_img_no|tre_nm|tre_hp|tre_att|tre_def|tre_critical_up|tre_miss_up|
					for(int socket=0;socket<list_sok.size();socket++){
						sok_item_id		= list_sok.get(socket).get("item_id").toString();
						
						if (eq_item_id.equals(sok_item_id)) {
							result_packet += 	list_sok.get(socket).get("socket_pos").toString() +"|"+
												list_sok.get(socket).get("tre_type").toString() +"|";
						}
					
					}//end socket for
					//몬스터 장착아이템 소켓정보 List 개수	
					int my_sok_cnt =0;
							
					for(int socket=0; socket<list_my_sok.size(); socket++){
						my_sok_item_id = list_my_sok.get(socket).get("item_id").toString();
						my_sok_item_uniqueid = list_my_sok.get(socket).get("item_uniqueID").toString();
					
						if (eq_item_id.equals(my_sok_item_id) && eq_item_uniqueID.equals(my_sok_item_uniqueid)) {
							my_sok_cnt++;
						}
					}
					result_packet += my_sok_cnt +"|";
					
					//item_setSocket_cnt|item_id|item_uniqueID|my_socket_pos|tre_id|tre_id_sn|tre_type|tre_level|tre_img_no|tre_nm|tre_hp|tre_att|tre_def|tre_critical_up|tre_miss_up|
					for(int my_socket=0;my_socket<list_my_sok.size();my_socket++){
						my_sok_item_id = list_my_sok.get(my_socket).get("item_id").toString();
						my_sok_item_uniqueid = list_my_sok.get(my_socket).get("item_uniqueID").toString();
						
						if (eq_item_id.equals(my_sok_item_id) && eq_item_uniqueID.equals(my_sok_item_uniqueid)) {
							result_packet += 	list_my_sok.get(my_socket).get("socket_pos").toString() +"|" +
												list_my_sok.get(my_socket).get("tre_id").toString() +"|" +
												list_my_sok.get(my_socket).get("tre_id_sn").toString() +"|" +
												list_my_sok.get(my_socket).get("tre_type").toString() +"|" +
												list_my_sok.get(my_socket).get("tre_level").toString() +"|" +
												list_my_sok.get(my_socket).get("tre_img_no").toString() +"|" +
												list_my_sok.get(my_socket).get("tre_nm").toString() +"|" +
												list_my_sok.get(my_socket).get("hp").toString() +"|" +
												list_my_sok.get(my_socket).get("att").toString() +"|" +
												list_my_sok.get(my_socket).get("def").toString() +"|" +
												list_my_sok.get(my_socket).get("critical_up").toString() +"|" +
												list_my_sok.get(my_socket).get("miss_up").toString() +"|";
						}
					}//end my socket for
				}
			}//end eq for	
					
		}//end mon for
	
		

}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(pstmt_sk != null) pstmt_sk.close();
	if(rs_sk != null) rs_sk.close();
	if(pstmt_eq != null) pstmt_eq.close();
	if(rs_eq != null) rs_eq.close();
}	%>
<%=P_type%>|<%=result_packet%>