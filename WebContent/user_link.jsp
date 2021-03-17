<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T118";

String ch_type	= request.getParameter("ch_type");	//채널타입
String ch_id	= request.getParameter("ch_id");	//채널아이디	

CallableStatement cs = null;
int result_cd = 0;
int new_user_account = 0;
int achv_result = 0;

try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

	cs = Conn.prepareCall("{call abn_linkUserAccount(?,?,?,?,?)}");
	cs.setString(1,user_account);
	cs.setString(2,ch_type);
	cs.setString(3,ch_id);
		
	cs.registerOutParameter(4, java.sql.Types.INTEGER);	
	cs.registerOutParameter(5, java.sql.Types.INTEGER);
	cs.execute();
	
	new_user_account= cs.getInt(4);
	result_cd 	= cs.getInt(5);
		
System.out.println("계정연동 결과(" +user_account + ")->("+ new_user_account + ") :" + result_cd);
	//System.out.println("ch_type : ch_id" +user_account + "->"+ ch_type + " :" + ch_id);
	if(result_cd == 0) {
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,4);
		cs.setInt(5,31);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //achv_result_cd
		cs.execute();

		achv_result = cs.getInt(7);
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(cs != null) cs.close();
	if(pstmt != null) pstmt.close();	
	if(rs != null) rs.close();
}	
%>
<%@ include file="./moe_empty_header.jsp"%>
<%=P_type%>|<%=result_cd%>|<%=new_user_account%>|