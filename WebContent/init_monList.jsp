<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_empty_header.jsp"%>
<%
String P_type ="T414";
String result_packet = "";

//몬스터 관련
	int tot_cnt ; 
	tot_cnt = 0;
	Map<String, Object> map = null;
	List<Map<String, Object>> list = null;
	int t_mon_id=0; String mon_id = ""; String sk_mon_id= ""; String sk_id= "";
//skill 관련
	int tot_sk_cnt; 
	tot_sk_cnt = 0;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

//몬스터 정보
	sql.setLength(0);
	sql.append(" Call abn_getInitInfoList  (1) \n") ;
	//System.out.println ("monster:" + sql.toString());
	  
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	

//Save monster info Map 
	int get_mon_cnt = 0;

	while(rs.next()){
		map = new HashMap();
		// tot_cnt|mon_id|mon_lv|mon_max_lv|mon_type|mon_nm|mon_HP|mon_ATT|mon_DEF|mon_rare_degree|mon_BP|
		// skill_cnt|skill_id|skill_nm|skill_cooltime|skill_att|skill_def|skill_hp|skill_desc|skill_point|skill_gold|skill_open_lv|skill_img_no|
		if(t_mon_id != rs.getInt("mon_id")){
			tot_cnt++;
		}
		map.put("mon_id"			, rs.getInt("mon_id"));
		map.put("mon_lv"			, rs.getInt("mon_lv"));
		map.put("mon_max_lv"		, rs.getInt("mon_max_lv"));
		map.put("mon_type"			, rs.getInt("mon_type"));
		map.put("mon_nm"			, rs.getString("mon_nm"));
		map.put("mon_HP"			, rs.getInt("mon_HP"));
		map.put("mon_ATT"			, rs.getInt("mon_ATT"));
		map.put("mon_DEF"			, rs.getInt("mon_DEF"));
		map.put("mon_rare_degree"	, rs.getInt("mon_rare_degree"));
		map.put("mon_BP"			, rs.getInt("mon_BP"));
		map.put("skill_cnt"			, rs.getInt("skill_cnt"));
		map.put("sk_mon_id"			, rs.getInt("sk_mon_id"));
		map.put("skill_id"			, rs.getInt("skill_id"));
		map.put("skill_nm"			, rs.getString("skill_nm"));
		map.put("skill_cooltime"	, rs.getInt("skill_cooltime"));
		map.put("skill_ATT"			, rs.getInt("skill_ATT"));
		map.put("skill_DEF"			, rs.getInt("skill_DEF"));
		map.put("skill_HP"			, rs.getInt("skill_HP"));
		map.put("skill_desc"		, rs.getString("skill_desc"));
		map.put("skill_point"		, rs.getInt("skill_point"));
		map.put("skill_gold"		, rs.getInt("skill_gold"));
		map.put("skill_open_lv"		, rs.getInt("skill_open_lv"));
		map.put("skill_img_no"		, rs.getInt("skill_img_no"));
		
		list.add(map);
		
		t_mon_id 	  = rs.getInt("mon_id");
		
		
	}


	result_packet += tot_cnt +"|";
	//몬스터 정보 List
		
		for(int i=0;i<list.size();i++){
			
			//System.out.println ("mon_id:" + mon_id);
			//System.out.println ("sk_mon_id:" + sk_mon_id);
			
			if (i==0 || !mon_id.equals(list.get(i).get("mon_id").toString()) ||!mon_id.equals(sk_mon_id)) {
			// tot_cnt|mon_id|mon_lv|mon_max_lv|mon_type|mon_nm|mon_HP|mon_ATT|mon_DEF|mon_rare_degree|mon_BP|
			// skill_cnt|skill_id|skill_nm|skill_cooltime|skill_desc|
			tot_sk_cnt =0;
			
			result_packet +=  	list.get(i).get("mon_id").toString() 			+"|"+
								list.get(i).get("mon_lv").toString() 			+"|"+
								list.get(i).get("mon_max_lv").toString() 		+"|"+
								list.get(i).get("mon_type").toString() 			+"|"+
								list.get(i).get("mon_nm").toString() 			+"|"+
								list.get(i).get("mon_HP").toString() 			+"|"+
								list.get(i).get("mon_ATT").toString() 			+"|"+
								list.get(i).get("mon_DEF").toString() 			+"|"+
								list.get(i).get("mon_rare_degree").toString() 	+"|"+
								list.get(i).get("mon_BP").toString() 			+"|"+								
								list.get(i).get("skill_cnt").toString() 		+"|";
			
			}		
			
			mon_id 	  = list.get(i).get("mon_id").toString();
			sk_mon_id = list.get(i).get("sk_mon_id").toString();
			
			//System.out.println ("sk_id:" + sk_id);
			//System.out.println ("sk_id2:" + list.get(i).get("skill_id").toString());
			  
			/*if (tot_sk_cnt ==0) {
				result_packet += "2|";	//스킬개수 강제세팅.
			}*/
			if (i==0 || !sk_id.equals(list.get(i).get("skill_id").toString()))
			result_packet +=list.get(i).get("skill_id").toString() 		+"|"+
							list.get(i).get("skill_nm").toString() 		+"|"+
							list.get(i).get("skill_cooltime").toString()+"|"+
							list.get(i).get("skill_ATT").toString()		+"|"+
							list.get(i).get("skill_DEF").toString()		+"|"+
							list.get(i).get("skill_HP").toString()		+"|"+
							list.get(i).get("skill_desc").toString() 	+"|"+
							list.get(i).get("skill_point").toString() 	+"|"+
							list.get(i).get("skill_gold").toString() 	+"|"+
							list.get(i).get("skill_open_lv").toString() +"|"+
							list.get(i).get("skill_img_no").toString() 	+"|";
			
			sk_id 		= list.get(i).get("skill_id").toString();
			tot_sk_cnt ++;
		}//end mon for
		

	//System.out.println (result_packet);	

}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();	

}	%>
<%=P_type%>|<%=result_packet%>