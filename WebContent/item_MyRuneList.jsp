<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T5944";
int item_category = 11; //Rune Item

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	
	   
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getItemList  (7, " + user_account + "," + item_category + " )\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	 
	while(rs.next()){
		map = new HashMap();
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
		map.put("remain_time"	, rs.getInt("remain_time"));
		map.put("item_class"	, rs.getInt("class"));
		
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
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>

<%=P_type %>|<%=tot_cnt %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("item_id")%>|<%=list.get(i).get("item_uniqueID")%>|<%=list.get(i).get("item_type")%>|<%=list.get(i).get("item_nm")%>|<%=list.get(i).get("item_img_no")%>|
<%=list.get(i).get("rare_degree")%>|<%=list.get(i).get("item_usage")%>|<%=list.get(i).get("item_cnt")%>|<%=list.get(i).get("item_desc")%>|<%=list.get(i).get("item_price")%>|<%=list.get(i).get("item_value")%>|<%=list.get(i).get("ATT")%>|<%=list.get(i).get("DEF")%>|<%=list.get(i).get("HP")%>|<%=list.get(i).get("SP")%>|<%=list.get(i).get("abnormal")%>|<%=list.get(i).get("speedup_all")%>|<%=list.get(i).get("speedup")%>|<%=list.get(i).get("exp_up")%>|<%=list.get(i).get("critical_up")%>|<%=list.get(i).get("reinforce_up")%>|<%=list.get(i).get("limit_lv")%>|<%=list.get(i).get("item_period_flag")%>|<%=list.get(i).get("item_period")%>|<%=list.get(i).get("remain_time")%>|<%=list.get(i).get("item_class")%>|<%=list.get(i).get("item_grade")%>|<%=list.get(i).get("item_level")%>|<%=list.get(i).get("item_exp")%>|<%=list.get(i).get("item_rfc_flag")%>|<%=list.get(i).get("item_rfc_mtr_flag")%>|<%=list.get(i).get("target_exp")%>|<%=list.get(i).get("socket_equip_flag")%>|
<%}%>
