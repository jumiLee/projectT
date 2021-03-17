<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "javax.servlet.*"%>

<%@ include file="./moe_common.jsp"%>
<%

String P_type ="T12";
CallableStatement cs = null;
List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt = 0;

//New Flag 관련 변수
int msg_new = 2; int frd_new = 2; int achv_new = 2; int book_new = 2; int mon_new = 2; //int frd_new_reg=2;
int def_new = 2; int boss_new = 2; int tre_new = 2; int infi_new = 2; int item_new = 2; int skill_new = 2;

try{

	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

// 배틀 중 보스 시간체크하여 삭제	
	sql.append(" Call abn_DeleteBossBattle (2," + user_account + ") \n");
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
//System.out.println ("돌발보스체크");



//업적처리
	int achv_result =0;
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
	
	/*
	int achv_id=0;
	for (achv_id =1; achv_id < 4 ; achv_id ++) {  
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");  //이벤트업적(매일12:00~2:00사이접속/매일18:00~19:00사이접속/테스터 이벤트)
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
	*/
	
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


	//사용자 정보 조회 부분 

	Conn = DriverManager.getConnection(DB_url_replica, DB_user, DB_pwd);
	sql.setLength(0);
	sql.append(" Call abn_getUserInfo ( " + user_account + ") \n");
	//System.out.println (sql.toString());
	pstmt = Conn.prepareStatement(sql.toString());
	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		
		msg_new  = rs.getInt("msg_new");
		frd_new  = rs.getInt("frd_new");
		achv_new = rs.getInt("achv_new");
		book_new = rs.getInt("book_new");
		mon_new  = rs.getInt("mon_new");
		def_new  = rs.getInt("def_new");
		boss_new = rs.getInt("boss_new");
		tre_new  = rs.getInt("tre_new");
		infi_new = rs.getInt("infi_new");
		item_new = rs.getInt("item_new");
		skill_new = rs.getInt("skill_new");
		
		map = new HashMap();
		//user_rank|보스유무|남은시간(분)|msg_new|frd_new|achv_new|book_new|
		map.put("user_rank", rs.getInt("user_rank"));
		map.put("boss_exist", rs.getInt("boss_exist"));
		map.put("boss_create_time", rs.getLong("boss_create_time"));
		map.put("boss_remain_time", rs.getLong("boss_remain_time"));
		map.put("boss_cur_time", rs.getLong("boss_cur_time"));		
		map.put("wb_exist", rs.getInt("wb_exist"));
		map.put("wb_create_time", rs.getLong("wb_create_time"));
		map.put("wb_remain_time", rs.getLong("wb_remain_time"));
		map.put("msg_new", msg_new);
		map.put("frd_new", frd_new);
		map.put("achv_new", achv_new);
		map.put("book_new", book_new);
		map.put("mon_new", mon_new);
		map.put("def_new", def_new);
		map.put("boss_new", boss_new);
		map.put("tre_new", tre_new);
		map.put("infi_new", infi_new);
		map.put("item_new", item_new);
		map.put("skill_new", skill_new);
		map.put("attned_flag", rs.getInt("attned_flag"));
		map.put("evt_pay_remain_day", rs.getInt("evt_pay_remain_day"));
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
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|
<%for(int i=0;i<list.size();i++){%>
	<%=list.get(i).get("user_rank")%>|<%=list.get(i).get("boss_exist")%>|<%=list.get(i).get("boss_create_time")%>|<%=list.get(i).get("boss_cur_time")%>|<%=list.get(i).get("boss_remain_time")%>|<%=list.get(i).get("wb_exist")%>|<%=list.get(i).get("wb_create_time")%>|<%=list.get(i).get("wb_remain_time")%>|<%=list.get(i).get("msg_new")%>|<%=list.get(i).get("frd_new")%>|<%=list.get(i).get("achv_new")%>|<%=list.get(i).get("book_new")%>|<%=list.get(i).get("mon_new")%>|<%=list.get(i).get("def_new")%>|<%=list.get(i).get("boss_new")%>|<%=list.get(i).get("tre_new")%>|<%=list.get(i).get("infi_new")%>|<%=list.get(i).get("item_new")%>|<%=list.get(i).get("skill_new")%>|<%=list.get(i).get("attned_flag")%>|<%=list.get(i).get("evt_pay_remain_day")%>|
<%}%>