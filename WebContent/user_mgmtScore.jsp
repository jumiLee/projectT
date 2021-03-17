<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T171";
String score_type = request.getParameter("score_type"); //1:PVP랭킹, 2:무한대전랭킹, 3:보스전랭킹, 4: 미션랭킹
String point 	  = request.getParameter("point"); 		//점수
  


CallableStatement cs = null;
int result_cd = 0; //결과코드
 
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Exec [abn_mgmtUserRank_out]  	 \n"); 
	sql.append(" 1  							,\n");
	sql.append(" "+ user_account +"			  	,\n");
	sql.append(" "+ point 		 +"				,\n");
	sql.append(" "+ score_type 	 +"				,\n");	
	sql.append(" ? 								 \n");	//result_cd
	 
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
<%=P_type%>|<%=result_cd%>|