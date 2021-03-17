<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T0201";
String target_kakao_id = request.getParameter("target_kakao_id"); //추천받는사람 카카오톡 아이디
int achv_type 	= 4; //업적타입 (연속미션)
int achv_id 	= 0; //업적아이디
int achv_cnt 	= 1; //업적수행회수

int result = 0;

CallableStatement cs = null;
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
//업적업데이트 	
	for (achv_id =6; achv_id < 10 ; achv_id ++) {  //업적아이디 (6~9까지) 
		/*
		sql.setLength(0);
		sql.append(" Exec [abn_mgmtUserAchv_out]	\n");
		sql.append(" 1				   ,			\n");
		sql.append(" "+ user_account +",  			\n");
		sql.append(" "+ target_kakao_id +",  		\n");
		sql.append(" "+ achv_type 	 +",  			\n");
		sql.append(" "+ achv_id 	 +",			\n");
		sql.append(" "+ achv_cnt 	 +",			\n");
		sql.append(" ?	 							\n");
		cs = Conn.prepareCall(sql.toString());
		cs.registerOutParameter(1, java.sql.Types.INTEGER);	 
		cs.execute();
		result = cs.getInt(1);
		*/
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);
		cs.setString(2,user_account);
		cs.setString(3,target_kakao_id);
		cs.setString(4,achv_type);
		cs.setString(5,achv_id);
		cs.setString(6,achv_cnt);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
		cs.execute();
		result = cs.getInt(7);
	}



}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=result%>|