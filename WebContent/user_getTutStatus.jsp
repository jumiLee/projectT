<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T116";
int tut_flag = 0;

try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	
	System.out.println("user_account:"+user_account);
	
	sql.append(" Call abn_getUserMstInfo  (1,"+ user_account + " )\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
	 
//System.out.println(sql.toString());
	
	rs = pstmt.executeQuery();
	

	while(rs.next()){
		tut_flag = rs.getInt("tut_flag");		
	}

	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();	
	
}	
%>
<% if (tut_flag == -4 ) {	//계정 생성 후 캐릭터 생성전 
	P_type ="T1161";
%>
	<%@ include file="./moe_empty_header_account.jsp"%>
	<%=P_type%>|<%=tut_flag%>|
<% }else{%>
	<%@ include file="./moe_header.jsp"%>
	<%=P_type%>|<%=tut_flag%>|
<% }	%>