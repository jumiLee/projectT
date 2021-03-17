<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T582";
String cash_id 		= request.getParameter("cash_id");
String device_type 	= request.getParameter("device_type");
String ch_type 		= request.getParameter("ch_type");
String ch_id 		= request.getParameter("ch_id");
String prod_id = "";
int result_cd = 0;

long trade_no = 0;	//거래번호 

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" EXEC [dbo].[abn_MgmtPayment] 1, " + user_account + "," + cash_id+ ",null," + device_type + "," + ch_type + ",'" + ch_id + "',null,null,null,null \n");
	pstmt = Conn.prepareStatement(sql.toString());
  	
  	
	//System.out.println("ch_type:" + ch_type);
	System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		trade_no 	= rs.getLong("trade_no");
		result_cd 	= rs.getInt("result_cd");
		prod_id 	= rs.getString("prod_id");
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
<%=P_type %>|<%=result_cd %>|<%=trade_no %>|<%=prod_id%>|