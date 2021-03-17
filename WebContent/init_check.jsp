<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_empty_header.jsp"%>
<%
String P_type ="T000";

//Return Value 
	String cur_ver = "0" ; 
	String src_ver = "0";
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

	sql.setLength(0);
	sql.append(" Call abn_getInitData  (1, null )\n") ;
	//System.out.println ("Cur_Version:" + sql.toString());
	  
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		cur_ver = rs.getString("cur_ver");
		src_ver = rs.getString("src_ver");
	}

}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();	

}	%>
<%=P_type%>|<%=cur_ver%>|<%=src_ver%>|