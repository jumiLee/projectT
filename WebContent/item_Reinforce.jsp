<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%
String P_type ="T561";
String job_type= (request.getParameter("job_type") == null) ? "1" : request.getParameter("job_type");


if (job_type.equals("2")){
	P_type ="T5942";	// 룬강화
}else{
	job_type = "1";
}

String item_id_basis= request.getParameter("item_id"); 		
String item_uid_basis= request.getParameter("item_uniqueID"); 		
String item_array	= request.getParameter("item_array"); 		
 
int result	=0;
int item_id = 0;
int item_uniqueID= 0;
int item_type= 0;
String item_nm = "";
int item_img_no = 0;

int rare_degree = 0;
int item_usage = 0;
int item_cnt = 0;
String item_desc ="";
int item_price =0;

int item_value = 0;
int ATT= 0;
int DEF= 0;
int HP = 0;
int SP = 0;

int abnormal = 0;
int speedup_all= 0;
int speedup= 0;
int exp_up= 0;
int critical_up= 0;

int reinforce_up= 0;
int limit_lv= 0;
int item_period_flag= 0;
int item_period= 0;
int remain_time=0;
int item_class= 0;

int item_grade=0;
int item_level= 0;
int item_exp= 0;
int item_rfc_flag= 0;
int item_rfc_mtr_flag= 0;
int item_bf_lv	= 0;
int item_bf_exp	= 0;
int item_bf_att	= 0;
int item_bf_def	= 0;
int target_exp_bf = 0;
int target_exp = 0;
int socket_equip_flag = 0;

try{
		
Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_ReinforceUserItem  (" + job_type + "," + user_account+"," + item_id_basis + "," + item_uid_basis + ",0,'" + item_array+ "')\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	   
//System.out.println("abn_ReinforceUserItem:" + sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){  
	
		result	= rs.getInt("result");
		item_id = rs.getInt("item_id");
		item_uniqueID= rs.getInt("item_uniqueID");
		item_type= rs.getInt("item_type");
		item_nm = rs.getString("item_nm");
		item_img_no = rs.getInt("item_img_no");
		
		rare_degree = rs.getInt("rare_degree");
		item_usage = rs.getInt("item_usage");
		item_cnt = rs.getInt("item_cnt");
		item_desc =rs.getString("item_desc");
		item_price =rs.getInt("item_price");
		
		item_value = rs.getInt("item_value");
		ATT= rs.getInt("ATT");
		DEF= rs.getInt("DEF");
		HP = rs.getInt("HP");
		SP = rs.getInt("SP");
		
		abnormal = rs.getInt("abnormal");
		speedup_all= rs.getInt("speedup_all");
		speedup= rs.getInt("speedup");
		exp_up= rs.getInt("exp_up");
		critical_up= rs.getInt("critical_up");
		
		reinforce_up= rs.getInt("reinforce_up");
		limit_lv= rs.getInt("limit_lv");
		item_period_flag= rs.getInt("item_period_flag");
		item_period= rs.getInt("item_period");
		remain_time=rs.getInt("remain_time");
		item_class= rs.getInt("class"); 
		
		item_grade=rs.getInt("item_grade");  
		item_level= rs.getInt("item_level");  		
		item_exp= rs.getInt("item_exp");  		
		item_rfc_flag= rs.getInt("item_rfc_flag");  	
		item_rfc_mtr_flag= rs.getInt("item_rfc_mtr_flag");  
		item_bf_lv	= rs.getInt("item_bf_lv");
		item_bf_exp	= rs.getInt("item_bf_exp");
		item_bf_att	= rs.getInt("item_bf_att");
		item_bf_def	= rs.getInt("item_bf_def");
		target_exp_bf	= rs.getInt("target_exp_bf");
		target_exp		= rs.getInt("target_exp");			
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
<%=P_type %>|<%=result%>|<%=item_id%>|<%=item_uniqueID%>|<%=item_type%>|<%=item_nm%>|<%=item_img_no%>|<%=rare_degree%>|<%=item_usage%>|<%=item_cnt%>|<%=item_desc%>|<%=item_price%>|<%=item_value%>|<%=ATT%>|<%=DEF%>|<%=HP%>|<%=SP%>|<%=abnormal%>|<%=speedup_all%>|<%=speedup%>|<%=exp_up%>|<%=critical_up%>|<%=reinforce_up%>|<%=limit_lv%>|<%=item_period_flag%>|<%=item_period%>|<%=remain_time%>|<%=item_class%>|<%=item_grade%>|<%=item_level%>|<%=item_exp%>|<%=item_rfc_flag%>|<%=item_rfc_mtr_flag%>|<%=item_bf_lv%>|<%=item_bf_exp%>|<%=item_bf_att%>|<%=item_bf_def%>|<%=target_exp_bf%>|<%=target_exp%>|