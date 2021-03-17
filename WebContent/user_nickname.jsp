<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T115";
int result_flag =0; 

request.setCharacterEncoding("UTF-8");
//response.setContentType("text/html; charset=UTF-8");
String user_nickname 		= new String(request.getParameter("user_nickname").getBytes("iso-8859-1"), "UTF-8"); //닉네임  
//String user_nickname 		= request.getParameter("user_nickname");
String mon_id = request.getParameter("mon_id");
int item_id = 0; int item_result = 0; 

CallableStatement cs = null;

try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
//1. 계정 생성
	
	cs = Conn.prepareCall("{call abn_makeUserNickname(?,?,?)}");
	cs.setString(1,user_account);
	cs.setString(2,user_nickname);
	
	cs.registerOutParameter(3, java.sql.Types.INTEGER);	 //result_flag
	cs.execute();
	
	result_flag = cs.getInt(3);
	
	//System.out.println("닉네임생성결과(" + user_account + "):" + user_nickname + ":" + result_flag);
	
//2. 선택한 캐릭터를 리더로 설정	
	if(result_flag == 0) {
		sql.append(" Call abn_MgmtUserMonster  (5," + user_account + "," + mon_id + ",1,0,1,0)\n") ;
		pstmt = Conn.prepareStatement(sql.toString());
		rs = pstmt.executeQuery();
	}
	
//3. 캐릭터 클래스에 따라 무기 제공
	if(result_flag == 0) {
		
		if (mon_id.equals("82")) {
			item_id = 3110001;
		}else if (mon_id.equals("99")) {
			item_id = 3120001;
		}else if (mon_id.equals("94")) {
			item_id = 3130001;
		}		
		
		cs = Conn.prepareCall("{call abn_MgmtItem_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,5);
		cs.setString(2,user_account);
		cs.setInt(3,item_id);
		cs.setInt(4,1);
		cs.setInt(5,0);
		
		cs.registerOutParameter(6, java.sql.Types.INTEGER);	 //result_flag
		cs.registerOutParameter(7, java.sql.Types.NVARCHAR); //result_msg
		cs.execute();
		
		item_result = cs.getInt(6);
		System.out.println("ITEM 생성결과(" + item_id + "):" + mon_id + ":" + item_result);
		
	}
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(cs != null) cs.close();
	if(pstmt != null) pstmt.close();	
	if(rs != null) rs.close();
}	
%>
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|<%=result_flag%>|<%=user_account%>
