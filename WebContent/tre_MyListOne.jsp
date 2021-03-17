<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T33";
String tre_id = request.getParameter("tre_id");

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt = 5 ;  //서브보물은 항상 5개
String tre_nm = "0";
int tre_sub1_cnt =0, tre_sub1_trap_cnt = 0;
int tre_sub2_cnt =0, tre_sub2_trap_cnt = 0;
int tre_sub3_cnt =0, tre_sub3_trap_cnt = 0;
int tre_sub4_cnt =0, tre_sub4_trap_cnt = 0;
int tre_sub5_cnt =0, tre_sub5_trap_cnt = 0;
try{
	 
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" EXEC [dbo].[abn_getTreList]  4," + user_account + "," + tre_id + " \n");	//특정보물리스트
	
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		
		tre_nm = rs.getString("tre_nm");
		if (rs.getInt("tre_sub_id") == 1) {
			tre_sub1_cnt = rs.getInt("tre_cnt");
			tre_sub1_trap_cnt = rs.getInt("trap_cnt");
		}else if(rs.getInt("tre_sub_id") == 2) {
			tre_sub2_cnt = rs.getInt("tre_cnt");
			tre_sub2_trap_cnt = rs.getInt("trap_cnt");
		}else if(rs.getInt("tre_sub_id") == 3) {
			tre_sub3_cnt = rs.getInt("tre_cnt");
			tre_sub3_trap_cnt = rs.getInt("trap_cnt");
		}else if(rs.getInt("tre_sub_id") == 4) {
			tre_sub4_cnt = rs.getInt("tre_cnt");
			tre_sub4_trap_cnt = rs.getInt("trap_cnt");
		}else if(rs.getInt("tre_sub_id") == 5) {
			tre_sub5_cnt = rs.getInt("tre_cnt");
			tre_sub5_trap_cnt = rs.getInt("trap_cnt");
		}
		
		//tot_cnt ++;
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>

<%=P_type%>|<%=tot_cnt %>|<%=tre_id %>|<%=tre_nm %>|<%=tre_sub1_cnt%>|<%=tre_sub1_trap_cnt%>|<%=tre_sub2_cnt%>|<%=tre_sub2_trap_cnt%>|<%=tre_sub3_cnt%>|<%=tre_sub3_trap_cnt%>|<%=tre_sub4_cnt%>|<%=tre_sub4_trap_cnt%>|<%=tre_sub5_cnt%>|<%=tre_sub5_trap_cnt%>|