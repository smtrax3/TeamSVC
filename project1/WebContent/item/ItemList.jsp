<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
	<!-- 가격 측정 진행중인 상품을  화면에 출력 -->
	<h1>전체 리스트</h1>

	<c:if test="${empty requestScope.v}">
		<c:redirect url="ItemListAction.do" />
	</c:if>

	<!-- 게시글이 있는 경우 -->
	<c:if test="${count > 0 }">

		<!-- 카테고리 분류검색을 위하여 form데이터 요청 처리 -->
		<form action="ItemCategoryAction.do" method="post">
			<table width="1000" border="0" height="100">
				<tr height="70">
					<td colspan="4" align="center">상품분류 : <select
						name="itemcategory">
							<option value="A">의류</option>
							<option value="B">전자기기</option>
							<option value="C">가구</option>
					</select>&nbsp;&nbsp;&nbsp; <input type="submit" value="상품검색">
					</td>
					<td>
						<!-- 전체 검색 --> <input type="button" value="전체 검색"
						onclick="location.href='ItemListAction.do'">
					</td>
					<td>
						<!-- 글쓰기 --> <input type="button" value="글쓰기"
						onclick="location.href='ItemWrite.do'">
					</td>
				</tr>
			</table>
		</form>

		<table width="1000" border="0" height="470">
			<c:set var="j" value="0" />
			<!-- ItemListController에서 넘겨받은 request영역안에있는 백터 사이즈 만큼 반복 -->
			<c:forEach var="v" items="${requestScope.v}">
				<!-- 4열씩 자동차 이미지,내용 뿌려주기 위해 4번 마다 tr을 열어준다 -->
				<c:if test="${j%4 == 0}">
					<tr align="center">
				</c:if>
				<td>
					<!-- 해당 상품의 가격 책정에 참여하기 위해 해당 상품의 글번호를 전달  --> <a
					href="ItemInfoAction.do?itemno=${v.num}"> <img alt=""
						src="tmpimg/${v.itemimg}" border="0" width="220" height="180">
				</a>
					<p /> 상품명1 : ${v.itemname}<br /> <p /> 희망포인트1 : ${v.itemprice}
				</td>
				<!-- j변수값 1씩 증가 -->
				<c:set var="j" value="${j+1}" />
			</c:forEach>
			</tr>
		</table>
	</c:if>


	<!-- 게시글이 없는경우 -->
	<c:if test="${count <= 0 }">
		<p>게시글이 없습니다.</p>
	</c:if>
	
	<div id="page_control">
	
		<c:if test="${count != 0 }">
		
		<c:if test="${empty itemcategory}">
			<c:if test="${startPage > pageBlock}">
				<a href="./ItemListAction.do?pageNum=${startPage-pageBlock}">Prev</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="./ItemListAction.do?pageNum=${i}"> [${i}]</a>	
			</c:forEach>
			
			<c:if test="${endPage < pageCount}">
				<a href="./ItemListAction.do?pageNum=${startPage+pageBlock}">Next</a>
			</c:if>	
		</c:if>
				<c:if test="${!empty itemcategory}">
			<c:if test="${startPage > pageBlock}">
				<a href="./ItemCategoryAction.do?pageNum=${startPage-pageBlock}&itemcategory=${itemcategory}">Prev</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="./ItemCategoryAction.do?pageNum=${i}&itemcategory=${itemcategory}"> [${i}]</a>	
			</c:forEach>
			
			<c:if test="${endPage < pageCount}">
				<a href="./ItemCategoryAction.do?pageNum=${startPage+pageBlock}&itemcategory=${itemcategory}">Next</a>
			</c:if>	
		</c:if>
			
		</c:if>
	</div>

</body>
</html>