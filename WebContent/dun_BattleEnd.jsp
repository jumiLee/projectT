<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>

<%
String P_type ="T037";
String job_type = request.getParameter("job_type");
String dun_type = request.getParameter("dun_type");
String dun_id = request.getParameter("dun_id");
String dun_level = request.getParameter("dun_level");
String attend_sn = request.getParameter("attend_sn");
String bat_result = request.getParameter("bat_result");

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

ResultSet rs_rwd = null;
PreparedStatement pstmt_rwd = null;
List<Map<String, Object>> list_rwd = null;
Map<String, Object> map_rwd = null;
int tot_rwd_cnt = 0;

int result_cd = 0;
String result_packet = "" ; //Result Packet
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	sql.append(" Call abn_DunBattleEnd  ("+ job_type + "," + user_account + "," + dun_type + "," + dun_id + "," + dun_level + "," + attend_sn + "," + bat_result + ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		result_cd = rs.getInt("result");		
	}
	
	
// 보상결과조회
	//tot_rwd_cnt|rwd_type|rwd_id|rwd_sub_id|rwd_nm|rwd_img|item_grade|
	if(bat_result.equals("1")) {
		sql.setLength(0);
		sql.append(" Call abn_getDungeon  (2," + user_account + "," + dun_type + "," + dun_id + "," + dun_level + ")\n") ;
		pstmt_rwd = Conn.prepareStatement(sql.toString());
		
		rs_rwd = pstmt_rwd.executeQuery();
		list_rwd = new ArrayList<Map<String, Object>>();
		while (rs_rwd.next()) {
			
			map_rwd = new HashMap();
			
			map_rwd.put("rwd_type"		, rs_rwd.getInt("rwd_type"));
			map_rwd.put("rwd_id"		, rs_rwd.getInt("rwd_id"));
			map_rwd.put("rwd_sub_id"	, rs_rwd.getInt("rwd_sub_id"));
			map_rwd.put("rwd_cnt"		, rs_rwd.getInt("rwd_cnt"));
			map_rwd.put("rwd_nm"		, rs_rwd.getString("rwd_nm"));
			map_rwd.put("rwd_img"		, rs_rwd.getInt("rwd_img"));
			map_rwd.put("item_grade"	, rs_rwd.getInt("item_grade"));
			
			list_rwd.add(map_rwd);
			tot_rwd_cnt++;
		}//end reward while 
		// result_packet += tot_rwd_cnt +"|";  //현재 요일던전 보상은 무조건 1개이므로 tot_cnt는 보내지 않음.
		for(int r=0;r<list_rwd.size();r++){
			result_packet +=list_rwd.get(r).get("rwd_cnt").toString()+"|" +
							list_rwd.get(r).get("rwd_type").toString() 	+"|" +
							list_rwd.get(r).get("rwd_id").toString() 	+"|" +
							list_rwd.get(r).get("rwd_sub_id").toString()+"|" +							
							list_rwd.get(r).get("rwd_nm").toString() 	+"|" +
							list_rwd.get(r).get("rwd_img").toString() 	+"|" +
							list_rwd.get(r).get("item_grade").toString()+"|" ;
		}
		
	}else{
		result_packet = "0|0|0|0|0|0|0|";
	}
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();	
	if(pstmt_rwd != null) pstmt_rwd.close();
	if(rs_rwd != null) rs_rwd.close();
}	%>
<%=P_type %>|<%=result_cd%>|<%=bat_result%>|<%=result_packet%>