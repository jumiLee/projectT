<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T13";

String job_type = request.getParameter("job_type");

int cur_cnt = 0;
int max_cnt = 0;

try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	//sql.append(" EXEC [dbo].[abn_getUserInfo_cnt]  " + job_type + "," + user_account + " \n");
	sql.append(" Call abn_getUserInfo_cnt  (" + job_type + "," + user_account + ")\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
	 
	//System.out.println(sql.toString());
	
	rs = pstmt.executeQuery();
	

	while(rs.next()){
		cur_cnt = rs.getInt("my_cnt");
		max_cnt = rs.getInt("max_cnt");
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
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|<%=job_type%>|<%=cur_cnt%>|<%=max_cnt%>|