<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T31";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" EXEC [dbo].[abn_getTreList]  1," + user_account + ",0 \n");	//완성보물리스트
	
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		map.put("tre_id"		, rs.getInt(1));
		map.put("tre_nm"		, rs.getString(2));
		map.put("tre_sub_id1"	, rs.getInt(3));
		map.put("tre_sub_id2"	, rs.getInt(4));
		map.put("tre_sub_id3"	, rs.getInt(5));
		map.put("tre_sub_id4"	, rs.getInt(6));
		map.put("tre_sub_id5"	, rs.getInt(7));
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

<%=P_type%>|<%=tot_cnt %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("tre_id")%>|<%=list.get(i).get("tre_nm")%>|<%=list.get(i).get("tre_sub_id1")%>|<%=list.get(i).get("tre_sub_id2")%>|<%=list.get(i).get("tre_sub_id3")%>|<%=list.get(i).get("tre_sub_id4")%>|<%=list.get(i).get("tre_sub_id5")%>|
<%}%>