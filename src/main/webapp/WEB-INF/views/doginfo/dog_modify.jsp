<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS 파일 링크 -->
<link rel="stylesheet"
	href="/project/resources/css/doginfo/dog_modify.css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gamja+Flower&display=swap"
	rel="stylesheet">

<!-- 폰트2 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<script>
        function send(f) {
            let dog_age = f.dog_age.value;
            let dog_size = f.dog_size.value;


            if (dog_age === "") {
                alert("강아지 나이를 선택하세요.");
                f.dog_age.focus();
                return false;
            }

            if (dog_size === "") {
                alert("강아지 크기를 선택하세요.");
                f.dog_size.focus();
                return false;
            }

            alert("수정이 완료되었습니다.");
            f.submit();
        }
    </script>



</head>



<body>

	<!-- 헤더  -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<main>
		<h2>반려견 정보 수정</h2>

		<div id="dog_form_containa">

			<form name="f" method="post" action="dog_update.do"
				enctype="multipart/form-data">

				<input type="hidden" name="dog_idx" value="${vo.dog_idx}">

				<div id="dogname_containa">
				<p>반려견 이름</p>
					<input type="text" name="dog_name" value="${vo.dog_name }">
				</div>
				
				<div id="dogage_comtaina">
				<p>반려견 나이</p>
					<select name="dog_age" onchange="send(this)" id="dog_age"
						value="${vo.dog_age }">
						<c:forEach var="i" begin="0" end="40">
							<option value="${i}">${i}세</option>
						</c:forEach>
					</select>
				</div>
				
				<div id="dogsize_containa">
				<p>반려견 크기</p>
					<select name="dog_size" onchange="send(this)">
						<option value="대형">대형</option>
						<option value="중형">중형</option>
						<option value="소형">소형</option>
					</select>
				</div>

				<div id="dogphoto_containa">
				<p>반려견 사진</p>
					<input type="file" name="dog_photo" value="${vo.dog_photo_name }">
				</div>

				<input type="hidden" name="dog_user_idx" value="${user.user_idx}">
				
				<div class="send_btn">
				<input type="button" value="등록" onclick="send(this.form);">
				</div>
			</form>

		</div>


	</main>
</body>

</html>