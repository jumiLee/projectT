<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>

<%
String P_type ="T567";

List<Map<String, Object>> list = null; 
Map<String, Object> map = null;
int tot_cnt =0;

ResultSet rs_m = null;
PreparedStatement pstmt_m = null;
Map<String, Object> map_m = null;
List<Map<String, Object>> list_m = null;
String m_item_id="";
String item_id  = "";

String result_packet = ""	;
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" CALL abn_getMtrItemList (3,"+user_account+ ",null, null) \n");

  	pstmt = Conn.prepareStatement(sql.toString());
  	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		map.put("mtr_item_id"		, rs.getInt("mtr_item_id"));
		map.put("mtr_item_nm"		, rs.getString("mtr_item_nm"));
		map.put("mtr_item_img_no"	, rs.getInt("mtr_item_img_no"));
		map.put("mtr_item_cnt"		, rs.getInt("mtr_item_cnt"));
		map.put("recipe_desc"		, rs.getString("recipe_desc"));
		map.put("item_id"			, rs.getInt("item_id"));
		map.put("item_nm"			, rs.getString("item_nm"));
		map.put("item_img_no"		, rs.getString("item_img_no"));
		map.put("item_grade_fr"		, rs.getInt("item_grade_fr"));
		map.put("item_grade_to"		, rs.getString("item_grade_to"));
		map.put("item_att_fr"		, rs.getInt("item_att_fr"));		
		map.put("item_att_to"		, rs.getInt("item_att_to"));
		map.put("item_def_fr"		, rs.getInt("item_def_fr"));
		map.put("item_def_to"		, rs.getInt("item_def_to"));	
		
		list.add(map);
		tot_cnt ++;
	}
	
	
System.out.println ("list:" + list.size());
	//My material item list
	sql.setLength(0);
	sql.append(" CALL abn_getMtrItemList (4,"+user_account+ ",null, null) \n");

	pstmt_m = Conn.prepareStatement(sql.toString());
	rs_m 	 = pstmt_m.executeQuery();
	list_m = new ArrayList<Map<String, Object>>();
	
	while(rs_m.next()){
		map_m = new HashMap();
		map_m.put("item_id"		, rs_m.getInt("item_id"));
		map_m.put("mtr_item_uid"	, rs_m.getInt("item_uniqueID"));		
		map_m.put("item_cnt"		, rs_m.getInt("item_cnt"));	
		
		list_m.add(map_m);
	}
	
	result_packet += tot_cnt +"|";
	for(int i=0;i<list.size();i++){
		
		item_id = list.get(i).get("mtr_item_id").toString();
		
		/* mtr_item_id|mtr_item_nm|mtr_item_img_no|mtr_item_uid|item_cnt|mtr_item_cnt|recipe_desc|item_id|item_nm|item_img_no|item_grade_fr|item_grade_to|item_att_fr|item_att_to|item_def_fr|item_def_to|*/
		result_packet +=list.get(i).get("mtr_item_id").toString() 	+"|"+
						list.get(i).get("mtr_item_nm").toString() 	+"|"+
						list.get(i).get("mtr_item_img_no").toString()+"|";
		
			for(int m=0; m < list_m.size();m++){
				m_item_id		= list_m.get(m).get("item_id").toString();
				
				if (item_id.equals(m_item_id)) {
					//System.out.println(mon_id + "/" + user_mon_sn + "===" +  sk_mon_id + "/" + sk_user_mon_sn + "========");	
					//skill_cnt|skill_id|skill_nm|skill_cooltime|skill_desc
					result_packet +=list_m.get(m).get("mtr_item_uid").toString() 	+"|"+
									list_m.get(m).get("item_cnt").toString()		+"|";
				}else{
					result_packet +="0|0|";
				}
			}
		
			result_packet +=
						list.get(i).get("mtr_item_cnt").toString() 	+"|"+
						list.get(i).get("recipe_desc").toString() 	+"|"+
						list.get(i).get("item_id").toString() 		+"|"+
						list.get(i).get("item_nm").toString() 		+"|"+
						list.get(i).get("item_img_no").toString() 	+"|"+
						list.get(i).get("item_grade_fr").toString() +"|"+
						list.get(i).get("item_grade_to").toString() +"|"+
						list.get(i).get("item_att_fr").toString() 	+"|"+
						list.get(i).get("item_att_to").toString() 	+"|"+
						list.get(i).get("item_def_fr").toString() 	+"|"+
						list.get(i).get("item_def_to").toString() 	+"|";
	}	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>

<%=P_type %>|<%=result_packet%>