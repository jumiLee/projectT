<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T501";
int job_type = 2;
String mon_id 		= request.getParameter("mon_id");
String user_mon_sn 	= request.getParameter("user_mon_sn");
String quest_info 	= request.getParameter("quest_info");
 
CallableStatement cs = null;
int result_cd = 0; //결과코드

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call abn_MgmtUserMonsterEtc(?,?,?,?,?,?)}");
	cs.setInt(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,mon_id);
	cs.setString(4,user_mon_sn);
	cs.setString(5,quest_info);
	
	cs.registerOutParameter(6, java.sql.Types.INTEGER);	 //result_flag
	cs.execute();
	result_cd = cs.getInt(6);
	
//System.out.println("quest update(user_account,quest_info):" + user_account + "," + mon_id+ "," + user_mon_sn+ "," + quest_info);
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=result_cd %>|