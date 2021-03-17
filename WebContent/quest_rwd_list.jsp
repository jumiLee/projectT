<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type 	= "T503";
String mon_id 	= request.getParameter("mon_id");	
String user_mon_sn 	= request.getParameter("user_mon_sn");
// String quest_no 	= request.getParameter("quest_no");
int rwd_category = 8;  //퀘스트 보상 카테고리 

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
int quest_no = 0;

try{
	
	Conn = DriverManager.getConnection(DB_url_replica, DB_user, DB_pwd);
	
	sql.append(" Call abn_getUserMonReward  (2,"+ user_account + "," + mon_id + "," + user_mon_sn + "," + rwd_category + ",null)\n") ;
//System.out.println ("abn_getUserMonReward:" + sql.toString());
	
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		//quest_no(수행할퀘스트번호)|rwd_cnt|rwd_sn|rwd_type|rwd_id|rwd_sub_id|rwd_nm|rwd_desc|rwd_img_no|
		
		quest_no = rs.getInt("quest_no");
		map = new HashMap();
		map.put("quest_no"	, rs.getInt("quest_no"));
		map.put("rwd_sn"	, rs.getInt("rwd_sn"));
		map.put("rwd_type"	, rs.getInt("rwd_type"));
		map.put("rwd_id"	, rs.getInt("rwd_id"));  
		map.put("rwd_sub_id", rs.getInt("rwd_sub_id"));
		map.put("rwd_nm"	, rs.getString("rwd_nm"));
		map.put("rwd_desc"	, rs.getString("rwd_desc"));	
		map.put("rwd_img_no", rs.getInt("rwd_img_no"));	
			
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
}	
%> 
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=quest_no%>|<%=tot_cnt %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("rwd_sn")%>|<%=list.get(i).get("rwd_type")%>|<%=list.get(i).get("rwd_id")%>|<%=list.get(i).get("rwd_sub_id")%>|<%=list.get(i).get("rwd_nm")%>|<%=list.get(i).get("rwd_desc")%>|<%=list.get(i).get("rwd_img_no")%>|
<%}%>