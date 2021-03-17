<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T49";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;

try{
	
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" EXEC [dbo].[abn_getMainMonList] " + user_account + " \n");
	
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){
		map = new HashMap();
		map.put("mon_id"		, rs.getInt("mon_id"));
		map.put("mon_level"		, rs.getInt("mon_level"));
		map.put("user_mon_sn"	, rs.getInt("user_mon_sn"));
		
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
<%=P_type%>|<%=tot_cnt%>|<%for(int i=0;i<list.size();i++){%><%=list.get(i).get("mon_id")%>|<%=list.get(i).get("user_mon_sn")%>|<%}%>