<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T033";
String job_type = request.getParameter("job_type");
String def_id = request.getParameter("def_id");
int result_cd = 0; //결과코드
 
List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int def_mon_id= 0; 	int def_mon_sn = 0;
int v_mon_id = 0; int v_mon_sn = 0;
int tot_cnt = 0;

CallableStatement cs = null;
try{
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
 
	/*	
	sql.append(" Exec [abn_MgmtDefense]	\n"); 
	sql.append(" "+ job_type +",  		\n");
	sql.append(" "+ user_account +",  	\n");
	sql.append(" "+ def_id +",  		\n");
	sql.append(" null,  	\n");
	sql.append(" ? 						\n");	//result_flag
	
	cs = Conn.prepareCall(sql.toString());
	cs.registerOutParameter(1, java.sql.Types.INTEGER);
	cs.execute();
	result_cd 	= cs.getInt(1);
	*/
	
	cs = Conn.prepareCall("{call abn_MgmtDefense(?,?,?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,def_id);
	cs.setString(4,null);
	
	cs.registerOutParameter(5, java.sql.Types.INTEGER);	 //result_flag
	
	cs.execute();
	
	result_cd = cs.getInt(5);
	

//전투시작인 경우, 몬스터 리스트 조회 	
	sql.setLength(0);
	//sql.append(" EXEC [dbo].[abn_getDefenseMonster]  1, " + def_id + " \n");
	sql.append(" Call abn_getDefenseMonster  (1," + def_id + ")\n") ;
	//System.out.println(sql.toString());
					
	pstmt = Conn.prepareStatement(sql.toString());
	rs = pstmt.executeQuery();
		
	list 	= new ArrayList<Map<String, Object>>();
	while(rs.next()){			
					
		map = new HashMap();
								
		//if (def_mon_id != (Integer)rs.getInt("def_mon_id") && def_mon_sn != (Integer)rs.getInt("def_mon_sn")) {
		if (def_mon_sn != (Integer)rs.getInt("def_mon_sn")) {
			tot_cnt++;
		}
								
		map.put("def_mon_id"				, rs.getInt("def_mon_id"));
		map.put("def_mon_lv"				, rs.getInt("def_mon_lv"));
		map.put("def_mon_nm"				, rs.getString("def_mon_nm"));
		map.put("def_mon_rare_degree"		, rs.getInt("def_mon_rare_degree"));
		map.put("def_mon_HP"				, rs.getInt("def_mon_HP"));
		map.put("def_mon_ATT"				, rs.getInt("def_mon_ATT"));
		map.put("def_mon_DEF"				, rs.getInt("def_mon_DEF"));
		map.put("def_mon_STR"				, rs.getInt("def_mon_STR"));
		map.put("skill_cnt"				, rs.getInt("skill_cnt"));
					
		map.put("def_mon_skill_id" 			, rs.getInt("def_mon_skill_id"));
		map.put("def_mon_skill_nm"			, rs.getString("def_mon_skill_nm"));
		map.put("def_mon_skill_ATT"			, rs.getInt("def_mon_skill_ATT"));
		map.put("def_mon_skill_DEF"			, rs.getInt("def_mon_skill_DEF"));
		map.put("def_mon_skill_cooltime"	, rs.getInt("def_mon_skill_cooltime"));
		map.put("def_mon_skill_luck"		, rs.getInt("def_mon_skill_luck"));
		map.put("def_mon_skill_confusion"	, rs.getInt("def_mon_skill_confusion"));
							
		map.put("def_mon_sn"				, rs.getInt("def_mon_sn"));
						
		list.add(map);										
								
		def_mon_id = rs.getInt("def_mon_id");
		def_mon_sn = rs.getInt("def_mon_sn");
							
	}//end while
%>										
	<%@ include file="./moe_header.jsp"%>			
	<%=P_type%>|<%=result_cd%>|<%=tot_cnt%>|
	<%for(int i=0;i<list.size();i++){ 						
						if ( (i==0) || ( v_mon_sn != (Integer)list.get(i).get("def_mon_sn")) ) { %>
							<%=list.get(i).get("def_mon_id")%>|<%=list.get(i).get("def_mon_lv")%>|<%=list.get(i).get("def_mon_nm")%>|<%=list.get(i).get("def_mon_rare_degree")%>|<%=list.get(i).get("def_mon_HP")%>|<%=list.get(i).get("def_mon_ATT")%>|<%=list.get(i).get("def_mon_DEF")%>|<%=list.get(i).get("def_mon_STR")%>|<%=list.get(i).get("skill_cnt")%>|<%=list.get(i).get("def_mon_skill_id")%>|<%=list.get(i).get("def_mon_skill_nm")%>|<%=list.get(i).get("def_mon_skill_ATT")%>|<%=list.get(i).get("def_mon_skill_DEF")%>|<%=list.get(i).get("def_mon_skill_cooltime")%>|<%=list.get(i).get("def_mon_skill_luck")%>|<%=list.get(i).get("def_mon_skill_confusion")%>|
						<%}else{%>
							<%=list.get(i).get("def_mon_skill_id")%>|<%=list.get(i).get("def_mon_skill_nm")%>|<%=list.get(i).get("def_mon_skill_ATT")%>|<%=list.get(i).get("def_mon_skill_DEF")%>|<%=list.get(i).get("def_mon_skill_cooltime")%>|<%=list.get(i).get("def_mon_skill_luck")%>|<%=list.get(i).get("def_mon_skill_confusion")%>|
						<%} //end if	
						
						v_mon_id = (Integer)list.get(i).get("def_mon_id");
						v_mon_sn = (Integer)list.get(i).get("def_mon_sn");
						
						
					} //end for 
					
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>