<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T413";
String mon_category = request.getParameter("mon_category");
int result_cd = 0; //결과코드
 
CallableStatement cs = null;
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
 	/*
	sql.append(" Exec [abn_MgmtBook]	\n"); 
	sql.append(" 3,  					\n");
	sql.append(" "+ user_account +",  	\n");
	sql.append(" "+ mon_category +",  	\n");
	sql.append(" ? 						\n");	//result_flag
	cs = Conn.prepareCall(sql.toString());
	cs.registerOutParameter(1, java.sql.Types.INTEGER);
	cs.execute();
	result_cd 	= cs.getInt(1);
	*/
	cs = Conn.prepareCall("{call abn_MgmtBook(?,?,?,?)}");
	cs.setInt(1,3);
	cs.setString(2,user_account);
	cs.setString(3,mon_category);
	
	cs.registerOutParameter(4, java.sql.Types.INTEGER);	
	cs.execute();
	result_cd 	= cs.getInt(4);
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=result_cd %>|