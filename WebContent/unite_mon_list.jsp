<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T861";
String mon_id 		= request.getParameter("mon_id"); 		//기초 몬스터 아이디
String mon_sn 	= request.getParameter("mon_sn"); 	//기초 몬스터 고유번호

//몬스터 관련  
	int tot_cnt =0 ; 
	String base_mon_id = "0"; String base_mon_sn="0";
	Map<String, Object> map = null;
	List<Map<String, Object>> list = null;
	
try{
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
//몬스터 정보
	//sql.append(" EXEC [dbo].[abn_getMonList] 7, " + user_account + ", " + mon_id + "," + mon_sn +" \n");
	sql.append(" Call abn_getMonList  (7,"+ user_account + "," + mon_id + "," + mon_sn + " )\n") ;
	//System.out.println ("합성가능monster:" + sql.toString());
	  
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
//Save monster info Map 
	while(rs.next()){
		map = new HashMap();
		//total_cnt|user_mon_sn|mon_id|mon_level|mon_type|max_exp|mon_exp|HP|cur_HP|carry_flag|mon_nm|ATT_STR|DEF_STR|STR_cnt|win_cnt|lose_cnt|deck_flag|mon_rare_degree|mon_BP|
		
		//합성대상몬스터는 리스트에서 제외
		base_mon_id = Integer.toString(rs.getInt("mon_id"));
		base_mon_sn = Integer.toString(rs.getInt("user_mon_sn"));
		
		if (mon_id.equals(base_mon_id) && mon_sn.equals(base_mon_sn) ) {
			
		}else{
			map.put("mon_id"		 , rs.getInt("mon_id"));
			map.put("user_mon_sn"	 , rs.getInt("user_mon_sn"));
			map.put("mon_level"		 , rs.getInt("mon_level"));
			map.put("mon_type"		 , rs.getInt("mon_type"));
			map.put("max_exp"		 , rs.getInt("max_exp"));
			map.put("mon_exp"		 , rs.getInt("mon_exp"));
			map.put("HP"			 , rs.getInt("HP"));
			map.put("cur_HP"		 , rs.getInt("cur_HP"));
			map.put("carry_flag"	 , rs.getInt("carry_flag"));
			map.put("mon_nm"		 , rs.getString("mon_nm"));
			map.put("ATT_STR"		 , rs.getInt("ATT_STR"));
			map.put("DEF_STR"		 , rs.getInt("DEF_STR"));
			map.put("STR_cnt"		 , rs.getInt("STR_cnt"));
			map.put("win_cnt"		 , rs.getInt("win_cnt"));
			map.put("lose_cnt"		 , rs.getInt("lose_cnt"));
			map.put("deck_flag"		 , rs.getInt("deck_flag"));
			map.put("mon_rare_degree", rs.getInt("mon_rare_degree"));
			map.put("mon_BP"		 , rs.getInt("mon_BP"));
			map.put("mon_max_lv"	 , rs.getInt("mon_max_lv"));
			
			list.add(map);
			tot_cnt++;
		}
		
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
<%=list.get(i).get("mon_id")%>|<%=list.get(i).get("user_mon_sn")%>|<%=list.get(i).get("mon_level")%>|<%=list.get(i).get("mon_type")%>|<%=list.get(i).get("max_exp")%>|
<%=list.get(i).get("mon_exp")%>|<%=list.get(i).get("HP")%>|<%=list.get(i).get("cur_HP")%>|<%=list.get(i).get("carry_flag")%>|<%=list.get(i).get("mon_nm")%>|
<%=list.get(i).get("ATT_STR")%>|<%=list.get(i).get("DEF_STR")%>|<%=list.get(i).get("STR_cnt")%>|<%=list.get(i).get("win_cnt")%>|<%=list.get(i).get("lose_cnt")%>|
<%=list.get(i).get("deck_flag")%>|<%=list.get(i).get("mon_rare_degree")%>|<%=list.get(i).get("mon_BP")%>|<%=list.get(i).get("mon_max_lv")%>|
<%}%>