<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>

<%
String P_type ="T036";
String job_type = request.getParameter("job_type");
String dun_type = request.getParameter("dun_type");
String dun_id = request.getParameter("dun_id");
String dun_level = request.getParameter("dun_level");

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

List<Map<String, Object>> list_m = null;
Map<String, Object> map_m = null;

ResultSet rs_d = null;
PreparedStatement pstmt_d = null;
String result_packet = "" ; //Result Packet

int dun_type_i=0; int dun_id_i=0; int dun_level_i =0; int mon_id= 0; 	int mon_sn = 0; 
String mon_id_s="0"; String mon_sn_s="0"; 
int tot_cnt = 0; int tot_sk_cnt=0;

int result_cd = 0;
int attend_sn = 0;  //시작한 전투일련 번호 (전투 결과 업데이트에 필요한 값)
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	sql.append(" Call abn_DunBattleStart  ("+ job_type + "," + user_account + "," + dun_type + "," + dun_id + "," + dun_level + ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		result_cd = rs.getInt("result");
		attend_sn = rs.getInt("attend_sn");
	}	
	
	if (result_cd == 0) {	//던전전투 시작 가능하면, 
	
		sql.setLength(0);
		sql.append(" Call abn_getDungeon  (3, "+ user_account + "," + dun_type + "," + dun_id + "," + dun_level + ")\n") ;
		//System.out.println("dungeon monster list :" + sql.toString());
				
		pstmt_d = Conn.prepareStatement(sql.toString());
		rs_d = pstmt_d.executeQuery();
				
		list 	= new ArrayList<Map<String, Object>>();
				
		while(rs_d.next()){			
					
			map = new HashMap();
			
			if ( mon_id != (Integer)rs_d.getInt("mon_id") || mon_sn != (Integer)rs_d.getInt("mon_sn")) {
				tot_cnt++;	
			}
			map.put("dun_stage", rs_d.getInt("dun_stage"));
			map.put("mon_id", rs_d.getInt("mon_id"));
			map.put("mon_sn", rs_d.getInt("mon_sn"));
			map.put("mon_type", rs_d.getInt("mon_type"));
			map.put("mon_lv", rs_d.getInt("mon_lv"));
			map.put("mon_nm", rs_d.getString("mon_nm"));
			map.put("mon_rare_degree", rs_d.getInt("mon_rare_degree"));
			map.put("mon_HP", rs_d.getInt("mon_HP"));
			map.put("mon_ATT", rs_d.getInt("mon_ATT"));
			map.put("mon_DEF", rs_d.getInt("mon_DEF"));
			map.put("mon_STR", rs_d.getInt("mon_STR"));
			map.put("skill_id", rs_d.getInt("skill_id"));
			map.put("skill_nm", rs_d.getString("skill_nm"));
			map.put("skill_ATT", rs_d.getInt("skill_ATT"));
			map.put("skill_DEF", rs_d.getInt("skill_DEF"));
			map.put("skill_cooltime", rs_d.getInt("skill_cooltime"));
			map.put("skill_luck", rs_d.getInt("skill_luck"));
			map.put("skill_confusion", rs_d.getInt("skill_confusion"));
			
			list.add(map);
			
			mon_id 		= rs_d.getInt("mon_id");
			mon_sn 		= rs_d.getInt("mon_sn");
		}
		
//System.out.println ("tot_cnt:" + tot_cnt);

		list_m = new ArrayList<Map<String, Object>>();
		
		for(int i=0;i<list.size();i++){	
			//skill_cnt|skill_id|skill_nm|skill_ATT|skill_DEF|skill_cooltime|skill_luck|confusion_luck|
			map_m = new HashMap();
			
			map_m.put("mon_id"			, list.get(i).get("mon_id").toString());
			map_m.put("mon_sn"			, list.get(i).get("mon_sn").toString());
			map_m.put("skill_id"		, list.get(i).get("skill_id").toString());
			map_m.put("skill_nm"		, list.get(i).get("skill_nm").toString());
			map_m.put("skill_ATT"		, list.get(i).get("skill_ATT").toString());
			map_m.put("skill_DEF"		, list.get(i).get("skill_DEF").toString());
			map_m.put("skill_cooltime"	, list.get(i).get("skill_cooltime").toString());
			map_m.put("skill_luck"		, list.get(i).get("skill_luck").toString());
			map_m.put("skill_confusion"	, list.get(i).get("skill_confusion").toString());
			
			list_m.add(map_m);		
		}//end dungeon monster list for
		
			
		for(int i=0;i<list.size();i++){
			if ( (i==0) || (!mon_id_s.equals(list.get(i).get("mon_id").toString()) || !mon_sn_s.equals(list.get(i).get("mon_sn").toString()))){ 
				
			
				//total_cnt|dun_stage|mon_id|mon_sn|mon_lv|mon_nm|mon_rare_degree|mon_HP|mon_ATT|mon_DEF|STR_cnt|
				result_packet +=list.get(i).get("dun_stage").toString() +"|" + 
								list.get(i).get("mon_id").toString() +"|" +
								list.get(i).get("mon_sn").toString() +"|" +
								list.get(i).get("mon_type").toString() +"|" +
								list.get(i).get("mon_lv").toString() +"|" +
								list.get(i).get("mon_nm").toString() +"|" +
								list.get(i).get("mon_rare_degree").toString() +"|" +
								list.get(i).get("mon_HP").toString() +"|" +
								list.get(i).get("mon_ATT").toString() +"|" +
								list.get(i).get("mon_DEF").toString() +"|" +
								list.get(i).get("mon_STR").toString() +"|" ;
				
				mon_id_s 	= list.get(i).get("mon_id").toString();
				mon_sn_s 	= list.get(i).get("mon_sn").toString();				
			
				tot_sk_cnt = 0;
				for(int sk=0;sk<list_m.size();sk++){
					
					if (mon_id_s.equals(list_m.get(sk).get("mon_id").toString()) && mon_sn_s.equals(list_m.get(sk).get("mon_sn").toString())) {
						tot_sk_cnt++;
					}			
				}
				result_packet += tot_sk_cnt +"|";
				
				for(int sk=0;sk<list_m.size();sk++){
					
					if (mon_id_s.equals(list_m.get(sk).get("mon_id").toString()) && mon_sn_s.equals(list_m.get(sk).get("mon_sn").toString())) {
						result_packet +=list_m.get(sk).get("skill_id").toString() +"|" + 
										list_m.get(sk).get("skill_nm").toString() +"|" +
										list_m.get(sk).get("skill_ATT").toString() +"|" +
										list_m.get(sk).get("skill_DEF").toString() +"|" +
										list_m.get(sk).get("skill_cooltime").toString() +"|" +
										list_m.get(sk).get("skill_luck").toString() +"|" +
										list_m.get(sk).get("skill_confusion").toString() +"|" ;
					}			
				}
			}
		}//end for 
				
	}else{
		//dun_stage|mon_id|mon_sn|mon_level|mon_nm|mon_rare_degree|mon_HP|mon_ATT|mon_DEF|STR_cnt|
		//skill_cnt|skill_id|skill_nm|skill_ATT|skill_DEF|skill_cooltime|skill_luck|confusion_luck|
		result_packet ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|";
	}
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(pstmt_d != null) pstmt_d.close();
	if(rs_d != null) rs_d.close();	
}	%>
<%=P_type %>|<%=result_cd%>|<%=attend_sn%>|<%=tot_cnt%>|<%=result_packet%>