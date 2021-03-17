<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T251";


String job_type = request.getParameter("job_type"); //1:PVP랭킹, 2:무한대전랭킹, 3:보스전랭킹, 4: 미션랭킹
int rank_type = 3; //1:전체, 2:친구, 3:나의랭킹

if(job_type.equals("2")) { 			//무한대전랭킹
	P_type = "T284";
}else if (job_type.equals("3")) {	//보스전
	P_type = "T274";
}

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

//나의랭킹조회관련
int my_rank=0; int my_point = 0; int my_win_cnt=0; int my_cont_win_cnt=0; int my_attend_cnt=0;  int cur_WP = 0; int max_WP = 0; 
//무한대전 연승관련
int latest_cont_win_cnt = 0;int revival_cost=0;

try{
	 
	Conn = DriverManager.getConnection(DB_url_replica, DB_user, DB_pwd);
	
  //나의 랭킹 정보 조회
	sql.append(" Call abn_getRank  (" + rank_type + "," + job_type+ ",0," + user_account+ ") \n") ;
	pstmt = Conn.prepareStatement(sql.toString());	
	rs = pstmt.executeQuery();
	 
	if(rs.next()){
		my_rank			=rs.getInt("user_rank");	
		my_point		=rs.getInt("point");
		my_win_cnt		=rs.getInt("win_cnt");
		my_cont_win_cnt	=rs.getInt("cont_win_cnt");
		my_attend_cnt	=rs.getInt("attend_cnt");
		max_WP			=rs.getInt("max_wp");
		cur_WP			=rs.getInt("cur_wp");		
	}

 //무한대전일 경우 최근 연승회수 조회 	
	if(job_type.equals("2")){
		sql.setLength(0);
		
		sql.append(" Call abn_getUserInfiBat  (1," + user_account+ ") \n") ;
		pstmt = Conn.prepareStatement(sql.toString());	
		rs = pstmt.executeQuery();
		 
		if(rs.next()){
			latest_cont_win_cnt	= rs.getInt("latest_cont_win_cnt");
			revival_cost = rs.getInt("infi_revival_cost");
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
<% if(job_type.equals("2")){ %>
	<%=P_type%>|<%=my_rank%>|<%=my_point%>|<%=my_win_cnt%>|<%=my_cont_win_cnt%>|<%=my_attend_cnt%>|<%=latest_cont_win_cnt%>|<%=revival_cost%>|<%=max_WP%>|<%=cur_WP%>|
<% }else {%>
	<%=P_type%>|<%=my_rank%>|<%=my_point%>|<%=my_win_cnt%>|<%=my_cont_win_cnt%>|<%=my_attend_cnt%>|<%=max_WP%>|<%=cur_WP%>|
<% }%>