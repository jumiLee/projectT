<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="";
String job_type = request.getParameter("job_type");

//P_type 설정
if (job_type.equals("1")) 	   {	// event achivement
	P_type ="T0211";
}else if(job_type.equals("2")) {	// weekly achivement
	P_type ="T0221";
}else if(job_type.equals("3")) {	// daily achivement
	P_type ="T0231";	
}else if(job_type.equals("4")) {	// series achivement
	P_type ="T0241";	
}else {
	P_type ="T0251";	
}

//업적 리스트 조회관련 변수
	List<Map<String, Object>> list = null;
	Map<String, Object> map = null;
	int tot_cnt ;
	tot_cnt = 0;
	String user_nickname = "";
	int rwd_type = 0;
//업적별 New 관련변수
	ResultSet rs_new = null;
	PreparedStatement pstmt_new = null;
	int achv1_flag = 2; int achv2_flag = 2; int achv3_flag = 2; int achv4_flag = 2;
	int achv5_flag = 2; int achv6_flag = 2; int achv7_flag = 2; int achv8_flag = 2; int achv9_flag = 2; int achv10_flag = 2;
	
	
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
// 업적별 New 여부 조회
	sql.append(" select achv_type  from USER_ACHIEVEMENT where user_account = " + user_account + " and achv_complete_flag = 1 and rwd_rcv_flag = 2 \n");
	pstmt_new = Conn.prepareStatement(sql.toString());	
	rs_new = pstmt_new.executeQuery();
	
	while(rs_new.next()){
		if (rs_new.getInt("achv_type") == 1) {
			achv1_flag = 1;			
		}else if (rs_new.getInt("achv_type") == 2) {
			achv2_flag = 1;			
		}else if (rs_new.getInt("achv_type") == 3) {
			achv3_flag = 1;			
		}else if (rs_new.getInt("achv_type") == 4) {
			achv4_flag = 1;			
		}else if (rs_new.getInt("achv_type") == 5) {
			achv5_flag = 1;			
		}else if (rs_new.getInt("achv_type") == 6) {
			achv6_flag = 1;			
		}else if (rs_new.getInt("achv_type") == 7) {
			achv7_flag = 1;			
		}else if (rs_new.getInt("achv_type") == 8) {
			achv8_flag = 1;			
		}else if (rs_new.getInt("achv_type") == 9) {
			achv9_flag = 1;			
		}else if (rs_new.getInt("achv_type") == 10) {
			achv10_flag = 1;			
		}
		
	}
	
//업적 리스트 조회
	sql.setLength(0);
	//sql.append(" EXEC [dbo].[abn_getUserAchv] 1, " + user_account + ","+ job_type + ", null \n");
	sql.append(" Call abn_getUserAchv  (1, " + user_account + ","+ job_type + ", null) \n") ;
	
	pstmt = Conn.prepareStatement(sql.toString());	
	//System.out.println (sql.toString());	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	/*
		total_cnt |achv_type|achv_id|achv_title|achv_content|achv_total_cnt|rwd_type|rwd_id|rwd_sub_id|rwd_name|achv_complete_flag|rwd_rcv_flag|achv_cnt|
	*/
	while(rs.next()){
		map = new HashMap();
		map.put("achv_type", rs.getInt("achv_type"));
		map.put("achv_id", rs.getInt("achv_id"));
		map.put("achv_title", rs.getString("achv_title"));
		map.put("achv_content", rs.getString("achv_content"));
		map.put("achv_total_cnt", rs.getInt("achv_complete_cnt"));
		rwd_type = rs.getInt("achv_rwd_type");
		if(rwd_type > 20 ) {
			map.put("rwd_type", 21);
		}else{
			map.put("rwd_type", rs.getInt("achv_rwd_type"));
		}
		//map.put("rwd_type", rs.getInt("achv_rwd_type"));
		map.put("rwd_id", rs.getInt("achv_rwd_id"));
		map.put("rwd_sub_id", rs.getInt("achv_rwd_sub_id"));
		map.put("rwd_name", rs.getString("rwd_name"));
		map.put("achv_complete_flag", rs.getInt("achv_complete_flag"));
		map.put("rwd_rcv_flag", rs.getInt("rwd_rcv_flag"));
		map.put("achv_cnt", rs.getInt("achv_cnt"));
		
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
	if(pstmt_new != null) pstmt_new.close();
	if(rs_new != null) rs_new.close();
		
}	%>
<%=P_type%>|<%=achv1_flag%>|<%=achv2_flag%>|<%=achv3_flag%>|<%=achv4_flag%>|<%=achv5_flag%>|<%=achv6_flag%>|<%=achv7_flag%>|<%=achv8_flag%>|<%=achv9_flag%>|<%=achv10_flag%>|<%=job_type%>|<%=tot_cnt%>|
<%for(int i=0;i<list.size();i++){%>
	<%=list.get(i).get("achv_type")%>|<%=list.get(i).get("achv_id")%>|<%=list.get(i).get("achv_title")%>|<%=list.get(i).get("achv_content")%>|<%=list.get(i).get("achv_total_cnt")%>|<%=list.get(i).get("rwd_type")%>|<%=list.get(i).get("rwd_id")%>|<%=list.get(i).get("rwd_sub_id")%>|<%=list.get(i).get("rwd_name")%>|<%=list.get(i).get("achv_complete_flag")%>|<%=list.get(i).get("rwd_rcv_flag")%>|<%=list.get(i).get("achv_cnt")%>|
<%}%>