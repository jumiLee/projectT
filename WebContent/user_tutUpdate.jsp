<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T117";
int result_flag =0; 

String tut_status = request.getParameter("tut_status"); //튜토리얼상태(0:skip, 1:완료)  


CallableStatement cs = null;

try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
/*	sql.append(" Exec [dbo].[abn_mgmtUserTutorial]  \n"); 
	sql.append(" "+ user_account 	+", 			\n");
	sql.append(" '"+ tut_status 	+"', 			\n");
	sql.append(" ? 									\n");	//result_flag
	
	//System.out.println (sql);
	cs = Conn.prepareCall(sql.toString());	
	cs.registerOutParameter(1, java.sql.Types.INTEGER);
	cs.execute();
	
	result_flag			= cs.getInt(1);
	*/
	cs = Conn.prepareCall("{call abn_mgmtUserTutorial(?,?,?)}");
	cs.setString(1,user_account);
	cs.setString(2,tut_status);
	
	cs.registerOutParameter(3, java.sql.Types.INTEGER);	 //result_flag
	cs.execute();
	result_flag = cs.getInt(3);
	
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
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|<%=result_flag%>|	