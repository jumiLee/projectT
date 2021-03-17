<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>

<%
String P_type ="T035";
String dun_type	= request.getParameter("dun_type"); //1:요일던전
String result_packet = "" ; //Result Packet

//던전관련
	List<Map<String, Object>> list = null;
	Map<String, Object> map = null;
	int tot_cnt = 1;
	String dun_type_d = "0"; String dun_id_d = "0"; String dun_level_d = "0";
	
//던전레벨관련
	List<Map<String, Object>> list_lv = null;
	Map<String, Object> map_lv = null;
	int tot_lv_cnt = 0;
	String dun_type_lv = "0"; String dun_id_lv = "0"; String dun_level_lv = "0";
//보상관련
	ResultSet rs_rwd = null;
	PreparedStatement pstmt_rwd = null;
	List<Map<String, Object>> list_rwd = null;
	Map<String, Object> map_rwd = null;
	int tot_rwd_cnt = 0;
	String dun_type_rwd = "0"; String dun_id_rwd = "0"; String dun_level_rwd = "0";
	
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

//던전리스트 조회 
	sql.append(" Call abn_getDungeon  (1," + user_account + "," + dun_type + ", null,null)\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
//System.out.println(sql.toString());
			  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while (rs.next()) {
		//dun_type|dun_id|today_flag|
		map = new HashMap();
		
		map.put("dun_type"		, rs.getInt("dun_type"));
		map.put("dun_id"		, rs.getInt("dun_id"));
		map.put("today_flag"	, rs.getInt("today_flag"));
		map.put("dun_level"		, rs.getInt("dun_level"));
		map.put("dun_nm"		, rs.getString("dun_nm"));
		map.put("dun_desc"		, rs.getString("dun_desc"));
		map.put("need_AP"		, rs.getInt("need_AP"));
		map.put("tot_cnt"		, rs.getInt("tot_cnt"));
		map.put("attend_cnt"	, rs.getInt("attend_cnt"));
		map.put("attend_fee"	, rs.getInt("attend_fee"));
		map.put("rivival_fee"	, rs.getInt("rivival_fee"));
		
		list.add(map);
	}//end dungeon list while

//던전 리스틑 레벨 조회
	list_lv = new ArrayList<Map<String, Object>>();
	
	for(int i=0;i<list.size();i++){	
	//while (rs.next()) {
		//tot_level_cnt|dun_level|dun_nm|dun_desc|need_AP|tot_cnt(참여가능회수)|attend_cnt(실제참여회수)
		map_lv = new HashMap();
		
		map_lv.put("dun_type"	, list.get(i).get("dun_type").toString());
		map_lv.put("dun_id"		, list.get(i).get("dun_id").toString());
		map_lv.put("dun_level"	, list.get(i).get("dun_level").toString());
		map_lv.put("dun_nm"		, list.get(i).get("dun_nm").toString());
		map_lv.put("dun_desc"	, list.get(i).get("dun_desc").toString());
		map_lv.put("need_AP"	, list.get(i).get("need_AP").toString());
		map_lv.put("tot_cnt"	, list.get(i).get("tot_cnt").toString());
		map_lv.put("attend_cnt"	, list.get(i).get("attend_cnt").toString());
		map_lv.put("attend_fee"	, list.get(i).get("attend_fee").toString());
		map_lv.put("rivival_fee", list.get(i).get("rivival_fee").toString());
		
		list_lv.add(map_lv);		
	}//end dungeon level list while
	
//던전 보상 리스트조회
	sql.setLength(0);
	sql.append(" Call abn_getDungeon  (2," + user_account + "," + dun_type + ", null,null)\n") ;
	pstmt_rwd = Conn.prepareStatement(sql.toString());
	//System.out.println(sql.toString());
			  	
	rs_rwd = pstmt_rwd.executeQuery();
	list_rwd = new ArrayList<Map<String, Object>>();
	while (rs_rwd.next()) {
		//tot_rwd_cnt|rwd_type|rwd_id|rwd_sub_id|rwd_cnt|rwd_nm|rwd_img|
		map_rwd = new HashMap();
		
		map_rwd.put("dun_type"		, rs_rwd.getInt("dun_type"));
		map_rwd.put("dun_id"		, rs_rwd.getInt("dun_id"));
		map_rwd.put("dun_level"		, rs_rwd.getInt("dun_level"));
		map_rwd.put("rwd_type"		, rs_rwd.getInt("rwd_type"));
		map_rwd.put("rwd_sn"		, rs_rwd.getInt("rwd_sn"));
		map_rwd.put("rwd_id"		, rs_rwd.getInt("rwd_id"));
		map_rwd.put("rwd_sub_id"	, rs_rwd.getInt("rwd_sub_id"));
		map_rwd.put("rwd_cnt"		, rs_rwd.getInt("rwd_cnt"));
		map_rwd.put("rwd_nm"		, rs_rwd.getString("rwd_nm"));
		map_rwd.put("rwd_img"		, rs_rwd.getInt("rwd_img"));
		
		list_rwd.add(map_rwd);
		tot_rwd_cnt++;
	}//end reward while 
	
		
//던전정보 리스트 
	for(int i=0;i<list.size();i++){
		
		if(i == 0){
			result_packet +=list.get(i).get("dun_type").toString() +"|" + 
							list.get(i).get("dun_id").toString() +"|"+ 
							list.get(i).get("today_flag").toString() +"|3|" ;
		}else{
		
			if(	dun_type_d.equals(list.get(i).get("dun_type").toString()) && 
				!dun_id_d.equals(list.get(i).get("dun_id").toString())) 
			{
				// dun_type|dun_id|today_flag|
				result_packet +=list.get(i).get("dun_type").toString() +"|" + 
								list.get(i).get("dun_id").toString() +"|"+ 
								list.get(i).get("today_flag").toString() +"|3|" ;
				tot_cnt++;
			}
		}
		dun_type_d  = list.get(i).get("dun_type").toString();
		dun_id_d 	= list.get(i).get("dun_id").toString();
		dun_level_d	= list.get(i).get("dun_level").toString();	
			
	
	//던전레벨정보 리스트
		tot_lv_cnt = 0;
		for(int lv=0;lv<list_lv.size();lv++){
			
			dun_type_lv  	= list_lv.get(lv).get("dun_type").toString();
			dun_id_lv 	  	= list_lv.get(lv).get("dun_id").toString();
			dun_level_lv	= list_lv.get(lv).get("dun_level").toString();
			
			if (dun_type_d.equals(dun_type_lv) && dun_id_d.equals(dun_id_lv)) {
				tot_lv_cnt++;
			}
		}
		//System.out.println("tot_lv_cnt:" + tot_lv_cnt);
		//result_packet += tot_lv_cnt +"|";
		
		for(int lv=0;lv<list_lv.size();lv++){
			
			dun_type_lv  	= list_lv.get(lv).get("dun_type").toString();
			dun_id_lv 	  	= list_lv.get(lv).get("dun_id").toString();
			dun_level_lv	= list_lv.get(lv).get("dun_level").toString();
			
			//tot_level_cnt|dun_level|dun_nm|dun_desc|need_AP|tot_cnt(참여가능회수)|attend_cnt(실제참여회수)|attend_fee(입장료)
			if (dun_type_d.equals(dun_type_lv) && dun_id_d.equals(dun_id_lv) && dun_level_d.equals(dun_level_lv)) {
				result_packet +=  	dun_level_lv+"|" + 
									list_lv.get(lv).get("dun_nm").toString() +"|" +
									list_lv.get(lv).get("dun_desc").toString() +"|" + 
									list_lv.get(lv).get("need_AP").toString() +"|" + 
									list_lv.get(lv).get("tot_cnt").toString() +"|" + 
									list_lv.get(lv).get("attend_cnt").toString() +"|" +
									list_lv.get(lv).get("attend_fee").toString() +"|" +
									list_lv.get(lv).get("rivival_fee").toString() +"|";
			
			
			//던전레벨별 보상정보 리스트	
			
				tot_rwd_cnt = 0;
				for(int r=0;r<list_rwd.size();r++){
					
					dun_type_rwd  	= list_rwd.get(r).get("dun_type").toString();
					dun_id_rwd 	  	= list_rwd.get(r).get("dun_id").toString();
					dun_level_rwd	= list_rwd.get(r).get("dun_level").toString();
					
					if (dun_type_lv.equals(dun_type_rwd) && dun_id_lv.equals(dun_id_rwd) && dun_level_lv.equals(dun_level_rwd)) {
						tot_rwd_cnt ++;
					}
				}
				result_packet += tot_rwd_cnt +"|";
				//tot_rwd_cnt|rwd_type|rwd_id|rwd_sub_id|rwd_cnt|rwd_nm|rwd_img|
				
				for(int r=0;r<list_rwd.size();r++){
					
					dun_type_rwd  	= list_rwd.get(r).get("dun_type").toString();
					dun_id_rwd 	  	= list_rwd.get(r).get("dun_id").toString();
					dun_level_rwd	= list_rwd.get(r).get("dun_level").toString();
					
					if 	(dun_type_d.equals(dun_type_rwd) && dun_id_d.equals(dun_id_rwd) && dun_level_d.equals(dun_level_rwd) &&
						 dun_type_lv.equals(dun_type_rwd) && dun_id_lv.equals(dun_id_rwd) && dun_level_lv.equals(dun_level_rwd))
					{
						result_packet +=	list_rwd.get(r).get("rwd_type").toString() +"|" +
											list_rwd.get(r).get("rwd_id").toString() +"|" +
											list_rwd.get(r).get("rwd_sub_id").toString() +"|" +
											list_rwd.get(r).get("rwd_cnt").toString() +"|" +
											list_rwd.get(r).get("rwd_nm").toString() +"|" +
											list_rwd.get(r).get("rwd_img").toString() +"|" ;
					}
				}  //end dungeon reward
			}//end dungeon level if
		}//end dungeon level list for	
	
	}//end dungeon list for
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
<%=P_type %>|<%=tot_cnt%>|<%=result_packet%>