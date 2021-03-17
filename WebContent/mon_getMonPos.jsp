<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T402";
int job_type = 8;
String mon_id 		= request.getParameter("mon_id");
String user_mon_sn 	= request.getParameter("user_mon_sn");
 
String result = ""; //결과값 
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" EXEC abn_getMonList " + job_type + ","+ user_account + "," + mon_id + "," + user_mon_sn + " \n");
	
	pstmt = Conn.prepareStatement(sql.toString());
	
	System.out.println (sql.toString());
	
	rs = pstmt.executeQuery();
	if(rs.next()){
		result = rs.getString("pos_info");
	}else{
		result = "-1";
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=mon_id%>|<%=user_mon_sn%>|<%=result%>|