<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String tre_id = request.getParameter("tre_id");
String P_type ="T34";

int rwd_point = 0;
CallableStatement cs = null;
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	
	cs = Conn.prepareCall("{call abn_GetUserPoint_out(?,?,?,?,?)}");
	cs.setInt(1,1);
	cs.setString(2,user_account);
	cs.setString(3,tre_id);
	
	cs.registerOutParameter(4, java.sql.Types.INTEGER);	
	cs.registerOutParameter(5, java.sql.Types.VARCHAR);
	cs.execute();
	rwd_point 	= cs.getInt(4);

	//System.out.println("rwd_point:" + rwd_point);
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|<%=rwd_point %>|