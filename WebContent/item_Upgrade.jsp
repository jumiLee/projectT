<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type = "";
String job_type= (request.getParameter("job_type") == null) ? "1" : request.getParameter("job_type");
String item_id 	  	 = request.getParameter("item_id");
String item_uniqueID = request.getParameter("item_uniqueID");
String mtr_item_array 	 = "";

if (job_type.equals("1")){
	P_type ="T568";	
}else if(job_type.equals("2")){
	P_type ="T5945";
}


int result_cd = 0; //결과코드
int upgrade_item_grade = 0; //승급결과 아이템등급
int achv_result = 0; //업적업데이트 결과코드 

CallableStatement cs = null;
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

// Upgrade Item Process 	
	cs = Conn.prepareCall("{call abn_UpgradeUserItem(?,?,?,?,?,?,?)}");
	cs.setString(1,job_type);	
	cs.setString(2,user_account);
	cs.setString(3,item_id);
	cs.setString(4,item_uniqueID);
	cs.setInt(5,0);
	cs.setString(6,mtr_item_array);
	cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //result_flag
	cs.execute();
	result_cd = cs.getInt(7);
	
	//System.out.println("abn_UpgradeUserItem:" + item_uniqueID);
	
// Update Achievement Process
if (job_type.equals("1")){
	if (result_cd == 0) {
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);					 
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,4);
		cs.setInt(5,10);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
		cs.execute();
		achv_result = cs.getInt(7);
			
		//System.out.println("업적결과" + achv_result);
	}
}
// Select Item Grade Information			
	sql.append(" select item_grade from USER_ITEM where user_account=" + user_account + " and item_uniqueID=" + item_uniqueID );
	
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println("item_grade:" + sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){  
		
		upgrade_item_grade	= rs.getInt("item_grade");
	}
	
	
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	
%>
<%@ include file="./moe_header.jsp"%>
<%=P_type %>|<%=result_cd %>|<%=upgrade_item_grade %>
