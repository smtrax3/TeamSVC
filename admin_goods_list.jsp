<%@page import="net.admin.goods.db.GoodsBean"%>
<%@page import="java.util.List"%>
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
List goodsList=(List)request.getAttribute("goodsList");
%>
	
<center>

<img src="http://smtrax3.cdn3.cafe24.com/jpg/price2.jpg"><br>
 
<div class="container">

  <table class="table table-hover">
    <thead>
<tr>
	<th>상품번호</th>
	<th>카테고리</th>
	<th>사진</th>
	<th>상품명</th>
   <th>가격</th>
   <th>수량</th>
   <th>등록일</th>
   <th>&nbsp</th>
</tr>
    </thead>
    
<%
   for(int i=0;i<goodsList.size();i++){
	   GoodsBean gBean=(GoodsBean)goodsList.get(i);
%>
    <tbody>
      <tr>
<td><%=gBean.getNum() %></td>
<td><%=gBean.getCategory() %></td>
<td><img src="./upload/<%=gBean.getImage().split(",")[0] %>" width="50" height="50"></td>
<td><%=gBean.getName() %></td>
<td><%=gBean.getPrice() %> Point </td>
<td><%=gBean.getAmount() %> 개 </td>
<td><%=gBean.getDate() %></td>

<td>
<a href="./GoodsModify.ag?num=<%=gBean.getNum()%>">수정</a> 
    / <a href="./GoodsDelete.ag?num=<%=gBean.getNum()%>">삭제</a></td>
      </tr>
<%
   }
%>
    </tbody>
  </table>
</div>


<h3><a href="./GoodsAdd.ag">상품등록</a></h3>

   
</body>
</html>

