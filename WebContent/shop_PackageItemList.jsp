<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T587";
String job_type 		= request.getParameter("job_type");
String item_category 	= request.getParameter("item_category");
String item_type 		= request.getParameter("item_type");

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

List<Map<String, Object>> pack_list = null;
Map<String, Object> pack_map = null;

int tot_cnt =0 ;
int pack_tot_cnt = 0;
int v_item_id = 0;
String result_packet = ""	;
String p_item_id ="0";
String item_id = "0";

try{
	
	    
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getMstItemList  (" + job_type + ","+ item_category + "," + item_type + ",0)\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	pack_list = new ArrayList<Map<String, Object>>();
	

	while(rs.next()){
		map = new HashMap();
		pack_map = new HashMap();
		
		if(v_item_id != rs.getInt("item_id")){
			tot_cnt ++;
		}
		
		v_item_id =  rs.getInt("item_id");
		
	// Package 자체 정보 Map 에 저장 
		map.put("item_id"		, v_item_id);
		map.put("item_nm"		, rs.getString("item_nm"));  
		map.put("item_category"	, rs.getInt("item_category"));
		map.put("item_type"		, rs.getInt("item_type"));	
		map.put("item_price"	, rs.getInt("item_price"));
		map.put("unit_cd"		, rs.getInt("unit_cd"));
		map.put("item_desc"		, rs.getString("item_desc"));
		map.put("item_value"	, rs.getInt("item_value"));
		map.put("item_cnt"		, rs.getInt("item_cnt"));
		map.put("item_img_no"	, rs.getInt("item_img_no"));		
		
		list.add(map);
		
		
	// Package 안에 들어있는 아이템들 Map 에 저장
		pack_map.put("item_id"		, v_item_id);
		pack_map.put("pack_type"	, rs.getInt("rwd_type"));
		pack_map.put("pack_id"		, rs.getInt("rwd_id"));
		pack_map.put("pack_sub_id"	, rs.getInt("rwd_sub_id"));
		pack_map.put("pack_nm"		, rs.getString("rwd_nm"));
		pack_map.put("pack_img_no"	, rs.getInt("rwd_img_no"));
		pack_map.put("pack_desc"	, rs.getString("rwd_desc"));
		pack_map.put("pack_grade"	, rs.getString("pack_grade"));
		pack_map.put("pack_class"	, rs.getString("pack_class"));
		
		pack_list.add(pack_map);
	
	}
	

/*
	while(rs.next()){
		pack_map = new HashMap();
		
		pack_map.put("item_id"		, rs.getInt("item_id"));
		pack_map.put("pack_type"	, rs.getInt("rwd_type"));
		pack_map.put("pack_id"		, rs.getInt("rwd_id"));
		pack_map.put("pack_sub_id"	, rs.getInt("rwd_sub_id"));
		pack_map.put("pack_nm"		, rs.getString("rwd_nm"));
		pack_map.put("pack_img_no"	, rs.getInt("rwd_img_no"));
		pack_map.put("pack_desc"	, rs.getString("rwd_desc"));
			
		pack_list.add(pack_map);	
	}
	*/
	if (list == null){
		//System.out.println ("T587 : ArrayList is null");		
	}
	if (pack_list == null){
		//System.out.println ("pack_list : ArrayList is null");		
	}
	/*
	total_cnt|item_id|item_nm|item_category|item_type|item_price|unit_cd|item_desc|item_value|item_cnt|item_img_no|
	pack_cnt|pack_type|pack_id|pack_sub_id|pack_nm|pack_img_no|pack_desc|
	*/
	for(int i=0;i<list.size();i++){

		if (item_id.equals(list.get(i).get("item_id").toString())) {
			
		}else {
			item_id		= list.get(i).get("item_id").toString();
		
			result_packet +=  	list.get(i).get("item_id").toString() 			+"|"+
								list.get(i).get("item_nm").toString() 			+"|"+
								list.get(i).get("item_category").toString() 	+"|"+
								list.get(i).get("item_type").toString() 		+"|"+
								list.get(i).get("item_price").toString() 		+"|"+
								list.get(i).get("unit_cd").toString() 			+"|"+
								list.get(i).get("item_desc").toString() 		+"|"+
								list.get(i).get("item_value").toString() 		+"|"+
								list.get(i).get("item_cnt").toString() 			+"|"+
								list.get(i).get("item_img_no").toString() 		+"|";
		
		
			//Package 내 상품리스트 개수 구하기 
			pack_tot_cnt = 0;
			for(int pack=0; pack < pack_list.size(); pack++){
				p_item_id = pack_list.get(pack).get("item_id").toString();
			
				if (p_item_id.equals(item_id)) {
					pack_tot_cnt++;
				}
			}
			
			result_packet += pack_tot_cnt + "|";
			
			//Package 내 상품리스트 정보  
			for(int pack=0; pack < pack_list.size(); pack++){
				
				p_item_id = pack_list.get(pack).get("item_id").toString();
				
				if (p_item_id.equals(item_id)) {
					
					result_packet+=	pack_list.get(pack).get("pack_type").toString() +"|"+
									pack_list.get(pack).get("pack_id").toString() +"|"+
									pack_list.get(pack).get("pack_sub_id").toString() +"|"+
									pack_list.get(pack).get("pack_nm").toString() +"|"+
									pack_list.get(pack).get("pack_img_no").toString() +"|"+
									pack_list.get(pack).get("pack_desc").toString() +"|" +
									pack_list.get(pack).get("pack_grade").toString() +"|" +
									pack_list.get(pack).get("pack_class").toString() +"|" ;
				}
			}
		}//end Package 내 Item List
						
	}// end Package Item List 
		
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>

<%=P_type %>|<%=tot_cnt %>|<%=result_packet%>