<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T501";
int job_type = 1;
String mon_id 		= request.getParameter("mon_id");
String user_mon_sn 	= request.getParameter("user_mon_sn");
String pos_info 	= request.getParameter("pos_info");
 
CallableStatement cs = null;
int result_cd = 0; //결과코드

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	sql.append(" Exec abn_MgmtUserMonsterEtc\n"); 
	sql.append(" "+ job_type 		+",  	\n");
	sql.append(" "+ user_account 	+",  	\n");
	sql.append(" '"+ mon_id 		+"',  	\n");
	sql.append(" '"+ user_mon_sn 	+"',  	\n");
	sql.append(" '"+ pos_info 		+"',  	\n");
	sql.append(" ? 							\n");	//result_cd
	
	cs = Conn.prepareCall(sql.toString());
	
//System.out.println(sql.toString());
	
	cs.registerOutParameter(1, java.sql.Types.INTEGER);
	cs.execute();
	
	result_cd 	= cs.getInt(1);
	
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