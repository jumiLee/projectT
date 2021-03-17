<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String tre_id = request.getParameter("tre_id");
String tre_sub_id = request.getParameter("tre_sub_id");
String P_type ="T35";

int result ;
result = 0;
try{
	
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" EXEC [dbo].[abn_SetTrap]  1," + user_account + "," + tre_id + "," + tre_sub_id + ", null \n");
	
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		result = rs.getInt("err_code");	//결과값 (0:성공, -1: 덫아이템 없음)
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|<%=result %>