<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%
String P_type ="T412";
String result_packet = "";
String mon_category = request.getParameter("mon_category");
if (mon_category ==null) {
	mon_category = "0";
}

//몬스터 관련
	int tot_cnt ; 
	tot_cnt = 0;
	Map<String, Object> map = null;
	List<Map<String, Object>> list = null;
	
//skill 관련
	ResultSet rs_sk = null;
	PreparedStatement pstmt_sk = null;
	int tot_sk_cnt; 
	tot_sk_cnt = 0;
	Map<String, Object> map_sk = null;
	List<Map<String, Object>> list_sk = null;
	
//book 관련
	ResultSet rs_book = null;
	PreparedStatement pstmt_book = null;
	int tot_book_cnt; 
	tot_book_cnt = 0;
	Map<String, Object> map_book = null;
	List<Map<String, Object>> list_book = null;
	
try{
	
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

//몬스터 도감 카테고리정보
	//sql.append(" EXEC [dbo].[abn_getMonBookList] 2, " + user_account + ", null  \n");
	sql.append(" Call abn_getMonBookList  (2,"+ user_account + ",null )\n") ;
	//System.out.println ("monster_category:" + sql.toString());
		  
	pstmt_book = Conn.prepareStatement(sql.toString());
	rs_book = pstmt_book.executeQuery();
	list_book = new ArrayList<Map<String, Object>>();
	
//몬스터 정보
	sql.setLength(0);
	//sql.append(" EXEC [dbo].[abn_getMonBookList] 1, " + user_account + "," + mon_category + " \n");
	sql.append(" Call abn_getMonBookList  (1,"+ user_account + "," + mon_category + " )\n") ;
	//System.out.println ("monster:" + sql.toString());
	  
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	
//몬스터 스킬 정보	
/*
	sql.setLength(0);
	sql.append(" EXEC [dbo].[abn_getMonSkill] 2, null,null,null \n");
	System.out.println ("monster:" + sql.toString());
	pstmt_sk = Conn.prepareStatement(sql.toString());
	rs_sk 	 = pstmt_sk.executeQuery();
	list_sk = new ArrayList<Map<String, Object>>();
*/
	 
//도감 상태 확인으로 업데이트
	CallableStatement cs = null;
	/*
	sql.setLength(0);
	sql.append(" Exec [abn_MgmtBook]  	\n"); 
	sql.append(" 2,  					\n");
	sql.append(" "+ user_account 	+",	\n");
	sql.append(" 0,					  	\n");
	sql.append(" ? 						\n");	//result_cd
	
	//System.out.println("====");	
	cs = Conn.prepareCall(sql.toString());	
	//System.out.println(sql.toString());	
	cs.registerOutParameter(1, java.sql.Types.INTEGER);
	cs.execute();
	*/
	
	cs = Conn.prepareCall("{call abn_MgmtBook(?,?,?,?)}");
	cs.setInt(1,2);
	cs.setString(2,user_account);
	cs.setInt(3,0);
	cs.registerOutParameter(4, java.sql.Types.INTEGER);	 
	cs.execute();
	
	//Save monster book info Map 
	while(rs_book.next()){
		map_book = new HashMap();
		//mon_category|mon_category_nm|cat_cur_cnt|rwd_rcv_flag|cat_total_cnt
		map_book.put("mon_category"		, rs_book.getInt("mon_category"));
		map_book.put("mon_category_nm"	, rs_book.getString("mon_category_nm"));
		map_book.put("cur_cat_mon_cnt"	, rs_book.getInt("cur_cat_mon_cnt"));
		map_book.put("rwd_rcv_flag"		, rs_book.getInt("rwd_rcv_flag"));
		map_book.put("total_cat_mon_cnt", rs_book.getInt("total_cat_mon_cnt"));
			
		list_book.add(map_book);
		tot_book_cnt++;
	}

		
//Save monster info Map 
	int get_mon_cnt = 0;

	while(rs.next()){
		map = new HashMap();
		//total_cnt|mon_category|mon_category_nm|mon_id|mon_lv|mon_max_lv|mon_type|mon_nm|mon_HP|mon_ATT|mon_DEF|mon_rare_degree|mon_BP|mon_get_cnt|check_flag
		map.put("mon_category"		, rs.getInt("mon_category"));
		map.put("mon_id"			, rs.getInt("mon_id"));
		map.put("mon_lv"			, rs.getInt("mon_lv"));
		map.put("mon_max_lv"		, rs.getInt("mon_max_lv"));
		map.put("mon_type"			, rs.getInt("mon_type"));
		map.put("mon_nm"			, rs.getString("mon_nm"));
		map.put("mon_HP"			, rs.getInt("mon_HP"));
		map.put("mon_ATT"			, rs.getInt("mon_ATT"));
		map.put("mon_DEF"			, rs.getInt("mon_DEF"));
		map.put("mon_rare_degree"	, rs.getInt("mon_rare_degree"));
		map.put("mon_BP"			, rs.getInt("mon_BP"));
		
		get_mon_cnt = rs.getInt("mon_cnt"); //현재몬스터보유수
		
		if(get_mon_cnt == 0) {
			map.put("mon_cnt"		, 0);
			map.put("check_flag"	, 0);
		}else{
			map.put("mon_cnt"		, rs.getInt("mon_cnt"));
			map.put("check_flag"	, rs.getInt("check_flag"));
		}
		map.put("mon_max_lv_flag"	, rs.getInt("mon_max_lv_flag"));
		
		list.add(map);
		tot_cnt++;
	}

//Save monster skill info Map 	
/*
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
*/
//각 list 데이터를 가지고 패킷 규격에 따라 만들기. 
	
	//몬스터 정보 List 개수
	/*
	int moncnt =0;  
	for(int i=0;i<list.size();i++){
			moncnt++;
	}
	result_packet += moncnt +"|";
	*/
	result_packet += tot_book_cnt +"|";
//몬스터 도감 카테고리 정보 List  
	String b_mon_category = "";
	for(int b=0;b<list_book.size();b++){
		
		b_mon_category = list_book.get(b).get("mon_category").toString();
				
		//mon_category|mon_category_nm|cat_cur_cnt|rwd_rcv_flag|cat_total_cnt
		result_packet+= b_mon_category +"|"+
						list_book.get(b).get("mon_category_nm").toString() 		+"|"+			
						list_book.get(b).get("cur_cat_mon_cnt").toString() 		+"|"+
						list_book.get(b).get("rwd_rcv_flag").toString() 		+"|"+
						list_book.get(b).get("total_cat_mon_cnt").toString() 	+"|";
	//몬스터 정보 List
		String mon_id = "";
		String a_mon_categpory = "";
		for(int i=0;i<list.size();i++){
			
			mon_id 			= list.get(i).get("mon_id").toString();
			a_mon_categpory = list.get(i).get("mon_category").toString();
			
			
			if(b_mon_category.equals(a_mon_categpory))
			{
			//total_cnt|mon_id|mon_lv|mon_max_lv|mon_type|mon_nm|mon_HP|mon_ATT|mon_DEF|mon_rare_degree|mon_BP|mon_get_cnt|mon_max_lv_flag|check_flag
			result_packet +=  	mon_id +"|"+
								//list.get(i).get("mon_category").toString() 	+"|"+
								//list.get(i).get("mon_lv").toString() 			+"|"+
								//list.get(i).get("mon_max_lv").toString() 		+"|"+
								//list.get(i).get("mon_type").toString() 		+"|"+
								//list.get(i).get("mon_nm").toString() 			+"|"+
								//list.get(i).get("mon_HP").toString() 			+"|"+
								//list.get(i).get("mon_ATT").toString() 		+"|"+
								//list.get(i).get("mon_DEF").toString() 		+"|"+
								//list.get(i).get("mon_rare_degree").toString() +"|"+
								//list.get(i).get("mon_BP").toString() 			+"|"+
								list.get(i).get("mon_cnt").toString() 			+"|"+
								list.get(i).get("mon_max_lv_flag").toString() 	+"|"+
								list.get(i).get("check_flag").toString() 		+"|";
			
					
		//몬스터 스킬정보 List 개수
		/*
			int skcnt =0;
			String sk_mon_id ;
			for(int sk=0;sk<list_sk.size();sk++){
				sk_mon_id		= list_sk.get(sk).get("mon_id").toString();
						
				
				if (mon_id.equals(sk_mon_id)  ) {
					skcnt++;
				}
			}
			result_packet += skcnt +"|";
			*/
		//몬스터 스킬정보 List
			/*
			for(int sk=0;sk<list_sk.size();sk++){
				sk_mon_id		= list_sk.get(sk).get("mon_id").toString();
				
				if (mon_id.equals(sk_mon_id)) {
					//skill_cnt|skill_id|skill_nm|skill_cooltime|skill_desc|
					result_packet += 	list_sk.get(sk).get("skill_id").toString() 			+"|"+
										list_sk.get(sk).get("skill_nm").toString() 			+"|"+
										list_sk.get(sk).get("skill_cooltime").toString()	+"|"+
										list_sk.get(sk).get("skill_desc").toString() 		+"|";
				}
			}//end sk for
			*/
		}
		}//end mon for
	}//end mon_book for
	
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