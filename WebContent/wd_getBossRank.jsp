<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T273";

int cur_open_flag=0; String open_time="00000000000000"; int open_term=0;
int myRank=0; int myScore=0; int myRscore=0; int myAttendCnt=0; int tot_cnt =0; int rank=0;
int boss_bat_id =0; int boss_mon_id =0; String boss_nm="";int MAX_HP=0; int CUR_HP=0; int mon_ATT=0; int mon_DEF=0; String mon_desc="";
//보스전 랭킹관련
	List<Map<String, Object>> list = null;
	Map<String, Object> map = null;

//보스정보관련
	ResultSet rs_bs = null;
	PreparedStatement pstmt_bs = null;
try{
	
	//Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	Conn = DriverManager.getConnection(DB_url_replica, DB_user, DB_pwd);
	
// 보스전 랭킹정보 조회 
	sql.append(" Call abn_getWorldBossList  (2, " + user_account + "  )\n") ;
	//System.out.println(sql.toString());
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	
	list 	= new ArrayList<Map<String, Object>>();
	  
	while(rs.next()){
		//cur_open_flag|open_time|open_term|myRank|myScore|tot_cnt|rank|user_account|user_image|user_nickname|user_score|user_carry_mon_id(대표몬스터아이디)|
		myRank			= rs.getInt("myRank");
		myScore			= rs.getInt("myScore");
		myRscore		= rs.getInt("myRscore");
		myAttendCnt		= rs.getInt("attend_cnt");
		cur_open_flag	= rs.getInt("cur_open_flag");
		open_time		= rs.getString("open_time");
		open_term		= rs.getInt("open_term");  
		
		rank = rs.getInt("user_rank");
		
		map = new HashMap();
		
		map.put("rank"				, rs.getInt("user_rank"));
		map.put("user_account"		, rs.getInt("user_account"));
		map.put("user_image"		, rs.getInt("user_img"));
		map.put("user_nickname"		, rs.getString("user_nickname"));
		map.put("user_score"		, rs.getInt("user_score"));
		map.put("user_carry_mon_id"	, rs.getInt("carry_mon_id"));
		
		list.add(map);
		
		if (rank != 0){	//랭킹이 생성되면, 
			tot_cnt ++;	
		}
	}//end while

// 보스정보조회 
	sql.setLength(0);
	sql.append(" Call abn_getWorldBossList  (1, " + user_account + "  )\n") ;
	pstmt_bs = Conn.prepareStatement(sql.toString());
  	//System.out.println(sql.toString());
  	rs_bs = pstmt_bs.executeQuery();
	  	
		while(rs_bs.next()){      
			//boss_bat_id|boss_mon_id|boss_nm|MAX_HP|CUR_HP|mon_ATT|mon_DEF|mon_desc|
			boss_bat_id	= rs_bs.getInt("boss_bat_id");
			boss_mon_id	= rs_bs.getInt("mon_id");
			boss_nm 	= rs_bs.getString("mon_nm");
			MAX_HP  	= rs_bs.getInt("max_HP");
			CUR_HP  	= rs_bs.getInt("cur_HP");
			mon_ATT		= rs_bs.getInt("mon_ATT");
			mon_DEF		= rs_bs.getInt("mon_DEF");
			mon_desc	= rs_bs.getString("mon_desc");			  
		}//end while		    
			
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(pstmt_bs != null) pstmt_bs.close();
	if(rs_bs != null) rs_bs.close();
	
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|<%=cur_open_flag%>|<%=open_time%>|<%=open_term%>|<%=myRank%>|<%=myScore%>|<%=myRscore%>|<%=myAttendCnt%>|<%=boss_bat_id%>|<%=boss_mon_id%>|<%=boss_nm%>|<%=MAX_HP%>|<%=CUR_HP%>|<%=mon_ATT%>|<%=mon_DEF%>|<%=mon_desc%>|<%=tot_cnt%>|
<% for (int i=0;i<list.size();i++){ %>
	<%=list.get(i).get("rank")%>|<%=list.get(i).get("user_account")%>|<%=list.get(i).get("user_image")%>|<%=list.get(i).get("user_nickname")%>|<%=list.get(i).get("user_score")%>|<%=list.get(i).get("user_carry_mon_id")%>|
<%} %>