<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T441";

String mon_id 		= request.getParameter("mon_id");
String user_mon_sn 	= request.getParameter("user_mon_sn");

int result 			 = 0;	//결과값
int rf_add_prob 	 = 0;	//강화추가성공확률
int rf_add_prob_cost = 0;	//강화추가성공확률 비용
int rf_cost 		 = 0; 	//강화비용

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
//강화정보 조회  	
	sql.append(" Call abn_getReinforceInfo  (" + user_account+"," + mon_id + "," + user_mon_sn + ")\n") ;
	pstmt = Conn.prepareStatement(sql.toString());	
	//System.out.println (sql.toString());
	rs = pstmt.executeQuery();
		
	while(rs.next()){
		result			=rs.getInt("result");
		rf_add_prob		=rs.getInt("rf_add_prob");
		rf_add_prob_cost=rs.getInt("rf_add_prob_cost");
		rf_cost			=rs.getInt("rf_cost");		
	} 
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=result%>|<%=rf_add_prob%>|<%=rf_add_prob_cost%>|<%=rf_cost%>|