<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T583";
String job_type 	= request.getParameter("job_type");
String cash_id 		= request.getParameter("cash_id");
String frd_account 	= request.getParameter("frd_account");	//친구계정(선물일 경우)
String trade_no 	= request.getParameter("trade_no");		//거래번호
String trade_cd 	= request.getParameter("trade_cd");		//결제결과
String order_no 	= request.getParameter("order_no");		//주문번호
String security_key	= request.getParameter("security_key");	//암호화

String server_key 	= "0";	//서버보안키 
String cur_version 	= "0";	//현재 버전
String trade_msg	= "0";	//결제결과메세지
int date_diff 		= 0; 	//현재시간과 결제요청 시간 차이 
int accept_itval 	= 0; 	//허용가능한 현재시간과 결제요청 시간차
int ch_type			= 0;	//사용자 채널타입(카카오일 경우 결제처리를 위해서 )
String ch_id		="0";	//사용자 채널아이디
int device_type		= 0;	//사용자 디바이스타입(카카오일 경우 결제처리를 위해서 )
String trade_amt    = "0";	//거래금액
int result_cd 		= 0;  	//결제체크 결과코드
int result_upd_cd	= 0;  	//결제결과 업데이트 결과코드 
int result_topup_cd	= 0;  	//충전 결과코드

CallableStatement cs = null;
             
  
//System.out.println ("trade_cd:" + trade_cd);

try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
 
	if (trade_cd.equals("0")) {	//거래성공이면,
		
		trade_msg = "Payment Sucess";
				
		sql.append(" EXEC [dbo].[abn_getUserPayment] 2, " + user_account + "," + trade_no + "\n");
		pstmt = Conn.prepareStatement(sql.toString());
	  	System.out.println(sql.toString());
	  	rs = pstmt.executeQuery();
		
		while(rs.next()){
			server_key 	 = rs.getString("server_key");
			cur_version  = rs.getString("cur_version");
			date_diff 	 = rs.getInt("date_diff");
			accept_itval = rs.getInt("accept_itval");
			ch_type		 = rs.getInt("ch_type");		//1:kakao
			ch_id	  	 = rs.getString("ch_id");		//채널아이디
			device_type	 = rs.getInt("device_type");	//1:AOD, 2:IOS
			trade_amt    = rs.getString ("trade_amt");	//거래금액			
		}
	//1. 암호화 키 비교

		MessageDigest md = MessageDigest.getInstance("MD5"); 

		String strData = trade_no+server_key+order_no;
		  
		byte[] bytData = strData.getBytes("UTF-8");
		md.update(bytData);
		byte[] digest = md.digest();
		String strENCData = "";
	    for(int i =0;i<digest.length;i++)
	    {
	        //strENCData = strENCData + Integer.toHexString(digest[i] & 0xFF).toUpperCase();
	        strENCData= strENCData +Integer.toString((digest[i] & 0xFF) + 0x100, 16).substring(1);
	        
	    }
	
	    System.out.println ("MyOne: " + strENCData);
	    System.out.println ("YouOne: " + security_key);

		if (!security_key.equals(strENCData)){
			result_cd = -21 ;  //암호화키 오류 
			trade_msg = "Security Key Invalid";
			System.out.println ("Remote Addr: " + request.getRemoteAddr()  +" / " + "Remote Host: " + request.getRemoteHost() + " / " + "X-Forward-For : " + request.getHeader("x-forwarded-for"));
		}
		if (order_no.length() < 20){
			result_cd = -24; //치트의심유저
			trade_msg = "cheat suspected user";
			trade_cd= "-24";
			System.out.println ("Remote Addr: " + request.getRemoteAddr()  +" / " + "Remote Host: " + request.getRemoteHost() + " / " + "X-Forward-For : " + request.getHeader("x-forwarded-for"));
		}else {
			String OrderStr = order_no.substring(0,20);
			if(!OrderStr.equals("12999763169054705758")) {
		
				result_cd = -24; //치트의심유저
				trade_msg = "cheat suspected user(2)";
				trade_cd= "-24";
				System.out.println ("Remote Addr: " + request.getRemoteAddr()  +" / " + "Remote Host: " + request.getRemoteHost() + " / " + "X-Forward-For : " + request.getHeader("x-forwarded-for"));
			}
		}
		
		
	//2. 송수신 시간 체크 
	/*
		if(date_diff > accept_itval) {
			result_cd = -22 ;  //거래시간 초과 
			trade_msg = "Timeout";
		}
	*/
	}else{				//거래 실패이면, 
		result_cd = -11;
		trade_msg = "Payment Failed";
	}
	
	//결제결과 업데이트
		sql.setLength(0);
		sql.append(" EXEC [dbo].[abn_MgmtPayment] 2, " + user_account + "," + cash_id+ "," + trade_no+ ",null,null,null,'" + order_no + "','" + security_key +"'," + trade_cd + ",'" + trade_msg + "'\n");
		pstmt = Conn.prepareStatement(sql.toString());
	  	System.out.println(sql.toString());
	  	rs = pstmt.executeQuery();
		
		while(rs.next()){
			result_upd_cd 	 = rs.getInt("result_cd");			
		}
	  	
		if (result_upd_cd != 0 ) {
			if(result_upd_cd == -21) {
				result_cd = -23; //업데이트 결과 에러
				trade_msg = "Duplicated Order Info";
			}else if (result_upd_cd == -22){
				result_cd = -23; //업데이트 결과 에러
				trade_msg = "Not Exist Order info";
			} 
		}   
	    
	System.out.println ("거래결과:" + trade_msg);    
	
	if (result_cd ==0) {	//충전조건 만족하면 ,
		
		//충전처리 
		sql.append(" Exec [abn_MgmtCash]  		\n"); 
		sql.append(" "+ job_type 			+", \n");
		sql.append(" "+ user_account 		+", \n");
		sql.append(" "+ frd_account 		+", \n");
		sql.append(" "+ cash_id 			+", \n");
		sql.append(" ? 							\n");	//result_cd
		
		cs = Conn.prepareCall(sql.toString());
		  
		//System.out.println(sql.toString());
		
		cs.registerOutParameter(1, java.sql.Types.INTEGER);
		cs.execute();
		
		result_topup_cd 	= cs.getInt(1);
		
		//Kakao 결제 결과 전송 
		if (ch_type == 1){
%>			
			<jsp:include page="shop_send_kakao.jsp" flush="true">
				<jsp:param name="user_account" value="<%=user_account %>"/>
				<jsp:param name="device_type" value="<%=device_type %>"/>
				<jsp:param name="cash_id" value="<%=cash_id %>"/>
				<jsp:param name="trade_no" value="<%=trade_no %>"/>
				<jsp:param name="trade_amt" value="<%=trade_amt %>"/>
				<jsp:param name="ch_id" value="<%=ch_id %>"/>				
			</jsp:include>
<%		}
		
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
<%=P_type %>|<%=result_cd %>|