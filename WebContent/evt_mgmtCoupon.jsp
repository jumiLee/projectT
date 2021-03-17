<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T043";
String job_type	 = request.getParameter("job_type");
String coupon_id = request.getParameter("coupon_id");
String evt_type = "";

int result_cd = 0; //결과코드

evt_type = coupon_id.substring(coupon_id.length()-1); //evt_type은 뒤에서 한자리 

//System.out.println ("evt_type:" + evt_type);
//System.out.println ("coupon_id:" + coupon_id);

//check evt type format
String expression = "[-+]?[0-9]*\\.?[0-9]+$";  
CharSequence inputStr = evt_type;  
Pattern pattern = Pattern.compile(expression);  
Matcher matcher = pattern.matcher(inputStr);  
   
if(matcher.matches()){  
	CallableStatement cs = null;
	try{
		Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	 
		cs = Conn.prepareCall("{call abn_MgmtEvtCoupon(?,?,?,?,?,?,?)}");
		cs.setString(1,job_type);
		cs.setString(2,user_account);
		cs.setString(3,evt_type);
		cs.setString(4,coupon_id);
		cs.setInt(5,0);
		cs.setInt(6,0);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //result_flag
		
		cs.execute();
		
		result_cd = cs.getInt(7);
		
	}catch(Exception e){
		System.out.println("SQL 연결 오류 : " + e);
		e.printStackTrace();
	}finally{
		if(Conn != null) Conn.close();
		if(pstmt != null) pstmt.close();
		if(rs != null) rs.close();
	}	
}else{
	result_cd = -11; // coupon type error
}


%>
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=result_cd %>|
