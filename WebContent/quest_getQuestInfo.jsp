<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T502";
int job_type = 9;
String mon_id 		= request.getParameter("mon_id");
String user_mon_sn 	= request.getParameter("user_mon_sn");
 
int result = 0; //결과값
String quest_info = ""; 
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getMonList (" + job_type + ","+ user_account + "," + mon_id + "," + user_mon_sn + ") \n");
	
	pstmt = Conn.prepareStatement(sql.toString());
	
System.out.println ("get QuestInfo:" + sql.toString());
	
	rs = pstmt.executeQuery();
	if(rs.next()){
		quest_info = rs.getString("quest_info");
		if (quest_info.equals("-1")) {
			result = -1;
		}else if (quest_info.equals("-2")) {
			result = -2;
		}
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=result%>|<%=mon_id%>|<%=user_mon_sn%>|<%=quest_info%>|