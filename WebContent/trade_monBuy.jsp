<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T82";
String mon_id = request.getParameter("mon_id");
String user_mon_sn = request.getParameter("user_mon_sn");
String mon_price = request.getParameter("mon_price");
String trade_flag = request.getParameter("trade_flag"); //added 4/6 

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;

try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" EXEC [dbo].[abn_MgmtUserMonster] 4, " + user_account + "," + mon_id + "," + user_mon_sn + "," + trade_flag + ",null,"+ mon_price + " \n");
	
	pstmt = Conn.prepareStatement(sql.toString());
	
	//System.out.println ("Buying Monster:" + sql.toString());
	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){
		map = new HashMap();
		map.put("result_mgmtUserMon", rs.getInt(1));
		map.put("msg_mgmtUserMon"	, rs.getString(2));
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
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|
<%for(int i=0;i<list.size();i++){%>
	<%=list.get(i).get("result_mgmtUserMon")%>|<%=list.get(i).get("msg_mgmtUserMon")%>|
<%}%>