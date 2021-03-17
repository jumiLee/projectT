<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T281";
String infi_id = request.getParameter("infi_id");
String bat_gold = request.getParameter("bat_gold");
int result_cd = 0;


int mon_tot_cnt=0;
String mon_id = "", sk_mon_id = "";
String result_packet ="";

CallableStatement cs = null;

//몬스터 관련
List<Map<String, Object>> list = null;
Map<String, Object> map = null;
String mon_sn ;

//몬스터 스킬관련
List<Map<String, Object>> list_sk = null;
Map<String, Object> map_sk = null;
ResultSet rs2 = null;
PreparedStatement pstmt2 = null;
String sk_mon_sn ;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	/*
	sql.append(" Exec [abn_BattleStart] 	\n");
	sql.append(" 2 , 						\n"); //무한대전 
	sql.append(" "+ user_account	+" ,  	\n");
	sql.append(" "+ user_account 	+" ,  	\n");
	sql.append(" "+ bat_gold 		+" ,  	\n");
	sql.append(" '"+infi_id			+ "',	\n"); //무한대전 처리를 위해 사용
	sql.append(" ?	 						\n");
	cs = Conn.prepareCall(sql.toString());
	cs.registerOutParameter(1, java.sql.Types.INTEGER);	 //Update Result
	cs.execute();
	result_cd = cs.getInt(1);
	*/
	cs = Conn.prepareCall("{call abn_BattleStart(?,?,?,?,?,?)}");
	cs.setInt(1,2);					//무한대전 
	cs.setString(2,user_account);
	cs.setString(3,user_account);
	cs.setString(4,bat_gold);
	cs.setString(5,infi_id);		//무한대전 처리를 위해 사용
	cs.registerOutParameter(6, java.sql.Types.INTEGER);	 //Update Result
	cs.execute();
	result_cd = cs.getInt(6);
	
	if (result_cd == 0) { //무한대전 참여 조건 만족하면 (골드, WP 등 체크 )
		
	
	//몬스터 정보 조회
		sql.setLength(0);			
		//sql.append(" EXEC [dbo].[abn_getMonListOther]  1, " + infi_id + " \n");
		sql.append(" Call abn_getMonListOther  (1," + infi_id + ") \n") ;
		//System.out.println(sql.toString());		
		pstmt = Conn.prepareStatement(sql.toString());
		rs = pstmt.executeQuery(); 
				
		list 	= new ArrayList<Map<String, Object>>();
		while(rs.next()){			
					
			map = new HashMap();
			//mon_id|mon_lv|mon_type|mon_nm|mon_rare_degree|mon_HP|mon_ATT|mon_DEF|STR_cnt|						
			map.put("infi_id"			, rs.getInt("infi_id"));
			map.put("mon_id"			, rs.getInt("mon_id"));
			map.put("mon_lv"			, rs.getInt("mon_lv"));
			map.put("mon_sn"			, rs.getString("mon_sn"));
			map.put("mon_type"			, rs.getInt("mon_type"));
			map.put("mon_nm"			, rs.getString("mon_nm"));
			map.put("mon_rare_degree"	, rs.getInt("mon_rare_degree"));
			map.put("mon_HP"			, rs.getInt("mon_HP"));
			map.put("mon_ATT"			, rs.getInt("mon_ATT"));
			map.put("mon_DEF"			, rs.getInt("mon_DEF"));
			map.put("mon_STR"			, rs.getInt("mon_STR"));
			
			list.add(map);	
		}//end while (monster)
	
	//몬스터 스킬 정보 조회
		sql.setLength(0);			
		//sql.append(" EXEC [dbo].[abn_getMonSkill] 3, " + infi_id + ", null, null  \n");
		sql.append(" Call abn_getMonSkill  (3," + infi_id + ",null,null ) \n") ;
		//System.out.println(sql.toString());
		pstmt2 = Conn.prepareStatement(sql.toString());
		rs2 = pstmt2.executeQuery(); 
				
		list_sk 	= new ArrayList<Map<String, Object>>();
		while(rs2.next()){			
					
			map_sk = new HashMap();
			//skill_id|skill_nm|skill_ATT|skill_DEF|skill_cooltime|skill_luck|confusion_luck|					
			map_sk.put("mon_id"			, rs2.getInt("mon_id"));
			map_sk.put("mon_sn"			, rs2.getString("mon_sn"));
			map_sk.put("skill_id"		, rs2.getInt("mon_skill_id"));
			map_sk.put("skill_nm"		, rs2.getString("mon_skill_nm"));
			map_sk.put("skill_ATT"		, rs2.getInt("mon_skill_ATT"));
			map_sk.put("skill_DEF"		, rs2.getInt("mon_skill_DEF"));
			map_sk.put("skill_cooltime"	, rs2.getInt("mon_skill_cooltime"));
			map_sk.put("skill_luck"		, rs2.getInt("mon_skill_luck"));
			map_sk.put("skill_confusion", rs2.getInt("mon_skill_confusion"));
			map_sk.put("skill_desc"		, rs2.getString("mon_skill_desc"));
			
			
			list_sk.add(map_sk);	
		}//end while(skill)
			
	//몬스터 정보 및 스킬정보 List로 패킷규격 만들기
		mon_tot_cnt =list.size(); 
		result_packet += mon_tot_cnt +"|";
		
		for(int i=0;i<list.size();i++){
			
			mon_id 	= list.get(i).get("mon_id").toString();
			mon_sn	= list.get(i).get("mon_sn").toString();		
			
			//mon_id|mon_lv|mon_type|mon_nm|mon_rare_degree|mon_HP|mon_ATT|mon_DEF|mon_STR
			result_packet +=  	
				list.get(i).get("infi_id").toString() +"|" +
				mon_id +"|"+
				list.get(i).get("mon_lv").toString() +"|" +
				list.get(i).get("mon_type").toString() +"|" + 
				list.get(i).get("mon_nm").toString() +"|" + 
				list.get(i).get("mon_rare_degree").toString() +"|" + 
				list.get(i).get("mon_HP").toString() +"|" + 
				list.get(i).get("mon_ATT").toString() +"|" +
				list.get(i).get("mon_DEF").toString() +"|" +
				list.get(i).get("mon_STR").toString() +"|" ;
		
		//몬스터 스킬 세팅 	
			int skcnt =0;
			for(int sk=0;sk<list_sk.size();sk++){
				sk_mon_id	= list_sk.get(sk).get("mon_id").toString();
				sk_mon_sn	= list_sk.get(sk).get("mon_sn").toString();
				
				if (mon_id.equals(sk_mon_id) && mon_sn.equals(sk_mon_sn) ) {
					skcnt++;
				}
			}
			result_packet += skcnt +"|";
			
		//몬스터 스킬정보 List
			for(int sk=0;sk<list_sk.size();sk++){
				sk_mon_id	= list_sk.get(sk).get("mon_id").toString();
				sk_mon_sn	= list_sk.get(sk).get("mon_sn").toString();
				
				if (mon_id.equals(sk_mon_id) && mon_sn.equals(sk_mon_sn) ) {
					//skill_id|skill_nm|skill_ATT|skill_DEF|skill_cooltime|skill_luck|confusion_luck|
					result_packet += 	
						list_sk.get(sk).get("skill_id").toString() 			+"|"+
						list_sk.get(sk).get("skill_nm").toString() 			+"|"+
						list_sk.get(sk).get("skill_ATT").toString() 		+"|"+
						list_sk.get(sk).get("skill_DEF").toString() 		+"|"+
						list_sk.get(sk).get("skill_cooltime").toString()	+"|"+
						list_sk.get(sk).get("skill_luck").toString()		+"|"+
						list_sk.get(sk).get("skill_confusion").toString()	+"|"+
						list_sk.get(sk).get("skill_desc").toString() 		+"|";
				}
			}
		}
	}//end if (result_cd=0)
	
	else{
		//System.out.println ("무한대전 Start Error(" + user_account + "):" + result_cd);
		result_packet +="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|";	
	}

}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(pstmt2 != null) pstmt2.close();
	if(rs2 != null) rs2.close();	
}	%>
<%@ include file="./moe_header.jsp"%>	
<%=P_type%>|<%=result_cd%>|<%=result_packet%>
