<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T584";
String job_type 		= request.getParameter("job_type");
String item_category 	= request.getParameter("item_category");
String item_type 		= request.getParameter("item_type");

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
String result_packet = ""	;

try{
	
	    
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getMstItemList  (" + job_type + ","+ item_category + "," + item_type + ",0)\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		/*
			item_id, item_nm, item_category, item_type, item_price, unit_cd, item_desc, item_value, item_cnt, class, rare_degree,
			ATT, DEF, HP, SP, abnormal, speedup_all, speedup, exp_up, critical_up, reinforce_up, limit_lv, 
			item_period_flag, item_period, item_dup_flag, item_new_flag, item_order, item_img_no, item_equip_flag, item_grade, 
			item_rfc_flag, item_rfc_mtr_flag, socket_equip_flag
		*/
		map.put("item_id"		, rs.getInt("item_id"));
		map.put("item_nm"		, rs.getString("item_nm"));  
		map.put("item_category"	, rs.getInt("item_category"));
		map.put("item_type"		, rs.getInt("item_type"));	
		map.put("item_price"	, rs.getInt("item_price"));
		map.put("unit_cd"		, rs.getInt("unit_cd"));
		map.put("item_desc"		, rs.getString("item_desc"));
		map.put("item_value"	, rs.getInt("item_value"));
		map.put("item_cnt"		, rs.getInt("item_cnt"));
		map.put("class"			, rs.getInt("class"));
		map.put("rare_degree"	, rs.getInt("rare_degree"));
		
		map.put("ATT"			, rs.getInt("ATT"));
		map.put("DEF"			, rs.getInt("DEF"));
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
		map.put("item_dup_flag"	, rs.getInt("item_dup_flag"));
		map.put("item_new_flag"	, rs.getInt("item_new_flag"));
		map.put("item_order"	, rs.getInt("item_order"));
		map.put("item_img_no"	, rs.getInt("item_img_no"));
		map.put("item_equip_flag"	, rs.getInt("item_equip_flag"));
		map.put("item_grade"	, rs.getInt("item_grade"));
		
		map.put("item_rfc_flag"		, rs.getInt("item_rfc_flag"));
		map.put("item_rfc_mtr_flag"	, rs.getInt("item_rfc_mtr_flag"));
		map.put("socket_equip_flag"	, rs.getInt("socket_equip_flag"));
		
		list.add(map);
		tot_cnt ++;
	}
	
	if (list == null){
		//System.out.println ("T584 : ArrayList is null");		
	}
	
	for(int i=0;i<list.size();i++){
		
		/*
		item_id, item_nm, item_category, item_type, item_price, unit_cd, item_desc, item_value, item_cnt, class, rare_degree,
		ATT, DEF, HP, SP, abnormal, speedup_all, speedup, exp_up, critical_up, reinforce_up, limit_lv, 
		item_period_flag, item_period, item_dup_flag, item_new_flag, item_order, item_img_no, item_equip_flag, item_grade, 
		item_rfc_flag, item_rfc_mtr_flag, socket_equip_flag
	*/
		result_packet +=  	list.get(i).get("item_id").toString() 			+"|"+
							list.get(i).get("item_nm").toString() 			+"|"+
							list.get(i).get("item_category").toString() 	+"|"+
							list.get(i).get("item_type").toString() 		+"|"+
							list.get(i).get("item_price").toString() 		+"|"+
							list.get(i).get("unit_cd").toString() 			+"|"+
							list.get(i).get("item_desc").toString() 		+"|"+
							list.get(i).get("item_value").toString() 		+"|"+
							list.get(i).get("item_cnt").toString() 			+"|"+
							list.get(i).get("class").toString() 			+"|"+
							list.get(i).get("rare_degree").toString() 		+"|"+							
							list.get(i).get("ATT").toString() 				+"|"+
							list.get(i).get("DEF").toString() 				+"|"+
							list.get(i).get("HP").toString() 				+"|"+
							list.get(i).get("SP").toString()				+"|"+
							list.get(i).get("abnormal").toString() 			+"|"+
							list.get(i).get("speedup_all").toString() 		+"|"+
							list.get(i).get("speedup").toString() 			+"|"+
							list.get(i).get("exp_up").toString() 			+"|"+
							list.get(i).get("critical_up").toString() 		+"|"+
							list.get(i).get("reinforce_up").toString() 		+"|"+
							list.get(i).get("limit_lv").toString() 			+"|"+							
							list.get(i).get("item_period_flag").toString() 	+"|"+
							list.get(i).get("item_period").toString() 		+"|"+
							list.get(i).get("item_dup_flag").toString() 	+"|"+
							list.get(i).get("item_new_flag").toString() 	+"|"+
							list.get(i).get("item_order").toString() 		+"|"+
							list.get(i).get("item_img_no").toString() 		+"|"+
							list.get(i).get("item_equip_flag").toString() 	+"|"+
							list.get(i).get("item_grade").toString() 		+"|"+
							list.get(i).get("item_rfc_flag").toString() 	+"|"+		
							list.get(i).get("item_rfc_mtr_flag").toString() +"|"+
							list.get(i).get("socket_equip_flag").toString() +"|";
	}
		
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>

<%=P_type %>|<%=tot_cnt %>|<%=result_packet%>