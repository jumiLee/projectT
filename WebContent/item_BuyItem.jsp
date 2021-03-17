<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T54";
int job_type = 1;	//구매
String item_id = request.getParameter("item_id");
String item_cnt = request.getParameter("item_cnt");

CallableStatement cs = null;
int result_cd = 0; //결과코드
String result_msg = "" ; //결과메세지
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call abn_MgmtItem_out(?,?,?,?,?,?,?)}");
	cs.setInt(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,item_id);
	cs.setString(4,item_cnt);
	cs.setString(5,null);
	
	cs.registerOutParameter(6, java.sql.Types.INTEGER);	
	cs.registerOutParameter(7, java.sql.Types.VARCHAR);
	cs.execute();
	result_cd 	= cs.getInt(6);
	result_msg  = cs.getString(7);
	
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