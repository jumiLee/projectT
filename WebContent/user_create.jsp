<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T112";
int exist_user_flag =0;	//기존유저 Flag (1:새로운 유저, 2:기존유저)
int exist_char_flag =0; //기존 캐릭터 Flag ( 1캐릭터있음, 2:캐릭터없음)
int mon_cnt = 0;
//request.setCharacterEncoding("UTF-8");

String tmp_header = "0|0|0|0|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0";

String user_level 	= request.getParameter("user_level");	//사용자레벨
String user_email 	= request.getParameter("m_no");			//이메일 (임시)
String user_pwd 	= request.getParameter("m_no");			//비밀번호 (임시)

String m_no 		= request.getParameter("m_no");			//핸드폰번호
String user_img 	= request.getParameter("user_img");		//사용자이미지
String user_nm 		= new String(request.getParameter("user_nm").getBytes("iso-8859-1"), "EUC-KR"); 

String ch_type	= request.getParameter("ch_type");	//채널타입
String ch_id	= request.getParameter("ch_id");	//채널아이디		

if(user_level==null ){
	//user_level = "1";
	user_level = "2"; //Guest
} 

CallableStatement cs = null;
int result_cd = 0;
int result_character = 0;
int new_user_account = 0;
String user_mobile = "";
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
//1. 계정 생성
	cs = Conn.prepareCall("{call abn_JoinUser_APP(?,?,?,?,?,?,?,?,?)}");
	cs.setString(1,user_level);
	cs.setString(2,user_email);
	cs.setString(3,m_no);
	cs.setString(4,user_pwd);
	cs.setString(5,ch_type);
	cs.setString(6,ch_id);
	
	cs.registerOutParameter(7, java.sql.Types.INTEGER);	 //Bat_Result
	cs.registerOutParameter(8, java.sql.Types.NVARCHAR);	 //Bat_Result
	cs.registerOutParameter(9, java.sql.Types.INTEGER);	 //Bat_Result
	
	cs.execute();
	
	new_user_account	= cs.getInt(7);
	user_mobile 		= cs.getString(8);
	result_cd			= cs.getInt(9);
	
	
System.out.println("계정생성결과(" + ch_id + "): " + result_cd);

//2-1. 기존 가입사용자인면, 기존 계정정보 보냄
	if (result_cd == 1) {
		exist_user_flag = 2; //기존유저
		
		//기존 캐릭터 있는지 검사
		sql.append(" select count(mon_id) as mon_cnt from user_monster where user_account=" + new_user_account ) ;
		pstmt = Conn.prepareStatement(sql.toString());
	  	rs = pstmt.executeQuery();
	  	
	  	if(rs.next()){
	  		mon_cnt = rs.getInt("mon_cnt");
	  	}	

	  //System.out.println(sql.toString());
	  	
	  	if (mon_cnt ==0 ) {
	  		exist_char_flag = 2;  
	  	}else{
	  		exist_char_flag = 1; 
	  	}
	}
//2-2. 최초 가입이면
	else if (result_cd == 0) {
		exist_user_flag = 1; //신규유저
		exist_char_flag = 2; //기존 캐릭터 없음
	}else{	
		//계정 생성 실패
		new_user_account = 0;
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
<%@ include file="./moe_empty_header.jsp"%>
<%=P_type%>|<%=result_cd%>|<%=new_user_account %>|<%=exist_user_flag%>|<%=exist_char_flag %>