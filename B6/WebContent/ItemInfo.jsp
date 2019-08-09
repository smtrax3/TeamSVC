<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

<!-- 쿠키 복호화 -->
<%@ page import="java.net.URLDecoder" %>

<%
	request.setCharacterEncoding("UTF-8");

	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length >0 ){
		
		for(int i=0;i<cookies.length;i++){
				
			System.out.println(cookies[i].getName() + "=" + URLDecoder.decode(cookies[i].getValue(),"utf-8"));
			System.out.println("OK");
			
		}
	}else{
		System.out.println("쿠키가 존재하지 않습니다.");
	}

%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<center>
		<h1>상품 정보 상세보기</h1>
		
				<table width="1000" border="0">
					<tr align="center">
						<td rowspan="6" width="600">
							<img alt="" src="img/${bean.itemimg}" width="500" border="0">
						</td>
						<td align="center" width="200">	상품명</td>
						<td align="center" width="200">	${bean.itemname}</td>
					</tr>
					<tr>
						<td align="center" width="200">	희망가격</td>
						<td align="center" width="200">	
							${bean.itemprice }
						</td>
					</tr>
				</table>
		<p>
		<b>상품 설명</b><p>
		${bean.iteminfo }
		<br>
		<button onclick="alert('댓글');">댓글</button>
		<button onclick="alert('수정');">수정</button>
		<button onclick="alert('삭제');">삭제</button>
		<button onclick="alert('목록');">목록</button>

		<hr>
		<h2>댓글창</h2>
		<table width="1000" border="1">
			<tr>
<!-- 				<td>들여쓰기</td> -->
<!-- 				<td>그룹번호</td> -->
<!-- 				<td>순서번호</td> -->
				<td>이미지</td>
				<td>번호</td>
				<td>작성자</td>
				<td>내용</td>
			</tr>
		
			
		<c:forEach var="re" items="${rebean}">
			<tr>
<%-- 				<td><c:out value="${re.re_lev}" /></td> --%>
<%-- 				<td><c:out value="${re.re_ref}" /></td> --%>
<%-- 				<td><c:out value="${re.re_seq}" /></td> --%>
				<td><img src="img/${re.re_img}" height="70" width="100"></td>
				<td><c:out value="${re.re_num}" /></td>
				<td><c:out value="${re.re_name}" /></td>
				<td>
					<c:if test="${re.re_lev > 0}">
						<img src="./images/level.gif" width="${re.re_lev * 30}" height="15">
						<img src="./images/re.gif">
					</c:if>
					<c:out value="${re.re_info}" />
				</td>
			</tr>	
		</c:forEach>
		</table>

	</center>
	
	



</body>
</html>