<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="";

String job_type = request.getParameter("job_type");
if (job_type.equals("1")){
	P_type = "T113";
}else if (job_type.equals("2")){
	P_type = "T114";
}

CallableStatement cs = null;
int result_cd = 0;

try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
//1. 계정 생성
	
	cs = Conn.prepareCall("{call abn_LeaveUser(?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
		
	cs.registerOutParameter(3, java.sql.Types.INTEGER);	
	cs.execute();
	result_cd 	= cs.getInt(3);
		
	System.out.println("탈퇴신청/철회 결과(" +user_account + "):"+ result_cd);

	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(cs != null) cs.close();
	if(pstmt != null) pstmt.close();	
	if(rs != null) rs.close();
}	
%>
<%@ include file="./moe_empty_header.jsp"%>
<%=P_type%>|<%=result_cd%>|