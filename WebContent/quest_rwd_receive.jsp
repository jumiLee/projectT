<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T504";
String mon_id 		= request.getParameter("mon_id");
String user_mon_sn 	= request.getParameter("user_mon_sn");
String quest_no 	= request.getParameter("quest_no");
int rwd_category = 8;  //퀘스트 보상 카테고리 

CallableStatement cs = null;

int result_cd = 0; //결과코드
 
List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	
// 퀘스트 완료처리	
	cs = Conn.prepareCall("{call abn_mgmtUserQuest(?,?,?,?,?,?)}");
	cs.setInt(1,2);
	cs.setString(2,user_account);
	cs.setString(3,mon_id);
	cs.setString(4,user_mon_sn);
	cs.setString(5,quest_no);
	
	cs.registerOutParameter(6, java.sql.Types.INTEGER);	 //result_flag
	cs.execute();
	result_cd = cs.getInt(6);
	
//System.out.println("quest updaCompletete(user_account,quest_no):" + user_account + "," + mon_id+ "," + user_mon_sn+ "," + quest_no);
// 퀘스트 보상획득 완료처리	
	if(result_cd == 0 ){
		cs = Conn.prepareCall("{call abn_mgmtUserQuest(?,?,?,?,?,?)}");
		cs.setInt(1,1);
		cs.setString(2,user_account);
		cs.setString(3,mon_id);
		cs.setString(4,user_mon_sn);
		cs.setString(5,quest_no);
		
		cs.registerOutParameter(6, java.sql.Types.INTEGER);	 //result_flag
		cs.execute();
		result_cd = cs.getInt(6);
		
//System.out.println("Quest Reward update:" + result_cd);
		
	}
	
	
//보상정보조회	
	Conn = DriverManager.getConnection(DB_url_replica, DB_user, DB_pwd);
	sql.append(" Call abn_getUserMonReward  (2,"+ user_account + "," + mon_id + "," + user_mon_sn + "," + rwd_category + "," + quest_no + " )\n") ;
	
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	//System.out.println("Quest Reward:" + sql);
	while(rs.next()){
		//rwd_cnt|rwd_sn|rwd_type|rwd_id|rwd_sub_id|rwd_nm|rwd_desc|rwd_img_no|
		map = new HashMap();
		map.put("rwd_sn"	, rs.getInt("rwd_sn"));
		map.put("rwd_type"	, rs.getInt("rwd_type"));
		map.put("rwd_id"	, rs.getInt("rwd_id"));  
		map.put("rwd_sub_id", rs.getInt("rwd_sub_id"));
		map.put("rwd_nm"	, rs.getString("rwd_nm"));
		map.put("rwd_desc"	, rs.getString("rwd_desc"));	
		map.put("rwd_img_no", rs.getInt("rwd_img_no"));	
		map.put("item_att_def", rs.getString("item_att_def"));
		map.put("item_class", rs.getInt("item_class"));
		
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
}	%>
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=result_cd %>|<%=tot_cnt %>|
<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("rwd_sn")%>|<%=list.get(i).get("rwd_type")%>|<%=list.get(i).get("rwd_id")%>|<%=list.get(i).get("rwd_sub_id")%>|<%=list.get(i).get("rwd_nm")%>|<%=list.get(i).get("rwd_desc")%>|<%=list.get(i).get("rwd_img_no")%>|<%=list.get(i).get("item_att_def")%>|<%=list.get(i).get("item_class")%>|
<%}%>