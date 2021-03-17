<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T039";
String dun_type = request.getParameter("dun_type");
String dun_id 	= request.getParameter("dun_id");

int result_cd = 0; //결과코드

CallableStatement cs = null;
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
 
	cs = Conn.prepareCall("{call abn_mgmtDungeonBattle(?,?,?,?,?)}");
	cs.setInt(1,1);
	cs.setString(2,user_account);
	cs.setString(3,dun_type);
	cs.setString(4,dun_id);
	
	cs.registerOutParameter(5, java.sql.Types.INTEGER);	 //result_flag
	cs.execute();
	result_cd = cs.getInt(5);
	
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
<%=P_type %>|<%=result_cd %>|
