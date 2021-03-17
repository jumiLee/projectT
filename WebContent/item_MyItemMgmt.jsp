<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="";
String job_type = request.getParameter("job_type");
String item_id  = request.getParameter("item_id");
String item_uniqueID = request.getParameter("item_uniqueID");
String item_cnt = request.getParameter("item_cnt");

if(job_type.equals("1")){	//구매
	P_type = "T541";
}else if(job_type.equals("2")) { //판매
	P_type = "T542";
	item_id = item_uniqueID;
}else if(job_type.equals("3")) { //사용
	P_type = "T543";
	item_id = item_uniqueID;
}else if(job_type.equals("6")) { //버리기
	P_type = "T544";
	item_id = item_uniqueID;
}else if(job_type.equals("9")) { //패키지 아이템 구매 
	P_type = "T546";	
	job_type = "1"; //처리프로시져는 같은나, 결과패킷을 클라이언트에서 다르게 하기 위해 job_type 구분 
}

List<Map<String, Object>> list = null;
Map<String, Object> map = null;

CallableStatement cs = null;
int result_cd = 0; //결과코드
String result_msg = "" ; //결과메세지
String result_packet = "";
try{
	
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	
	cs = Conn.prepareCall("{call abn_MgmtItem_out(?,?,?,?,?,?,?)}");
	cs.setString(1,job_type);
	cs.setString(2,user_account);
	cs.setString(3,item_id);
	cs.setString(4,item_cnt);
	cs.setString(5,null);
	
	cs.registerOutParameter(6, java.sql.Types.INTEGER);	
	cs.registerOutParameter(7, java.sql.Types.VARCHAR);	
	cs.execute();
	
//System.out.println ("item_MyItemMgmt:" + result_cd);
	
	result_cd 	= cs.getInt(6);
	result_msg 	= cs.getString(7);
	
	result_packet +=  result_cd + "|" + result_msg;
	
//패키지 아이템 외의 아이템 구매일 경우엔, 아이템 정보를 결과로 보내줌 	
	if (P_type.equals("T541") ){	
		sql.append(" Call abn_getMstItemList  (6,null,null," + item_id + " )\n") ;
		pstmt = Conn.prepareStatement(sql.toString());
		rs = pstmt.executeQuery();
		list = new ArrayList<Map<String, Object>>();
		
		while(rs.next()){
			map = new HashMap();
			map.put("item_nm"		, rs.getString("item_nm"));
			map.put("item_desc"		, rs.getString("item_desc"));
			map.put("item_img_no"	, rs.getInt("item_img_no"));	
			
			list.add(map);		
		}
		for(int i=0;i<list.size();i++){
			//result|msg|Item_img|item_nm|item_desc|
			result_packet +=  
					list.get(i).get("item_nm").toString() +"|"+	
					list.get(i).get("item_desc").toString() +"|"+
					list.get(i).get("item_img_no").toString() ;
		}
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
<%=P_type %>|<%=result_packet %>|