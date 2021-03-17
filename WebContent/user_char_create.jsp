<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T115";
int result_flag =0; 

request.setCharacterEncoding("UTF-8");
//response.setContentType("text/html; charset=UTF-8");
String user_nickname 		= new String(request.getParameter("user_nickname").getBytes("iso-8859-1"), "UTF-8"); //닉네임  
//String user_nickname 		= request.getParameter("user_nickname");
String mon_id = request.getParameter("mon_id");
int result_character = 0;

CallableStatement cs = null;

try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
//1. 캐릭터(몬스터) 생성
	cs = Conn.prepareCall("{call abn_makeCharacter_APP(?,?,?,?,?)}");
	cs.setInt(1,0);	//프로시져 내에서 처리하는 것으로 변경
	cs.setString(2,user_account);
	cs.setString(3,user_nickname);
	cs.setString(4,mon_id); 
	
	cs.registerOutParameter(5, java.sql.Types.INTEGER);	 //Bat_Result
	cs.execute();
	
	result_character = cs.getInt(5);
	  
	//System.out.println("캐릭터 및 닉네임 생성결과("+user_nickname + "): " + result_character);		

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
<%=P_type%>|<%=result_character%>|<%=user_account%>
