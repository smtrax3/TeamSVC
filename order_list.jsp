
<%@page import="net.order.db.OrderBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<title>Insert title here</title>

<c:import url="../inc/header.jsp" />

</head>

<body>
	<%
		List orderList = (List) request.getAttribute("orderList");
	%>

	<div class="container">
		<h2>배송상태</h2>
		<p></p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>상품명</th>
					<th>구매자</th>
					<th>판매자</th>
					<th>주문금액</th>
					<th>주문상태</th>
					<th>주문일시</th>
				</tr>
			</thead>
			<tbody>

				<%
					for (int i = 0; i < orderList.size(); i++) {
						OrderBean orderbean = (OrderBean) orderList.get(i);
				%>
				<tr>
					<td><a
						href="./OrderDetail.or?trade_num=<%=orderbean.getO_trade_num()%>">
							<%=orderbean.getO_trade_num()%></a></td>
					<td><%=orderbean.getO_g_name()%></td>
					<td><%=orderbean.getO_receive_name()%></td>
					<td><%=orderbean.getO_trade_payer()%></td>
					<td><%=orderbean.getO_sum_money()%>Point</td>


					<%
						String status = "";
							//  orderbean.getO_status()  0 이면 "대기중"
							//  1이면 발송준비 2 발송완료 3 배송중 4 배송완료 5 주문취소
							if (orderbean.getO_status() == 0) {
								status = "대기중";
							} else if (orderbean.getO_status() == 1) {
								status = "발송준비";
							} else if (orderbean.getO_status() == 2) {
								status = "발송완료";
							} else if (orderbean.getO_status() == 3) {
								status = "배송중";
							} else if (orderbean.getO_status() == 4) {
								status = "배송완료";
							} else if (orderbean.getO_status() == 5) {
								status = "주문취소";
							}
					%>

					<td><%=status%></td>
					<td><%=orderbean.getO_date()%></td>

					<%
						}
					%>

				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>





