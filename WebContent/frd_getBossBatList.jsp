<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T691";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	//sql.append(" EXEC [dbo].[abn_getBossList]  2, " + user_account);
	sql.append(" CALL abn_getBossList (2," + user_account + ") \n");
	
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
 
	while(rs.next()){
		map = new HashMap();
		map.put("frd_account", rs.getInt("frd_account"));
		map.put("frd_nickname", rs.getString("frd_nickname"));
		map.put("frd_image", rs.getInt("frd_image"));
		map.put("frd_level", rs.getInt("frd_level"));
		map.put("frd_cnt", rs.getInt("frd_cnt"));
		map.put("frd_monster", rs.getInt("frd_monster"));
		map.put("boss_mon_id", rs.getInt("boss_mon_id"));
		map.put("boss_mon_nm", rs.getString("boss_mon_nm"));
		map.put("mon_max_HP", rs.getInt("mon_max_HP"));
		map.put("mon_CUR_HP", rs.getInt("mon_CUR_HP"));
		map.put("mon_ATT", rs.getInt("mon_ATT"));
		map.put("mon_DEF", rs.getInt("mon_DEF"));
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
<%=P_type%>|<%=tot_cnt%>|
<%for(int i=0;i<list.size();i++){%>
	<%=list.get(i).get("frd_account")%>|<%=list.get(i).get("frd_nickname")%>|<%=list.get(i).get("frd_image")%>|<%=list.get(i).get("frd_level")%>|<%=list.get(i).get("frd_cnt")%>|<%=list.get(i).get("frd_monster")%>|<%=list.get(i).get("boss_mon_id")%>|<%=list.get(i).get("boss_mon_nm")%>|<%=list.get(i).get("mon_max_HP")%>|<%=list.get(i).get("mon_CUR_HP")%>|<%=list.get(i).get("mon_ATT")%>|<%=list.get(i).get("mon_DEF")%>|
<%}%>