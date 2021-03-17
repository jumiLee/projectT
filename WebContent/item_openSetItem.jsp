<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T545";
String job_type 	= request.getParameter("job_type");
String item_id 		= request.getParameter("item_id");
String item_uniqueID= request.getParameter("item_uniqueID");

int result = 0;
CallableStatement cs = null;

List<Map<String, Object>> list = null; 
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	
// Open Set item  
	cs = Conn.prepareCall("{call abn_mgmtSetItem(?,?,?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,item_id);
	cs.setString(4,item_uniqueID);
	
	cs.registerOutParameter(5, java.sql.Types.INTEGER);	 //Result
	
	cs.execute();
	
	result = cs.getInt(5);
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=result%>|<%=job_type%>|