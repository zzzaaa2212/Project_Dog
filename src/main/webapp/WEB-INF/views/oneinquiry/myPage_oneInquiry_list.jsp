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
    	<link rel="stylesheet" href="/project/resources/css/oneinquiry/mypage_oneinquiry_list.css">
		
		<style>
			table{border-collapse: collapse;}
		</style>
		
		<jsp:include page="/WEB-INF/views/include/login_session.jsp"/>
    	
		<script src="/project/resources/js/httpRequest.js"></script>
		
	</head>
	
	<body>
	
		<!-- 헤더  -->
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		
		<main>
		
		<form>
		<input type="hidden" name="oneinquiry_user_idx" value="${vo.oneinquiry_idx }">
		
		
		<div> 
		<h2>나의 1:1문의</h2> 
		</div>
		
		
		<div id="oneinquiry_list">
		<table>
			<tr>
 				<th>번호</th>
 				<th>제목</th>
 				<th>카테고리</th>
 				<th>작성일</th>
 				<th>상태</th>
 			</tr>
 			
 			<c:forEach var="vo" items="${list }">
 			<tr>
				<td>${vo.oneinquiry_idx }</td>
				<td><a href="oneInquiryView.do?oneinquiry_idx=${vo.oneinquiry_idx }">${vo.oneinquiry_title }</a></td>
				<td>${vo.oneinquiry_category }</td>
				<td>${vo.oneinquiry_regdate }</td>
				<td>${vo.oneinquiry_status }</td>
			</c:forEach>
		</table>
		</div>
		
		
		<div class="page_menu">${pageMenu }</div>
 		</form>
 		</main>
	</body>
</html>