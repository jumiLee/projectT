
<%
//Tstore 영수증 체크 

String req = "https://iapdev.tstore.co.kr/digitalsigncomfirm.iap"; //Dev
//String req = "https://iap.tstore.co.kr/digitalsigncomfirm.iap"; //Live
//String txid 	= request.getParameter("txid");
//String appid 	= request.getParameter("appid");
//String signdata = request.getParameter("signdata");

//example 
String txid 	="TX_0000000658";
String appid 	="OA12345678";	
String signdata ="MIIH7QYJKoZIhvcNAQcCoIIH3jCCB9oCAQExDzANBglghkgBZQMEAMIIH7QYJKdDFDFFEFEFEFoZIhvcNAQcCoIIH3jCCB9oCAQExDzANBglghkgBZQMEA…";	


//Tsore에 검증요청 보냄 
	String urlParameters = 	"txid=" + txid +
							"&appid=" + appid + 
							"&signdata=" + signdata;
	
System.out.println (req + "?" + urlParameters);

	URL url = new URL(req);
	HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	connection.setDoOutput(true);
	connection.setDoInput(true);
	connection.setInstanceFollowRedirects(false);
	connection.setRequestMethod("POST");
	connection.setRequestProperty("Content-Type", "application/json");
	//connection.setRequestProperty("Content-Type", "application/x-form-urlencoded");
	connection.setRequestProperty("charset", "utf-8");
	connection.setRequestProperty("Content-Length", "" + Integer.toString(urlParameters.getBytes().length));
	connection.setUseCaches (false);
	
	DataOutputStream wr = new DataOutputStream(connection.getOutputStream ());
	wr.writeBytes(urlParameters);
	wr.flush();

	
	String line;
	
	BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));

	while ((line = reader.readLine()) != null) {
		System.out.println(line);				
	}

	
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(reader);
	
	JSONObject jsonObject = (JSONObject) obj;
	int status = (Integer) jsonObject.get("status");
	//Number status = (Number) jsonObject.get("status");
	System.out.println("TStore 응답결과: " + status);
	
	if(status== 0){
		result_validation_cd = 0;
	}else{
		result_validation_cd = status;
	}
	
	wr.close();
	reader.close();
	connection.disconnect();
	%>	
