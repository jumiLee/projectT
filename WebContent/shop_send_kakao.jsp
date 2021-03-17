<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%

user_account = request.getParameter("user_account");
String device_type 	= request.getParameter("device_type");
String cash_id 		= request.getParameter("cash_id");
String trade_no 	= request.getParameter("trade_no");
String trade_amt 	= request.getParameter("trade_amt");
String ch_id 		= request.getParameter("ch_id");

//Kakao 관련정보 
String req = "https://gameapi.kakao.com/payment_v1/payments.json";
String client_id = "91362871318847377";
String secret_key = "a2b19b4788ebf926623d7efba604acd6e75957025844511e7838446c2daee71a";

String platform = "0";String os = "0";
if (device_type.equals("1")){
	platform ="google";
	os = "android"; 
}else if (device_type.equals("2")){
	platform ="apple";
	os = "ios"; 
}
/*
System.out.println ("ch_id:" + ch_id);
System.out.println ("platform:" + platform);
System.out.println ("os:" + os);
System.out.println ("trade_amt:" + trade_amt);
System.out.println ("trade_no:" + trade_no);
*/
String currency = "KRW";
try{
	
	String urlParameters = "client_id=" + client_id +
			"&secret_key=" + secret_key + 
			"&service_user_id=" + ch_id + 
			"&platform=" + platform +
			"&os=" + os +
			"&price=" + trade_amt +
			"&currency=" +currency +
			"&buy_no=" + trade_no;
		
			URL url = new URL(req);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setInstanceFollowRedirects(false);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			connection.setRequestProperty("charset", "utf-8");
			connection.setRequestProperty("Content-Length", "" + Integer.toString(urlParameters.getBytes().length));
			connection.setUseCaches (false);
			DataOutputStream wr = new DataOutputStream(connection.getOutputStream ());
			wr.writeBytes(urlParameters);
			wr.flush();
			String line;
	
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			/*
			while ((line = reader.readLine()) != null) {
			System.out.println(line);				
			}
			*/
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(reader);

			JSONObject jsonObject = (JSONObject) obj;
			Long status = (Long) jsonObject.get("status");
			System.out.println("trade_no : " + trade_no + " / kakao 전송결과: " + status);

			wr.close();
			reader.close();
			connection.disconnect();
		
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
