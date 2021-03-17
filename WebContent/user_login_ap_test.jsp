<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.collections.map.HashedMap"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@ include file="./DBConnection.jsp"%> 
<%
CallableStatement cs = null;
String P_type ="T111";

String m_no = request.getParameter("m_no");
//String m_no = "'01090430750'"; 
int result = 0;
int user_account = 0;
try{   
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getUserInfoByAccountNo  (" + m_no + " )\n") ;
	//System.out.println (sql.toString());
	System.out.println ("Remote Addr: " + request.getRemoteAddr()  +" / " + "Remote Host: " + request.getRemoteHost() + " / " + "X-Forward-For : " + request.getHeader("x-forwarded-for"));
	System.out.println ("m_no:" + m_no);
	
	pstmt = Conn.prepareStatement(sql.toString());	
	rs = pstmt.executeQuery();  
	while(rs.next()){		
		result 		 = rs.getInt("result");
		user_account = rs.getInt("user_account");
		
		System.out.println("result:"+result);
		
		if (result == 0) {	//정상사용자면,	
			//업적처리 
			
				cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}"); // 7일연속접속
				cs.setInt(1,1);
				cs.setString(2,user_account);
				cs.setString(3,user_account);
				cs.setInt(4,2);
				cs.setInt(5,1);
				cs.setInt(6,1);
				cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //achv_result_cd
				cs.execute();
				achv_result = cs.getInt(7);
				
				cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}"); //하루1회접속
				cs.setInt(1,1);
				cs.setString(2,user_account);
				cs.setString(3,user_account);
				cs.setInt(4,3);
				cs.setInt(5,1);
				cs.setInt(6,1);
				cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //achv_result_cd
				cs.execute();
				achv_result = cs.getInt(7);
				
				int achv_id=0;
				for (achv_id =1; achv_id < 4 ; achv_id ++) {  
					cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");  //이벤트업적(매일12:00~2:00사이접속/매일18:00~19:00사이접속/설 접속 이벤트)
					cs.setInt(1,1);
					cs.setString(2,user_account);
					cs.setString(3,user_account);
					cs.setInt(4,1);
					cs.setInt(5,achv_id);
					cs.setInt(6,1);
					cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //achv_result_cd
					cs.execute();
					achv_result = cs.getInt(7);
				}
				
			// 5,500 정액제 상품 결제자 업데이트 
				int payment_result =0;
				cs = Conn.prepareCall("{call abn_mgmtUserEvtPayment(?,?,?,?,?)}"); 
				cs.setInt(1,2);
				cs.setString(2,user_account);
				cs.setInt(3,1);
				cs.setInt(4,2);
				cs.registerOutParameter(5, java.sql.Types.INTEGER);	 //achv_result_cd
				cs.execute();
				payment_result = cs.getInt(5);
				
			// 출석업데이트 
				int attend_result =0;
				cs = Conn.prepareCall("{call abn_MgmtAttend(?,?,?,?,?,?)}"); 
				cs.setInt(1,1);
				cs.setString(2,user_account);
				cs.setInt(3,1);
				cs.setString(4,null);
				cs.setString(5,null);
				cs.registerOutParameter(6, java.sql.Types.INTEGER);	 
				cs.execute();
				attend_result = cs.getInt(6);
				
%>
			<jsp:forward page="user_main_test.jsp">	
			<jsp:param name="user_account" value="<%=user_account %>"/>
			</jsp:forward>
<%		//계정만 있고 캐릭터 생성안한경우		
		}else if(result == -4){	%>			
			<%@ include file="./moe_empty_header.jsp"%>
			<%=P_type%>|<%=result %>|
<%    
		//정상사용자이면, 메인으로 이동
		}else{		%>
			<%@ include file="./moe_header.jsp"%>
			<%=P_type%>|<%=result %>|
<%			
		}
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>