<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T581";
String device_type 	= request.getParameter("device_type");
String payment_type = (request.getParameter("payment_type") == null) ? "2" : request.getParameter("payment_type");


List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
String result_packet= "";

try{
	    
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

	sql.append(" Call abn_getCashList  (1,"+ user_account + "," + device_type + "," + payment_type + ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
System.out.println(sql);	
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		map = new HashMap();
		map.put("cash_id"		, rs.getInt("cash_id"));
		map.put("cash_type_cd"	, rs.getInt("cash_type_cd"));  
		map.put("cash_amt"		, rs.getInt("cash_amt"));
		map.put("cash_dis_amt"	, rs.getInt("cash_dis_amt"));	
		map.put("coin_amt"		, rs.getInt("coin_amt"));
		map.put("coin_nm"		, rs.getString("coin_nm"));
		map.put("coin_desc"		, rs.getString("coin_desc"));
		map.put("prod_id"		, rs.getString("prod_id"));
		map.put("device_type"	, rs.getString("device_type"));
		map.put("prod_img"		, rs.getInt("prod_img"));
		
		list.add(map);
		tot_cnt ++;
	}
	
	if (list == null){
		//System.out.println ("T581 : ArrayList is null");
		result_packet="0";
	}else{
		for(int i=0;i<list.size();i++){
			//result|msg|Item_img|item_nm|item_desc|
			result_packet +=  
					list.get(i).get("cash_id").toString() +"|"+	
					list.get(i).get("cash_type_cd").toString() +"|"+
					list.get(i).get("cash_amt").toString() +"|"+
					list.get(i).get("cash_dis_amt").toString() +"|"+
					list.get(i).get("coin_amt").toString() +"|"+
					list.get(i).get("coin_nm").toString() +"|"+
					list.get(i).get("coin_desc").toString() +"|"+
					list.get(i).get("prod_id").toString() +"|"+
					list.get(i).get("device_type").toString() +"|"+
					list.get(i).get("prod_img").toString() +"|";
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

<%=P_type %>|<%=payment_type%>|<%=tot_cnt %>|<%=result_packet%>