<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T042";
String rwd_category 	  = request.getParameter("rwd_category");
String rwd_category_value = request.getParameter("rwd_category_value");

int result_cd = 0; //결과코드
int rwd_type = 0; int rwd_id=0; //보상타입 및 보상아이디

CallableStatement cs = null;
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

	cs = Conn.prepareCall("{call abn_mgmtUserReward(?,?,?,?,?)}");
	cs.setInt(1,1);
	cs.setString(2,user_account);
	cs.setString(3,rwd_category);
	cs.setString(4,rwd_category_value);
	cs.registerOutParameter(5, java.sql.Types.INTEGER);	 //result_flag
	cs.execute();
	result_cd = cs.getInt(5);
	
	
	//보상타입조회 
	sql.setLength(0);
	sql.append(" select rwd_id, rwd_type from MGR_REWARD  where rwd_category=" + rwd_category + " and rwd_category_value = " + rwd_category_value + " \n");
		
	pstmt = Conn.prepareStatement(sql.toString());
		
	rs = pstmt.executeQuery();
	if (rs.next()){
		rwd_type =  rs.getInt("rwd_type");
		rwd_id   =  rs.getInt("rwd_id");
	}
		
	if(result_cd == 0 && rwd_type == 21 ) {	// 뽑기권이면 
		%>
		<jsp:forward page="draw_mgmtGiftDraw.jsp">	
			<jsp:param name="user_account" value="<%=user_account %>"/>
			<jsp:param name="P_type" value="T77"/>
			<jsp:param name="draw_id" value="<%=rwd_id %>"/>
		</jsp:forward>	
						
		<%	}
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	
%>
	<%@ include file="./moe_header.jsp"%>
	<%=P_type %>|<%=result_cd %>|
