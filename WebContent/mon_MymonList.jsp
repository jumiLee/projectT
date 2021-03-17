<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T41";
%>
<%@include file="./mon_MyCommonInfo.jsp"%>

<%
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(pstmt_sk != null) pstmt_sk.close();
	if(rs_sk != null) rs_sk.close();
	if(pstmt_eq != null) pstmt_eq.close();
	if(rs_eq != null) rs_eq.close();
}	%>
<%=P_type%>|<%=result_packet%>