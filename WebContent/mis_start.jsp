<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T731";
String mis_id = request.getParameter("mis_id");
String mis_sub_id = request.getParameter("mis_sub_id");
String add_mis_gold = request.getParameter("add_mis_gold");
//도움준 친구 처리 관련 
String frd_account = request.getParameter("frd_account");	//도움준 친구 계정
CallableStatement cs = null;
int result_cd = 0;

int tot_cnt ;
int mis_result ;
int mis_type;
int complete_rate = 0;

int boss_mon_id =0 ;
String boss_mon_nm = "";
int mon_max_HP=0 ;
int mon_cur_HP =0 ;
int mon_ATT=0 	;
int mon_DEF =0 ;
int need_AP = 0;

int mis_mon_id= 0; 	int mis_mon_sn = 0;
int v_mon_id = 0; int v_mon_sn = 0;

tot_cnt = 0;
mis_result = 0;
mis_type = 0;

StringBuffer sql2 = new StringBuffer();
ResultSet rs2 = null;
PreparedStatement pstmt2 = null;

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
//System.out.println ("===============mis_start.jsp======================");	
	sql.append(" Call abn_MissionStart  ("+ user_account + "," + mis_id + "," + mis_sub_id + "," + add_mis_gold + ")\n") ;
  	pstmt = Conn.prepareStatement(sql.toString());
  	
  	//System.out.println(sql.toString());
  	
	rs = pstmt.executeQuery();
	
	while(rs.next()){		
		
		mis_result = rs.getInt("result");
		mis_type   = rs.getInt("mis_type");
		 
		if (mis_type == 2) {
			boss_mon_id = rs.getInt("boss_mon_id");
			boss_mon_nm = rs.getString("boss_mon_nm");
			mon_max_HP	= rs.getInt("mon_max_HP");
			mon_cur_HP	= rs.getInt("mon_cur_HP");
			mon_ATT		= rs.getInt("mon_ATT");
			mon_DEF		= rs.getInt("mon_DEF");
			need_AP		= rs.getInt("need_AP");			
		}
		
		//System.out.println ("mis_result:" + mis_result);
		//System.out.println ("mis_type:" + mis_type);
	}	
		if (mis_type == 2) {
			//System.out.println("BOSS APPEAR!!!");	
%>
			<%@ include file="./moe_header.jsp"%>
			T79|<%=boss_mon_id%>|<%=boss_mon_nm%>|<%=mon_max_HP%>|<%=mon_cur_HP%>|<%=mon_ATT%>|<%=mon_DEF%>|<%=need_AP%>|
						
<%		} else if (mis_type == 0 || mis_type == 1) {	%>
			<%
			
			if (mis_result == 0) { //미션시작이 성공이면, 몬스터 리스트조회
				
				//sql2.append(" EXEC [dbo].[abn_getMissionList]  1, " + mis_id + "," + mis_sub_id + " \n");
				sql2.append(" Call abn_getMissionList  (1, "+ mis_id + "," + mis_sub_id + ")\n") ;
				//System.out.println("몬스터리스트 가져옴 : :" + sql2.toString());
				
				pstmt2 = Conn.prepareStatement(sql2.toString());
				rs2 = pstmt2.executeQuery();
				
				list 	= new ArrayList<Map<String, Object>>();
				
				while(rs2.next()){			
					
					map = new HashMap();
						
						//if (mis_mon_id != (Integer)rs2.getInt("mis_mon_id") && mis_mon_sn != (Integer)rs2.getInt("mis_mon_sn")) {
						if (mis_mon_sn != (Integer)rs2.getInt("mis_mon_sn")) {
							tot_cnt++;	
						}
						map.put("mis_mon_stage"				, rs2.getInt("mis_mon_stage"));
						map.put("mis_mon_id"				, rs2.getInt("mis_mon_id"));
						map.put("mis_mon_lv"				, rs2.getInt("mis_mon_lv"));
						map.put("mis_mon_type"				, rs2.getInt("mis_mon_type"));
						map.put("mis_mon_nm"				, rs2.getString("mis_mon_nm"));
						map.put("mis_mon_rare_degree"		, rs2.getInt("mis_mon_rare_degree"));
						map.put("mis_mon_HP"				, rs2.getInt("mis_mon_HP"));
						map.put("mis_mon_ATT"				, rs2.getInt("mis_mon_ATT"));
						map.put("mis_mon_DEF"				, rs2.getInt("mis_mon_DEF"));
						map.put("mis_mon_STR"				, rs2.getInt("mis_mon_STR"));
						map.put("mis_skill_cnt"				, rs2.getInt("skill_cnt"));
						
						map.put("mis_mon_skill_id" 			, rs2.getInt("mis_mon_skill_id"));
						map.put("mis_mon_skill_nm"			, rs2.getString("mis_mon_skill_nm"));
						map.put("mis_mon_skill_ATT"			, rs2.getInt("mis_mon_skill_ATT"));
						map.put("mis_mon_skill_DEF"			, rs2.getInt("mis_mon_skill_DEF"));
						map.put("mis_mon_skill_cooltime"	, rs2.getInt("mis_mon_skill_cooltime"));
						map.put("mis_mon_skill_luck"		, rs2.getInt("mis_mon_skill_luck"));
						map.put("mis_mon_skill_confusion"	, rs2.getInt("mis_mon_skill_confusion"));
						map.put("mis_mon_sn"				, rs2.getInt("mis_mon_sn"));
						map.put("mis_mon_skill_desc"		, rs2.getString("mis_mon_skill_desc"));
				
						list.add(map);										
						
						mis_mon_id = rs2.getInt("mis_mon_id");
						mis_mon_sn = rs2.getInt("mis_mon_sn");
						
				}//end while
									
				//도움 준 친구가 있고 미션 결과처리에 오류가 없는 경우 	
				if (!frd_account.equals("-1") &&  mis_result == 0) {	
					
					cs = Conn.prepareCall("{call abn_MgmtFriendHelp_out(?,?,?,?,?)}");
					cs.setInt(1,1);
					cs.setString(2,user_account);
					cs.setString(3,frd_account);
					cs.setInt(4,0);
					
					cs.registerOutParameter(5, java.sql.Types.INTEGER);	 //result_cd
					cs.execute();
					
					result_cd = cs.getInt(5);
					//System.out.println ("도움친구처리결과:" +result_cd );
				}

				
			// 튜토리얼 미션 처리
			if (mis_result== 0 && mis_id.equals("0") ) {
				mis_result = 3;
			}
				
%>			<%@ include file="./moe_header.jsp"%>			
			<%=P_type%>|<%=mis_result%>|<%=tot_cnt%>|
				<%for(int i=0;i<list.size();i++){ 						
					if ( (i==0) || ( v_mon_sn != (Integer)list.get(i).get("mis_mon_sn")) ) { %>
						<%=list.get(i).get("mis_mon_stage")%>|<%=list.get(i).get("mis_mon_id")%>|<%=list.get(i).get("mis_mon_lv")%>|<%=list.get(i).get("mis_mon_type")%>|<%=list.get(i).get("mis_mon_nm")%>|<%=list.get(i).get("mis_mon_rare_degree")%>|<%=list.get(i).get("mis_mon_HP")%>|<%=list.get(i).get("mis_mon_ATT")%>|<%=list.get(i).get("mis_mon_DEF")%>|<%=list.get(i).get("mis_mon_STR")%>|<%=list.get(i).get("mis_skill_cnt")%>|<%=list.get(i).get("mis_mon_skill_id")%>|<%=list.get(i).get("mis_mon_skill_nm")%>|<%=list.get(i).get("mis_mon_skill_ATT")%>|<%=list.get(i).get("mis_mon_skill_DEF")%>|<%=list.get(i).get("mis_mon_skill_cooltime")%>|<%=list.get(i).get("mis_mon_skill_luck")%>|<%=list.get(i).get("mis_mon_skill_confusion")%>|<%=list.get(i).get("mis_mon_skill_desc")%>|
					<%}else{%>
						<%=list.get(i).get("mis_mon_skill_id")%>|<%=list.get(i).get("mis_mon_skill_nm")%>|<%=list.get(i).get("mis_mon_skill_ATT")%>|<%=list.get(i).get("mis_mon_skill_DEF")%>|<%=list.get(i).get("mis_mon_skill_cooltime")%>|<%=list.get(i).get("mis_mon_skill_luck")%>|<%=list.get(i).get("mis_mon_skill_confusion")%>|<%=list.get(i).get("mis_mon_skill_desc")%>|
					<%} //end if	
					
					v_mon_id = (Integer)list.get(i).get("mis_mon_id");
					v_mon_sn = (Integer)list.get(i).get("mis_mon_sn");
					
					%>	
<%				} //end for %>
<%			}else{ 	
				//System.out.println ("Mission Start Fail :" + mis_result);
				//System.out.println(sql.toString());
%>	
				<%@ include file="./moe_header.jsp"%>		
				<%=P_type%>|<%=mis_result%>|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|				
<%			} //end if (mis_result == 0)
		} //end if (mis_type == 1)			
  
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
