<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="";
String job_type = request.getParameter("job_type");
String frd_name = request.getParameter("frd_name");
if (frd_name != null){
	frd_name = new String(frd_name.getBytes("8859_1"),"euc-kr"); //한글 깨짐 처리
} 
  
//P_type 설정
if (job_type.equals("1")) {	//나의친구목록
	P_type ="T60";
}else if (job_type.equals("2"))	{	// 신청중 친구목록
	P_type ="T61";
}else if (job_type.equals("3"))	{	// 요청온 친구목록
	P_type ="T62";
}else if (job_type.equals("4"))	{ 	// 추천 친구목록
	P_type ="T63";
}else if (job_type.equals("5"))	{ 	// 동료찾기
	P_type ="T64";
}   

//친구리스트 조회관련 변수
	List<Map<String, Object>> list = null;
	Map<String, Object> map = null;
	int tot_cnt =0; 

//친구관련 flag 조회 변수
	int new_frd_flag = 2; int req_frd_flag= 2;
	ResultSet rs_new = null;
	PreparedStatement pstmt_new = null;

try{
	
	//Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	Conn = DriverManager.getConnection(DB_url_replica, DB_user, DB_pwd);
	
//친구 관련 Flag 조회 
	sql.append(" CALL abn_getFriendList (8," + user_account + ",null) \n");
//System.out.println (sql.toString());

	pstmt_new = Conn.prepareStatement(sql.toString());	
	rs_new = pstmt_new.executeQuery();
	
	if(rs_new.next()){
		new_frd_flag = rs_new.getInt("new_frd_flag");
		req_frd_flag = rs_new.getInt("req_frd_flag");
	}
	
//친구리스트 조회 	
	sql.setLength(0);
	sql.append(" CALL abn_getFriendList (" + job_type + "," + user_account + ",'" + frd_name + "') \n");
	pstmt = Conn.prepareStatement(sql.toString());	
//System.out.println (sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		
		//new_frd_flag = rs.getInt("new_frd_flag");
		//req_frd_flag = rs.getInt("req_frd_flag");
		
		map = new HashMap();
		map.put("frd_account", rs.getInt("frd_account"));
		map.put("frd_nickname", rs.getString("frd_nickname"));
		map.put("frd_image", rs.getInt("frd_image"));
		map.put("frd_level", rs.getInt("frd_level"));
		map.put("frd_cnt", rs.getInt("frd_cnt"));	
		map.put("frd_monster", rs.getInt("frd_monster"));
		if (job_type.equals("1")){
			map.put("shake_flag", rs.getInt("shake_flag"));
		}
		map.put("frd_mon_rare_degree", rs.getInt("frd_mon_rare_degree"));
		map.put("frd_mon_type", rs.getInt("frd_mon_type"));
		
		list.add(map);
		tot_cnt++;
	} 
	
//새로운 친구상태 NEW 업데이트 처리 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

	CallableStatement cs = null;
	
	cs = Conn.prepareCall("{call abn_MgmtUserNewNotice(?,?,?,?,?)}");
	cs.setInt(1,1);
	cs.setString(2,user_account);
	cs.setInt(3,2);
	cs.setInt(4,2);
	cs.registerOutParameter(5, java.sql.Types.INTEGER);	
	cs.execute();
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<% if (job_type.equals("1")){ %>
<%=P_type%>|<%=new_frd_flag%>|<%=req_frd_flag%>|<%=tot_cnt%>|
<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("frd_account")%>|<%=list.get(i).get("frd_nickname")%>|<%=list.get(i).get("frd_image")%>|<%=list.get(i).get("frd_level")%>|<%=list.get(i).get("frd_cnt")%>|<%=list.get(i).get("shake_flag")%>|<%=list.get(i).get("frd_monster")%>|<%=list.get(i).get("frd_mon_rare_degree")%>|<%=list.get(i).get("frd_mon_type")%>|
<%}%>
<% } else { %>
<%=P_type%>|<%=new_frd_flag%>|<%=req_frd_flag%>|<%=tot_cnt%>|
<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("frd_account")%>|<%=list.get(i).get("frd_nickname")%>|<%=list.get(i).get("frd_image")%>|<%=list.get(i).get("frd_level")%>|<%=list.get(i).get("frd_cnt")%>|<%=list.get(i).get("frd_monster")%>|<%=list.get(i).get("frd_mon_rare_degree")%>|<%=list.get(i).get("frd_mon_type")%>|
<%}%>
<% }%>
