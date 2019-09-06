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

	<center>
	
<img src="http://smtrax3.cdn3.cafe24.com/jpg/what.png"><br>

	<form action="./GoodsAddAction.ag" method="post"
		enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>카테고리</td>
				<td><select name="category">
						<option value="best">BestItem</option>
						<option value="howmuch">Howmuch?</option>
				</select></td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>판매가</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="amount"></td>
			</tr>
		
			<tr>
				<td>제품정보</td>
				<td><input type="text" name="content"></td>
			</tr>
			<tr>
				<td>메인제품이미지</td>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td>제품이미지1</td>
				<td><input type="file" name="file2"></td>
			</tr>
			<tr>
				<td>제품이미지2</td>
				<td><input type="file" name="file3"></td>
			</tr>
			<tr>
				<td>제품이미지3</td>
				<td><input type="file" name="file4"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="상품등록"> <input
					type="reset" value="다시등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>