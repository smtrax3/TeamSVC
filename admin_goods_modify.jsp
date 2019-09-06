<%@page import="net.admin.goods.db.GoodsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
<title>Insert title here</title>

<c:import url="../inc/header.jsp" />

</head>
<body>

<%
GoodsBean goodsbean=(GoodsBean)request.getAttribute("goodsbean");
%>

<center>

<h1>상품수정</h1>

<form action="./GoodsModifyAction.ag" method="post">
<input type="hidden" name="num" value="<%=goodsbean.getNum()%>">
<table border="1">
<tr><td>카테고리</td><td>
<select name="category">

<option value="bast" <%if(goodsbean.getCategory().equals("bast")){%>selected<%}%>>BestItem</option>
<option value="itemadd" <%if(goodsbean.getCategory().equals("howmuch")){%>selected<%}%>>howmuch</option>

</select></td></tr>

<tr>
<td>상품이름</td>
<td><input type="text" name="name" value="<%=goodsbean.getName()%>"></td></tr>
<tr>
<td>판매가</td><td><input type="text" name="price" value="<%=goodsbean.getPrice()%>"></td></tr>
<tr>
<td>수량</td><td><input type="text" name="amount" value="<%=goodsbean.getAmount()%>"></td></tr>
<tr>
<td>Best상품</td>
<td><input type="radio" name="best" value="1" <%if(goodsbean.getBest()==1){%>checked<%}%>>예
<input type="radio" name="best" value="0" <%if(goodsbean.getBest()==0){%>checked<%}%>>아니오</td></tr>
<tr>
<td>제품정보</td><td><input type="text" name="content" value="<%=goodsbean.getContent()%>"></td></tr>
<tr>
<td colspan="2"><input type="submit" value="상품수정">
<input type="reset" value="다시등록"></td></tr>
			</table>
		</form>
	</body>
</html>



