<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.collections.map.HashedMap"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@ include file="./DBConnection.jsp"%> 
<%
String P_type ="T111";

String m_no = request.getParameter("m_no");
//String m_no = "'01090430750'"; 
int result = 0;
int user_account = 0;
try{   
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getUserInfoByAccountNo  (" + m_no + " )\n") ;
	//System.out.println (sql.toString());
	System.out.println ("Remote Addr: " + request.getRemoteAddr()  +" / " + "Remote Host: " + request.getRemoteHost() + " / " + "X-Forward-For : " + request.getHeader("x-forwarded-for"));
	System.out.println ("m_no:" + m_no);
	
	pstmt = Conn.prepareStatement(sql.toString());	
	rs = pstmt.executeQuery();  
	while(rs.next()){		
		result 		 = rs.getInt("result");
		user_account = rs.getInt("user_account");
		
		System.out.println("result:"+result);
		
		if (result == 0) {	//정상사용자면,	%>
			<jsp:forward page="user_main.jsp">	
			<jsp:param name="user_account" value="<%=user_account %>"/>
			</jsp:forward>
<%		//계정만 있고 캐릭터 생성안한경우		
		}else if(result == -4){	%>			
			<%@ include file="./moe_empty_header.jsp"%>
			<%=P_type%>|<%=result %>|
<%    
		//정상사용자이면, 메인으로 이동
		}else{		%>
			<%@ include file="./moe_header.jsp"%>
			<%=P_type%>|<%=result %>|
<%			
		}
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>