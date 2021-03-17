<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T311";
String bat_gold = request.getParameter("bat_gold");
String bat_account = request.getParameter("bat_account");
int result_cd = 0;

CallableStatement cs = null;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call abn_BattleStart(?,?,?,?,?,?)}");
	cs.setInt(1,4);
	cs.setString(2,user_account);
	cs.setString(3,bat_account);
	cs.setString(4,bat_gold);
	cs.setString(5,null);
	
	cs.registerOutParameter(6, java.sql.Types.INTEGER);	
	cs.execute();
	result_cd 	= cs.getInt(6);
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%@ include file="./moe_header.jsp"%>	
<%=P_type%>|<%=result_cd%>|
