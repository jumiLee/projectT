<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%

/*
"orderId":"12999763169054705758.1371079406387615",
"packageName":"com.example.app",
"productId":"exampleSku",
"purchaseTime":1345678900000,
"purchaseState":0,
"developerPayload":"bGoa+V7g/yqDXvKRqq+JTFn4uQZbPiQJo4pf9RzJ",
"purchaseToken":"opaque-token-up-to-1000-characters"
*/
String device = request.getParameter("device");
if (device.equals("1")){ // AOS
	

	String orderId 			= request.getParameter("orderId");
	String developerPayload	= request.getParameter("developerPayload");
	
	String package_name 	= request.getParameter("package_name");
	String product_id 		= request.getParameter("product_id");
	String purchaseToken	= request.getParameter("purchaseToken");
	String AuthCode = "4/Q4YHLbHcBnq3kNjIAdyy_6bcKhVWFeAZ0ltfqsEkKcE.kjw7gHAp9ZoQBrG_bnfDxpJiHlngmgI";
	try{
		
		https://www.googleapis.com/androidpublisher/v1.1/applications/com.EDEN.NOB/inapp/com.edenworld.nb.prod_1/purchases/paymenttoken/?accesse_token=ya29.ZStBkRnGyZ2mUYOLgls7QVBxOg82XhBCFo8UIT5gM
		
		String urlParameters = "https://www.googleapis.com/androidpublisher/v1.1/" + 
				"applications/" + packageName + 
				"inapp/" + productId + 
				"purchases/" + purchaseToken +
				"?accesse_token=4/Q4YHLbHcBnq3kNjIAdyy_6bcKhVWFeAZ0ltfqsEkKcE.kjw7gHAp9ZoQBrG_bnfDxpJiHlngmgI" ;
			
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
				//System.out.println("trade_no : " + trade_no + " / kakao 전송결과: " + status);
	
				wr.close();
				reader.close();
				connection.disconnect();
	}		
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
