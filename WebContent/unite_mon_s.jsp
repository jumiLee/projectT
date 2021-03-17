<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T84";
String mon_id 		= request.getParameter("mon_id"); 		//기초 몬스터 아이디
String user_mon_sn 	= request.getParameter("user_mon_sn"); 	//기초 몬스터 고유번호
String mon_array= request.getParameter("mon_array");//합성 대상 몬스터 배열정보(mon_id:mon_sn|mon_id:mon_sn|...)

int tot_cnt ;
tot_cnt = 0;
int result = 0; int mon_lv_bf =0 ; int mon_exp_bf=0 ; int mon_att_bf =0 ; int mon_def_bf=0 ; int mon_lv_af=0 ; int mon_exp_af=0 ; int mon_att_af =0; int mon_def_af =0 ; int total_exp=0 ; int united_amt=0 ; int levelup_flag=0;
 
List<Map<String, Object>> list = null;
Map<String, Object> map = null;

try{
		
Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	//sql.append(" EXEC [dbo].[abn_getBatList] 3, " + user_account + ",null,null,"+bat_result+" \n");
	sql.append(" EXEC [dbo].[abn_UniteUserMonster] " + user_account + "," + mon_id +"," + user_mon_sn + ",'" + mon_array + "'\n");
	
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		
		mon_lv_bf 	= rs.getInt("mon_lv_bf");
		mon_exp_bf	= rs.getInt("mon_exp_bf"); 
		mon_att_bf 	= rs.getInt("mon_att_bf"); 
		mon_def_bf	= rs.getInt("mon_def_bf"); 
		mon_lv_af	= rs.getInt("mon_lv_af"); 
		mon_exp_af	= rs.getInt("mon_exp_af"); 
		mon_att_af 	= rs.getInt("mon_att_af"); 
		mon_def_af 	= rs.getInt("mon_def_af"); 
		total_exp	= rs.getInt("total_exp"); 
		united_amt	= rs.getInt("united_amt"); 
		levelup_flag= rs.getInt("levelup_flag");
		result      = rs.getInt("result");
		
		map = new HashMap();
		
		map.put("mon_id"			, rs.getInt("mon_id"));
		map.put("user_mon_sn"		, rs.getInt("user_mon_sn"));
		map.put("mon_nm"			, rs.getString("mon_nm"));
		map.put("mon_lv"			, rs.getInt("mon_lv"));
		map.put("mon_str_cnt"		, rs.getInt("mon_str_cnt"));
		map.put("mon_max_lv"		, rs.getInt("mon_max_lv"));
		map.put("mon_rare_degree"	, rs.getInt("mon_rare_degree"));
		map.put("mon_type"			, rs.getInt("mon_type"));
		
		list.add(map);		
		
		if (rs.getInt("mon_id") ==0) {
			tot_cnt = 0;
		}else{
			tot_cnt ++;
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
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=result%>|<%=mon_lv_bf %>|<%=mon_exp_bf %>|<%=mon_att_bf %>|<%=mon_def_bf %>|<%=mon_lv_af %>|<%=mon_exp_af %>|<%=mon_att_af %>|<%=mon_def_af %>|<%=total_exp %>|<%=united_amt %>|<%=levelup_flag%>|<%=tot_cnt %>|
<%for(int i=0;i<list.size();i++){%>
	<%=list.get(i).get("mon_id")%>|<%=list.get(i).get("user_mon_sn")%>|<%=list.get(i).get("mon_nm")%>|<%=list.get(i).get("mon_lv")%>|<%=list.get(i).get("mon_str_cnt")%>|<%=list.get(i).get("mon_max_lv")%>|<%=list.get(i).get("mon_rare_degree")%>|<%=list.get(i).get("mon_type")%>|
<%}%>