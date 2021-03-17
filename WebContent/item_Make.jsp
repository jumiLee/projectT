<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T569";
String mtr_item_id= request.getParameter("mtr_item_id"); 		
String mtr_item_uid= request.getParameter("mtr_item_uid"); 		
 
int result	=0;
int item_id= 0;
String item_nm= "";
String item_desc = "";
int item_img_no = 0;
int item_grade = 0;

int achv_result = 0; //업적업데이트 결과코드 
CallableStatement cs = null;

try{
		
Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_MakeUserItem  (" + user_account+"," + mtr_item_id + "," + mtr_item_uid + ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	   
//System.out.println("abn_MakeUserItem:" + sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){  
	/* result|item_id|item_nm|item_desc|item_img_no|item_grade| */
		result	= rs.getInt("result");
		
		item_id= rs.getInt("item_id");
		item_nm= rs.getString("item_nm");
		item_desc= rs.getString("item_desc");	
		item_img_no = rs.getInt("item_img_no");
		item_grade = rs.getInt("item_grade");
	}	
	
// Update Achievement Process
	if (result == 0) {
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);					 
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,4);
		cs.setInt(5,18);
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 
		cs.execute();
		achv_result = cs.getInt(7);
				
		//System.out.println("Make Item Achv" + achv_result);
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
<%=P_type %>|<%=result%>|<%=item_id%>|<%=item_nm%>|<%=item_desc%>|<%=item_img_no%>|<%=item_grade%>|