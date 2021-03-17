<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>	
<%
String P_type ="T252";
String job_type 	= request.getParameter("job_type"); 		//1:PVP
String bat_account 	= request.getParameter("bat_user_account"); //대상 계정
String bat_gold 	= request.getParameter("bat_gold"); //사용골드
String use_item 	= request.getParameter("use_item"); 		//사용아이템

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
CallableStatement cs = null;

int result_cd = 0; //업데이트 결과 

try{ 
		 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call abn_BattleStart(?,?,?,?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,bat_account);
	cs.setString(4,bat_gold);
	cs.setString(5,use_item);
	cs.registerOutParameter(6, java.sql.Types.INTEGER);	 //Update Result
	cs.execute();
	result_cd = cs.getInt(6);
		 
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();  
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	
%>
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=result_cd%>|