<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T002";
String job_type 	= request.getParameter("job_type");		//1:개별수신 2:일괄수신
String receive_sn  	= request.getParameter("receive_sn"); 	//message sn
String good_type  	= request.getParameter("good_type"); 	//보상타입
int rwd_type = 0;
rwd_type = Integer.parseInt(good_type);
  
CallableStatement cs = null;
int result_cd = 0; //결과코드
String result_msg = ""; 
 
try{
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	//메세지 수신처리
	
	cs = Conn.prepareCall("{call abn_mgmtReceiveBox(?,?,?,?,?,?,?,?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,receive_sn);
	cs.setString(4,null);
	cs.setString(5,null);
	cs.setString(6,null);
	cs.setString(7,null);
	cs.setString(8,null);
	
	cs.registerOutParameter(9, java.sql.Types.INTEGER);	 //result_cd	
	cs.registerOutParameter(10, java.sql.Types.VARCHAR); //result_message
	cs.execute();
	
	result_cd 	= cs.getInt(9);
	result_msg  = cs.getString(10);	
	
	//뽑기권이면
	if (good_type.equals("21")) { 
	sql.setLength(0);
	//sql.append(" select good_type from USER_RECEIVE_BOX where user_account=" + user_account + " and receive_sn = " + receive_sn + " \n");
	sql.append(" select good_id from USER_RECEIVE_BOX where user_account=" + user_account + " and receive_sn = " + receive_sn + " \n");
	
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	if (rs.next()){
		//rwd_type =  rs.getInt("good_type");
		rwd_type =  rs.getInt("good_id");
	}
		
%>
		<jsp:forward page="draw_mgmtGiftDraw.jsp">	
			<jsp:param name="user_account" value="<%=user_account %>"/>
			<jsp:param name="P_type" value="T75"/>
			<jsp:param name="draw_id" value="<%=rwd_type %>"/>
		</jsp:forward>	
		
<%	
	}
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=result_cd%>|<%=receive_sn%>|