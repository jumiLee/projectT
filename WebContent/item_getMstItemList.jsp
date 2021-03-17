<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String job_type = request.getParameter("job_type");
String item_type = request.getParameter("item_type");
String P_type ="";

if (job_type.equals("1")) { //제조아이템 상세정보
	P_type = "T560";
}else if (job_type.equals("2")){	//By Type
	P_type = "T532";
}else if (job_type.equals("3")){	//By Category
	P_type = "T533";
}


//조회 아이템관련 
	List<Map<String, Object>> list = null;
	Map<String, Object> map = null;
	int tot_cnt=0 ;
	String m_item_id ="";
	
//아이템 마스터 관련
	ResultSet rs_item = null;
	PreparedStatement pstmt_item = null;
	int tot_item_cnt = 0; 
	Map<String, Object> map_item = null;
	List<Map<String, Object>> list_item = null;
	String v_item_id="";	
		
//소켓 마스터 관련
	Map<String, Object> map_sok = null;
	List<Map<String, Object>> list_sok = null;
	int tot_sok_cnt=0 ;
	String s_item_id="";	
	
	String result_packet = "" ; //Result Packet

	
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
// 조회 아이템 기본 정보
	if (job_type.equals("1")) { //제조아이템리스트
		sql.append(" CALL abn_getMtrItemList (1,"+user_account+ ",null, null) \n");
	}

	pstmt = Conn.prepareStatement(sql.toString());
  	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	if (job_type.equals("1")) { //제조아이템리스트
		while(rs.next()){
			map = new HashMap();
			/*	total_cnt|mtr_item_id|mtr_item_nm|mtr_item_img_no|mtr_item_uid|item_cnt|mtr_item_cnt|recipe_desc| */
			map.put("mtr_item_id"		, rs.getInt("mtr_item_id"));
			map.put("mtr_item_nm"		, rs.getString("mtr_item_nm"));
			map.put("mtr_item_img_no"	, rs.getInt("mtr_item_img_no"));
			map.put("mtr_item_uid"		, rs.getInt("mtr_item_uid"));		
			map.put("item_cnt"			, rs.getInt("item_cnt"));	
			
			map.put("mtr_item_cnt"		, rs.getInt("mtr_item_cnt"));
			map.put("recipe_desc"		, rs.getString("recipe_desc"));
			map.put("item_id"			, rs.getInt("item_id"));
			
			list.add(map);
			tot_cnt ++;
		}
	}
	
//아이템 기본 및 소켓 정보	
	sql.setLength(0);
	sql.append(" Call abn_getMstItemList (5,null,null,0) \n");
	
	pstmt_item 	= Conn.prepareStatement(sql.toString());
	rs_item 	= pstmt_item.executeQuery();	
	list_item 	= new ArrayList<Map<String, Object>>();	
	
//Save item master info Map 	
	while(rs_item.next()){
		map_item = new HashMap();
		//item_id|item_uniqueID(0)|item_type|item_nm|item_img_no|item_rare_degree|item_usage|item_cnt(0)|item_desc|item_price|item_value|
		//ATT|DEF|HP|SP|abnormal|speedup_all|speedup|exp_up|critical_up|reinforce_up|
		//limit_lv|item_period_flag|item_period|remain_time(s)(0)|item_class|item_grade|item_level(0)|item_exp(0)|item_rfc_flag|item_rfc_mtr_flag|target_exp(0)|socket_equip_flag|check_flag(0)|item_upgrade_price(0)|
		// item_socket_cnt|socket_pos|socket_type|item_setSocket_cnt(0으로 보냄)*/
		map_item.put("item_id"		, rs_item.getInt("item_id"));
		map_item.put("item_uniqueID", 0);
		map_item.put("item_type"	, rs_item.getInt("item_type"));		
		map_item.put("item_nm"		, rs_item.getString("item_nm"));
		map_item.put("item_img_no"	, rs_item.getInt("item_img_no"));		
		map_item.put("rare_degree"	, rs_item.getInt("rare_degree"));
		map_item.put("item_usage"	, 0);
		map_item.put("item_cnt"		, 0);
		map_item.put("item_desc"	, rs_item.getString("item_desc"));
		map_item.put("item_price"	, rs_item.getInt("item_price"));		
		map_item.put("item_value"	, rs_item.getInt("item_value"));
		
		map_item.put("ATT"			, rs_item.getInt("ATT"));
		map_item.put("DEF"			, rs_item.getInt("DEF"));
		map_item.put("HP"			, rs_item.getInt("HP"));
		map_item.put("SP"			, rs_item.getInt("SP"));		
		map_item.put("abnormal"		, rs_item.getInt("abnormal"));
		map_item.put("speedup_all"	, rs_item.getInt("speedup_all"));
		map_item.put("speedup"		, rs_item.getInt("speedup"));
		map_item.put("exp_up"		, rs_item.getInt("exp_up"));
		map_item.put("critical_up"	, rs_item.getInt("critical_up"));
		map_item.put("reinforce_up"	, rs_item.getInt("reinforce_up"));
		
		map_item.put("limit_lv"		, rs_item.getInt("limit_lv"));
		map_item.put("item_period_flag"	, rs_item.getInt("item_period_flag"));
		map_item.put("item_period"	, rs_item.getInt("item_period"));
		map_item.put("remain_time"	, 0);		
		map_item.put("item_class"	, rs_item.getInt("class"));  		
		map_item.put("item_grade"	, rs_item.getInt("item_grade"));  	
		map_item.put("item_level"	, 0);  	
		map_item.put("item_exp"		, 0);  		
		map_item.put("item_rfc_flag"	, rs_item.getInt("item_rfc_flag"));		
		map_item.put("item_rfc_mtr_flag"	, rs_item.getInt("item_rfc_mtr_flag")); 
		map_item.put("target_exp"		, 0);  		
		map_item.put("socket_equip_flag"	, rs_item.getInt("socket_equip_flag"));	
		map_item.put("check_flag"		, 0);			
		map_item.put("item_upgrade_cost"	, 0);		
		
		map_item.put("socket_pos"		, rs_item.getInt("socket_pos"));
		map_item.put("socket_type"		, rs_item.getInt("tre_type"));
		
		list_item.add(map_item);
		tot_item_cnt ++;
	}

//Save item Socket info Map (기존 아이템마스터 정보에서 소캣정보 분리)
	list_sok 	= new ArrayList<Map<String, Object>>();	
	for(int s=0;s<list_item.size();s++){
		
		map_sok = new HashMap();
		//item_socket_cnt|socket_pos|socket_type|
		map_sok.put("item_id"	 , list_item.get(s).get("item_id").toString());
		map_sok.put("socket_pos" , list_item.get(s).get("socket_pos").toString());
		map_sok.put("socket_type", list_item.get(s).get("socket_type").toString());
		//map_sok.put("item_setSocket_cnt","0");
		
		list_sok.add(map_sok);
	}

//특정조회 아이템과 아이템마스터정보 합침.
//System.out.println ("tot_cnt:" + tot_cnt);

	result_packet += tot_cnt +"|";
	for(int i=0; i<list.size(); i++){
		if (job_type.equals("1")) { //제조아이템리스트
			result_packet += 	
				list.get(i).get("mtr_item_id").toString() +"|" +
				list.get(i).get("mtr_item_nm").toString() +"|" +
				list.get(i).get("mtr_item_img_no").toString() +"|" +
				list.get(i).get("mtr_item_uid").toString() +"|" +
				list.get(i).get("item_cnt").toString() +"|" +			
				list.get(i).get("mtr_item_cnt").toString() +"|" +
				list.get(i).get("recipe_desc").toString() +"|" +
				list.get(i).get("item_id").toString() +"|" ;
		
			m_item_id = list.get(i).get("item_id").toString();
		}
		
		//아이템 마스터 정보
		for(int t=0; t < list_item.size(); t++){
			if(t==0 || !v_item_id.equals(list_item.get(t).get("item_id").toString())) {
			v_item_id = list_item.get(t).get("item_id").toString();

			if (m_item_id.equals(v_item_id)){
				result_packet += 	
						list_item.get(t).get("item_uniqueID").toString() +"|" +
						list_item.get(t).get("item_type").toString() +"|" +								
						list_item.get(t).get("item_nm").toString() +"|" +
						list_item.get(t).get("item_img_no").toString() +"|" +
						list_item.get(t).get("rare_degree").toString() +"|" +
						list_item.get(t).get("item_usage").toString() +"|" +
						list_item.get(t).get("item_cnt").toString() +"|" +
						list_item.get(t).get("item_desc").toString() +"|" +
						list_item.get(t).get("item_price").toString() +"|" +
						list_item.get(t).get("item_value").toString() +"|" +						
						list_item.get(t).get("ATT").toString() +"|" +
						list_item.get(t).get("DEF").toString() +"|" +
						list_item.get(t).get("HP").toString() +"|" +
						list_item.get(t).get("SP").toString() +"|" +
						list_item.get(t).get("abnormal").toString() +"|" +
						list_item.get(t).get("speedup_all").toString() +"|" +
						list_item.get(t).get("speedup").toString() +"|" +
						list_item.get(t).get("exp_up").toString() +"|" +
						list_item.get(t).get("critical_up").toString() +"|" +
						list_item.get(t).get("reinforce_up").toString() +"|" +					
						list_item.get(t).get("limit_lv").toString() +"|" +
						list_item.get(t).get("item_period_flag").toString() +"|" +
						list_item.get(t).get("item_period").toString() +"|" +
						list_item.get(t).get("remain_time").toString() +"|" +
						list_item.get(t).get("item_class").toString() +"|" +
						list_item.get(t).get("item_grade").toString() +"|" +
						list_item.get(t).get("item_level").toString() +"|" +
						list_item.get(t).get("item_exp").toString() +"|" +
						list_item.get(t).get("item_rfc_flag").toString() +"|" +
						list_item.get(t).get("item_rfc_mtr_flag").toString() +"|" +
						list_item.get(t).get("target_exp").toString() +"|" +
						list_item.get(t).get("socket_equip_flag").toString() +"|" +
						list_item.get(t).get("check_flag").toString() +"|" +
						list_item.get(t).get("item_upgrade_cost").toString() +"|" ;
				
				//아이템 소캣 개수 구하기 
				tot_sok_cnt = 0;
				for(int sc=0; sc < list_sok.size(); sc++){
					s_item_id = list_sok.get(sc).get("item_id").toString();
					if (m_item_id.equals(s_item_id)){
						tot_sok_cnt++;
					}
				}
				
				//아이템 소캣정보 추가
				result_packet += tot_sok_cnt +"|";
				for(int s=0; s < list_sok.size(); s++){
					s_item_id = list_sok.get(s).get("item_id").toString();
					
					if (m_item_id.equals(s_item_id)){
						result_packet += 	
								list_sok.get(s).get("socket_pos").toString() +"|" +
								list_sok.get(s).get("socket_type").toString() +"|" ;
								//list_sok.get(s).get("item_setSocket_cnt").toString() +"|" ;						
					}
				}//end socket for
			}
			}//end if
		}//end item master for
		
	}
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(rs_item != null) rs_item.close();
	if(pstmt_item != null) pstmt_item.close(); 
 
}	%>

<%=P_type %>|<%=result_packet%>