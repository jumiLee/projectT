<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T121";
String attend_type = request.getParameter("attend_type");
int tot_cnt =0;
int today_attend_flag = 0;

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	//sql.append(" EXEC [dbo].[abn_getUserAttendList]  1, " +  user_account + "," + attend_type + ",null \n");
	sql.append(" Call abn_getUserAttendList  (1, " + user_account + ","+ attend_type + ", null) \n") ;
	
	pstmt = Conn.prepareStatement(sql.toString());
	//System.out.println(sql.toString());
			  	
	rs = pstmt.executeQuery();
	
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){			
		//total_cnt|day_no|rwd_type|rwd_id|rwd_sub_id|rwd_rcv_flag|rwd_nm|
		map = new HashMap();
		//map.put("today_attend_flag"	, rs.getInt("today_attend_flag"));
		map.put("day_no"		, rs.getInt("day_no"));
		map.put("rwd_type"		, rs.getInt("rwd_type"));
		map.put("rwd_id"		, rs.getInt("rwd_id"));
		map.put("rwd_sub_id"	, rs.getInt("rwd_sub_id"));
		map.put("rwd_rcv_flag"	, rs.getInt("rwd_rcv_flag"));
		map.put("rwd_nm"		, rs.getString("rwd_nm"));
		
		list.add(map);
		tot_cnt++;		
	}//end while	    
%>
<%@ include file="./moe_header.jsp"%>
	<%=P_type%>|<%=tot_cnt%>|<%for(int i=0;i<list.size();i++){%>
	<%=list.get(i).get("day_no")%>|<%=list.get(i).get("rwd_type")%>|<%=list.get(i).get("rwd_id")%>|<%=list.get(i).get("rwd_sub_id")%>|<%=list.get(i).get("rwd_rcv_flag")%>|<%=list.get(i).get("rwd_nm")%>|
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
