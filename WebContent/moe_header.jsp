<%
StringBuffer sql_h = new StringBuffer();
ResultSet rs_h = null;
PreparedStatement pstmt_h = null;

StringBuffer sql_hd = new StringBuffer();
ResultSet rs_hd = null;
PreparedStatement pstmt_hd = null;

int h_user_level =0; int h_max_exp	 =0; int h_user_exp =0; int h_max_AP =0; int h_cur_AP=0; int h_user_gold=0;
int h_user_coin  =0; int h_user_point=0; int h_user_img =0; int h_cur_wp =0; int h_max_wp=0; int h_user_stat=0;
String h_user_nickname = "0";

List<Map<String, Object>> list_h = null;
Map<String, Object> map_h = null;
int tot_cnt_h ;
tot_cnt_h = 0;
int max_party_h = 3;
String deck_packet = "";
try{ 
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

// 사용자 정보	
	//sql_h.append("EXEC abn_getHeader " +  user_account);	
	sql_h.append("Call abn_getHeader (" +  user_account + ");");
	pstmt_h = Conn.prepareStatement(sql_h.toString());	
	rs_h = pstmt_h.executeQuery();
	
	while(rs_h.next()){
		h_user_level	= rs_h.getInt("user_level");
		h_max_exp		= rs_h.getInt("target_exp");
		h_user_exp		= rs_h.getInt("user_exp");
		h_max_AP		= rs_h.getInt("max_AP");
		h_cur_AP		= rs_h.getInt("cur_AP");
		h_user_gold		= rs_h.getInt("user_gold");
		h_user_coin		= rs_h.getInt("user_coin");
		h_user_point	= rs_h.getInt("user_point");
		h_user_img		= rs_h.getInt("user_img");
		h_cur_wp		= rs_h.getInt("cur_wp");
		h_max_wp		= rs_h.getInt("max_wp");	
		h_user_nickname	= rs_h.getString("user_nickname");
		h_user_stat     = rs_h.getInt("user_stat");
	}	
	
	if (h_user_stat != 1) {	//정상사용자 아니면,	%>
		<jsp:forward page="ma_block.jsp">	
			<jsp:param name="user_account" value="<%=user_account %>"/>
		</jsp:forward>	
<%	}
// 덱몬스터 정보	
	//sql_hd.append(" EXEC [dbo].[abn_getMonList] 4," + user_account + ", null, null  \n");
	sql_hd.append(" Call abn_getMonList (3," + user_account + ", null, null);  \n");
	pstmt_hd = Conn.prepareStatement(sql_hd.toString());	
	rs_hd = pstmt_hd.executeQuery();
	list_h = new ArrayList<Map<String, Object>>();
	
	while(rs_hd.next()){
		map_h = new HashMap();
		
		map_h.put("user_mon_sn"		, rs_hd.getInt("user_mon_sn"));
		map_h.put("mon_id"			, rs_hd.getInt("mon_id"));
		map_h.put("mon_level"		, rs_hd.getInt("mon_level"));
		map_h.put("carry_flag"		, rs_hd.getInt("carry_flag"));
		map_h.put("deck_pos"		, rs_hd.getInt("deck_pos"));
		map_h.put("mon_rare_degree"	, rs_hd.getInt("mon_rare_degree"));
		map_h.put("mon_type"		, rs_hd.getInt("mon_type"));
		map_h.put("str_cnt"			, rs_hd.getInt("str_cnt"));
		
		tot_cnt_h++;
		list_h.add(map_h);
	}
	
//Deck Pos에 따른 파티원 배치
    String Deck[] =new String[max_party_h];
    for(int des = 0;des<Deck.length;des++)
    {
    	Deck[des]="-1|-1|-1|-1|-1|-1|-1|";	//header 추가시 변경
    } 
	int deck_post=0 ; 
	for(int i=0;i<list_h.size();i++){
		deck_post = (Integer) list_h.get(i).get("deck_pos");
		/* |total_cnt|user_mon_sn|mon_id|mon_level|carry_flag|mon_rare_degree|mon_type| */
		Deck[(deck_post-1)] =  list_h.get(i).get("user_mon_sn") +"|"+ list_h.get(i).get("mon_id") +"|"+ list_h.get(i).get("mon_level") +"|"+ list_h.get(i).get("carry_flag") +"|"+ list_h.get(i).get("mon_rare_degree") +"|"+ list_h.get(i).get("mon_type") +"|"+ list_h.get(i).get("str_cnt") +"|" ; 
	}
	for(int des = 0;des<Deck.length;des++)
    {
		deck_packet+=Deck[des] ;
    }
	
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt_h != null) pstmt_h.close();
	if(rs_h != null) rs_h.close();
	if(pstmt_hd != null) pstmt_hd.close();
	if(rs_hd != null) rs_hd.close();
}
%>
<%=h_user_level%>|<%=h_max_exp%>|<%=h_user_exp%>|<%=h_max_AP%>|<%=h_cur_AP%>|<%=h_user_gold%>|<%=h_user_coin%>|<%=h_user_point%>|<%=h_user_img%>|<%=h_user_nickname%>|<%=h_cur_wp%>|<%=h_max_wp%>|<%=user_account%>|<%=max_party_h%>|<%=deck_packet %>