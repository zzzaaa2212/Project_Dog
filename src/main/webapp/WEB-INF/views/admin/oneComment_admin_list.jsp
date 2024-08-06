<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			table{
				border-radius: 10px;
				width: 900px;
		
			}
			
			td, th {
				padding: 10px;
				border:1px solid #C4DEFF;
				text-align: center;
				font-family: Nanum Gothic;
				font-weight: bold;
				border-radius: 5px;
				
			}
		</style>
		

	</head>
	
	<body>
	<c:forEach var="vo" items="${list }">
		<table style="text-align: left;">
		<c:if test="${vo.onecomment_delete eq 0 }">
				<input type="hidden" name="onecomment_idx" value="${vo.onecomment_idx }">
				<input type="hidden" name="onecomment_oneinquiry_idx" value="${vo.onecomment_oneinquiry_idx }">
			<tr>
				<td>작성자</td>
				<td>${vo.onecomment_admin_name }</td>
				
				<td><input type="button" value="삭제" onclick="oneCommDel('${vo.onecomment_idx}', '${vo.onecomment_oneinquiry_idx }');"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td colspan="2">${vo.onecomment_regdate }</td>
			</tr>

			<tr>
				<td>답변내용</td>
				<td colspan="2">${vo.onecomment_content }</td>
			</tr>
		</c:if>
		</table>
		<br>
	</c:forEach>
	</body>
</html>