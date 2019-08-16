<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<c:set  var="center" value="${param.center}"></c:set>
		<c:if test="${center==null}">
				<c:set var ="center" value="center.jsp"></c:set>
		</c:if>
		
		 	<center>
			<%-- <jsp:include page=""></jsp:include>  --%>
			
			<tr>
			
			<jsp:include page="${center}"></jsp:include>
			
			</tr>
			
		<%-- 	<tr>
			<jsp:include page=""></jsp:include>
			</tr> --%>
			
			
			
			
			
			</center>
			
			



</body>
</html>