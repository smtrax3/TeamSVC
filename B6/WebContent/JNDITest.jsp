<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<H1>jndi 설정 테스트</H1>
<%

Connection conn = null;
	try{
		
		/*JNDI(Java Naming and Directory Interface)*/
		//Tomcat(웹어플리케이션 WAS)서버의 context.xml파일에 설정을 통해..
		//데이터소스(커넥션풀)을 WAS서버에 만들어 놓으면... 커넥션풀 사용을위해..
		//WAS서버 내부의 커넥션풀 에  디렉토리 기반의 접근을 하기위한  기술 
		
		//1.WAS서버와 연결된 DBApp웹프로젝트의 모든 정보를 가지고 있는   컨텍스트객체 생성
		Context init = new InitialContext();
		
		//2.연결된 WAS서버에서  DataSource(커넥션풀) 검색해서 가져오기 
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		//DataSource(커넥션풀)에서  DB연동객체 (커넥션) 가져오기  
		conn = ds.getConnection(); //DB연결
	
		if(conn != null)
			out.println("연결 성공...");
	}
	catch(Exception err){
		err.printStackTrace();
	}
%>
</body>
</html>