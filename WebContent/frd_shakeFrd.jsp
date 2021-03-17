<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T65";
String frd_account 	= request.getParameter("frd_account");
String ch_type 		= request.getParameter("frd_ch_type");
String ch_id		= request.getParameter("frd_ch_id");
int job_type = 0;

CallableStatement cs = null;
int result_cd = 0; int result_kakao=0;//결과코드
String result_msg = ""; //결과메세지
try{
	
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
//카카오톡 유저일 경우, ch_id (카카오아이디)로 사용자 계정을 찾아야 함.	
	if (ch_type.equals("1")) {
		
		sql.append(" CALL abn_getUserInfo_by_Channel (1," + ch_type + ",'" + ch_id + "') \n");
		pstmt = Conn.prepareStatement(sql.toString());
		
		//System.out.println("KAKAO 계정(" + ch_id + "):" + sql.toString());
		
		rs = pstmt.executeQuery();
		while(rs.next()){
			frd_account = rs.getString("user_account");
			result_kakao = rs.getInt("result");
		}
		job_type = 7;	//카톡친구 하트보내기
	}else{
		job_type = 2;	//게임친구 하트보내기	
	}

//하트보내기
	/*
	sql.setLength(0);
	sql.append(" Exec [abn_GetUserPoint_out]  	 \n"); 
	sql.append(" "+ job_type	 +"				,\n");
	sql.append(" "+ user_account +"			  	,\n");
	sql.append(" "+ frd_account  +"				,\n");
	sql.append(" ? 								,\n");	//result_cd
	sql.append(" ? 								 \n");	//result_msg
	cs = Conn.prepareCall(sql.toString());
	cs.registerOutParameter(1, java.sql.Types.INTEGER);
	cs.registerOutParameter(2, java.sql.Types.VARCHAR);
	cs.execute();
	result_cd 	= cs.getInt(1);
	result_msg  = cs.getString(2);
	*/
	cs = Conn.prepareCall("{call abn_GetUserPoint_out(?,?,?,?,?)}");
	cs.setInt(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,frd_account);
	
	cs.registerOutParameter(4, java.sql.Types.INTEGER);	
	cs.registerOutParameter(5, java.sql.Types.VARCHAR);
	cs.execute();
	result_cd 	= cs.getInt(4);
	result_msg  = cs.getString(5);
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();	
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|<%=result_cd%>|<%=result_msg%>