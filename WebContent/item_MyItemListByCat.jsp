<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>

<%
String P_type ="T533";
String item_category = request.getParameter("item_category");

//아이템관련
	List<Map<String, Object>> list = null; 
	Map<String, Object> map = null;
	int tot_cnt ;
	tot_cnt = 0;
	String eq_item_id; String eq_item_uniqueID;

	//소켓 마스터 관련
	ResultSet rs_sok = null;
	PreparedStatement pstmt_sok = null;
	int tot_sok_cnt; 
	tot_sok_cnt = 0; 
	Map<String, Object> map_sok = null;
	List<Map<String, Object>> list_sok = null;
	String sok_item_id;	

//나의 소켓 정보 관련
	ResultSet rs_my_sok = null;
	PreparedStatement pstmt_my_sok = null;
	int tot_my_sok_cnt; 
	tot_my_sok_cnt = 0; 
	Map<String, Object> map_my_sok = null;
	List<Map<String, Object>> list_my_sok = null;
	String my_sok_item_id ="0";	String my_sok_item_uniqueid  ="0";
	
	String result_packet = "" ; //Result Packet
	
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
//System.out.println ("/////////// item_MyItemListCat  /////////// ");
// 아이템정보 		
	sql.append(" CALL abn_getItemList (6,"+user_account+ ","+ item_category +") \n");
  	pstmt = Conn.prepareStatement(sql.toString());
	//System.out.println ("item_MyItemListByCat:" + sql.toString());  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	//몬스터 장착아이템 소켓 마스터 정보	
	sql.setLength(0);
	sql.append(" Call abn_getSocketTreasureList (7, " + user_account + ", null,null,null,null) \n");
	//System.out.println ("Socket:" + sql.toString());
	pstmt_sok = Conn.prepareStatement(sql.toString());
	rs_sok 	 = pstmt_sok.executeQuery();	
	list_sok = new ArrayList<Map<String, Object>>();	

//몬스터 장착아이템 소켓 정보	
	sql.setLength(0);
	sql.append(" Call abn_getSocketTreasureList (3, " + user_account + ", null,null,null,null) \n");
	//System.out.println ("Socket:" + sql.toString());
	pstmt_my_sok = Conn.prepareStatement(sql.toString());
	rs_my_sok 	 = pstmt_my_sok.executeQuery();	
	list_my_sok = new ArrayList<Map<String, Object>>();
		
	while(rs.next()){
		map = new HashMap();
		map.put("item_id"		, rs.getInt("item_id"));
		map.put("item_uniqueID"	, rs.getInt("item_uniqueID"));
		map.put("item_type"		, rs.getInt("item_type"));
		map.put("item_nm"		, rs.getString("item_nm"));
		map.put("item_img_no"	, rs.getInt("item_img_no"));
		
		map.put("rare_degree"	, rs.getInt("rare_degree"));
		map.put("item_usage"	, rs.getInt("item_usage"));
		map.put("item_cnt"		, rs.getInt("item_cnt"));
		map.put("item_desc"		, rs.getString("item_desc"));
		map.put("item_price"	, rs.getInt("item_price"));
		
		map.put("item_value"	, rs.getInt("item_value"));
		map.put("ATT"			, rs.getInt("ATT"));
		map.put("DEF"			, rs.getInt("DEF"));
		map.put("HP"			, rs.getInt("HP"));
		map.put("SP"			, rs.getInt("SP"));
		
		map.put("abnormal"		, rs.getInt("abnormal"));
		map.put("speedup_all"	, rs.getInt("speedup_all"));
		map.put("speedup"		, rs.getInt("speedup"));
		map.put("exp_up"		, rs.getInt("exp_up"));
		map.put("critical_up"	, rs.getInt("critical_up"));
		
		map.put("reinforce_up"	, rs.getInt("reinforce_up"));
		map.put("limit_lv"		, rs.getInt("limit_lv"));
		map.put("item_period_flag"	, rs.getInt("item_period_flag"));
		map.put("item_period"	, rs.getInt("item_period"));
		map.put("remain_time"	, rs.getInt("remain_time"));
		map.put("item_class"	, rs.getInt("class"));  //added 2014-09-30
		
		map.put("item_grade"	, rs.getInt("item_grade"));  //added 2014-11-12
		map.put("item_level"	, rs.getInt("item_level"));  	//added 2014-11-12
		map.put("item_exp"		, rs.getInt("item_exp"));  		//added 2014-11-12
		map.put("item_rfc_flag"	, rs.getInt("item_rfc_flag"));  //added 2014-11-12		
		map.put("item_rfc_mtr_flag"	, rs.getInt("item_rfc_mtr_flag"));  //added 2014-11-12
		map.put("target_exp"		, rs.getInt("target_exp"));  		//added 2014-11-17
		map.put("socket_equip_flag"	, rs.getInt("socket_equip_flag"));	//added 2014-11-25
		
		list.add(map);
		tot_cnt ++;
	}

//Save item socket master info Map 	
	while(rs_sok.next()){
		map_sok = new HashMap();
		//item_socket_cnt|socket_pos|socket_type|
		map_sok.put("item_id"		, rs_sok.getInt("item_id"));
		map_sok.put("socket_pos"	, rs_sok.getInt("socket_pos"));
		map_sok.put("tre_type"		, rs_sok.getInt("tre_type"));
		
		list_sok.add(map_sok);
		tot_sok_cnt ++;
	}

//Save my socket info Map 	
	while(rs_my_sok.next()){
	map_my_sok = new HashMap();
	//item_setSocket_cnt|item_id|item_uniqueID|my_socket_pos|tre_id|tre_id_sn|tre_type|tre_level|tre_img_no|tre_nm|tre_hp|tre_att|tre_def|tre_critical_up|tre_miss_up|
		map_my_sok.put("item_id"		, rs_my_sok.getInt("item_id"));
		map_my_sok.put("item_uniqueID"	, rs_my_sok.getInt("item_uniqueID"));
		map_my_sok.put("socket_pos"		, rs_my_sok.getInt("socket_pos"));
		map_my_sok.put("tre_id"			, rs_my_sok.getInt("tre_id"));
		map_my_sok.put("tre_id_sn"		, rs_my_sok.getInt("tre_id_sn"));
		map_my_sok.put("tre_type"		, rs_my_sok.getInt("tre_type"));
		map_my_sok.put("tre_level"		, rs_my_sok.getInt("tre_level"));
		map_my_sok.put("tre_img_no"		, rs_my_sok.getInt("tre_img_no"));
		map_my_sok.put("tre_nm"			, rs_my_sok.getString("tre_nm"));
		map_my_sok.put("hp"				, rs_my_sok.getInt("hp"));
		map_my_sok.put("att"			, rs_my_sok.getInt("att"));
		map_my_sok.put("def"			, rs_my_sok.getInt("def"));
		map_my_sok.put("critical_up"	, rs_my_sok.getInt("critical_up"));
		map_my_sok.put("miss_up"		, rs_my_sok.getInt("miss_up"));
		
		list_my_sok.add(map_my_sok);
		tot_my_sok_cnt ++;
	}
		
	//몬스터 장착정보 List
		
		for(int eq=0;eq<list.size();eq++){
			
			eq_item_id		= list.get(eq).get("item_id").toString();
			eq_item_uniqueID= list.get(eq).get("item_uniqueID").toString();
			
			result_packet += 	list.get(eq).get("item_id").toString() 		+"|"+
					 			list.get(eq).get("item_uniqueID").toString() +"|"+
					 			list.get(eq).get("item_type").toString() 	+"|"+
					 			list.get(eq).get("item_nm").toString() 		+"|"+
					 			list.get(eq).get("item_img_no").toString() 	+"|"+							 			
					 			list.get(eq).get("rare_degree").toString() 	+"|"+
								list.get(eq).get("item_usage").toString() 	+"|"+
								list.get(eq).get("item_cnt").toString() 		+"|"+
								list.get(eq).get("item_desc").toString() 	+"|"+
								list.get(eq).get("item_price").toString() 	+"|"+										
								list.get(eq).get("item_value").toString() 	+"|"+
								list.get(eq).get("ATT").toString() 		+"|"+
								list.get(eq).get("DEF").toString() 		+"|"+
								list.get(eq).get("HP").toString() 			+"|"+
								list.get(eq).get("SP").toString() 			+"|"+					
								list.get(eq).get("abnormal").toString() 		+"|"+
								list.get(eq).get("speedup_all").toString() 	+"|"+
								list.get(eq).get("speedup").toString() 		+"|"+
								list.get(eq).get("exp_up").toString() 		+"|"+
								list.get(eq).get("critical_up").toString() 	+"|"+
					 			list.get(eq).get("reinforce_up").toString() 	+"|"+
					 			list.get(eq).get("limit_lv").toString() 		+"|"+
					 			list.get(eq).get("item_period_flag").toString() 	+"|"+
					 			list.get(eq).get("item_period").toString() 		+"|"+
					 			list.get(eq).get("remain_time").toString() 		+"|"+
					 			list.get(eq).get("item_class").toString() 		+"|"+							 			
								list.get(eq).get("item_grade").toString() 	+"|"+
								list.get(eq).get("item_level").toString() 	+"|"+
								list.get(eq).get("item_exp").toString() 		+"|"+
								list.get(eq).get("item_rfc_flag").toString() +"|"+
								list.get(eq).get("item_rfc_mtr_flag").toString() +"|"+
								list.get(eq).get("target_exp").toString() +"|"+
								list.get(eq).get("socket_equip_flag").toString()	+"|";
			
			//몬스터 장착아이템 소켓마스터정보 List 개수
			
			int sok_cnt =0;
			
			for(int socket=0; socket<list_sok.size(); socket++){
				sok_item_id = list_sok.get(socket).get("item_id").toString();
			
				if (eq_item_id.equals(sok_item_id)) {
					sok_cnt++;
				}
			}
			result_packet += sok_cnt + "|";
			//item_socket_cnt|socket_pos|socket_type|my_socket_pos|tre_id|tre_id_sn|tre_type|tre_level|tre_img_no|tre_nm|tre_hp|tre_att|tre_def|tre_critical_up|tre_miss_up|
			for(int socket=0;socket<list_sok.size();socket++){
				sok_item_id		= list_sok.get(socket).get("item_id").toString();
				
				if (eq_item_id.equals(sok_item_id)) {
					result_packet += 	list_sok.get(socket).get("socket_pos").toString() +"|"+
										list_sok.get(socket).get("tre_type").toString() +"|";
				}
			
			}//end socket for
		
		//몬스터 장착아이템 소켓정보 List 개수	
			int my_sok_cnt =0;
					
			for(int socket=0; socket<list_my_sok.size(); socket++){
				my_sok_item_id = list_my_sok.get(socket).get("item_id").toString();
				my_sok_item_uniqueid = list_my_sok.get(socket).get("item_uniqueID").toString();
			
				if (eq_item_id.equals(my_sok_item_id) && eq_item_uniqueID.equals(my_sok_item_uniqueid)) {
					my_sok_cnt++;
				}
			}
			result_packet += my_sok_cnt +"|";
			
			//item_setSocket_cnt|item_id|item_uniqueID|my_socket_pos|tre_id|tre_id_sn|tre_type|tre_level|tre_img_no|tre_nm|tre_hp|tre_att|tre_def|tre_critical_up|tre_miss_up|
			for(int my_socket=0;my_socket<list_my_sok.size();my_socket++){
				my_sok_item_id = list_my_sok.get(my_socket).get("item_id").toString();
				my_sok_item_uniqueid = list_my_sok.get(my_socket).get("item_uniqueID").toString();
				
				if (eq_item_id.equals(my_sok_item_id) && eq_item_uniqueID.equals(my_sok_item_uniqueid)) {	
					result_packet += 	list_my_sok.get(my_socket).get("socket_pos").toString() +"|" +
										list_my_sok.get(my_socket).get("tre_id").toString() +"|" +
										list_my_sok.get(my_socket).get("tre_id_sn").toString() +"|" +
										list_my_sok.get(my_socket).get("tre_type").toString() +"|" +
										list_my_sok.get(my_socket).get("tre_level").toString() +"|" +
										list_my_sok.get(my_socket).get("tre_img_no").toString() +"|" +
										list_my_sok.get(my_socket).get("tre_nm").toString() +"|" +
										list_my_sok.get(my_socket).get("hp").toString() +"|" +
										list_my_sok.get(my_socket).get("att").toString() +"|" +
										list_my_sok.get(my_socket).get("def").toString() +"|" +
										list_my_sok.get(my_socket).get("critical_up").toString() +"|" +
										list_my_sok.get(my_socket).get("miss_up").toString() +"|";
				}
			}//end my socket for
		
		}//end eq for	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(rs_sok != null) rs_sok.close();
	if(pstmt_sok != null) pstmt_sok.close();
}	%>

<%=P_type %>|<%=tot_cnt %>|<%=result_packet%>