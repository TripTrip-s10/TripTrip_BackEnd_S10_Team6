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
<!--
 
  </head>

  <body>
    <!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
					<!-- ***** Logo Start ***** -->
					<a href="index.html" class="logo" style="padding-top: 5px">
						<h1 style="color: rgba(0, 151, 60, 1); font-size: x-larger">Trip!Trip!</h1>
					</a>
					<!-- ***** Logo End ***** -->
					<!-- ***** Menu Start ***** -->
					<ul class="nav">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="browse.jsp">Browse</a></li>
						<li><a href="board.jsp">Board</a></li>
						<li><a href="crateArticle.jsp">Posting</a></li>
						<li id="profile" style="display: none"><a href="profile.jsp">Profile
								<img src="${root}/assets/img/profile.jpg" alt="" />
						</a></li>
					</ul>
					<a class="menu-trigger"> <span>Menu</span>
					</a>
					<!-- ***** Menu End ***** -->
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- ***** Header Area End ***** -->

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
						<div class="col-lg-6 float-end">
							<div class="form-check" style="float: right;">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault1"> <label
									class="form-check-label" for="flexRadioDefault1"> 인기순 </label>
							</div>
							<div class="form-check me"
								style="float: right; margin-right: 10px;">
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="flexRadioDefault2" checked>
								<label class="form-check-label" for="flexRadioDefault2">
									최신순 </label>
							</div>
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
													"${article.title}"<br />
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
