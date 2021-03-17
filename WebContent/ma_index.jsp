<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_empty_header.jsp"%>
<%
String P_type ="T003";
/*
int ma_type =1;
String msg ="정기점검중 입니다. (시간 오전 8:00~오전 10:00)";
*/	
int ma_type =0;
String msg ="  ";
try{

	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

	sql.setLength(0);
	sql.append(" select var_value as ma_type, var_desc as msg  from MGR_VARIABLE where var_category=2 and var_id='MA_STATUS' \n");	//현재 버전 조회
	//System.out.println ("Cur_Version:" + sql.toString());
	  
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		ma_type = rs.getInt("ma_type");
		msg = rs.getString("msg");
	}

}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();	

}	%>
<%=P_type%>|<%=ma_type%>|<%=msg%>|