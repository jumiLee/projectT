<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>	
<%
String P_type ="T253";
String job_type 	= request.getParameter("job_type"); 		//1:PVP
String bat_account 	= request.getParameter("bat_user_account"); //대상 계정
String bat_result	= request.getParameter("bat_result"); 		//대전 결과

int result_cd = 0; int get_score=0; int cur_score=0; int cont_win_cnt=0; int get_gold=0;

//업적관련
	CallableStatement cs = null;
	int achv_id = 0; int achv_result=0;

try{ 
		 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_BattleEnd  ("+job_type+"," + user_account + "," + bat_account + "," + bat_result + ") \n") ;
	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println("PVP end:" + sql.toString());
  	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		//result|get_score(획득점수)|cur_score(현재점수)|cont_win_cnt(연승회수)|get_gold(획득골드)|
		result_cd 	= rs.getInt("result"); 
		get_score	= rs.getInt("get_score");
		cur_score	= rs.getInt("point");
		cont_win_cnt= rs.getInt("cont_win_cnt");
		get_gold	= rs.getInt("get_gold");
		
	}
	
	
	//PVP 참가 업적업데이트 	 
	if(job_type.equals("1")) {
		//(attend) 참가 업적	
		for (achv_id =1; achv_id < 5 ; achv_id ++) {  //업적아이디 (1~까지) 
				
			cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
			cs.setInt(1,1);					 
			cs.setString(2,user_account);
			cs.setString(3,user_account);
			cs.setInt(4,6);
			cs.setInt(5,achv_id);
			cs.setInt(6,1);
			cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
			cs.execute();
			achv_result = cs.getInt(7);
			
			//System.out.println(achv_id + "번째 결과" + achv_result);
		}
		
		//(Weekly) 참가 업적	
		for (achv_id =9; achv_id < 13 ; achv_id ++) {  //업적아이디 (1~까지) 
						
			cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
			cs.setInt(1,1);					 
			cs.setString(2,user_account);
			cs.setString(3,user_account);
			cs.setInt(4,2);
			cs.setInt(5,achv_id);
			cs.setInt(6,1);
			cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
			cs.execute();
			achv_result = cs.getInt(7);			
		}
		
		//(daily) PVP 1회 참가 업적업데이트
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);					 
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,3);
		cs.setInt(5,7);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
		cs.execute();
		achv_result = cs.getInt(7);
		
		//(continuous) PVP 최초 참가 업적업데이트
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,4);
		cs.setInt(5,29);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
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
<%=P_type %>|<%=bat_result %>|<%=get_score %>|<%=cur_score%>|<%=cont_win_cnt%>|<%=get_gold%>|