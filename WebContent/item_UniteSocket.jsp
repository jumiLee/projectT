<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T5932";
String job_type 	= request.getParameter("job_type");
String tre_id 		= request.getParameter("tre_id");
String tre_array	= request.getParameter("tre_array");

int result = 0;
int unite_tre_id = 0;
int tre_type = 0;
int tre_level = 0;
int tre_img_no = 0;
String tre_nm = "0";
int hp = 0;
int att = 0;
int def = 0;
int critical_up = 0;
int miss_up = 0;

CallableStatement cs = null;
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_UniteSocketTreasure (" + job_type + ","+ user_account + "," + tre_id + ",'" + tre_array + "' )\n");
	
	pstmt = Conn.prepareStatement(sql.toString());
	
//System.out.println (sql.toString());
	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		/* result, tre_id, tre_type, tre_level, tre_nm, hp, att, def, critical_up, miss_up */	
		result 		= rs.getInt("result");
		unite_tre_id= rs.getInt("tre_id");
		tre_type	= rs.getInt("tre_type");
		tre_level 	= rs.getInt("tre_level");
		tre_img_no 	= rs.getInt("tre_img_no");
		tre_nm 		= rs.getString("tre_nm");
		hp 			= rs.getInt("hp");
		att			= rs.getInt("att");
		def 		= rs.getInt("def");
		critical_up = rs.getInt("critical_up");
		miss_up 	= rs.getInt("miss_up");
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=result%>|<%=job_type%>|<%=unite_tre_id %>|<%=tre_type%>|<%=tre_level %>|<%=tre_img_no%>|<%=tre_nm %>|<%=hp %>|<%=att%>|<%=def %>|<%=critical_up %>|<%=miss_up %>|