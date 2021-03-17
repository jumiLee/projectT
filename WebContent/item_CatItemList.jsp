<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T511";
String item_category = request.getParameter("item_category"); // 친구계정

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
		   
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getItemList  (5, null, " + item_category + " )\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  //System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	 
	while(rs.next()){
		map = new HashMap();
		map.put("item_category"	, rs.getInt("item_category"));
		map.put("item_id"		, rs.getInt("item_id"));
		map.put("item_nm"		, rs.getString("item_nm"));  
		map.put("item_price"	, rs.getInt("item_price"));
		map.put("item_desc"		, rs.getString("item_desc"));
		map.put("unit_cd"		, rs.getString("unit_cd"));	
		map.put("item_img_no"	, rs.getString("item_img_no"));	
		map.put("item_new_flag"	, rs.getString("item_new_flag"));	
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
<%=list.get(i).get("item_category")%>|<%=list.get(i).get("item_id")%>|<%=list.get(i).get("item_nm")%>|<%=list.get(i).get("item_price")%>|<%=list.get(i).get("item_desc")%>|<%=list.get(i).get("unit_cd")%>|<%=list.get(i).get("item_img_no")%>|<%=list.get(i).get("item_new_flag")%>|
<%}%>