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
					<!-- ***** Banner Start ***** -->
					<div class="banner">
						<div class="row">
							<!-- <div class="col-lg-7"> -->
							<div class="header-text">
								<h4>
									<em>여행 기록</em>
								</h4>
							</div>
							<div class="col-lg-6">
								<!-- 생성버튼? -->
							</div>

						</div>
					</div>
					<!-- ***** Banner End ***** -->
					<div class="most-popular">
						<div class="row">
							<div class="col-lg-12">
								<div class="row">
									<c:forEach var="article" items="${articles}">
										<div class="col-lg-3 col-sm-6">
											<div class="item" id="article">
												<a href="#" class="article-title" data-no="${article.id}">
													<img src="${root}/assets/img/nophoto.png" alt="" />
													<h4>
														${article.title}
												<br />
													</h4>
												</a>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p>
						Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights
						reserved. <br />Design: <a href="https://templatemo.com"
							target="_blank" title="free CSS templates">TemplateMo</a>
						Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
					</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="${root}/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="${root}/assets/js/profile.js"></script>
	<script>
		let title = document.querySelectorAll(".article-title");
		title.forEach(function(title) {
			title.addEventListener("click", function() {
				console.log(this.getAttribute("data-no"));
				location.href = "${root}/board?action=view&articleno="
						+ this.getAttribute("data-no");
			});
		});
	</script>
</body>
</html>
