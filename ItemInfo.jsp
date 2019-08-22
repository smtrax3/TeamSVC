<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

<!-- 쿠키 복호화 -->
<%@ page import="java.net.URLDecoder" %>

<%
// 	request.setCharacterEncoding("UTF-8");

// 	Cookie[] cookies = request.getCookies();
// 	if(cookies != null && cookies.length >0 ){
		
// 		for(int i=0;i<cookies.length;i++){
				
// 			System.out.println(cookies[i].getName() + "=" + URLDecoder.decode(cookies[i].getValue(),"utf-8"));
// 			System.out.println("OK");
			
// 		}
// 	}else{
// 		System.out.println("쿠키가 존재하지 않습니다.");
// 	}

%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



<%-- ********** Header Include ********** --%>
<c:import url="../inc/header.jsp" />

<title>상품 상세보기</title>

<script style="user-select: auto;">
  $(document).ready(function(){
    $('.slider').bxSlider();
  });
</script>


	
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">



	//일반 댓글 ajax?????로 할 필요?
	function submitFunction(){
		alert("댓글 입력클릭");
		
		var itemNum = $('#itemNum').val();
		var reName = $('#reName').val();
		var rePrice = $('#rePrice').val();
		var reContent = $('#reContent').val();
		
		$.ajax({
			
			type: "POST",
			url: "./ItemReWriteAction.do",
			data: {
			
				itemNum: itemNum,
				reName: reName,
				rePrice: rePrice,
				reContent: reContent
			},
			success: function(result){
				
				if(result==1){
					alert("입력 성공")
				}else if(result==0){
					alert("정확한 값을 입력하세요");
				}else{
					alert("DB에러")
				}
			}
		});
		$('#reContent').val('');
		
	}

	//추천 비추천 Ajax 처리
	function reUp(num){
		alert(num);

		$.ajax({
			
			type: "post",
			url: "./ReLikeAction.do",
			data: {
				renum: num
			},
			success: function(result){
				alert("result : "+ result);
				
				setTimeout(function() { // Code here }, delay);
					$('#like'+num).empty();
					$('#like'+num).append(result);
				},1000);
			}
		});
		
	}
	
	function reDown(num){
		alert("DOWN");
		alert(num);		
		
		$.ajax({
			
			type: "post",
			url: "./ReUnLikeAction.do",
			data: {
				renum: num
			},
			success: function(result){
				alert("result : "+ result);
				$('#unlike'+num).empty();
				$('#unlike'+num).append(result);
			}
		});
		
	}
</script>

<!-- jQuery를 bxslider를 이용한 상품 슬라이드 효과 bxslider 라이브러리 import  -->
	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

  <script>
    $(document).ready(function(){
      $('.slider').bxSlider();
    });
  </script>
  
</head>

<body>
	<center>
		<h1 align="center">상품 정보 상세보기</h1>
		
				<table width="1000" border="0">
					<tr align="center">
						<td rowspan="6" width="600">

  					  <div class="slider">
										
						<c:forEach var="img" items="${imgList}">
						<div><img alt="" src="upfile/<c:out value="${img.imgname}" />" width="500" border="0"></div>
							</c:forEach>
					
					</div>
		
						</td>
						<td align="center" width="200">상품명</td>
						<td align="center" width="200">${bean.itemname}</td>
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
		<button onclick="alert('수정');">수정</button>
		<button onclick="location.href='ItemDelete.do?num=${bean.num}';">삭제</button>
		<button onclick="location.href='ItemListAction.do';">목록</button>

		<hr>
		<h2>댓글작성</h2>
			<input type="hidden" id="itemNum" value=${bean.num}>
			
			<input type="text" height="40" id="reName" placeholder="이름" maxlength="20 ">
			<input type="text" height="40" id="rePrice" placeholder="제시금액"><br>
			<textarea rows="5" cols="50" id="reContent" placeholder="메시지를 입력하세요" maxlength="100"></textarea>
			<button onclick="submitFunction();">전송</button>
		<hr>
		<h2>댓글창</h2>
		<table width="1000" border="1">
			<tr>
				<td>번호</td>
				<td>작성자</td>				
				<td>내용</td>
				<td>금액</td>
				<td>기타</td>
			</tr>
		
			
		<c:forEach var="re" items="${rebean}">
			<tr>
				<td><c:out value="${re.re_num}" /></td>
				<td>등급 아이콘 : <c:out value="${re.re_name}" /></td>
				<td>
					<c:if test="${re.re_lev > 0}">
						<img src="tmpimg/level.gif" width="${re.re_lev * 30}" height="15">
						<img src="tmpimg/re.gif">
					</c:if>
					<img src="tmpimg/${re.re_img}" height="70" width="100"><br>
					<c:out value="${re.re_info}" /><br>
					<a href="#" onclick="reDelete('<c:out value="${re.re_num}"/>')">삭제</a>
					<a href="#" onclick="reUpdate('<c:out value="${re.re_num}"/>')">수정</a>
					<a href="#" onclick="reReply('<c:out value="${re.re_num}"/>')">댓글</a>
				</td>
				<td><c:out value="${re.re_price}" /></td>
				<td>
					<button onclick="reUp(${re.re_num})">추천 </button>
					<span id="like${re.re_num}">${re.re_up}	</span><br>
					
					<button onclick="reDown(${re.re_num})">비추천 </button>
					<span id="unlike${re.re_num}">${re.re_down}</span>
				</td>
			</tr>	
		</c:forEach>
		</table>

	</center>
	
	



</body>
</html>