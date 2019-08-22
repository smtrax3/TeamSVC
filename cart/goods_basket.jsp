<%@page import="net.admin.goods.db.GoodsBean"%>
<%@page import="net.basket.db.BasketBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// request.setAttribute("basketList", basketList);
// request.setAttribute("goodsList", goodsList);
List basketList=(List)request.getAttribute("basketList");
List goodsList=(List)request.getAttribute("goodsList");
%>
<h1>장바구니</h1>
<table border="1">
<tr><td>번호</td>
<td>사진</td>
<td>제품명</td>
<td>사이즈</td>
<td>색상</td>
<td>수량</td>
<td>가격</td>
<td>취소</td></tr>
<%
	for(int i=0;i<basketList.size();i++){
		
	BasketBean basketbean=(ItemBean)basketList.get(i);
	GoodsBean goodsbean=(GoodsBean)goodsList.get(i);
	
%>
	
<tr><td><%=basketbean.getB_num() %></td>
<td><img src="./upload/<%=goodsbean.getImage().split(",")[0]%>" width="50" height="50"></td>

<td><%=goodsbean.getName() %></td>
<td><%=basketbean.getB_g_size() %></td>
<td><%=basketbean.getB_g_color() %></td>
<td><%=basketbean.getB_g_amount() %></td>
<td><%=goodsbean.getPrice() %></td>

<td><a href="./BasketDelete.ba?b_num=<%=basketbean.getB_num()%>">취소</a></td></tr>	
	<%
}
%>
</table>
<a href="./chash.me">[구매하기]</a>
<a href="./ItemList.do">[계속쇼핑하기]</a>
</body>
</html>





