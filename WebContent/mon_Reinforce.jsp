<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T44";
String mon_id 		= request.getParameter("mon_id"); 		//기초 몬스터 아이디
String user_mon_sn 	= request.getParameter("user_mon_sn"); 	//기초 몬스터 고유번호
String item_id 		= request.getParameter("item_id"); 		//강화 아이템
String mon_array	= request.getParameter("mon_array");	//강화 대상 몬스터 배열정보(mon_id:mon_sn|mon_id:mon_sn|...)
 
int err_code = 0;
int RF_flag = 0;
int RF_CNT = 0;
int RF_GOLD = 0;
int RF_ADD_ATT = 0;
int RF_ADD_DEF =0;
try{
		
Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	//sql.append(" EXEC [dbo].[abn_ReinforceUserMonster] " + user_account + "," + mon_id +"," + user_mon_sn + "," + item_id + ",'" + mon_array + "'\n");
	sql.append(" Call abn_ReinforceUserMonster  (" + user_account+"," + mon_id + "," + user_mon_sn + ","+item_id+ ",'" + mon_array+ "')\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	   
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
	
		err_code	= rs.getInt("err_code");
		RF_flag		= rs.getInt("RF_flag");
		RF_CNT		= rs.getInt("RF_CNT");
		RF_GOLD		= rs.getInt("RF_GOLD");
		RF_ADD_ATT	= rs.getInt("RF_ADD_ATT");
		RF_ADD_DEF	= rs.getInt("RF_ADD_DEF");
	}	
		
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=err_code%>|<%=RF_flag%>|<%=RF_CNT%>|<%=RF_GOLD%>|<%=RF_ADD_ATT%>|<%=RF_ADD_DEF%>|