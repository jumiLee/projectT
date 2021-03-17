<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T811";
String order_column = "sold_out_dt";
String order_value  = "desc";
String buy_user_nickname = "0";

order_column = request.getParameter("order_column");
order_value = request.getParameter("order_value");

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" EXEC [dbo].[abn_getTradeMonList] 2, " + user_account + ", null,null, '" +order_column + "','" + order_value+ "' \n");
	
  	//System.out.println ("trade_MymonList:" + sql.toString());
  
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){
		map = new HashMap();
		
		buy_user_nickname = rs.getString("user_nickname") ;
		if (buy_user_nickname.equals("")) buy_user_nickname = "0";
		
		map.put("mon_id"			, rs.getInt("mon_id"));
		map.put("mon_sn"			, rs.getInt("mon_sn"));
		map.put("mon_nm"			, rs.getString("mon_nm"));
		map.put("reg_dt"			, rs.getString("reg_dt"));
		map.put("sold_out_flag"		, rs.getInt("sold_out_flag"));
		map.put("sold_out_dt"		, rs.getString("sold_out_dt"));
		map.put("buy_user_account"	, rs.getInt("buy_user_account"));
		map.put("mon_price"			, rs.getInt("mon_price"));
		map.put("buy_user_nickname"	, buy_user_nickname);
		map.put("mon_level"	, rs.getInt("mon_level"));
		map.put("mon_type"	, rs.getInt("mon_type"));
		map.put("max_exp"	, rs.getInt("max_exp"));
		map.put("mon_exp"	, rs.getInt("mon_exp"));
		map.put("max_HP"	, rs.getInt("max_HP"));
		map.put("cur_HP"	, rs.getInt("HP"));
		map.put("ATT"	, rs.getInt("ATT"));
		map.put("ATT_STR"	, rs.getInt("ATT_STR"));
		map.put("DEF"	, rs.getInt("DEF"));
		map.put("DEF_STR"	, rs.getInt("DEF_STR"));
		map.put("STR_cnt"	, rs.getInt("STR_cnt"));
		map.put("win_cnt"	, rs.getInt("win_cnt"));
		map.put("lose_cnt"	, rs.getInt("lose_cnt"));
		map.put("mon_rare_degree"	, rs.getInt("mon_rare_degree"));
		map.put("mon_BP"	, rs.getInt("mon_BP"));
		map.put("trade_flag"	, rs.getInt("trade_flag"));
		
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
<%=list.get(i).get("mon_sn")%>|<%=list.get(i).get("mon_id")%>|<%=list.get(i).get("mon_level")%>|<%=list.get(i).get("mon_type")%>|<%=list.get(i).get("max_exp")%>|<%=list.get(i).get("mon_exp")%>|<%=list.get(i).get("max_HP")%>|<%=list.get(i).get("cur_HP")%>|<%=list.get(i).get("mon_nm")%>|<%=list.get(i).get("ATT")%>|<%=list.get(i).get("ATT_STR")%>|<%=list.get(i).get("DEF")%>|<%=list.get(i).get("DEF_STR")%>|<%=list.get(i).get("STR_cnt")%>|<%=list.get(i).get("win_cnt")%>|<%=list.get(i).get("lose_cnt")%>|<%=list.get(i).get("mon_price")%>|<%=list.get(i).get("mon_rare_degree")%>|<%=list.get(i).get("mon_BP")%>|<%=list.get(i).get("trade_flag")%>|<%=list.get(i).get("reg_dt")%>|<%=list.get(i).get("sold_out_flag")%>|<%=list.get(i).get("sold_out_dt")%>|<%=list.get(i).get("buy_user_account")%>|<%=list.get(i).get("buy_user_nickname")%>|
<%}%>