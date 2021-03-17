<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>

<%
String P_type ="";
String item_type = request.getParameter("item_type");

//P_type 설정
if (item_type.equals("3")) {	//강화
	P_type ="T56";
}else if (item_type.equals("8"))	{	// 장착
	P_type ="T57";
} 

List<Map<String, Object>> list = null; 
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	
	   
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	//sql.append(" EXEC [dbo].[abn_getItemList] 4,"+user_account+ ","+ item_type +" \n");	//3:강화, 8:장착
	sql.append(" Call abn_getItemList  (4," + user_account+"," + item_type + ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		map.put("item_id"		, rs.getInt("item_id"));
		map.put("item_nm"		, rs.getString("item_nm"));  
		map.put("item_cnt"		, rs.getInt("item_cnt"));
		map.put("item_desc"		, rs.getString("item_desc"));
		map.put("item_att"		, rs.getInt("item_att"));
		map.put("item_def"		, rs.getInt("item_def"));  
		map.put("item_type"		, rs.getInt("item_type"));
		map.put("item_price"	, rs.getInt("item_price"));
		map.put("item_uniqueID"	, rs.getInt("item_uniqueID"));
		map.put("rare_degree"	, rs.getInt("rare_degree"));
		map.put("item_class"	, rs.getInt("class"));  //added 2014-09-30
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
<%=list.get(i).get("item_id")%>|<%=list.get(i).get("item_uniqueID")%>|<%=list.get(i).get("item_nm")%>|<%=list.get(i).get("item_cnt")%>|<%=list.get(i).get("item_desc")%>|<%=list.get(i).get("item_att")%>|<%=list.get(i).get("item_def")%>|<%=list.get(i).get("item_type")%>|<%=list.get(i).get("item_price")%>|<%=list.get(i).get("rare_degree")%>|<%=list.get(i).get("item_class")%>|
<%}%>