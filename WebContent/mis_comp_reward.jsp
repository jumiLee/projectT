<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T735";
String mis_id = request.getParameter("mis_id");
int result = 0;
CallableStatement cs = null;

//보상정보관련
int tot_cnt = 0;
int rwd_category = 6;

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

try{
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);

//미션완성도에 대한 보상 조회 
	sql.append(" CALL abn_getCommonRwdList (1," + rwd_category + "," + mis_id + ") \n");
	pstmt = Conn.prepareStatement(sql.toString());
  	
//System.out.println("RwdList:"+ sql.toString());
  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();

	while(rs.next()){		
		map = new HashMap();
		map.put("rwd_type"		, rs.getInt("rwd_type"));
		map.put("rwd_id"		, rs.getInt("rwd_id"));
		map.put("rwd_sub_id"	, rs.getInt("rwd_sub_id"));
		map.put("rwd_nm"		, rs.getString("rwd_nm"));
		map.put("rwd_desc"		, rs.getString("rwd_desc"));
		
		list.add(map); 
		tot_cnt ++;
	}	

//보상처리  	
	if (tot_cnt > 0 ){
		
		cs = Conn.prepareCall("{call abn_MissionCompRwd(?,?,?,?)}");
		cs.setInt(1,1);
		cs.setString(2,user_account);
		cs.setString(3,mis_id);
		cs.registerOutParameter(4, java.sql.Types.INTEGER);	
		cs.execute();
		result 	= cs.getInt(4);
		
//System.out.println("RwdResult:"+ result);
	}else{
		result = -1;
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
<%=P_type%>|<%=result%>|<%=tot_cnt%>|<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("rwd_type")%>|<%=list.get(i).get("rwd_id")%>|<%=list.get(i).get("rwd_sub_id")%>|<%=list.get(i).get("rwd_nm")%>|<%=list.get(i).get("rwd_desc")%>|
<%}%>