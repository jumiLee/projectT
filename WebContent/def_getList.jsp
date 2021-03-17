<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T031";

//침공방어이력 관련변수
int def_id 			 = 0;
String def_nm  	 	 = "0";
String def_desc  	 = "0";
int def_day 		 = 0;
int total_def_day	 = 0;
int daily_def_cnt 	 = 0;
int tot_daily_def_cnt= 0;
int def_term		 = 0;
String def_date  	 = "0";
int rwd_rcv_flag 	 = 0;

int tot_cnt = 0;

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
ResultSet rs_rwd = null;
PreparedStatement pstmt_rwd = null;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

//방어이력조회	
	//sql.append(" EXEC [dbo].[abn_getDefense]  1, " +  user_account + " \n");
	sql.append(" Call abn_getDefense  (1," + user_account + ")\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
	//System.out.println(sql.toString());
			  	
	rs = pstmt.executeQuery();
	if (rs.next()) {
		//def_id|def_nm|def_desc|def_day|total_def_day|daily_def_cnt|tot_daily_def_cnt|def_term|def_date|rwd_rcv_flag
		def_id			 = rs.getInt("def_id");
		def_nm			 = rs.getString("def_nm");
		def_desc		 = rs.getString("def_desc");	
		def_day 		 = rs.getInt("def_day");
		total_def_day	 = rs.getInt("tot_day");
		daily_def_cnt	 = rs.getInt("daily_def_cnt");
		tot_daily_def_cnt= rs.getInt("tot_daily_def_cnt");
		def_term		 = rs.getInt("attend_term");	
		def_date  		 = rs.getString("def_full_dt");
		rwd_rcv_flag 	 = rs.getInt("rwd_rcv_flag");
	}
	
//보상리스트조회
	list = new ArrayList<Map<String, Object>>();
	//오늘 참가할 수 있는 회수 이미 다 참가
	/*
	if (daily_def_cnt == tot_daily_def_cnt){
		map = new HashMap();
		map.put("rwd_type"		, 0);
		map.put("rwd_id"		, 0);
		map.put("rwd_sub_id"	, 0);
		map.put("rwd_nm"		, "0");
		map.put("rwd_desc"		, "0");
		
		list.add(map);		
	}else{
		sql.setLength(0);
		//이전방어 보상 받았으면, 다음 보상을 보여 줌.
		if(rwd_rcv_flag == 1) {
			def_id = def_id + 1;
		}
		sql.append(" EXEC [dbo].[abn_getCommonRwdList]  1, 2, " +  def_id + " \n");
		//System.out.println(sql.toString());
		pstmt_rwd = Conn.prepareStatement(sql.toString());
		
		rs_rwd = pstmt_rwd.executeQuery();
		
		
		while(rs_rwd.next()){			
			//tot_rwd_cnt|rwd_type|rwd_id|rwd_sub_id|rwd_nm|rwd_desc|
			map = new HashMap();
			map.put("rwd_type"		, rs_rwd.getInt("rwd_type"));
			map.put("rwd_id"		, rs_rwd.getInt("rwd_id"));
			map.put("rwd_sub_id"	, rs_rwd.getInt("rwd_sub_id"));
			map.put("rwd_nm"		, rs_rwd.getString("rwd_nm"));
			map.put("rwd_desc"		, rs_rwd.getString("rwd_desc"));
			
			list.add(map);
			tot_cnt++;		
		}//end while	 
	}//end if	
	*/
	sql.setLength(0);
	//sql.append(" EXEC [dbo].[abn_getCommonRwdList]  1, 2, " +  def_id + " \n");
	sql.append(" Call abn_getCommonRwdList  (1,2," + def_id + ")\n") ;
	//System.out.println(sql.toString());
	pstmt_rwd = Conn.prepareStatement(sql.toString());
	
	rs_rwd = pstmt_rwd.executeQuery();
	
	while(rs_rwd.next()){			
		//tot_rwd_cnt|rwd_type|rwd_id|rwd_sub_id|rwd_nm|rwd_desc|
		map = new HashMap();
		map.put("rwd_type"		, rs_rwd.getInt("rwd_type"));
		map.put("rwd_id"		, rs_rwd.getInt("rwd_id"));
		map.put("rwd_sub_id"	, rs_rwd.getInt("rwd_sub_id"));
		map.put("rwd_nm"		, rs_rwd.getString("rwd_nm"));
		map.put("rwd_desc"		, rs_rwd.getString("rwd_desc"));
		
		list.add(map);
		tot_cnt++;		
	}//end while	 
%>
<%@ include file="./moe_header.jsp"%>
	<%=P_type%>|<%=def_id%>|<%=def_nm%>|<%=def_desc%>|<%=def_day%>|<%=total_def_day%>|<%=daily_def_cnt%>|<%=tot_daily_def_cnt%>|<%=def_term%>|<%=def_date%>|<%=rwd_rcv_flag%>|<%=tot_cnt%>| 
	<%for(int i=0;i<list.size();i++){%>
	<%=list.get(i).get("rwd_type")%>|<%=list.get(i).get("rwd_id")%>|<%=list.get(i).get("rwd_sub_id")%>|<%=list.get(i).get("rwd_nm")%>|<%=list.get(i).get("rwd_desc")%>|
	<%}%> 
<%			
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
