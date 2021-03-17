<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T601";
String frd_account = request.getParameter("frd_account"); // 친구계정

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;

try{
	 
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	//sql.append(" EXEC [dbo].[abn_getMonList] 4, " + frd_account + ", null,null \n");
	sql.append(" CALL abn_getMonList (4," + frd_account + ",null,null) \n");  
  	//System.out.println ("moe:" + sql.toString());
  
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){
		//deck_cnt|mon_id|user_mon_sn|mon_nm|mon_level|mon_type|mon_rare_degree|str_cnt|deck_pos|carry_flag|
		map = new HashMap();
		map.put("mon_id"			, rs.getInt("mon_id"));
		map.put("user_mon_sn"		, rs.getInt("user_mon_sn"));
		map.put("mon_nm"			, rs.getString("mon_nm"));
		map.put("mon_level"			, rs.getInt("mon_level"));
		map.put("mon_type"			, rs.getInt("mon_type"));
		map.put("mon_rare_degree"	, rs.getInt("mon_rare_degree"));
		map.put("str_cnt"			, rs.getInt("str_cnt"));
		map.put("deck_pos"			, rs.getInt("deck_pos"));
		map.put("carry_flag"		, rs.getInt("carry_flag"));
			
		list.add(map);
		tot_cnt++;
	}
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=tot_cnt%>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("mon_id")%>|<%=list.get(i).get("user_mon_sn")%>|<%=list.get(i).get("mon_nm")%>|<%=list.get(i).get("mon_level")%>|<%=list.get(i).get("mon_type")%>|<%=list.get(i).get("mon_rare_degree")%>|<%=list.get(i).get("str_cnt")%>|<%=list.get(i).get("deck_pos")%>|<%=list.get(i).get("carry_flag")%>|
<%}%>