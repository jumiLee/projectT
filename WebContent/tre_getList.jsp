<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T33";
String tre_id = request.getParameter("tre_id");

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

int tot_cnt = 0 ;  //총 보석개수(tre_id)  
String cur_tre_id="0";
String result_packet ="";

try{
	 
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" CALL abn_getTreList (4," + user_account + ",'" + tre_id + "') \n");
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		
		map.put("tre_id"	, rs.getInt("tre_id"));
		map.put("tre_nm"	, rs.getString("tre_nm"));
		map.put("max_wp"	, rs.getString("max_wp"));
		map.put("cur_wp"	, rs.getString("cur_wp"));
		map.put("tre_sub_id", rs.getInt("tre_sub_id"));
		map.put("tre_sub_nm", rs.getString("tre_sub_nm"));
		map.put("tre_cnt"	, rs.getInt("tre_cnt"));
		map.put("trap_cnt"	, rs.getInt("trap_cnt"));
		
		list.add(map);
	}
	
//보석 총개수 
	for(int i=0;i<list.size();i++){
		if (!cur_tre_id.equals(list.get(i).get("tre_id").toString())) 
		{ 
			tot_cnt++;
		}
		cur_tre_id 		= list.get(i).get("tre_id").toString();
	}
		
	result_packet += tot_cnt +"|";
	cur_tre_id ="0";
	for(int i=0;i<list.size();i++){
		if (cur_tre_id.equals(list.get(i).get("tre_id").toString())) 
		{ 
			result_packet +=
				list.get(i).get("tre_sub_id").toString() 	+"|"+
				list.get(i).get("tre_sub_nm").toString()	+"|"+
				list.get(i).get("tre_cnt").toString() 		+"|"+
				list.get(i).get("trap_cnt").toString() 		+"|";
		}
		else 
		{
			result_packet +=  	
				list.get(i).get("tre_id").toString()		+"|"+
				list.get(i).get("tre_nm").toString()		+"|"+				
				list.get(i).get("max_wp").toString()		+"|"+
				list.get(i).get("cur_wp").toString()		+"|"+
				list.get(i).get("tre_sub_id").toString() 	+"|"+
				list.get(i).get("tre_sub_nm").toString()	+"|"+
				list.get(i).get("tre_cnt").toString() 		+"|"+
				list.get(i).get("trap_cnt").toString() 		+"|";
		}	
		cur_tre_id 		= list.get(i).get("tre_id").toString();
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>

<%=P_type%>|<%=result_packet%>