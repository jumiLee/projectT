<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T5831";
String job_type 	= request.getParameter("job_type");		//1:구매, 2:선물
String cash_id 		= request.getParameter("cash_id");
String frd_account 	= request.getParameter("frd_account");	//친구계정(선물일 경우)
String trade_no 	= request.getParameter("trade_no");		//거래번호 (Eden Order No)
String trade_cd 	= request.getParameter("trade_cd");		//결제결과
String trade_res_key= request.getParameter("trade_res_key");//Tstore 에서 받은 txid
String signdata		= request.getParameter("signdata");		//Tstore 에서 받은 영수증 
/*
String url_signdata		= request.getParameter("signdata");	//Tstore 에서 받은 영수증 
String signdata =  java.net.URLDecoder.decode(url_signdata);
signdata = signdata.replaceAll(" ","+"); //받아오는 데이터가 +를 공백으로 변환시킴. (클라에서 수정하면 이 부분은 지울 것. )
*/

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
String tid =""; 		//[Tstore] 영수증 검증 시 받은 Product >> TID
String log_time = "";	//[Tstore] 영수증 검증 시 받은 Product >> log_time
String trade_key= "";   //결제요청시 저장했던 암호화키

CallableStatement cs = null;
            
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

//거래성공이면,
	if (trade_cd.equals("0")) {	
		
		trade_msg = "Payment Sucess";
	
	//trade_no에 해당하는 결제 요청 정보 가져옴. 		
		sql.append(" Call abn_getUserPayment  (2,"+ user_account + "," + trade_no + ")\n") ;
		pstmt = Conn.prepareStatement(sql.toString());

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
			appid		 = rs.getString ("appid");		//영수증 검증에 필요한 appid
			trade_key	 = rs.getString ("trade_key");	//결제요청시 저장했던 암호화키
		}

	// 영수증 검증
		//String req = "https://iapdev.tstore.co.kr/digitalsignconfirm.iap"; //Dev
		String req = "https://iap.tstore.co.kr/digitalsignconfirm.iap"; //Live

	//Tsore에 검증요청 보냄
		JSONObject json=new JSONObject();
		json.put("txid",trade_res_key);
		json.put("appid",appid);
		json.put("signdata",signdata);
		
	System.out.println("Tstore 검증요청:\n" + json.toString());
		
		URL url = new URL(req);
		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		connection.setDoOutput(true);
		connection.setDoInput(true);
		connection.setInstanceFollowRedirects(false);
		connection.setRequestMethod("POST");
		connection.setRequestProperty("Content-Type", "application/json");
		//connection.setRequestProperty("Content-Type", "application/x-form-urlencoded");
		connection.setRequestProperty("charset", "utf-8");
		//connection.setRequestProperty("Content-Length", "" + Integer.toString(urlParameters.getBytes().length));
		connection.setRequestProperty("Content-Length", "" + Integer.toString(json.toString().getBytes().length));
		connection.setUseCaches (false);
		
		DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
		wr.writeBytes(json.toString());
		wr.flush();
		
		String line;
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		//테스트용으로만 하고 주석처리해야함.
		/*
		while ((line = reader.readLine()) != null) {
			System.out.println("line:"+line);				
		}
		*/
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(reader);
		
		JSONObject jsonObject = (JSONObject) obj;
		Long status = (Long) jsonObject.get("status");
		
		System.out.println("TStore (결제요청응답결과:" + status + ")");
		
		//영수증이 유효한 경우만 상품정보 들어옴. 
		if(Long.toString(status).equals("0")){	
			JSONArray msg = (JSONArray) jsonObject.get("product"); //구매된 상품정보
			
			Iterator iterator = msg.iterator();
			HashMap<String, String> map = new HashMap<String, String>();
			while (iterator.hasNext()) {
				
				JSONObject prodObj = (JSONObject)iterator.next();
				tid = (String)prodObj.get("tid");
				log_time= (String)prodObj.get("log_time");
				
			}
			
			result_validation_cd = "0";
			
//System.out.println("(tid:"+tid + ") / (log_time: " + log_time + ")");

		}else{
			result_validation_cd = Long.toString(status);
			result_cd = -12;
			trade_msg = "receipt validation failed";
			trade_cd = result_validation_cd;
		}
		
		wr.close();
		reader.close();
		connection.disconnect();
		
					
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
			if (!tid.equals(trade_key)){
				result_cd = -21 ;  //암호화키 오류 
				trade_msg = "Security Key Invalid";
				System.out.println (trade_msg + "===> MyOne: " + trade_key + ",YourOne:" + tid);
				//System.out.println ("Remote Addr: " + request.getRemoteAddr()  +" / " + "Remote Host: " + request.getRemoteHost() + " / " + "X-Forward-For : " + request.getHeader("x-forwarded-for"));
			}
			
		//2. 송수신 시간 체크 
			/*
				if(date_diff > accept_itval) {
					result_cd = -22 ;  //거래시간 초과 
					trade_msg = "Timeout";
				}
			*/
			//}*/
	
		}
//거래 실패이면, 
	}else{				
		result_cd = -11;
		trade_msg = "Payment Failed";
	}
	
	//결제결과 업데이트
		sql.setLength(0);
		//sql.append(" Call abn_MgmtPayment  (2,"+ user_account + "," + cash_id + "," + trade_no + ",null,null,null,'" + trade_res_key + "','" + strENCData + "'," + trade_cd + ",'" +trade_msg + "'," + payment_type +" )\n") ;
		sql.append(" Call abn_MgmtPayment  (2,"+ user_account + "," + cash_id + "," + trade_no + ",null,null,null,null,null," + trade_cd + ",'" +trade_msg + "','" + trade_res_key + "'," + payment_type +" )\n") ;
	
System.out.println(sql);
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