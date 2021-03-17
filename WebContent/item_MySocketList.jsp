<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>

<%
String P_type ="T5911";
//String item_id = request.getParameter("item_id");
//String socket_pos = request.getParameter("socket_pos");

List<Map<String, Object>> list = null; 
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	
	   
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getSocketTreasureList  (6," + user_account+",null,null,null,null)\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		/* total_cnt|tre_id|tre_cnt|tre_type|tre_level|tre_img_no|tre_nm|tre_hp|tre_att|tre_def|tre_critical_up|tre_miss_up| */
		map.put("tre_id"		, rs.getInt("tre_id"));
		map.put("tre_cnt"		, rs.getString("tre_cnt"));  
		map.put("tre_type"		, rs.getInt("tre_type"));
		map.put("tre_level"		, rs.getInt("tre_level"));
		map.put("tre_img_no"	, rs.getInt("tre_img_no"));
		map.put("tre_nm"		, rs.getString("tre_nm"));  
		map.put("hp"			, rs.getInt("hp"));
		map.put("att"			, rs.getInt("att"));
		map.put("def"			, rs.getInt("def"));
		map.put("critical_up"	, rs.getInt("critical_up"));
		map.put("miss_up"		, rs.getInt("miss_up")); 
		list.add(map);
		tot_cnt ++;
	}
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>

<%=P_type %>|<%=tot_cnt %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("tre_id")%>|<%=list.get(i).get("tre_cnt")%>|<%=list.get(i).get("tre_type")%>|<%=list.get(i).get("tre_level")%>|<%=list.get(i).get("tre_img_no")%>|<%=list.get(i).get("tre_nm")%>|<%=list.get(i).get("hp")%>|<%=list.get(i).get("att")%>|<%=list.get(i).get("def")%>|<%=list.get(i).get("critical_up")%>|<%=list.get(i).get("miss_up")%>|
<%}%>