<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T272";
int have_account = 0;  //월드보스는 user_account=0 이 주인	
String boss_mon_id	 = request.getParameter("boss_mon_id");
String boss_bat_id 	 = request.getParameter("boss_bat_id");
String boss_cur_HP 	 = request.getParameter("boss_cur_HP");

int clear_flag = 0;
int boss_clear_time = 0;	//Boss clear: 클리어까지 걸린시간, Boss battle 중 : 생성부터 지금까지 걸린 시간
int rwd_type = 0; int mon_cur_HP=0; int acum_point=0; int acum_attend_cnt = 0;

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;

CallableStatement cs = null;

try{
	  
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_MgmtWDBossBattle  (" + have_account + "," + user_account + "," + boss_bat_id + "," + boss_mon_id + "," + boss_cur_HP + " )\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	//list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		
		clear_flag 		= rs.getInt("clear_flag");
		boss_clear_time = rs.getInt("clear_time");
		rwd_type 		= rs.getInt("rwd_type");
		mon_cur_HP 		= rs.getInt("mon_cur_HP");
		acum_point 		= rs.getInt("acum_point");
		acum_attend_cnt = rs.getInt("acum_attend_cnt");		
	}		
	
//업적처리 												
	int achv_id = 0; int achv_result=0;

	//(Daily) 월드보스 하루 1회 참가하기
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,3);
		cs.setInt(5,5);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //achv_result_cd
		cs.execute();
		achv_result = cs.getInt(7);
		
	//(Weekly) 월드보스 10,20,30회 참가하기
	for(achv_id = 5; achv_id < 8 ; achv_id ++){
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,2);
		cs.setInt(5,achv_id);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //achv_result_cd
		cs.execute();
		achv_result = cs.getInt(7);
	}	
	
	//월드보스 참가업적
	for(achv_id = 1; achv_id < 5 ; achv_id ++){
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,10);
		cs.setInt(5,achv_id);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //achv_result_cd
		cs.execute();
		achv_result = cs.getInt(7);
	}		
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
<%=P_type%>|<%=clear_flag%>|<%=boss_clear_time%>|<%=rwd_type%>|<%=mon_cur_HP%>|<%=acum_point%>|<%=acum_attend_cnt%>|