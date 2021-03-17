<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>
<%@ include file="./moe_header.jsp"%>
<%

int unit_cd = 0;
String P_type = "T91";

List<Map<String, Object>> list = null;
Map<String, Object> map = null;
int tot_cnt 	= 0;
int draw_id 	= 0;
int draw_type	= 0;


try{
	
	 
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	sql.append(" Call abn_getDrawList  (1, null )\n") ;
	
	pstmt = Conn.prepareStatement(sql.toString());
	
	//System.out.println (sql.toString());
	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while(rs.next()){
		map = new HashMap();
		
		draw_id = rs.getInt("draw_id");
		if(draw_id == 1 || draw_id == 2 || draw_id==23 || draw_id==24 ) {
			draw_type = 1;
		}else if (draw_id == 3 || draw_id == 5 || draw_id==6 || draw_id==21 || draw_id==22 ) {
			draw_type = 2;
		} else {
			draw_type = 4;
		}
		
		map.put("draw_id"		, draw_id);						//가차 아이디
		map.put("draw_type_cd"	, rs.getInt("draw_type_cd"));	//가차 Type 코드 (현재는 draw_id와 동일)
		map.put("draw_nm"		, rs.getString("draw_nm"));		//가차명
		map.put("draw_price"	, rs.getInt("draw_price"));		//가차가격
		map.put("dis_price"		, rs.getInt("dis_price"));		//할인가격
		map.put("unit_cd"		, rs.getInt("unit_cd"));		//결제단위코드
		map.put("first_flag"	, rs.getInt("first_flag"));		//가차사용 처음 여부
		map.put("draw_type"		, draw_type);					//가차타입 (1: 아이템 뽑기, 2: 몬스터 뽑기, 3: 둘다, 4: 둘다 아님)
		
		list.add(map);
		tot_cnt++;
		
	}
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
<%=P_type%>|<%=tot_cnt%>|
<%for(int i=0;i<list.size();i++){%>
<%=list.get(i).get("draw_id")%>|<%=list.get(i).get("draw_nm")%>|<%=list.get(i).get("draw_price")%>|<%=list.get(i).get("dis_price")%>|<%=list.get(i).get("unit_cd")%>|<%=list.get(i).get("first_flag")%>|<%=list.get(i).get("draw_type")%>|
<%}%>