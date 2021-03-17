<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T471";
int job_type = 1;
String deck_array = request.getParameter("deck_array");

 
CallableStatement cs = null;
int result_cd = 0; //결과코드
String result_msg = "" ; //결과메세지
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call abn_MgmtDeck(?,?,?,?,?)}");
	cs.setInt(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,deck_array);
	
	cs.registerOutParameter(4, java.sql.Types.INTEGER);	 //result_flag
	cs.registerOutParameter(5, java.sql.Types.VARCHAR);	 //result_flag
	cs.execute();
	
	result_cd 	= cs.getInt(4);
	result_msg 	= cs.getString(5);
	
//System.out.println ("Deck :(" + deck_array + ")" + sql.toString() + ",  Result: " + result_cd);
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=result_cd %>|<%=result_msg %>|