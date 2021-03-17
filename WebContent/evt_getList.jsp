<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./moe_common.jsp"%>

<%
String P_type ="T041";
String rwd_category = request.getParameter("rwd_category");

int rwd_rcv_flag = 0;int evt_id = 0; 
int open_flag=0;int lunch_open_flag=2; int dinner_open_flag = 2;
String msg = "";String lunch_bs_msg = "";String dinner_bs_msg = ""; String lunch_msg=""; String dinner_msg=""; 

int tot_cnt = 0;


List<Map<String, Object>> list = null;
Map<String, Object> map = null;
ResultSet rs_rwd = null;
PreparedStatement pstmt_rwd = null;

try{
	
	lunch_bs_msg = "점심시간 (12시~13시)시간 ";
	dinner_bs_msg = "퇴근시간 (18시~19시)시간 ";
	
//현재 시간 계산 
    String inTime   = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());
    int nowTime = Integer.valueOf(inTime);
    
    if (nowTime >= 120000 && nowTime <= 130000){
    	lunch_msg = "보상을 받으세요.";
    	lunch_open_flag = 1;
    }else if(nowTime < 120000){
    	lunch_msg = "조금만 기다리세요.";
    }else if(nowTime > 130000){
    	lunch_msg = "내일을 기다리세요.";
    }
    
    if (nowTime >= 180000 && nowTime <= 190000){
    	dinner_msg = "보상을 받으세요.";
    	dinner_open_flag = 1; 
    }else if(nowTime < 180000){
    	dinner_msg = "조금만 기다리세요.";
    }else if(nowTime > 190000){
    	dinner_msg = "내일을 기다리세요.";
    }
   
//식후땡 보상이력 조회
	Conn = DriverManager.getConnection(DB_url, DB_user, DB_pwd);
	sql.append(" CALL abn_getUserReward (1," + user_account +"," + rwd_category + ",null ) \n");
	pstmt = Conn.prepareStatement(sql.toString());
//System.out.println(sql.toString());
			  	
	rs = pstmt.executeQuery();
	list = new ArrayList<Map<String, Object>>();
	while (rs.next()) {
		//total_cnt|rwd_category_value|open_flag|msg|
		evt_id  	 = rs.getInt("rwd_category_value");
		rwd_rcv_flag = rs.getInt("rwd_rcv_flag");
		
		map = new HashMap();
		
		if (evt_id == 1){
			if (rwd_rcv_flag ==1){
				lunch_msg = " 보상을 이미 받았습니다.";
				lunch_open_flag = 2;
			}
			msg = lunch_bs_msg + lunch_msg;
			open_flag = lunch_open_flag;
		}else if (evt_id ==2){
			if (rwd_rcv_flag ==1){
				dinner_msg = " 보상을 이미 받았습니다.";
				dinner_open_flag = 2;
			}
			msg = dinner_bs_msg + dinner_msg;
			open_flag = dinner_open_flag;
		}
		
		map.put("evt_id", evt_id);
		map.put("open_flag"	, open_flag);
		map.put("msg"	, msg);

		list.add(map);	
		tot_cnt ++;
	}

%>
<%@ include file="./moe_header.jsp"%>
	<%=P_type%>|<%=tot_cnt%>| 
	<%for(int i=0;i<list.size();i++){%>
	<%=list.get(i).get("evt_id")%>|<%=list.get(i).get("open_flag")%>|<%=list.get(i).get("msg")%>|
	<%}%> 
<%			
}catch(Exception e){
	System.out.println("SQL 연결 오류 : " + e);
	e.printStackTrace();
}finally{
	if(Conn != null) Conn.close();
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
}	%>
