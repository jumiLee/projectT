<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T5821";

String cash_id 		= request.getParameter("cash_id");
String device_type 	= request.getParameter("device_type");
int payment_type= 2; //결제사 타입(0:일반, 1:Google, 2:Tstore)
String ch_type 	= request.getParameter("ch_type"); //채널타입 (0:일반, 1:카카오톡, 2:Google)
String ch_id 	= request.getParameter("ch_id");
String appid 	= "";
String prod_id 	= "";
int result_cd 	= 0;
long trade_no 	= 0;	//거래번호 
String server_key = "";
String strENCData = "";
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_MgmtPayment  (1, " + user_account + "," + cash_id + ",null, " + device_type + "," + ch_type + ",'" + ch_id + "', null,null,null,null,null," + payment_type +"  )\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
  	
	System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		trade_no 	= rs.getLong("trade_no");
		result_cd 	= rs.getInt("result_cd");
		prod_id 	= rs.getString("prod_id");
		server_key	= rs.getString("server_key");
		appid		= rs.getString("appid");		
	}

//trade_key 생성 	
	MessageDigest md = MessageDigest.getInstance("MD5"); 
	
	//String strData = trade_no+server_key+order_no;
	String strData = trade_no+server_key;
			  
	byte[] bytData = strData.getBytes("UTF-8");
	md.update(bytData);
	byte[] digest = md.digest();
			
	for(int i =0;i<digest.length;i++)
	{
		//strENCData = strENCData + Integer.toHexString(digest[i] & 0xFF).toUpperCase();
		strENCData= strENCData +Integer.toString((digest[i] & 0xFF) + 0x100, 16).substring(1);		        
	}
	//System.out.println ("strENCData:" + strENCData);
	
//Trade_key DB Update 
	sql.setLength(0);
	sql.append(" Call abn_MgmtPayment  (3, " + user_account + ",null," + trade_no + ",null,null,null,null,'" + strENCData + "',null,null,null,null)\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
  	
	System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		result_cd 	= rs.getInt("result_cd");
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
<%=P_type %>|<%=result_cd %>|<%=trade_no %>|<%=appid%>|<%=prod_id%>|<%=strENCData%>|