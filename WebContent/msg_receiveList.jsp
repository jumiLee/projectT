<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="";
String job_type = request.getParameter("job_type");

int good_type = 0;

//P_type 설정
if (job_type.equals("1")) {	// 수신함
	P_type ="T001";
}
 
List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
String user_nickname = "";
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getMsgList  ("+ job_type + "," + user_account + " )\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	/*
		total_cnt|receive_sn|sender_account|sender_img|good_type|good_id|good_sub_id|good_nm|good_desc|receive_dt|receive_msg|
	*/
	while(rs.next()){
		map = new HashMap();
		map.put("receive_sn", rs.getInt("receive_sn"));
		map.put("sender_account", rs.getInt("sender_account"));
		map.put("sender_nickname", rs.getString("sender_nickname"));
		map.put("sender_img", rs.getInt("sender_img"));
		good_type = rs.getInt("good_type");
		if(good_type > 20 ) {
			map.put("good_type", 21);	//뽑기권일 경우엔 21로 보냄.
		}else{
			map.put("good_type", rs.getInt("good_type"));
		}
		map.put("good_id", rs.getInt("good_id"));
		map.put("good_sub_id", rs.getInt("good_sub_id"));
		map.put("good_nm", rs.getString("good_nm"));
		map.put("good_desc", rs.getString("good_desc"));
		map.put("receive_dt", rs.getString("receive_dt"));
		map.put("receive_msg", rs.getString("receive_msg"));
		
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
	<%=list.get(i).get("receive_sn")%>|<%=list.get(i).get("sender_account")%>|<%=list.get(i).get("sender_nickname")%>|<%=list.get(i).get("sender_img")%>|<%=list.get(i).get("good_type")%>|<%=list.get(i).get("good_id")%>|<%=list.get(i).get("good_sub_id")%>|<%=list.get(i).get("good_nm")%>|<%=list.get(i).get("good_desc")%>|<%=list.get(i).get("receive_dt")%>|<%=list.get(i).get("receive_msg")%>|
<%}%>