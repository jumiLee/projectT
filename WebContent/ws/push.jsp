<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.android.gcm.server.*" %>

<%	
	Sender sender= new Sender("AIzaSyBwkGXZ49G7879ssGUvjDOui33YRkFWTZo"); //API Key
	
	Message  msg  = new Message.Builder().addData("key","Good job,younjin!").build();
	
	System.out.println (msg.toString());
	
	//String app_id = "APA91bHv0UZ_ccgxJsdzCbx9G7T85nTUKntkzYGDOg3PVpjfWyaNc38NmzdkktKp4uiCT7C315fpnkfiX4lsLDGpg-RgdbfyvNM7OryMwn8BGdladfnDxldZZyml-ui5aUghAuOXCHQc"; //amulator
	//String app_id = "APA91bFxoTdZmhBY0ZK1G9xfv9ND7MgEdZLirJMilJXMM65Qc_BEoTSirO9cGhpYjmi9eRqf8NlcWcqdB6NxMTQ-jjC7ihvEtvbEyqAVG31gHbI9uo_kXKJL8qpX8FxhDbD6JaZ6XfqG"; //myone					 
	String app_id = "APA91bFq1ubModcSPlBpwbzw04LKvTEQ_W_Ue8PL-SM64bPpCvAhnOQyjVaq6AXGYZbEfEvgk7Fhczhg753-UZowp0-rN3QA1549vmDSYi0ndgSAUxKPOtym4mB8SKyW-mpEf11loCSu1mdnepKb4C7okzdX6AyQlg"; //CYJ
	Result result = sender.send(msg, app_id, 5);
	
	if(result.getMessageId() !=null){
		System.out.println ("success!");
	}else{
		String error = result.getErrorCodeName();   //에러 내용 받기
		System.out.println ("error:" + result);
	}
	
	out.println (result);
%> 