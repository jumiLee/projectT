<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String mon_id_basis = request.getParameter("mon_id_basis");	//진화대상 몬스터 아이디
String mon_sn_basis = request.getParameter("mon_sn_basis");	//진화대상 몬스터 일련번호
String mon_id_meterial = request.getParameter("mon_id_meterial");	//진화소재 몬스터 아이디
//String mon_sn_meterial = request.getParameter("mon_sn_meterial");	//진화소재 몬스터 일련번호  --> null로 처리하면 자동으로 검색하여 처리함.

//System.out.println("mon_sn_basis:" + mon_sn_basis);

String P_type ="T852";

int result ;
result = 0;
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_RevolutionUserMonster  (2,"+ user_account + "," + mon_id_basis + "," + mon_sn_basis +"," + mon_id_meterial + ",null  )\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	 
	while(rs.next()){
		result =  rs.getInt("result_cd");				
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
<%=P_type%>|<%=result%>|