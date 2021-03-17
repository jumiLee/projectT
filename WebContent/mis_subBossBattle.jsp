<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T793";

String frd_account 	= request.getParameter("frd_account");	//함께 전투에 참여하는 친구 계정
String mis_id 		= request.getParameter("mis_id");		//mission id
String mis_sub_id 	= request.getParameter("mis_sub_id");	//mission sub id
String BatResult 	= request.getParameter("BatResult");	//bat result (client send)
int add_exp=0; int add_gold=0; //승리후 획득 경험치, 골드

int boss_mon_id = 0; String boss_result="00";

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	 
// 미션에 해당하는 boss_id 조회	
	sql.append ("select mon_id from MST_MISSION_DETAIL where mis_id=" + mis_id + " and mis_sub_id = " + mis_sub_id + "  \n");
	
	//System.out.println("boss id:"+sql.toString());
	
	pstmt = Conn.prepareStatement(sql.toString());
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		boss_mon_id = rs.getInt("mon_id");	
	}
 
  	
 // 보스전투
 	CallableStatement cs = null;
 /*
  	sql.setLength(0);
  	sql.append(" Exec [abn_MissionBossBattle_AP]  	\n");
	sql.append(" 1,  							\n"); 
	sql.append(" "+ user_account +",				\n");
	sql.append(" "+ frd_account  +",				\n");
	sql.append(" "+ BatResult  +",  			\n");
	sql.append(" "+ mis_id 		 +",			\n");
	sql.append(" "+ mis_sub_id 	 +",  			\n");
	sql.append(" ? 								\n");	//result (bat_result,level_flag,stage_clear_flag)
	//System.out.println("2:" + sql.toString());
	cs = Conn.prepareCall(sql.toString());
	cs.registerOutParameter(1, java.sql.Types.VARCHAR);
	cs.execute();
	boss_result 	= cs.getString(1);
	*/
	cs = Conn.prepareCall("{call abn_MissionBossBattle_AP(?,?,?,?,?,?,?)}");
	cs.setInt(1,1);
	cs.setString(2,user_account);
	cs.setString(3,frd_account);
	cs.setString(4,BatResult);
	cs.setString(5,mis_id);
	cs.setString(6,mis_sub_id);
	cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //result (bat_result,level_flag,stage_clear_flag)
	cs.execute();
	boss_result = cs.getInt(7);
	
  // 획득 경험치,골드 조회	(승리한 경우만)
	sql.setLength(0);
  
  	if(BatResult.equals("1")){
  		sql.append ("select mis_gold, mis_exp from MST_MISSION_DETAIL  where mis_id=" + mis_id + " and mis_sub_id = " + mis_sub_id + "  \n");
  		
  		//System.out.println("3:"+sql.toString());
  		
  		pstmt = Conn.prepareStatement(sql.toString());
  	  	rs = pstmt.executeQuery();
  	  	
  	  	while(rs.next()){
  	  		add_exp = rs.getInt("mis_exp");	
  	  		add_gold= rs.getInt("mis_gold");
  		}
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
<%=P_type%>|<%=boss_result%>|<%=add_gold%>|<%=add_exp%>|