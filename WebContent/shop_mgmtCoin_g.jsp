<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T5832";
String job_type 	= request.getParameter("job_type");
String cash_id 		= request.getParameter("cash_id");
String frd_account 	= request.getParameter("frd_account");	//친구계정(선물일 경우)
String trade_no 	= request.getParameter("trade_no");		//거래번호
String trade_cd 	= request.getParameter("trade_cd");		//결제결과
String order_no 	= request.getParameter("order_no");		//주문번호
String security_key	= request.getParameter("security_key");	//암호화(payload)
String trade_res_key= request.getParameter("trade_res_key");//Google 에서 받은 purchase token

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
String result_validation_cd = "-1"; //영수증 검증 결과 
int payment_type	= 0; 
String d_prod_id	= "";
String appid = "0";
String strENCData = "";
String payload =""; 	//[Google] 영수증 검증 시 받은 payload 

int status =0;
String trade_key= "";   //결제요청시 저장했던 암호화키


CallableStatement cs = null;
             
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
 
	if (trade_cd.equals("0")) {	//거래성공이면,
		
		trade_msg = "Payment Sucess";
				
		sql.append(" CALL abn_getUserPayment (2,"+user_account+ "," + trade_no + ")  \n");
		
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
			payment_type = rs.getInt ("payment_type");	//결제사 타입 
			d_prod_id	 = rs.getString ("prod_id");	//결제요청했던 상품
			trade_key	 = rs.getString ("trade_key");	//결제요청시 저장했던 암호화키
		} 
		
	// 영수증 검증	
	
System.out.println("Google (결제요청응답결과:" + status + ")");
	
		if(Long.toString(status).equals("0")){	
			payload = security_key;
			result_validation_cd = "0";
		}else{
			result_validation_cd = Long.toString(status);
			result_cd = -12;
			trade_msg = "receipt validation failed";
			trade_cd = result_validation_cd;
		}
	
	//암호화 키 비교
	if (result_cd == 0 ) {	//영수증 검증에 성공한 경우, 암호화키 비교 
		/*
		MessageDigest md = MessageDigest.getInstance("MD5"); 
		String strData = trade_no+server_key;
		byte[] bytData = strData.getBytes("UTF-8");
		md.update(bytData);
		byte[] digest = md.digest();

		for(int i =0;i<digest.length;i++)
	    {
	        //strENCData = strENCData + Integer.toHexString(digest[i] & 0xFF).toUpperCase();
	        strENCData= strENCData +Integer.toString((digest[i] & 0xFF) + 0x100, 16).substring(1);
	        
	    }
		*/	
		if (!payload.equals(trade_key)){
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
		}  
	}else{				//거래 실패이면, 
		result_cd = -11;
		trade_msg = "Payment Failed";
	}
	
	//결제결과 업데이트
		sql.setLength(0);
		//sql.append(" Call abn_MgmtPayment  (2,"+ user_account + "," + cash_id + "," + trade_no + ",null,null,null,'" + order_no + "','" + strENCData + "'," + trade_cd + ",'" +trade_msg + "'," + payment_type +" )\n") ;
		sql.append(" Call abn_MgmtPayment  (2,"+ user_account + "," + cash_id + "," + trade_no + ",null,null,null,'" + order_no + "',null," + trade_cd + ",'" +trade_msg + "','" + trade_res_key + "'," + payment_type +" )\n") ;
System.out.println(sql.toString());
	
		pstmt = Conn.prepareStatement(sql.toString());
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
		cs = Conn.prepareCall("{call abn_MgmtCash(?,?,?,?,?,?)}");
		cs.setString(1,job_type);
		cs.setString(2,user_account);
		cs.setString(3,frd_account);
		cs.setString(4,cash_id);
		cs.setInt(5,payment_type);
		
		cs.registerOutParameter(6, java.sql.Types.INTEGER);
		
		cs.execute();
		result_topup_cd = cs.getInt(6);	
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