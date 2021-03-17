<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T602";
String frd_account = request.getParameter("frd_account"); // 친구계정

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
	String eq_mon_id ; String eq_user_mon_sn ;

	//몬스터 종합 정보 
	Map<String, Object> map_total = null;
	List<Map<String, Object>> list_total = null;
	list_total = new ArrayList<Map<String, Object>>();
	String mon_id ; String user_mon_sn ;
	int skill_max_cnt = 2;
	int equip_max_cnt = 2;
	String result_packet = ""	;
	
	
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
//몬스터 정보
	//sql.append(" EXEC [dbo].[abn_getMonList] 1, " + frd_account + ", null,null \n");
	sql.append(" CALL abn_getMonList (1," + frd_account + ",null,null) \n");  
	//System.out.println ("monster:" + sql.toString());
	  
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
//몬스터 스킬 정보	
	sql.setLength(0);
	//sql.append(" EXEC [dbo].[abn_getMonSkill] 1, " + frd_account + ", null,null \n");
	sql.append(" CALL abn_getMonSkill (1," + frd_account + ",null,null) \n");  
	//System.out.println ("monster:" + sql.toString());
	pstmt_sk = Conn.prepareStatement(sql.toString());
	rs_sk 	 = pstmt_sk.executeQuery();
	list_sk = new ArrayList<Map<String, Object>>();
	
//몬스터 장착 정보	
	sql.setLength(0);
	//sql.append(" EXEC [dbo].[abn_getMonEquip] 1, " + frd_account + ", null,null \n");
	sql.append(" CALL abn_getMonEquip (1," + frd_account + ",null,null) \n");  
	//System.out.println ("monster:" + sql.toString());
	pstmt_eq = Conn.prepareStatement(sql.toString());
	rs_eq 	 = pstmt_eq.executeQuery();	
	list_eq = new ArrayList<Map<String, Object>>();
	
//Save monster info Map 
	while(rs.next()){
		map = new HashMap();
		//user_mon_sn|mon_id|mon_level|mon_type|max_exp|mon_exp|HP|cur_HP|carry_flag|mon_nm|ATT_STR|DEF_STR|STR_cnt|win_cnt|lose_cnt|deck_flag|rare_degree|mon_BP
		
		map.put("mon_cnt"		, rs.getInt("mon_cnt"));
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
		
		list.add(map);
		tot_cnt++;
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
		//item_cnt|item_id|item_uid|item_type|item_name|item_ATT|item_DEF|item_price|
		map_eq.put("equip_cnt"		, rs_eq.getInt("equip_cnt"));
		map_eq.put("mon_id"			, rs_eq.getInt("mon_id"));
		map_eq.put("user_mon_sn"	, rs_eq.getInt("user_mon_sn"));
		map_eq.put("item_id"		, rs_eq.getInt("item_id"));
		map_eq.put("item_uniqueID"	, rs_eq.getInt("item_uniqueID"));
		map_eq.put("item_type"		, rs_eq.getInt("item_type"));
		map_eq.put("item_nm"		, rs_eq.getString("item_nm"));
		map_eq.put("item_ATT"		, rs_eq.getInt("item_ATT"));
		map_eq.put("item_DEF"		, rs_eq.getInt("item_DEF"));
		map_eq.put("item_price"		, rs_eq.getInt("item_price"));
		
		list_eq.add(map_eq);
		
		tot_eq_cnt ++;
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
							list.get(i).get("mon_rare_degree").toString() 	+"|"+
							list.get(i).get("mon_BP").toString() 		+"|";
		
				
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
			
			if (mon_id.equals(eq_mon_id) && user_mon_sn.equals(eq_user_mon_sn) ) {
				//item_cnt|item_id|item_uid|item_type|item_name|item_ATT|item_DEF|item_price|
				result_packet += 	list_eq.get(eq).get("item_id").toString() 		+"|"+
						 			list_eq.get(eq).get("item_uniqueID").toString() +"|"+
						 			list_eq.get(eq).get("item_type").toString() 	+"|"+
						 			list_eq.get(eq).get("item_nm").toString() 		+"|"+
						 			list_eq.get(eq).get("item_ATT").toString() 		+"|"+
						 			list_eq.get(eq).get("item_DEF").toString() 		+"|"+
						 			list_eq.get(eq).get("item_price").toString() 	+"|";
				
			}
			
		}//end eq for
		
	}
	
	//System.out.println (result_packet);
	
	/*for(int tot=0;tot<list.size();tot++){
		System.out.println (tot + ":" + list_total.get(tot).get("moster") );
		System.out.println (tot + ":" + list_total.get(tot).get("skill1") );
		
	}*/

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