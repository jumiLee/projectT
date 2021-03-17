<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>	
<%
String P_type ="T312";
String bat_account	= request.getParameter("bat_account"); 	//상대방계정 
String tre_id		= request.getParameter("tre_id"); 		//보물아이디
String tre_sub_id	= request.getParameter("tre_sub_id"); 	//보물서브아이디
String bat_result 	= request.getParameter("bat_result");	//대상 결과
String bat_score	= request.getParameter("bat_score"); 	//대전 획득 점수 

int result_cd = 0; int get_score=0; int cur_score=0; int cont_win_cnt=0; int get_gold=0;

try{ 
		 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_treBattleEnd  (1," + user_account + "," + bat_account + "," + tre_id + "," + tre_sub_id + "," + bat_result + "," + bat_score + "  )\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		//result|get_score(획득점수)|cur_score(현재점수)|cont_win_cnt(연승회수)|get_gold(획득골드)|
		result_cd 	= rs.getInt("result"); 
		get_score	= rs.getInt("get_score");
		get_gold	= rs.getInt("get_gold");
		
	}
	
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
<%=P_type %>|<%=bat_result %>|<%=get_score %>|<%=get_gold%>|