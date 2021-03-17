<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String tre_id = request.getParameter("tre_id");
String tre_sub_id = request.getParameter("tre_sub_id");
String P_type ="T22";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	 
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	//sql.append(" EXEC [dbo].[abn_getBatList] 2, " + user_account + ","+ tre_id +","+tre_sub_id+",null \n");
	sql.append(" Call abn_getBatList  (2," + user_account + "," + tre_id + "," + tre_sub_id + ",null )\n") ;
	
  	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		map.put("bat_user_account"	, rs.getInt(1));
		map.put("user_mon_sn"	, rs.getInt(6));
		map.put("mon_id"		, rs.getInt(5));
		map.put("mon_level"		, rs.getInt(7));
		map.put("mon_type"		, rs.getInt(16));
		map.put("user_level"	, rs.getInt(2));
		map.put("user_nickNamae", rs.getString(3));
		map.put("mon_nm"		, rs.getString(15));
		map.put("ATT_STR"		, rs.getInt(9)+rs.getInt(11));
		map.put("DEF_STR"		, rs.getInt(10)+rs.getInt(12));
		map.put("STR_cnt"		, rs.getInt(8));
		map.put("win_cnt"		, rs.getInt(13));
		map.put("lose_cnt"		, rs.getInt(14));
		map.put("bat_user_img"	, rs.getInt(17));
		map.put("mon_rare_degree"	, rs.getInt("mon_rare_degree"));
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
<%=list.get(i).get("bat_user_account")%>|<%=list.get(i).get("bat_user_img")%>|<%=list.get(i).get("user_mon_sn")%>|<%=list.get(i).get("mon_id")%>|<%=list.get(i).get("mon_level")%>|<%=list.get(i).get("mon_type")%>|<%=list.get(i).get("user_level")%>|<%=list.get(i).get("user_nickNamae")%>|<%=list.get(i).get("mon_nm")%>|<%=list.get(i).get("ATT_STR")%>|<%=list.get(i).get("DEF_STR")%>|<%=list.get(i).get("STR_cnt")%>|<%=list.get(i).get("win_cnt")%>|<%=list.get(i).get("lose_cnt")%>|<%=list.get(i).get("mon_rare_degree")%>|
<%}%>