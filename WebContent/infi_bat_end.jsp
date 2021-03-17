<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>	
<%
String P_type ="T282";
String infi_id 		= request.getParameter("infi_id"); 		//무한대전 아이디 (Stage) 
String item_use_flag= request.getParameter("item_use_flag"); 		//아이템사용여
String bat_result 	= request.getParameter("bat_result");	//대상 결과
String bat_score	= request.getParameter("bat_score"); 	//대전 획득 점수

int result_cd = 0; int get_score=0; int cur_score=0; int cont_win_cnt=0; int get_gold=0; int revival_type =0; int revival_cost=0;
int achv_id = 0; int achv_result=0; //업적관련


CallableStatement cs = null;
try{ 
		 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_infiBattleEnd  (1," + user_account + "," + infi_id + "," + item_use_flag + "," + bat_result + "," + bat_score +  ") \n") ;
	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		//result|get_score(획득점수)|cur_score(현재점수)|cont_win_cnt(연승회수)|get_gold(획득골드)|
		result_cd 	 = rs.getInt("result"); 
		get_score	 = rs.getInt("get_score");
		cur_score	 = rs.getInt("point");
		cont_win_cnt = rs.getInt("cont_win_cnt");
		get_gold	 = rs.getInt("get_gold");
		revival_type = rs.getInt("infi_revival_type");
		revival_cost = rs.getInt("infi_revival_cost");
	}
	
	if(result_cd != 0 ){
		//System.out.println ("무한대전 End  Error(" + user_account + "):" + result_cd);
	}
	
//무한대전 참가 업적업데이트 	 
	if(bat_result.equals("2")) { //무한대전이 끝나는 시점에 한번만 업데이트
		for (achv_id =1; achv_id < 5 ; achv_id ++) {  //업적아이디 (1~까지) 
			
			cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
			cs.setInt(1,1);					 
			cs.setString(2,user_account);
			cs.setString(3,user_account);
			cs.setInt(4,8);
			cs.setInt(5,achv_id);
			cs.setInt(6,1);
			cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
			cs.execute();
			achv_result = cs.getInt(7);
		}
	}
	
//(daily) 무한대전 1회 참가 업적업데이트
	if(bat_result.equals("1")) {
		
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);					 
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,3);
		cs.setInt(5,3);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
		cs.execute();
		achv_result = cs.getInt(7);
	}

//(weekly) 무한대전 10 Round 클리어하기	
		if(bat_result.equals("1") && infi_id.equals("10")) {
			
			cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
			cs.setInt(1,1);					 
			cs.setString(2,user_account);
			cs.setString(3,user_account);
			cs.setInt(4,2);
			cs.setInt(5,12);
			cs.setInt(6,1);
			cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
			cs.execute();
			achv_result = cs.getInt(7);
		}
//(weekly) 무한대전 20 Round 클리어하기	
	if(bat_result.equals("1") && infi_id.equals("20")) {
		
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);					 
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,2);
		cs.setInt(5,3);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
		cs.execute();
		achv_result = cs.getInt(7);
	}
//(weekly) 무한대전 30 Round 클리어하기
	if(bat_result.equals("1") && infi_id.equals("30")) {
		
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);					 
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,2);
		cs.setInt(5,4);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
		cs.execute();
		achv_result = cs.getInt(7);
	}

//(continuous) 최초 무한대전 참가 업적
	if(bat_result.equals("1") && infi_id.equals("1")) {
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,4);
		cs.setInt(5,28);
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
<%=P_type %>|<%=result_cd %>|<%=get_score %>|<%=cur_score%>|<%=infi_id%>|<%=get_gold%>|<%=bat_result%>|<%=revival_type%>|<%=revival_cost%>|