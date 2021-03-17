<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="";
String job_type = request.getParameter("job_type");
String mon_id = request.getParameter("mon_id");
String user_mon_sn = request.getParameter("user_mon_sn");
String item_id = request.getParameter("item_id");	//거래시에는 Trade_flag 값 (1:자동거래, 2:사용자간 거래)
String price = request.getParameter("price");

 
//P_type 설정
if (job_type.equals("1")) {			//치료
	P_type ="T43";
}else if (job_type.equals("2"))	{	//강화
	P_type ="T44";
}else if (job_type.equals("3"))	{	//판매
	P_type ="T45";	
}else if (job_type.equals("5"))	{	//리더설정
	P_type ="T46";
}else if (job_type.equals("6"))	{	//덱설정
	P_type ="T47";
}else if (job_type.equals("7"))	{	//덱해제
	P_type ="T48";
}
	
int tot_cnt =0; int result_cd = 0; String result_msg= "";

try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_MgmtUserMonster  (" + job_type+"," + user_account + "," + mon_id + "," + user_mon_sn+ "," + item_id + ",1," + price + ")\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
	
System.out.println (sql.toString());
	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		result_cd = rs.getInt("result_mgmtUserMon");
		result_msg = rs.getString("msg_mgmtUserMon");
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
<%=P_type%>|<%=result_cd%>|<%=result_msg%>|