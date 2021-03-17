<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T0200";
String achv_type = request.getParameter("achv_type");
String achv_id = request.getParameter("achv_id");
String achv_cnt = request.getParameter("achv_cnt");

int result = 0;

CallableStatement cs = null;
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	/*
	sql.append(" {Call abn_mgmtUserAchv_out		\n");
	sql.append(" 1				   ,			\n");
	sql.append(" "+ user_account +",  			\n");
	sql.append(" "+ user_account +",  			\n");
	sql.append(" "+ achv_type 	 +",  			\n");
	sql.append(" "+ achv_id 	 +",			\n");
	sql.append(" "+ achv_cnt 	 +",			\n");
	sql.append(" ?	 							}\n");
	
	cs = Conn.prepareCall(sql.toString());*/
	cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
	cs.setInt(1,1);
	cs.setString(2,user_account);
	cs.setString(3,user_account);
	cs.setString(4,achv_type);
	cs.setString(5,achv_id);
	cs.setString(6,achv_cnt);
	
	cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //Bat_Result
	
	cs.execute();
	
	result = cs.getInt(7);
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=result%>|