<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T42";
String mon_id = request.getParameter("mon_id");
String user_mon_sn = request.getParameter("user_mon_sn");

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

int tot_cnt ;
tot_cnt = 0;

try{	
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" EXEC [dbo].[abn_getMonList] 2, " + user_account + ", " + mon_id + "," + user_mon_sn + "\n");
		
	//System.out.println ("mon_MymonDetail:" + sql.toString());
	
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){
		map = new HashMap();
		map.put("user_mon_sn"	, rs.getInt(1));
		map.put("mon_id"		, rs.getInt(2));
		map.put("mon_level"		, rs.getInt(3));
		map.put("mon_type"		, rs.getInt(4));
		map.put("max_exp"		, rs.getInt(5));
		map.put("mon_exp"		, rs.getInt(6));
		map.put("HP"			, rs.getInt(7));
		map.put("cur_HP"		, rs.getInt(8));
		map.put("carry_flag"	, rs.getInt(9));
		map.put("mon_nm"		, rs.getString(10));
		map.put("ATT_STR"		, rs.getInt(11));
		map.put("DEF_STR"		, rs.getInt(12));
		map.put("STR_cnt"		, rs.getInt(13));
		map.put("win_cnt"		, rs.getInt(14));
		map.put("lose_cnt"		, rs.getInt(15));
		map.put("deck_flag"		, rs.getInt("deck_flag"));
		map.put("rare_degree"	, rs.getInt("mon_rare_degree"));
		map.put("mon_BP"		, rs.getInt("mon_BP"));
				
		if (rs.getInt("sk1") == 0){
			map.put("sk1"		, -1);
			map.put("sk1_nm"	, "0");
			map.put("sk1_ct"	, 0);
			map.put("sk1_desc"	, "0");
			
		}else{
			map.put("sk1"		, rs.getInt("sk1"));
			map.put("sk1_nm"	, rs.getString("sk1_nm"));
			map.put("sk1_ct"	, rs.getInt("sk1_ct"));
			map.put("sk1_desc"	, rs.getString("sk1_desc"));
		}
		
		if (rs.getInt("sk2") == 0){
			map.put("sk2"		, -1);
			map.put("sk2_nm"	, "0");
			map.put("sk2_ct"	, 0);
			map.put("sk2_desc"	, "0");
			
		}else{
			map.put("sk2"		, rs.getInt("sk2"));
			map.put("sk2_nm"	, rs.getString("sk2_nm"));
			map.put("sk2_ct"	, rs.getInt("sk2_ct"));
			map.put("sk2_desc"	, rs.getString("sk2_desc"));
		}
		
		if (rs.getInt("eq1") == 0){
			map.put("eq1"		, -1); //If there is no data, set -1
			map.put("eq1_uid"	, 0);
			map.put("eq1_type"	, 0); 
			map.put("eq1_nm"	, "0");
			map.put("eq1_att"	, 0);
			map.put("eq1_def"	, 0);
			map.put("eq1_price"	, 0);
		}else{
			map.put("eq1"		, rs.getInt("eq1"));
			map.put("eq1_uid"	, rs.getInt("eq1_uid"));
			map.put("eq1_type"	, rs.getInt("eq1_type"));
			map.put("eq1_nm"	, rs.getString("eq1_nm"));
			map.put("eq1_att"	, rs.getInt("eq1_att"));
			map.put("eq1_def"	, rs.getInt("eq1_def"));
			map.put("eq1_price"	, rs.getInt("eq1_price"));
		}
		if (rs.getInt("eq2") == 0){
			map.put("eq2"		, -1);	//If there is no data, set -1
			map.put("eq2_uid"	, 0);
			map.put("eq2_type"	, 0); 
			map.put("eq2_nm"	, "0");
			map.put("eq2_att"	, 0);
			map.put("eq2_def"	, 0);
			map.put("eq2_price"	, 0);
		}else{
			map.put("eq2"		, rs.getInt("eq2"));
			map.put("eq2_uid"	, rs.getInt("eq2_uid"));
			map.put("eq2_type"	, rs.getInt("eq2_type"));
			map.put("eq2_nm"	, rs.getString("eq2_nm"));
			map.put("eq2_att"	, rs.getInt("eq2_att"));
			map.put("eq2_def"	, rs.getInt("eq2_def"));	
			map.put("eq2_price"	, rs.getInt("eq2_price"));			
		}
		
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
<%=P_type%>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("user_mon_sn")%>|<%=list.get(i).get("mon_id")%>|<%=list.get(i).get("mon_level")%>|<%=list.get(i).get("mon_type")%>|<%=list.get(i).get("max_exp")%>|<%=list.get(i).get("mon_exp")%>|<%=list.get(i).get("HP")%>|<%=list.get(i).get("cur_HP")%>|<%=list.get(i).get("carry_flag")%>|<%=list.get(i).get("mon_nm")%>|<%=list.get(i).get("ATT_STR")%>|<%=list.get(i).get("DEF_STR")%>|<%=list.get(i).get("STR_cnt")%>|<%=list.get(i).get("win_cnt")%>|<%=list.get(i).get("lose_cnt")%>|<%=list.get(i).get("deck_flag")%>|<%=list.get(i).get("rare_degree")%>|<%=list.get(i).get("mon_BP")%>|<%=list.get(i).get("sk1")%>|<%=list.get(i).get("sk1_nm")%>|<%=list.get(i).get("sk1_ct")%>|<%=list.get(i).get("sk1_desc")%>|<%=list.get(i).get("sk2")%>|<%=list.get(i).get("sk2_nm")%>|<%=list.get(i).get("sk2_ct")%>|<%=list.get(i).get("sk2_desc")%>|<%=list.get(i).get("eq1")%>|<%=list.get(i).get("eq1_uid")%>|<%=list.get(i).get("eq1_type")%>|<%=list.get(i).get("eq1_nm")%>|<%=list.get(i).get("eq1_att")%>|<%=list.get(i).get("eq1_def")%>|<%=list.get(i).get("eq1_price")%>|<%=list.get(i).get("eq2")%>|<%=list.get(i).get("eq2_uid")%>|<%=list.get(i).get("eq2_type")%>|<%=list.get(i).get("eq2_nm")%>|<%=list.get(i).get("eq2_att")%>|<%=list.get(i).get("eq2_def")%>|<%=list.get(i).get("eq2_price")%>|<%}%>