<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T862";
String mon_id 		= request.getParameter("mon_id"); 		//기초 몬스터 아이디
String user_mon_sn 	= request.getParameter("mon_sn"); 	//기초 몬스터 고유번호
String mon_array	= request.getParameter("mon_array"); 	//대상 몬스터 배열

//합성  관련
	int tot_cnt =0; int unite_result=0; int unite_mon_id =0;
	Map<String, Object> map = null;
	List<Map<String, Object>> list = null;
	
//skill 관련
	ResultSet rs_sk = null;
	PreparedStatement pstmt_sk = null;
	int tot_sk_cnt =0; 
	Map<String, Object> map_sk = null;
	List<Map<String, Object>> list_sk = null;
	String sk_mon_id ; String sk_user_mon_sn ;
	
	String result_packet = ""	;
	
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
//몬스터 정보
	//sql.append(" EXEC [dbo].[abn_UniteHighUserMonster] " + user_account + ","  + mon_id + "," + user_mon_sn + ",'" + mon_array + "' \n");
	sql.append(" Call abn_UniteHighUserMonster  ("+ user_account + "," + mon_id + "," + user_mon_sn + ",'" + mon_array +"' )\n") ;
	//System.out.println ("합성:" + sql.toString());
	  
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
//Save monster info Map 
	while(rs.next()){
		map = new HashMap();
		//result|mon_id|mon_nm|mon_level|mon_type|HP||ATT|DEF|mon_rare_degree|mon_BP|skill_cnt|skill_id|skill_nm|skill_cooltime|skill_desc|
		unite_result = rs.getInt("result");
		unite_mon_id = rs.getInt("mon_id");
		
		map.put("result"		 , unite_result);
		map.put("mon_id"		 , unite_mon_id);
		map.put("mon_nm"		 , rs.getString("mon_nm"));
		map.put("mon_level"		 , rs.getInt("mon_lv"));
		map.put("mon_type"		 , rs.getInt("mon_type"));
		map.put("mon_HP"		 , rs.getInt("mon_HP"));
		map.put("mon_ATT"		 , rs.getInt("mon_ATT"));
		map.put("mon_DEF"		 , rs.getInt("mon_DEF"));
		map.put("mon_rare_degree", rs.getInt("mon_rare_degree"));
		map.put("mon_BP"		 , rs.getInt("mon_BP"));
		
		list.add(map);
		tot_cnt++;		
	} //end while
	
/* 합성 성공이면 새로 얻은 몬스터 스킬 조회 */
	if (unite_result == 0 ){
		sql.setLength(0);
		sql.append(" SELECT mon_id, skill_id, skill_nm, skill_cooltime, skill_desc from MST_MONSTER_SKILL where mon_id =" + unite_mon_id + " \n");
		
		pstmt_sk = Conn.prepareStatement(sql.toString());
		rs_sk 	 = pstmt_sk.executeQuery();
		list_sk = new ArrayList<Map<String, Object>>();
		
		//Save monster skill info Map 	
		while(rs_sk.next()){
			map_sk = new HashMap();
			//skill_cnt|skill_id|skill_nm|skill_cooltime|skill_desc|
			map_sk.put("mon_id"			, rs_sk.getInt("mon_id"));
			map_sk.put("skill_id"		, rs_sk.getInt("skill_id"));
			map_sk.put("skill_nm"		, rs_sk.getString("skill_nm"));
			map_sk.put("skill_cooltime"	, rs_sk.getInt("skill_cooltime"));
			map_sk.put("skill_desc"		, rs_sk.getString("skill_desc"));
			
			list_sk.add(map_sk);
			tot_sk_cnt ++;
		}
	}//endif (unite_result ==0)
	
	//각 list 데이터를 가지고 패킷 규격에 따라 만들기. 
		
	//몬스터 정보 List
		for(int i=0;i<list.size();i++){
			
			mon_id 		= list.get(i).get("mon_id").toString();
			
			//total_cnt|user_mon_sn|mon_id|mon_level|mon_type|max_exp|mon_exp|HP|cur_HP|carry_flag|mon_nm|ATT_STR|DEF_STR|STR_cnt|win_cnt|lose_cnt|deck_flag|mon_rare_degree|mon_BP
			result_packet +=  	list.get(i).get("result").toString() 	+"|"+
								mon_id +"|"+
								list.get(i).get("mon_nm").toString() 		+"|"+
								list.get(i).get("mon_level").toString() 	+"|"+
								list.get(i).get("mon_type").toString() 		+"|"+
								list.get(i).get("mon_HP").toString() 			+"|"+
								list.get(i).get("mon_ATT").toString() 		+"|"+
								list.get(i).get("mon_DEF").toString() 		+"|"+
								list.get(i).get("mon_rare_degree").toString()+"|"+
								list.get(i).get("mon_BP").toString() 		+"|";

			if (unite_result ==0 ){
			//몬스터 스킬정보 List 개수
				int skcnt =0;
				for(int sk=0;sk<list_sk.size();sk++){
					sk_mon_id		= list_sk.get(sk).get("mon_id").toString();
								
					if (mon_id.equals(sk_mon_id) ) {
						skcnt++;
					}
				}
				result_packet += skcnt +"|";
			//몬스터 스킬정보 List
				for(int sk=0;sk<list_sk.size();sk++){
					sk_mon_id		= list_sk.get(sk).get("mon_id").toString();
					
					if (mon_id.equals(sk_mon_id)) {
						//System.out.println(mon_id + "/" + user_mon_sn + "===" +  sk_mon_id + "/" + sk_user_mon_sn + "========");	
						//skill_cnt|skill_id|skill_nm|skill_cooltime|skill_desc
						result_packet += 	list_sk.get(sk).get("skill_id").toString() 			+"|"+
											list_sk.get(sk).get("skill_nm").toString() 			+"|"+
											list_sk.get(sk).get("skill_cooltime").toString()	+"|"+
											list_sk.get(sk).get("skill_desc").toString() 		+"|";
					}
				}//end sk for
			}//end if (unite_result ==0 ){
			else{
				result_packet  += "0|0|0|0|0|"; //스킬부분 0으로 채움.
			}
		} // end for
	
	
	//System.out.println (result_packet);
	
	/*for(int tot=0;tot<list.size();tot++){
		System.out.println (tot + ":" + list_total.get(tot).get("moster") );
		System.out.println (tot + ":" + list_total.get(tot).get("skill1") );
		
	}*/

}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(pstmt_sk != null) pstmt_sk.close();
	if(rs_sk != null) rs_sk.close();	
}	%>
<%=P_type%>|<%=result_packet%>