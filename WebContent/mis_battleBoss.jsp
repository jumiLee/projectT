<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T792";
String have_account = request.getParameter("have_account");

int boss_mon_id =0; String boss_mon_nm = "0"; int mon_max_HP =0; int mon_CUR_HP= 0; int mon_ATT =0; int mon_DEF =0; int need_AP=0;
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	//sql.append(" EXEC [dbo].[abn_getBossList]  1, " + have_account );
	sql.append(" CALL abn_getBossList (1," + have_account + ") \n");
  	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();  
	 
	while(rs.next()){
		boss_mon_id = rs.getInt("boss_mon_id");
		boss_mon_nm = rs.getString("boss_mon_nm");
		if (boss_mon_nm == null) boss_mon_nm="0";
		mon_max_HP  = rs.getInt("mon_max_HP");
		mon_CUR_HP  = rs.getInt("mon_CUR_HP");
		mon_ATT		= rs.getInt("mon_ATT");
		mon_DEF		= rs.getInt("mon_DEF");
		need_AP		= rs.getInt("need_AP");
		
	}//end while
		
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();	
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|<%=boss_mon_id%>|<%=boss_mon_nm%>|<%=mon_max_HP%>|<%=mon_CUR_HP%>|<%=mon_ATT%>|<%=mon_DEF%>|<%=need_AP%>|	