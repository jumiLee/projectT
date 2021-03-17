<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T271";

int boss_bat_id=0; int boss_id=0; String boss_nm="0"; int MAX_HP=0; int CUR_HP=0; int mon_ATT=0; int mon_DEF=0;
int cur_open_flag=0; String open_time="00000000000000"; int open_term=0;
int myRank=0; int myScore=0;int tot_cnt =0;

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

CallableStatement cs = null;
int result_cd = 0;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

// 월드보스 시작처리
	cs = Conn.prepareCall("{call abn_BattleStart(?,?,?,?,?,?)}");
	cs.setInt(1,3);
	cs.setString(2,user_account);
	cs.setInt(3,0);
	cs.setInt(4,0);
	cs.setInt(5,0);
	
	cs.registerOutParameter(6, java.sql.Types.INTEGER);	 //result_flag
	cs.execute();
	result_cd = cs.getInt(6);
	
// 보스정보조회 
	sql.append(" Call abn_getWorldBossList  (1, " + user_account + "  )\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
  	//System.out.println(sql.toString());
  	rs = pstmt.executeQuery();
  	
	while(rs.next()){      
		//boss_bat_id|boss_id|boss_nm|MAX_HP|CUR_HP|mon_ATT|mon_DEF|cur_open_flag|open_time|open_term|
		boss_bat_id		= rs.getInt("boss_bat_id");
		boss_id 	 	= rs.getInt("mon_id");
		boss_nm 		= rs.getString("mon_nm");
		MAX_HP  		= rs.getInt("max_HP");
		CUR_HP  		= rs.getInt("cur_HP");
		mon_ATT			= rs.getInt("mon_ATT");
		mon_DEF			= rs.getInt("mon_DEF");
		cur_open_flag	= rs.getInt("cur_open_flag");
		open_time		= rs.getString("open_time");
		open_term		= rs.getInt("open_term");  
	}//end while
		
}catch(Exception e){    
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();	
}	%> 
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|<%=cur_open_flag%>|<%=boss_bat_id%>|<%=boss_id%>|<%=boss_nm%>|<%=MAX_HP%>|<%=CUR_HP%>|<%=mon_ATT%>|<%=mon_DEF%>|