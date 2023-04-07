<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.triptrip.user.dto.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<% User writer = (User)request.getAttribute("writer"); %>
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
					<!-- ***** Banner Start ***** -->
					<div class="banner">
						<div class="row">
							<!-- <div class="col-lg-7"> -->
							<div class="header-text">
								<!-- <h4><em>여행 게시물</em></h4> -->
							</div>
							<div class="col-lg-12">
								<div class="travle-info">
									<div class="article-title" id="article-title">
										<h4>${article.title}</h4>
									</div>
									<div class="article-info">
										<span id="creator" style="color: gray">by
											${writer.name}</span> <span id="crateDate"
											style="margin-left: 10px; color: gray;">${article.createAt}
										</span>
									</div>

								</div>
							</div>
						</div>
						<!-- ***** Banner End ***** -->
						<div class="most-popular">
							<div class="row">
								<div class="col-lg-12">
									<div class="article-content" style="margin-top: 10px">
										${article.content}</div>
								</div>
								<div class="col-lg-12" style="background-color: #f1f1f1;">
								</div>
							</div>
						</div>
					</div>
<%if(user != null && user.getId() !=  writer.getId()) {%>
					<div style="float: right">
						<span class="login-button" id="mvupdate-button"> <a>수정하기</a>
						</span> <span class="join-button" id="delete-button"> <a>삭제하기</a>
						</span>
					</div>
				</div>
<%} %>
			</div>
		</div>
	</div>

	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="${root}/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="${root}/assets/js/profile.js"></script>
	<script>
	document.querySelector("#mvupdate-button").addEventListener("click", function () {
    	location.href = "${root}/board?action=mvupdate&articleno="+${article.id};
      });
      
      document.querySelector("#delete-button").addEventListener("click", function () {
    	  location.href = "${root}/board?action=delete&articleno="+${article.id};
      });
	</script>
</body>
</html>
