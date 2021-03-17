<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T692";
String order_str  = request.getParameter("order_str"); 		//정렬조건

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;

try{
	
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getFriendList  (6,"+ user_account + ",'" + order_str + "')\n") ; 
//System.out.println (sql.toString());
	
	pstmt = Conn.prepareStatement(sql.toString());
	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){
		map = new HashMap();
		map.put("frd_account", rs.getInt("frd_account"));
		map.put("frd_nickname", rs.getString("frd_nickname"));
		map.put("frd_image", rs.getInt("frd_image"));
		map.put("frd_level", rs.getInt("frd_level"));
		map.put("frd_cnt", rs.getInt("frd_cnt"));	
		map.put("frd_mon_id", rs.getInt("frd_mon_id"));		
		map.put("frd_mon_nm", rs.getString("frd_mon_nm"));
		map.put("frd_mon_att", rs.getInt("frd_mon_att"));
		map.put("frd_mon_def", rs.getInt("frd_mon_def"));
		map.put("frd_mon_lv", rs.getInt("frd_mon_lv"));
		map.put("frd_mon_hp", rs.getInt("frd_mon_hp"));
		map.put("frd_mon_type", rs.getInt("frd_mon_type"));
		map.put("frd_mon_rare_degree", rs.getInt("frd_mon_rare_degree"));
		map.put("frd_flag", rs.getInt("frd_flag"));
		list.add(map);
		tot_cnt++;
	} 
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=tot_cnt%>|
<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("frd_account")%>|<%=list.get(i).get("frd_nickname")%>|<%=list.get(i).get("frd_image")%>|<%=list.get(i).get("frd_level")%>|<%=list.get(i).get("frd_cnt")%>|<%=list.get(i).get("frd_mon_id")%>|<%=list.get(i).get("frd_mon_nm")%>|<%=list.get(i).get("frd_mon_att")%>|<%=list.get(i).get("frd_mon_def")%>|<%=list.get(i).get("frd_mon_lv")%>|<%=list.get(i).get("frd_mon_hp")%>|<%=list.get(i).get("frd_mon_type")%>|<%=list.get(i).get("frd_mon_rare_degree")%>|<%=list.get(i).get("frd_flag")%>|
<%}%>