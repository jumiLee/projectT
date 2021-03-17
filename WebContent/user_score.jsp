<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T17";
String job_type = request.getParameter("job_type"); //1:PVP랭킹, 2:무한대전랭킹, 3:보스전랭킹, 4: 미션랭킹
String rank_type = request.getParameter("rank_type"); //1:전체, 2:친구
 
if(job_type.equals("2")){
	P_type = "T283";	//무한대전랭킹패킷 
}

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

int tot_cnt 	=0;  //전체랭킹 수 
int tot_frd_cnt =0;	 //친구랭킹 수
int top_cnt     =5; //조회할 데이터 수
int frd_rank    =1; //친구랭킹생성
//나의랭킹조회관련
int my_rank=0; int my_point = 0; int my_win_cnt=0; int my_cont_win_cnt=0; int my_attend_cnt=0;  

try{
	 
	Conn = DriverManager.getConnection(DB_url_replica, DB_user, DB_pwd);
	
  //전체랭킹 
	sql.append(" Call abn_getRank  ("+ rank_type + "," + job_type + "," + top_cnt + "," +user_account + ") \n") ;
  	//System.out.println (sql);
  
  	pstmt = Conn.prepareStatement(sql.toString());	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){
		
		//myRank|myScore|total_cnt|rank|user_account|user_image|user_nickname|user_score|user_carry_mon_id(대표몬스터아이디)|
		
		map = new HashMap();
		
		map.put("user_account"	, rs.getInt("user_account"));
		map.put("user_image"	, rs.getInt("user_image"));
		map.put("nick_name"		, rs.getString("nick_name"));
		map.put("carry_mon_id"	, rs.getInt("carry_mon_id"));
		map.put("p_score"		, rs.getInt("user_score")); 		 
		
		
		if (rank_type.equals("2")) {	//친구랭킹이면, 
			map.put("user_rank"	, frd_rank);
			if (rs.getInt("user_account") == Integer.parseInt(user_account) ) {
				my_rank = frd_rank;
				my_point = rs.getInt("myPoint");
			}
			frd_rank++;
		}else{							//전체랭킹이면, 
			map.put("user_rank"	, rs.getInt("user_rank"));
			my_rank = rs.getInt("myRank");
			my_point = rs.getInt("myPoint");
		}

		list.add(map);
		tot_cnt++;
		
	} 
	
	

}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=my_rank%>|<%=my_point%>|<%=tot_cnt%>|
<%for(int i=0;i<list.size();i++){%><%=list.get(i).get("user_rank")%>|<%=list.get(i).get("user_account")%>|<%=list.get(i).get("user_image")%>|<%=list.get(i).get("nick_name")%>|<%=list.get(i).get("p_score")%>|<%=list.get(i).get("carry_mon_id")%>|
<%}%>