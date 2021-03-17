<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T547";
int job_type = 3;

String cash_id 	= request.getParameter("cash_id");
String payment_type = request.getParameter("payment_type");

 
CallableStatement cs = null;
int result_cd = 0; //결과코드

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call abn_MgmtCash(?,?,?,?,?,?)}");
	cs.setInt(1,job_type);
	cs.setString(2,user_account);
	cs.setInt(3,0);
	cs.setString(4,cash_id);
	cs.setString(5,payment_type);
	cs.registerOutParameter(6, java.sql.Types.INTEGER);

	cs.execute();
	
	result_cd = cs.getInt(6);
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=result_cd %>|<%=job_type%>|<%=cash_id%>|<%=payment_type%>|