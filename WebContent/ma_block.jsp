<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_empty_header.jsp"%>
<%
String P_type ="T003";

int ma_type =-1;
String msg ="죄송합니다. 사정상 입장하실 수 없습니다. 고객센터에 문의하시기 바랍니다. ";
try{

		System.out.println (user_account);
	/*
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

	sql.setLength(0);
	sql.append(" EXEC [dbo].[abn_getInitData] 1 , null \n");	//현재 버전 조회
	//System.out.println ("Cur_Version:" + sql.toString());
	  
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		cur_ver = rs.getString("cur_ver");
		src_ver = rs.getString("src_ver");
	}
*/
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();	

}	%>
<%=P_type%>|<%=ma_type%>|<%=msg%>|