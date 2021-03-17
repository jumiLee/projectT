<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T038";
String job_type = request.getParameter("job_type");
if (job_type.equals("1")) {	//요일던전 이어하기
	P_type = "T038";
}

int result_cd = 0; //결과코드

CallableStatement cs = null;
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
 
	cs = Conn.prepareCall("{call abn_mgmtUserProperty(?,?,?,?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
	cs.setInt(3,401);
	cs.setInt(4,0);
	cs.setInt(5,0);
	
	cs.registerOutParameter(6, java.sql.Types.INTEGER);	 //result_flag
	cs.execute();
	result_cd = cs.getInt(6);
	
//System.out.println("이어하기 결과" + result_cd);

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
<%=P_type %>|<%=result_cd %>|<%=job_type %>
