<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="";
String job_type = request.getParameter("job_type");
String achv_type = request.getParameter("achv_type");
String achv_id = request.getParameter("achv_id");

int result = 0;
int achv_rwd_type = 0; 

//System.out.println ("achv_type:" +job_type);

//P_type 설정
if (achv_type.equals("1")) 	   {	// event achivement
	P_type ="T0212";
}else if(achv_type.equals("2")) {	// weekly achivement
	P_type ="T0222";
}else if(achv_type.equals("3")) {	// daily achivement
	P_type ="T0232";	
}else if(achv_type.equals("4")) {	// series achivement
	P_type ="T0242";	
}else {
	P_type ="T0252";	
}


//List<Map<String, Object>> list = null;
//Map<String, Object> map = null;
//int tot_cnt ;
//tot_cnt = 0;
//String user_nickname = "";
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" CALL abn_mgmtUserAchvReward (" + job_type +"," + user_account + ","+ achv_type + "," + achv_id + ") \n");
	
	pstmt = Conn.prepareStatement(sql.toString());
	
	//System.out.println (sql.toString());
	
	rs = pstmt.executeQuery();
	if (rs.next()){
		result =  rs.getInt("result");
	}
	
	//보상타입조회 
	sql.setLength(0);
	//sql.append(" select achv_rwd_type from MST_ACHIEVEMENT  where achv_type=" + achv_type + " and achv_id = " + achv_id + " \n");
	sql.append(" select achv_rwd_id from MST_ACHIEVEMENT  where achv_type=" + achv_type + " and achv_id = " + achv_id + " \n");
	
	pstmt = Conn.prepareStatement(sql.toString());
	
	rs = pstmt.executeQuery();
	if (rs.next()){
		achv_rwd_type =  rs.getInt("achv_rwd_id");
	}
	
	if(result ==0 && achv_rwd_type > 20 ) {	//뽑기권이면 
%>
		<jsp:forward page="draw_mgmtGiftDraw.jsp">	
			<jsp:param name="user_account" value="<%=user_account %>"/>
			<jsp:param name="P_type" value="T76"/>
			<jsp:param name="draw_id" value="<%=achv_rwd_type %>"/>
		</jsp:forward>	
				
<%	}
			
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=result%>|<%=achv_id%>|