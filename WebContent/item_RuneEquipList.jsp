<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T5941";
String mon_id		= request.getParameter("mon_id"); 		
String user_mon_sn	= request.getParameter("user_mon_sn");

//룬장착 관련 
	List<Map<String, Object>> list = null;
	Map<String, Object> map = null;
	int tot_cnt ;
	tot_cnt = 0;
	String eq_item_id;
	
	String result_packet = "" ; //Result Packet
	
try{
	   
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
// 장착룬 정보 	
	sql.append(" Call abn_getMonEquip (2,"+user_account+ "," + mon_id + "," + user_mon_sn + ") \n");
//System.out.println ("abn_getMonEquip:" + sql.toString());
  	pstmt = Conn.prepareStatement(sql.toString());
  	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		/*	total_cnt|
			rune_pos|item_id|item_uniqueID|item_type|item_nm|item_img_no|item_rare_degree|item_usage|item_cnt|item_desc|
			item_price|item_value|ATT|DEF|HP|SP|abnormal|speedup_all|speedup|exp_up|
			critical_up|reinforce_up|limit_lv|item_period_flag|item_period|remain_time(s)||item_grade|item_lv|item_exp|
			item_rfc_flag|item_rfc_mtr_flag|target_exp|socket_equip_flag|*/
		
		map.put("rune_pos"		, rs.getInt("rune_pos"));	
		map.put("item_id"		, rs.getInt("item_id"));
		map.put("item_uniqueID"	, rs.getInt("item_uniqueID"));
		map.put("item_type"		, rs.getInt("item_type"));
		map.put("item_nm"		, rs.getString("item_nm"));
		map.put("item_img_no"	, rs.getInt("item_img_no"));
		
		map.put("rare_degree"	, rs.getInt("rare_degree"));
		map.put("item_usage"	, rs.getInt("item_usage"));
		map.put("item_cnt"		, rs.getInt("item_cnt"));
		map.put("item_desc"		, rs.getString("item_desc"));
		map.put("item_price"	, rs.getInt("item_price"));
		
		map.put("item_value"	, rs.getInt("item_value"));
		map.put("item_att"		, rs.getInt("item_att"));
		map.put("item_def"		, rs.getInt("item_def"));
		map.put("HP"			, rs.getInt("HP"));
		map.put("SP"			, rs.getInt("SP"));
		
		map.put("abnormal"		, rs.getInt("abnormal"));
		map.put("speedup_all"	, rs.getInt("speedup_all"));
		map.put("speedup"		, rs.getInt("speedup"));
		map.put("exp_up"		, rs.getInt("exp_up"));
		map.put("critical_up"	, rs.getInt("critical_up"));

		map.put("reinforce_up"	, rs.getInt("reinforce_up"));
		map.put("limit_lv"		, rs.getInt("limit_lv"));
		map.put("item_period_flag"	, rs.getInt("item_period_flag"));
		map.put("item_period"	, rs.getInt("item_period"));
		map.put("remain_time"	, rs.getInt("remain_time"));
		
		map.put("class"			, rs.getInt("class"));  		
		map.put("item_grade"	, rs.getInt("item_grade"));  	
		map.put("item_level"	, rs.getInt("item_level"));  	
		map.put("item_exp"		, rs.getInt("item_exp"));  		
		map.put("item_rfc_flag"	, rs.getInt("item_rfc_flag"));  
		
		map.put("item_rfc_mtr_flag"	, rs.getInt("item_rfc_mtr_flag"));  	
		map.put("target_exp"		, rs.getInt("target_exp"));  			
		map.put("socket_equip_flag"	, rs.getInt("socket_equip_flag"));	
		
		list.add(map);
		tot_cnt ++;
	}
	
//몬스터 장착정보 List
	for(int eq=0;eq<list.size();eq++){
		
		result_packet += 	list.get(eq).get("rune_pos").toString() 	+"|"+
							list.get(eq).get("item_id").toString() 		+"|"+
				 			list.get(eq).get("item_uniqueID").toString()+"|"+
				 			list.get(eq).get("item_type").toString() 	+"|"+
				 			list.get(eq).get("item_nm").toString() 		+"|"+
				 			list.get(eq).get("item_img_no").toString() 	+"|"+							 			
				 			list.get(eq).get("rare_degree").toString() 	+"|"+
							list.get(eq).get("item_usage").toString() 	+"|"+
							list.get(eq).get("item_cnt").toString() 	+"|"+
							list.get(eq).get("item_desc").toString() 	+"|"+
							list.get(eq).get("item_price").toString() 	+"|"+										
							list.get(eq).get("item_value").toString() 	+"|"+
							list.get(eq).get("item_att").toString() 	+"|"+
							list.get(eq).get("item_def").toString() 	+"|"+
							list.get(eq).get("HP").toString() 			+"|"+
							list.get(eq).get("SP").toString() 			+"|"+					
							list.get(eq).get("abnormal").toString() 	+"|"+
							list.get(eq).get("speedup_all").toString() 	+"|"+
							list.get(eq).get("speedup").toString() 		+"|"+
							list.get(eq).get("exp_up").toString() 		+"|"+
							list.get(eq).get("critical_up").toString() 	+"|"+
				 			list.get(eq).get("reinforce_up").toString() +"|"+
				 			list.get(eq).get("limit_lv").toString() 	+"|"+
				 			list.get(eq).get("item_period_flag").toString() 	+"|"+
				 			list.get(eq).get("item_period").toString() 	+"|"+
				 			list.get(eq).get("remain_time").toString() 	+"|"+
				 			list.get(eq).get("class").toString() 		+"|"+							 			
							list.get(eq).get("item_grade").toString() 	+"|"+
							list.get(eq).get("item_level").toString() 	+"|"+
							list.get(eq).get("item_exp").toString() 	+"|"+
							list.get(eq).get("item_rfc_flag").toString() +"|"+
							list.get(eq).get("item_rfc_mtr_flag").toString() +"|"+
							list.get(eq).get("target_exp").toString() 	+"|"+
							list.get(eq).get("socket_equip_flag").toString() +"|";
	}//end eq for
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>

<%=P_type %>|<%=tot_cnt %>|<%=result_packet%>