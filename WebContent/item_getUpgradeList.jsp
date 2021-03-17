<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>

<%
String P_type ="T570";
String item_id= request.getParameter("item_id"); 		
String item_uniqueID= request.getParameter("item_uniqueID"); 	

List<Map<String, Object>> list = null; 
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" CALL abn_getMtrItemList (2,"+user_account+ "," + item_id + "," + item_uniqueID + ") \n");
	
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		/* upgrade_cost(승급비용)|mtr_item_id|mtr_item_nm|mtr_item_img_no|need_cnt|my_cnt|*/
		
		map.put("upgrade_cost"		, rs.getInt("upgrade_cost"));
		map.put("item_id"			, rs.getInt("item_id"));
		map.put("item_nm"			, rs.getString("item_nm"));
		map.put("item_img_no"		, rs.getString("item_img_no"));
		map.put("need_cnt"			, rs.getInt("need_cnt"));	
		map.put("my_cnt"			, rs.getInt("my_cnt"));

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

<%=P_type %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("upgrade_cost")%>|<%=list.get(i).get("item_id")%>|<%=list.get(i).get("item_nm")%>|<%=list.get(i).get("item_img_no")%>|<%=list.get(i).get("need_cnt")%>|<%=list.get(i).get("my_cnt")%>|
<%}%>