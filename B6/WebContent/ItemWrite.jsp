<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%--제이쿼리 사용을 위한 최신 링크 설정 --%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script type="text/javascript">
	
		function Check(f) {
			var cnt = f.elements.length;
			var filecnt = 1;
			for (i = 0; i < cnt; i++) {
				if (f.elements[i].type == "file") {
					if (f.elements[i].value == "") {
						var msg = filecnt + "번째 파일정보가 누락되었습니다.\n파일을 선택해주세요.";
						window.alert(msg);
						f.elements[i].focus();
						return;
					}
					filecnt++;
				}
			}
			f.submit();
		}//check()함수 끝
	
	
		function addInput() {
			
			//입력받은 업로드할 파일수 얻기
			var filecnt = document.f.add.value;
			
			if(0 <= filecnt && filecnt < 5){
				//div태그를 선택해서 가져와서 변수에 저장
				var div = document.getElementById("inputDiv");
				
				
				var msg = "";
				
				//입력받은 업로드할 파일수 만큼 반복 하여 <input type="file">태그를 동적으로 생성하여
				//div태그영역에 추가함.
				for(i=0; i<filecnt; i++){
					
					msg += "<input type='file' name='upfile" + i + "' ><br>";
					
				}
	
				//div태그영역 내부에  위의 msg변수값 적용
				div.innerHTML = msg;
			}else{
				alert("0~4 입력");
				document.f.add.value.focus;
			}
			
		}
	
	</script>


<title>Insert title here</title>
</head>
<body>
   
<h1 align="center">글쓰기</h1>

	<!-- 
		<form>요소에 입력된 데이터가 request객체를 통해서 ItemWriteAction.do로 전송 
		※set property 속성 사용하려면 dto 클래스 변수명과 동일하게 name 속성값 설정
	 -->
	<form name="f" method="POST" action="ItemWriteAction.do" enctype="multipart/form-data">

		<table border="1" width="60%">
			<tr height="40">
				<th width="200">글제목</th><td><input type="text" name="subject"> </td>
			</tr>
			<tr height="40">
				<th width="200">비밀번호</th><td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<th>글내용</th><td colspan="2"><textarea name="content" rows="10" cols="100"></textarea></td>	
			</tr>
			<tr>
				<th>파일첨부</th>
				<td>
					추가할 파일수 입력 : <input type="text" name="add" size="2">
					<input type="button" value="파일선택추가" onclick="addInput()"><BR>
					<div id="inputDiv"></div>
				</td>
			</tr>

		</table>
		<div id="table_search">
			<input type="button" value="글쓰기" class="btn" onclick="Check(this.form);">
			<input type="reset" value="다시작성" class="btn">
			<input type="button" value="글목록" class="btn" 
				   onclick="location.href='ItemList.jsp'">
		</div>
	</form>


</body>
</html>