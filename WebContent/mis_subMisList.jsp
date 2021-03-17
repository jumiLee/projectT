<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T72";
String mis_id = request.getParameter("mis_id");

ResultSet rs2 = null;
PreparedStatement pstmt2 = null;

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt =0; 
int comp_degree =0; int rwd_rcv_flag =0;
int boss_mon_id =0; String boss_mon_nm ="0"; int boss_mon_lv=0; int boss_mon_hp=0; int boss_mon_att=0; int boss_mon_def=0;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	//sql.append(" EXEC [dbo].[abn_getUserSubMission]  " + user_account + ","+ mis_id + " \n");
	sql.append(" Call abn_getUserSubMission  ("+ user_account + "," + mis_id + ")\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
  	//System.out.println(sql.toString());
  	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		
		comp_degree = rs.getInt("comp_degree");
		rwd_rcv_flag = rs.getInt("rwd_rcv_flag");
		
		map.put("mis_id"			, rs.getInt("mis_id"));
		map.put("mis_sub_id"		, rs.getInt("mis_sub_id"));
		map.put("mis_sub_nm"		, rs.getString("mis_sub_nm"));
		map.put("mis_AP"			, rs.getInt("mis_AP"));
		map.put("mis_gold"			, rs.getInt("mis_gold"));
		map.put("mis_exp"			, rs.getInt("mis_exp"));
		map.put("Complete_Rate"		, rs.getInt("Complete_Rate"));
		map.put("user_gold"			, rs.getInt("user_gold"));
		map.put("user_comp_degree"	, rs.getInt("user_comp_degree"));	//미션완료정도
		map.put("boss_flag"			, rs.getInt("boss_flag"));
		map.put("cur_flag"			, rs.getInt("cur_flag"));		
		
		boss_mon_id = rs.getInt("boss_mon_id");
		map.put("boss_mon_id"	, boss_mon_id);
	
		
		if (rs.getInt("boss_flag") == 1) {//보스이면
			
			sql.setLength(0);
			sql.append(" select mon_nm, mon_lv, mon_HP, mon_ATT, mon_DEF from MST_MONSTER where mon_id=" + boss_mon_id + " \n");
			pstmt2 = Conn.prepareStatement(sql.toString());		  	
		  	//System.out.println(sql.toString());		  	
			rs2 = pstmt2.executeQuery();
			
			while (rs2.next()){
				map.put("boss_mon_nm"	, rs2.getString("mon_nm"));
				map.put("boss_mon_lv"	, rs2.getInt("mon_lv"));
				map.put("boss_mon_hp"	, rs2.getInt("mon_HP"));
				map.put("boss_mon_att"	, rs2.getInt("mon_ATT"));
				map.put("boss_mon_def"	, rs2.getInt("mon_DEF"));
			}			
		}else{
			map.put("boss_mon_nm"	, "0");
			map.put("boss_mon_lv"	, 0);
			map.put("boss_mon_hp"	, 0);
			map.put("boss_mon_att"	, 0);
			map.put("boss_mon_def"	, 0);
		}
		
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
	if(pstmt2 != null) pstmt2.close();
	if(rs2 != null) rs2.close();
}	%>

<%=P_type%>|<%=comp_degree%>|<%=rwd_rcv_flag%>|<%=tot_cnt %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("mis_id")%>|<%=list.get(i).get("mis_sub_id")%>|<%=list.get(i).get("mis_sub_nm")%>|<%=list.get(i).get("mis_AP")%>|<%=list.get(i).get("mis_gold")%>|<%=list.get(i).get("mis_exp")%>|<%=list.get(i).get("Complete_Rate")%>|<%=list.get(i).get("cur_flag")%>|<%=list.get(i).get("user_gold")%>|<%=list.get(i).get("user_comp_degree")%>|<%=list.get(i).get("boss_flag")%>|<%=list.get(i).get("boss_mon_id")%>|<%=list.get(i).get("boss_mon_nm")%>|<%=list.get(i).get("boss_mon_lv")%>|<%=list.get(i).get("boss_mon_hp")%>|<%=list.get(i).get("boss_mon_att")%>|<%=list.get(i).get("boss_mon_def")%>|
<%}%>