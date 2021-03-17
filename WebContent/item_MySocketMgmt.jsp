<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T592";
String job_type 	= request.getParameter("job_type");
String item_id 		= request.getParameter("item_id");
String item_uniqueID= request.getParameter("item_uniqueID");
String tre_id 		= request.getParameter("tre_id");
String tre_id_sn	= request.getParameter("tre_id_sn");
String socket_pos 	= request.getParameter("socket_pos");

int result = 0;
CallableStatement cs = null;

List<Map<String, Object>> list = null; 
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
//System.out.println("call abn_mgmtUserSocket==>" +job_type+"," + user_account +","+item_id+","+item_uniqueID+","+socket_pos+","+tre_id+","+tre_id_sn );

// 소켓 끼기 or 빼기  
	cs = Conn.prepareCall("{call abn_mgmtUserSocket(?,?,?,?,?,?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,item_id);
	cs.setString(4,item_uniqueID);
	cs.setString(5,socket_pos);
	cs.setString(6,tre_id);
	cs.setString(7,tre_id_sn);
	
	cs.registerOutParameter(8, java.sql.Types.INTEGER);	 //Result
	
	cs.execute();
	
	result = cs.getInt(8);
	
// 소켓 장착 리스트 요청 	
	sql.append(" Call abn_getSocketTreasureList  (3," + user_account+",null," + item_uniqueID + "," + item_id + ",null) \n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		/*total_cnt|socket_pos|socket_type|my_socket_pos|tre_id|tre_id_sn|tre_img_no|tre_hp|tre_att|tre_def|tre_critical_up|tre_miss_up|*/
		map.put("socket_pos"	, rs.getInt("socket_pos"));
		map.put("tre_type"		, rs.getInt("tre_type"));
		map.put("my_socket_pos"	, rs.getInt("my_socket_pos"));
		map.put("tre_id"		, rs.getInt("tre_id"));
		map.put("tre_id_sn"		, rs.getInt("tre_id_sn"));  
		map.put("tre_type"		, rs.getInt("tre_type"));
		map.put("tre_level"		, rs.getInt("tre_level"));
		map.put("tre_img_no"	, rs.getInt("tre_img_no"));
		map.put("tre_nm"		, rs.getString("tre_nm"));
		map.put("hp"			, rs.getInt("hp"));
		map.put("att"			, rs.getInt("att"));
		map.put("def"			, rs.getInt("def"));
		map.put("critical_up"	, rs.getInt("critical_up"));
		map.put("miss_up"		, rs.getInt("miss_up")); 
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
<%=P_type%>|<%=result%>|<%=job_type%>|<%=tot_cnt %>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("socket_pos")%>|<%=list.get(i).get("tre_type")%>|<%=list.get(i).get("my_socket_pos")%>|<%=list.get(i).get("tre_id")%>|<%=list.get(i).get("tre_id_sn")%>|<%=list.get(i).get("tre_type")%>|<%=list.get(i).get("tre_level")%>|<%=list.get(i).get("tre_img_no")%>|<%=list.get(i).get("tre_nm")%>|<%=list.get(i).get("hp")%>|<%=list.get(i).get("att")%>|<%=list.get(i).get("def")%>|<%=list.get(i).get("critical_up")%>|<%=list.get(i).get("miss_up")%>|
<%}%>