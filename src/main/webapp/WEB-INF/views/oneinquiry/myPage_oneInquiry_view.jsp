<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- 폰트 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gamja+Flower&display=swap" rel="stylesheet">
		
		<!-- 폰트2 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
		
		<!-- CSS 파일 링크 -->
    	<link rel="stylesheet" href="/project/resources/css/oneinquiry/mypage_oneinquiry_view.css">
		
		
		<jsp:include page="/WEB-INF/views/include/login_session.jsp"/>
    	
		<script src="/project/resources/js/httpRequest.js"></script>
		
		
		<script>
			window.onload = function(){
				commList();
			}
			
			function commList(){
				let url = "commentList.do";
				let param = "oneinquiry_idx=" + ${vo.oneinquiry_idx};
				sendRequest(url, param, commListFn, "post");
			}
			function commListFn(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText; //comment_list.do -> oneComment_list.jsp 갔다가 콜백으로 옴 가지고 온 스트링은 json도 아니라 div에 바로 뿌릴 수 있음
					console.log(data);
					document.getElementById("comment_disp").innerHTML = data;
				}
			}
		</script>
	</head>
	
	<body>
	
		<!-- 헤더  -->
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
	<main>
		<div>
		<h2>1:1문의 상세보기</h2>
		</div>
		
		<div id="oneinquiry_view_main">
		
		<table class="table_main">
			<tr>
				<td>제목</td>
				<td>${vo.oneinquiry_title }</td>
			</tr>
			
			<tr>
				<td>작성일</td>
				<td>${vo.oneinquiry_regdate }</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>${vo.oneinquiry_content }</td>
			</tr>
			
			<tr>
				<td>첨부파일</td>
				<td>
				<c:if test="${vo.oneinquiry_filename ne 'no_file'}">
				<c:choose>
					<c:when test="${vo.oneinquiry_filetype.startsWith('image/')}">
						<div class="photo">
						<img src="${pageContext.request.contextPath}/resources/upload/${vo.oneinquiry_filename}" width="700">
						</div>
					</c:when>
					<c:otherwise> <!-- 그림 이외의 파일 다운로드 링크 띄우기 -->
						<a href="${pageContext.request.contextPath}/resources/upload/${vo.oneinquiry_filename}" download>download: ${vo.oneinquiry_filename }</a>
					</c:otherwise>
				</c:choose>
				</c:if>
				</td>
			</tr>
			
		</table>
		
		<br><br>
		
		<hr>
		<br>
		
		</div>
		<div id="comment_disp"></div>
		
				<div class="list_view_btn">	
				<input type="button" value="목록보기" onclick="location.href='oneInquiryList.do?user_idx=${sessionScope.user.user_idx}'">
				</div>
		
		
		</main>
	</body>
</html>