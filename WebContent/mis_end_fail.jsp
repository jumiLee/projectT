<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T734";
String mis_id 	  = request.getParameter("mis_id");
String mis_sub_id = request.getParameter("mis_sub_id");
String mis_gold   = request.getParameter("mis_gold");	
String mis_exp	  = request.getParameter("mis_exp");

//도움준 친구 처리 관련 
String frd_account = request.getParameter("frd_account");	//도움준 친구 계정
CallableStatement cs = null;
int result_cd = 0;

int tot_cnt = 0;
int mis_rwd_result = 0;
int boss_mon_id =0; String boss_mon_nm ="0"; int boss_mon_lv=0; int boss_mon_hp=0; int boss_mon_att=0; int boss_mon_def=0;

ResultSet rs2 = null;
PreparedStatement pstmt2 = null;

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

//파티원 미션 수행 전/후 정보
String bf_mon_id ; String bf_user_mon_sn; //String bf_mon_nm ="0"; int bf_lv =0 ; int bf_mon_exp=0 ; int bf_mon_target_exp=0 ; 
String af_mon_id ; String af_user_mon_sn; //String bf_mon_nm ="0"; int af_lv =0 ; int af_mon_exp=0 ; int af_mon_target_exp=0 ; 

List<Map<String, Object>> list_bf = null;
Map<String, Object> map_bf = null;
List<Map<String, Object>> list_af = null;
Map<String, Object> map_af = null;
ResultSet rs3 = null;
PreparedStatement pstmt3 = null;
ResultSet rs4 = null;
PreparedStatement pstmt4 = null;
int tot_bf_cnt = 0; int tot_af_cnt = 0; String result_party_packet = "";
String result_packet = ""	;

try{
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

//미션 수행 전 Party 정보 조회 (레벨, 경험치, Max경험치)
	//sql.append(" EXEC [dbo].[abn_getMonList]  4," + user_account + ",null, null \n");		
	sql.append(" Call abn_getMonList  (4,"+ user_account + ",null, null )\n") ;	
	pstmt3 = Conn.prepareStatement(sql.toString());
  	
//System.out.println("1:"+ sql.toString());
  	
	rs3 = pstmt3.executeQuery();
	list_bf = new ArrayList<Map<String, Object>>();

	while(rs3.next()){		
		map_bf = new HashMap();
		map_bf.put("bf_mon_id"			, rs3.getInt("mon_id"));
		map_bf.put("bf_user_mon_sn"		, rs3.getInt("user_mon_sn"));
		map_bf.put("bf_mon_nm"			, rs3.getString("mon_nm"));
		map_bf.put("bf_lv"				, rs3.getInt("mon_level"));
		map_bf.put("bf_mon_exp"			, rs3.getInt("mon_exp"));
		map_bf.put("bf_mon_target_exp"	, rs3.getInt("max_exp"));
		
		list_bf.add(map_bf); 
		tot_bf_cnt ++;
	}	

//미션 수행에 따른 처리
	sql.setLength(0);
	sql.append(" Call abn_MissionFail  ("+ user_account + "," + mis_id + "," + mis_sub_id + "," + mis_gold + "," + mis_exp + " )\n") ;
	pstmt = Conn.prepareStatement(sql.toString());
//System.out.println("mission fail:"+ sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){		
		
		mis_rwd_result = rs.getInt("result");		
	}	
	
	//도움 준 친구가 있고 미션 결과처리에 오류가 없는 경우
	/*
		if (!frd_account.equals("-1") &&  mis_rwd_result == 0) {	

			cs = Conn.prepareCall("{call abn_MgmtFriendHelp_out(?,?,?,?,?)}");
			cs.setInt(1,1);
			cs.setString(2,user_account);
			cs.setString(3,frd_account);
			cs.setInt(4,0);
			
			cs.registerOutParameter(5, java.sql.Types.INTEGER);	 //result_cd
			cs.execute();
			
			result_cd = cs.getInt(5);
			
			System.out.println ("도움친구처리결과(fail):" +result_cd );
		}
	*/		
//미션 수행 후 Party 정보 조회 (레벨, 경험치, Max경험치)
	sql.setLength(0);
	sql.append(" Call abn_getMonList  (4,"+ user_account + ",null, null )\n") ;
	pstmt4 = Conn.prepareStatement(sql.toString());
  	
//System.out.println("4:"+ sql.toString());
  	
	rs4 = pstmt4.executeQuery();
	list_af = new ArrayList<Map<String, Object>>();

	while(rs4.next()){		
		map_af = new HashMap();
		map_af.put("af_mon_id"			, rs4.getInt("mon_id"));
		map_af.put("af_user_mon_sn"		, rs4.getInt("user_mon_sn"));
		map_af.put("af_mon_nm"			, rs4.getString("mon_nm"));
		map_af.put("af_lv"				, rs4.getInt("mon_level"));
		map_af.put("af_mon_exp"			, rs4.getInt("mon_exp"));
		map_af.put("af_mon_target_exp"	, rs4.getInt("max_exp"));
		
		list_af.add(map_af); 
		tot_af_cnt ++;
	}	

	if (tot_bf_cnt != tot_af_cnt) {
		result_packet += "-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|";
	}else{

		//mon_cnt|mon_id|user_mon_sn|mon_nm|bf_mon_lv|bf_mon_exp|bf_mon_target_exp|af_mon_lv|af_mon_exp|af_mon_target_exp|
		result_packet += tot_af_cnt +"|";
		for(int i=0;i<list_bf.size();i++){
			
			bf_mon_id		= list_bf.get(i).get("bf_mon_id").toString(); 
			bf_user_mon_sn	= list_bf.get(i).get("bf_user_mon_sn").toString();

			result_packet +=	bf_mon_id										+"|"+ 
								bf_user_mon_sn									+"|"+
								list_bf.get(i).get("bf_mon_nm").toString() 		+"|"+
								list_bf.get(i).get("bf_lv").toString() 			+"|"+
								list_bf.get(i).get("bf_mon_exp").toString() 		+"|"+
								list_bf.get(i).get("bf_mon_target_exp").toString() +"|" ;
			for(int af=0;af<list_af.size();af++){
				af_mon_id		= list_af.get(af).get("af_mon_id").toString();
				af_user_mon_sn	= list_af.get(af).get("af_user_mon_sn").toString();
			
				if (bf_mon_id.equals(af_mon_id) && bf_user_mon_sn.equals(af_user_mon_sn) ) {
			
					result_packet +=list_af.get(af).get("af_lv").toString() 			+"|"+
									list_af.get(af).get("af_mon_exp").toString() 		+"|"+
									list_af.get(af).get("af_mon_target_exp").toString() +"|" ;
				}
			}//end af for			
		}//end bf for
	}//end if
 	
%>		
<%@ include file="./moe_header.jsp"%>
<%=P_type%>|<%=mis_rwd_result%>|<%=result_packet%>
<% 
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(pstmt2 != null) pstmt2.close();
	if(rs2 != null) rs2.close();	
	if(pstmt3 != null) pstmt3.close();
	if(rs3 != null) rs3.close();	
	if(pstmt4 != null) pstmt4.close();
	if(rs4 != null) rs4.close();	
}	%>
