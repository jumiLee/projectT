<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T732";
String mis_id = request.getParameter("mis_id");
String mis_sub_id = request.getParameter("mis_sub_id");
String result = request.getParameter("result");

int tot_cnt =0; 
int start_prob_range =0; int end_prob_range =0;
String mis_rwd_type="0"; String mis_rwd_id="0"; String mis_rwd_sub_id="0";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

Map<String, Object> map_pick = null;
List<Map<String, Object>> list_pick = null;
String pick_no="0";

ResultSet rs2 = null;
PreparedStatement pstmt2 = null;
int user_rwd_result = 0;
String sel_no = "0";
int picked_rwd = 0; 
int second_rwd = 0; 
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
//System.out.println ("===============mis_reward.jsp======================");
	//sql.append(" EXEC [dbo].[abn_getMissionList]  2, " +  mis_id + "," + mis_sub_id + " \n");
	sql.append(" Call abn_getMissionList  (2,"+ mis_id + "," + mis_sub_id + ")\n") ;
	
	pstmt = Conn.prepareStatement(sql.toString());
//System.out.println(sql.toString());
			  	
	rs = pstmt.executeQuery();
	
	list = new ArrayList<Map<String, Object>>();
	
// Pick Random number  
	Random random = new Random();
	int randomInteger = random.nextInt(100)+1;
	//System.out.println("randomInteger:" + randomInteger);
		
	while(rs.next()){			
		
		map = new HashMap();
		
		start_prob_range = end_prob_range+1;
		
		map.put("sn", tot_cnt);
		map.put("start_prob_range"	, start_prob_range);
		map.put("mis_rwd_type"		, rs.getInt("mis_rwd_type"));
		map.put("mis_rwd_id"		, rs.getInt("mis_rwd_id"));
		map.put("mis_rwd_sub_id"	, rs.getInt("mis_rwd_sub_id"));
		map.put("mis_rwd_nm"		, rs.getString("mis_rwd_nm"));
		map.put("mis_rwd_desc"		, rs.getString("mis_rwd_desc"));
		map.put("mis_rwd_prob"		, rs.getInt("mis_rwd_prob"));
		map.put("rwd_img_no"		, rs.getInt("rwd_img_no"));
		
		
		end_prob_range += rs.getInt("mis_rwd_prob");
		
		map.put("end_prob_range"	,end_prob_range);
		
		if (randomInteger >= start_prob_range && randomInteger <= end_prob_range) {
			//System.out.println("pick this:" +  rs.getInt("mis_rwd_id"));			
			map.put("pick_no", 1); //selected reward
		}else{
			map.put("pick_no", 0);
		}
		
		tot_cnt++;
		
		list.add(map);
		
	}//end while
		

//보상 정보 세팅 	
	list_pick = new ArrayList<Map<String, Object>>();
	
	for(int i=0;i<list.size();i++){
		
		pick_no = list.get(i).get("pick_no").toString();
		
		Map<String, Object>  map_pick1 = new HashMap();
		
	//선택된 보상 
		if(pick_no.equals("1"))
		{
			mis_rwd_type	=list.get(i).get("mis_rwd_type").toString();  
			mis_rwd_id		=list.get(i).get("mis_rwd_id").toString(); 
			mis_rwd_sub_id	=list.get(i).get("mis_rwd_sub_id").toString(); 
			
			map_pick1.put("pick_no"			, list.get(i).get("pick_no").toString());
			map_pick1.put("mis_rwd_type"	, mis_rwd_type);
			map_pick1.put("mis_rwd_id"		, mis_rwd_id);
			map_pick1.put("mis_rwd_sub_id"	, mis_rwd_sub_id);
			map_pick1.put("mis_rwd_nm"		, list.get(i).get("mis_rwd_nm").toString());
			map_pick1.put("mis_rwd_desc"	, list.get(i).get("mis_rwd_desc").toString());
			map_pick1.put("rwd_img_no"		, list.get(i).get("rwd_img_no").toString());
			
			sel_no = list.get(i).get("sn").toString();
			user_rwd_result ++;
			
			list_pick.add(map_pick1);
			//System.out.println("list_pick 1"  );
			list.remove(i);	//선택된 보상 제거 
			
		//user_mission_reward 에 보상정보 등록
			sql.setLength(0);
			//sql.append(" EXEC [dbo].[abn_MgmtUserMissionReward]  1, " +  user_account + "," + mis_id + "," + mis_sub_id + "," + mis_rwd_type + "," + mis_rwd_id + "," + mis_rwd_sub_id + " \n");
			sql.append(" Call abn_MgmtUserMissionReward  (1,"+ user_account + "," + mis_id + "," + mis_sub_id + "," + mis_rwd_type + "," + mis_rwd_id + "," + mis_rwd_sub_id + " )\n") ;
//System.out.println(sql.toString());
			pstmt2 = Conn.prepareStatement(sql.toString());	
			rs2 = pstmt2.executeQuery();
			if(rs2.next()){		
				//user_rwd_result = rs2.getInt("result");
			}
			
			if (user_rwd_result != 0 ) { %>
			
<%			}
		}
	}	
	
	
//두번째 보상
	randomInteger = random.nextInt(list.size());	//나머지 보상 Random pick
	Map<String, Object> map_pick2 = new HashMap();
	map_pick2.put("pick_no"			, list.get(randomInteger).get("pick_no").toString());
	map_pick2.put("mis_rwd_type"	, list.get(randomInteger).get("mis_rwd_type").toString());
	map_pick2.put("mis_rwd_id"		, list.get(randomInteger).get("mis_rwd_id").toString());
	map_pick2.put("mis_rwd_sub_id"	, list.get(randomInteger).get("mis_rwd_sub_id").toString());
	map_pick2.put("mis_rwd_nm"		, list.get(randomInteger).get("mis_rwd_nm").toString());
	map_pick2.put("mis_rwd_desc"	, list.get(randomInteger).get("mis_rwd_desc").toString());
	map_pick2.put("rwd_img_no"		, list.get(randomInteger).get("rwd_img_no").toString());
					
	list_pick.add(map_pick2);
	//System.out.println("list_pick 2"  );
	list.remove(randomInteger);	//선택된 보상 제거 
	user_rwd_result ++;
	
//세 번째 보상
	randomInteger = random.nextInt(list.size());	//나머지 보상 Random pick
	
	Map<String, Object> map_pick3 = new HashMap();
	
	map_pick3.put("pick_no"			, list.get(randomInteger).get("pick_no").toString());
	map_pick3.put("mis_rwd_type"	, list.get(randomInteger).get("mis_rwd_type").toString());
	map_pick3.put("mis_rwd_id"		, list.get(randomInteger).get("mis_rwd_id").toString());
	map_pick3.put("mis_rwd_sub_id"	, list.get(randomInteger).get("mis_rwd_sub_id").toString());
	map_pick3.put("mis_rwd_nm"		, list.get(randomInteger).get("mis_rwd_nm").toString());
	map_pick3.put("mis_rwd_desc"	, list.get(randomInteger).get("mis_rwd_desc").toString());
	map_pick3.put("rwd_img_no"		, list.get(randomInteger).get("rwd_img_no").toString());
	
	list_pick.add(map_pick3);
	//System.out.println("list_pick 3"  );
	list.remove(randomInteger);	//선택된 보상 제거 
	user_rwd_result ++;
	
	//System.out.println("size" + list_pick.size());
	/*
	for(int i=0;i<list_pick.size();i++){
		System.out.println ("==========================================");
		
		System.out.println ("mis_rwd_type:"+list_pick.get(i).get("mis_rwd_type").toString());
		System.out.println ("mis_rwd_id:"+list_pick.get(i).get("mis_rwd_id").toString());
		System.out.println ("mis_rwd_nm:"+list_pick.get(i).get("mis_rwd_nm").toString());
		System.out.println ("==========================================");
	}
	*/
%>
<%@ include file="./moe_header.jsp"%>
	<%=P_type%>|<%=list_pick.size()%>|<%for(int i=0;i<list_pick.size();i++){%>
	<%=list_pick.get(i).get("pick_no")%>|<%=list_pick.get(i).get("mis_rwd_type")%>|<%=list_pick.get(i).get("mis_rwd_id")%>|<%=list_pick.get(i).get("mis_rwd_sub_id")%>|<%=list_pick.get(i).get("mis_rwd_nm")%>|<%=list_pick.get(i).get("mis_rwd_desc")%>|<%=list_pick.get(i).get("rwd_img_no")%>|
	<%}%> 
<%			
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(pstmt2 != null) pstmt2.close();
	if(rs != null) rs.close();
	if(rs2 != null) rs2.close();
}	%>
