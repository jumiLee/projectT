<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="";
String frd_account 	= request.getParameter("frd_account");
String job_type 	= request.getParameter("job_type");
String ch_type 		= request.getParameter("frd_ch_type");
String ch_id		= request.getParameter("frd_ch_id");

//P_type 설정
if (job_type.equals("1")) {			// 친구신청하기
	P_type ="T66";
}else if (job_type.equals("2"))	{	// 친구 수락
	P_type ="T67";
	ch_type = "0";
	ch_id 	= "0";
}else if (job_type.equals("3"))	{	// 친구 거절
	P_type ="T68";
	ch_type = "0";
	ch_id 	= "0";
}else if (job_type.equals("4"))	{ 	// 친구 신청 취소
	P_type ="T69";
	ch_type = "0";
	ch_id 	= "0";
}else if (job_type.equals("5"))	{ 	// 친구 삭제
	P_type ="T693";
	ch_type = "0";
	ch_id 	= "0";
}

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt ;
tot_cnt = 0;
int result_kakao=0;//결과코드 
int result_frd_request=0;
CallableStatement cs = null;

try{
	
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

//카카오톡 유저일 경우, ch_id (카카오아이디)로 사용자 계정을 찾아야 함.	
	if (ch_type.equals("1")) {
		
		sql.append(" CALL abn_getUserInfo_by_Channel (1," + ch_type + ",'" + ch_id + "') \n");
		pstmt = Conn.prepareStatement(sql.toString());
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			frd_account = rs.getString("user_account");
			result_kakao = rs.getInt("result");
		}		
	}
	
//친구 관련 처리

	sql.setLength(0);
	sql.append(" CALL abn_MgmtFriend (" + job_type + "," + user_account + "," + frd_account + ") \n");
	
	pstmt = Conn.prepareStatement(sql.toString());
	
//System.out.println (sql.toString());
	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
	while(rs.next()){
		result_frd_request = rs.getInt(1);
		map = new HashMap();
		map.put("result", result_frd_request);
		map.put("msg", rs.getString(2));		
		list.add(map);
		tot_cnt++;
	}
	
	//친구신청 업적 처리
	if (job_type.equals("1") && result_frd_request == 0) {			// 친구신청하기
		
		int achv_result = 0; 		
		
		cs = Conn.prepareCall("{call abn_mgmtUserAchv_out(?,?,?,?,?,?,?)}");
		cs.setInt(1,1);
		cs.setString(2,user_account);
		cs.setString(3,user_account);
		cs.setInt(4,4); //achv_type
		cs.setInt(5,27); //achv_id
		cs.setInt(6,1);
		cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //achv_result_cd
		cs.execute();
		
		achv_result = cs.getInt(7);
		
		//System.out.println("친구신청업적: " + achv_result);
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
<%=P_type%>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("result")%>|<%=list.get(i).get("msg")%>|
<%}%>