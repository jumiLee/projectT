<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T431";
String job_type 	= request.getParameter("job_type"); 	//1:퀘스트아이템 자동장착
String mon_id 		= request.getParameter("mon_id"); 		//기초 몬스터 아이디
String user_mon_sn 	= request.getParameter("user_mon_sn"); 	//기초 몬스터 고유번호
String item_id 		= request.getParameter("item_id"); 		//장착 아이템

CallableStatement cs = null;
int result_cd = 0; //결과코드
String result_msg = "" ; //결과메세지
try{
	
// 장착 및 장착해제 	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call abn_mgmtEquipItem(?,?,?,?,?,?,?,?)}");
	cs.setString(1,job_type);		//job_type= 3(자동장착)
	cs.setString(2,user_account);
	cs.setString(3,mon_id);
	cs.setString(4,user_mon_sn);
	cs.setString(5,item_id);
	cs.setInt(6,0);				//item_uid는 프로시져 내에서 자동 검색
	
	cs.registerOutParameter(7, java.sql.Types.INTEGER);	
	cs.registerOutParameter(8, java.sql.Types.VARCHAR);
	cs.execute();
	result_cd 	= cs.getInt(7);
	result_msg 	= cs.getString(8);
	
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();	
}	
%>  
<%=P_type %>|<%=result_cd %>|<%=job_type %>|