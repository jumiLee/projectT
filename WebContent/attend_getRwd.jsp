<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T122";
String job_type = request.getParameter("job_type");
String attend_type = request.getParameter("attend_type");
String day_no = request.getParameter("day_no");
int result_cd = 0; //결과코드
 
CallableStatement cs = null;
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

	cs = Conn.prepareCall("{call abn_MgmtAttend(?,?,?,?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,attend_type);
	cs.setString(4,day_no);
	cs.setString(5,null);
	
	cs.registerOutParameter(6, java.sql.Types.INTEGER);	 //Bat_Result
	cs.execute();
	
	result_cd 	= cs.getInt(6);
	
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