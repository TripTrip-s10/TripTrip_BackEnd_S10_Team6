<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />

<title>Trip!Trip!</title>
<link rel="icon" href="${root}/assets/img/title-icon.png"
	type="image/icon type" />
<!-- Bootstrap core CSS -->
<link href="${root}/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Additional CSS Files -->
<link rel="stylesheet" href="${root}/assets/css/fontawesome.css" />
<link rel="stylesheet"
	href="${root}/assets/css/templatemo-cyborg-gaming.css" />
<link rel="stylesheet" href="${root}/assets/css/animate.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

</head>

<body>
	<!-- nav bar start -->
	<%@ include file="/common/nav.jsp"%>
	<!-- nav bar end -->

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<!-- ***** Featured Games Start ***** -->
					<div class="row">
						<div class="title-input" style="margin-bottom: 15px">
							<form class="row g-3 form-inline" role="form" id="article-form"
								method="post" action="">
								<input type="hidden" name="action" value="write" />
								<div class="col-md-6" style="margin-top: 10px">
									<span>시작일</span> <input type="date" class="form-control"
										placeholder="시작일" />
								</div>
								<div class="col-md-6" style="margin-top: 10px">
									<span>종료일</span> <input type="date" class="form-control"
										placeholder="종료일" />
								</div>
								<div class="col-12">
									<input type="text" class="form-control" id="title" name="title"
										placeholder="제목" />
								</div>
								<div class="col-12">
									<textarea class="form-control" id="content" name="content"
										style="height: 540px; font-size: small"></textarea>
								</div>
								<div class="col-12">
									<div class="index-button me-0" id="posting-button">
										<a>저장하기</a>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- ***** Featured Games End ***** -->
				</div>
			</div>
		</div>
	</div>
	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="${root}/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="${root}/assets/js/profile.js"></script>

	<script>
		document.querySelector("#posting-button").addEventListener(
				"click",
				function() {
					if (!document.querySelector("#title").value
							|| !document.querySelector("#content").value) {
						alert("제목 및 내용 모두 입력해 주세요.");
						return;
					} else {
						let form = document.querySelector("#article-form");
						form.setAttribute("action", "${root}/board");
						form.submit();
					}
				});
	</script>
</body>
</html>
