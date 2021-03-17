<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T032";
String job_type = request.getParameter("job_type");
if (job_type.equals("3")) {
	P_type = "T034";
}
String def_id = request.getParameter("def_id");
String def_result = request.getParameter("def_result");
int result_cd = 0; //결과코드
 

StringBuffer sql2 = new StringBuffer();
ResultSet rs2 = null;
PreparedStatement pstmt2 = null;
List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int def_mon_id= 0; 	int def_mon_sn = 0;
int v_mon_id = 0; int v_mon_sn = 0;

CallableStatement cs = null;
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
 
	/*
	sql.append(" Exec [abn_MgmtDefense]	\n"); 
	sql.append(" "+ job_type +",  		\n");
	sql.append(" "+ user_account +",  	\n");
	sql.append(" "+ def_id +",  		\n");
	sql.append(" "+ def_result +",  	\n");
	sql.append(" ? 						\n");	//result_flag
	
	cs = Conn.prepareCall(sql.toString());
	cs.registerOutParameter(1, java.sql.Types.INTEGER);
	cs.execute();
	result_cd 	= cs.getInt(1);
	*/
	cs = Conn.prepareCall("{call abn_MgmtDefense(?,?,?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,def_id);
	cs.setString(4,def_result);
	
	cs.registerOutParameter(5, java.sql.Types.INTEGER);	 //result_flag
	cs.execute();
	result_cd = cs.getInt(5);
	
	//System.out.println("result_cd:" + result_cd);

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
	<%=P_type %>|<%=result_cd %>|
