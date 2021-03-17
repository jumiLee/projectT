<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T562";

String job_type		= request.getParameter("job_type");
String item_id		= request.getParameter("item_id");
String item_uniqueID= request.getParameter("item_uniqueID");


int cost_type = 0;
int cost = 0;

try{
		
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

	sql.append(" Call abn_getItemCost  (" + job_type + "," + user_account+"," + item_id + "," + item_uniqueID+ ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	
	if(rs.next()){  	
		cost_type	= rs.getInt("cost_type");
		cost 		= rs.getInt("cost");					
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
<%=P_type %>|<%=job_type%>|<%=cost_type%>|<%=cost%>|