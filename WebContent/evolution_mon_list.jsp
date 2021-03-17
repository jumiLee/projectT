<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String mon_id = request.getParameter("mon_id");	//진화대상 몬스터 아이디
String P_type ="T851";

int basis_mon_id =0 ; int mtr_exist_flag=0 ; int rev_mon_id =0 ; int rev_amt=0 ; int rev_mon_att=0 ; int rev_mon_def=0 ; int rev_mon_BP =0; int rev_mon_lv =0 ; int rev_mon_max_lv=0 ; int rev_mon_type=0 ; int rev_mon_rare_degree=0;
String rev_mon_nm="0";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_RevolutionUserMonster  (1,"+ user_account + "," + mon_id + ",null,null,null  )\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		
		basis_mon_id 	= rs.getInt("mon_id"); 
		mtr_exist_flag	= rs.getInt("mtr_exist_flag");
		rev_mon_id 		= rs.getInt("rev_mon_id");	
		rev_amt			= rs.getInt("rev_amt");
		rev_mon_att		= rs.getInt("rev_amt");
		rev_mon_def		= rs.getInt("rev_mon_def");
		rev_mon_BP 		= rs.getInt("rev_mon_BP");
		rev_mon_lv 		= rs.getInt("rev_mon_lv");
		rev_mon_max_lv	= rs.getInt("rev_mon_max_lv");
		rev_mon_type	= rs.getInt("rev_mon_type");
		rev_mon_rare_degree = rs.getInt("rev_mon_rare_degree");
		rev_mon_nm		= rs.getString("rev_mon_nm");
		
		map = new HashMap();
		
		map.put("mtr_id"		, rs.getInt("mtr_id"));
		map.put("mtr_sn"		, rs.getInt("mtr_sn"));
		map.put("mtr_nm"		, rs.getString("mtr_nm"));
		map.put("mtr_lv"		, rs.getInt("mtr_lv"));
		map.put("mtr_str_cnt"	, rs.getInt("mtr_str_cnt"));
		map.put("mtr_max_lv"	, rs.getInt("mtr_max_lv"));
		map.put("mtr_rare_degree"	, rs.getInt("mtr_rare_degree"));
		map.put("mtr_type"			, rs.getInt("mtr_type"));
		
		list.add(map);
		
		if (rs.getInt("mtr_id") ==0) {
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
 
<%=P_type%>|<%=basis_mon_id%>|<%=mtr_exist_flag%>|<%=rev_mon_id%>|<%=rev_amt%>|<%=rev_mon_att%>|<%=rev_mon_def%>|<%=rev_mon_BP%>|<%=rev_mon_lv%>|<%=rev_mon_max_lv%>|<%=rev_mon_type%>|<%=rev_mon_rare_degree%>|<%=rev_mon_nm%>|
<%=tot_cnt%>|<%for(int i=0;i<list.size();i++){%><%=list.get(i).get("mtr_id")%>|<%=list.get(i).get("mtr_sn")%>|<%=list.get(i).get("mtr_nm")%>|<%=list.get(i).get("mtr_lv")%>|<%=list.get(i).get("mtr_str_cnt")%>|<%=list.get(i).get("mtr_max_lv")%>|<%=list.get(i).get("mtr_rare_degree")%>|<%=list.get(i).get("mtr_type")%>|
<%}%>