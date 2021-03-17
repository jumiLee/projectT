<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
//Tstore 영수증 체크 
System.out.println ("==============TSTORE 검증시작==============");

String result_validation_cd = "-1";
//String req = "https://iapdev.tstore.co.kr/digitalsignconfirm.iap"; //Dev
String req = "https://iap.tstore.co.kr/digitalsignconfirm.iap"; //Live
			
//String txid 	= request.getParameter("txid");
//String appid 	= request.getParameter("appid");
//String signdata = request.getParameter("signdata");

//example 
String tid = "";
String log_time="";
String txid 	="TX_00000000253438";
String appid 	="OA00687270";
String signdata ="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";
signdata = signdata.replaceAll(" ","+");

//String signdata ="111";

//Tsore에 검증요청 보냄 

System.out.println ("signdata:" + signdata);
try{
	
	JSONObject json=new JSONObject();
	json.put("txid",txid);
    json.put("appid",appid);
    json.put("signdata",signdata);
    System.out.println(json.toString());
	
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
	//wr.writeBytes(urlParameters);
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
	System.out.println("status:"+status);
	if(Long.toString(status).equals("0")){	//영수증이 유효한 경우만 상품정보 들어옴. 
		JSONArray msg = (JSONArray) jsonObject.get("product"); //구매된 상품정보
		
		Iterator iterator = msg.iterator();
		HashMap<String, String> map = new HashMap<String, String>();
		while (iterator.hasNext()) {
			
			JSONObject prodObj = (JSONObject)iterator.next();
			tid = (String)prodObj.get("tid");
			log_time= (String)prodObj.get("log_time");
			
		}
		System.out.println("tid:"+tid);
		System.out.println("log_time:"+log_time);
	}
	
	if(Long.toString(status).equals("0")){
		result_validation_cd = "0";
	}else{
		result_validation_cd = Long.toString(status);
	}
	

	wr.close();
	reader.close();
	connection.disconnect();
	
	

System.out.println ("==============TSTORE 검증종료==============");	
	
}catch(Exception e){
	System.out.println("Tstore오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>