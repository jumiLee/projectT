<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T81";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" EXEC [dbo].[abn_getTradeMonList] 1, " + user_account + ", null,null,null,null \n");
	
	pstmt = Conn.prepareStatement(sql.toString());
	
	//System.out.println (sql.toString());
	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){
		map = new HashMap();
		map.put("mon_id"	, rs.getInt(1));
		map.put("mon_sn"	, rs.getInt(2));
		map.put("mon_level"	, rs.getInt(3));
		map.put("mon_type"	, rs.getInt(4));
		map.put("mon_exp"	, rs.getInt(5));
		map.put("target_exp", rs.getInt(6));
		map.put("HP"		, rs.getInt(7));
		map.put("max_HP"	, rs.getInt(8));
		map.put("mon_nm"	, rs.getString(9));
		map.put("ATT"		, rs.getInt(10));
		map.put("ATT_STR"	, rs.getInt(11));
		map.put("DEF"		, rs.getInt(12));
		map.put("DEF_STR"	, rs.getInt(13));
		map.put("STR_cnt"	, rs.getInt(14));
		map.put("win_cnt"	, rs.getInt(15));
		map.put("lose_cnt"	, rs.getInt(16));
		map.put("mon_price"	, rs.getInt(17));
		map.put("mon_rare_degree", rs.getInt(18));
		map.put("mon_BP", rs.getInt("mon_BP"));
		map.put("trade_flag", rs.getInt("trade_flag"));	//거래유형(1:자동거래,2:사용자간 거래)
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
<%=P_type%>|<%=tot_cnt%>|
<%for(int i=0;i<list.size();i++){%>
	<%=list.get(i).get("mon_sn")%>|<%=list.get(i).get("mon_id")%>|<%=list.get(i).get("mon_level")%>|<%=list.get(i).get("mon_type")%>|<%=list.get(i).get("target_exp")%>|<%=list.get(i).get("mon_exp")%>|<%=list.get(i).get("max_HP")%>|<%=list.get(i).get("HP")%>|<%=list.get(i).get("mon_nm")%>|<%=list.get(i).get("ATT")%>|<%=list.get(i).get("ATT_STR")%>|<%=list.get(i).get("DEF")%>|<%=list.get(i).get("DEF_STR")%>|<%=list.get(i).get("STR_cnt")%>|<%=list.get(i).get("win_cnt")%>|<%=list.get(i).get("lose_cnt")%>|<%=list.get(i).get("mon_price")%>|<%=list.get(i).get("mon_rare_degree")%>|<%=list.get(i).get("mon_BP")%>|<%=list.get(i).get("trade_flag")%>|
<%}%>