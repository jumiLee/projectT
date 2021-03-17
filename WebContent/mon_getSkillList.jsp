<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T420";
String mon_id = request.getParameter("mon_id");
String user_mon_sn = request.getParameter("user_mon_sn");

int skill_lvup_my_point=0; 

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getMonSkill  (4,"+ user_account + "," + mon_id + "," + user_mon_sn + ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	 
	while(rs.next()){
		
		//mon_id|user_mon_sn|skill_my_point|
		//tot_cnt|skill_id|skill_nm|skill_lv|skill_cooltime|skill_att|skill_def|skill_hp|skill_desc|skill_point|skill_gold|skill_min_lv|skill_max_lv|
		skill_lvup_my_point = rs.getInt("skill_my_point");
		
		map = new HashMap();
		map.put("skill_id"		, rs.getInt("skill_id"));
		map.put("skill_nm"		, rs.getString("skill_nm"));
		map.put("skill_lv"		, rs.getInt("skill_lv"));
		map.put("skill_cooltime", rs.getInt("skill_cooltime"));		
		map.put("skill_att"		, rs.getInt("skill_att"));
		map.put("skill_def"		, rs.getInt("skill_def"));
		map.put("skill_hp"		, rs.getInt("skill_hp"));
		map.put("skill_desc"	, rs.getString("skill_desc"));
		map.put("skill_point"	, rs.getInt("skill_point"));
		map.put("skill_gold"	, rs.getInt("skill_gold"));
		map.put("skill_open_lv"	, rs.getInt("skill_open_lv"));
		map.put("skill_max_lv"	, rs.getInt("skill_max_lv"));
		map.put("skill_img_no"	, rs.getInt("skill_img_no"));		
		
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

<%=P_type %>|<%=mon_id%>|<%=user_mon_sn%>|<%=skill_lvup_my_point%>|<%=tot_cnt %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("skill_id")%>|<%=list.get(i).get("skill_nm")%>|<%=list.get(i).get("skill_lv")%>|<%=list.get(i).get("skill_cooltime")%>|<%=list.get(i).get("skill_att")%>|<%=list.get(i).get("skill_def")%>|<%=list.get(i).get("skill_hp")%>|<%=list.get(i).get("skill_desc")%>|<%=list.get(i).get("skill_point")%>|<%=list.get(i).get("skill_gold")%>|<%=list.get(i).get("skill_open_lv")%>|<%=list.get(i).get("skill_max_lv")%>|<%=list.get(i).get("skill_img_no")%>|
<%}%>