<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- 메인 페이지 -->
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
<link rel="icon" href="../assets/img/title-icon.png"
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
					<div class="row">
						<div class="col-lg-12">
							<div class="main-profile">
								<div class="row">
									<div class="col-lg-2">
										<img src="${root}/assets/img/profile.jpg" alt=""
											style="border-radius: 23px" />
									</div>
									<div class="col-lg-3 align-self-center">
										<div class="main-info header-text">
											<h4>
												닉네임:
												<%=user.getName()%></h4>
											<%
												if (user.getMsg() != null) {
											%><p>
												상태메세지:
												<%=user.getMsg()%></p>
											<%
												}
											%>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 ">
										<form id="auth-form" method="post" action="">
											<div style="text-align: center">
												<span class="main-border-button"><input type="hidden"
													name="action" value="mvwithdraw" /> <a
													id="mvwithdraw-button">회원탈퇴</a> </span> <span
													class="main-border-button"> <a
													data-bs-toggle="modal" data-bs-target="#profileModal"
													href="#">회원정보 수정</a>
												</span> <span class="main-border-button"> <input
													type="hidden" name="action" value="logout" /> <a
													id="logout-button">로그아웃</a>
												</span>
											</div>
										</form>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="clips">
												<div class="row">
													<div class="col-lg-12">
														<div class="heading-section">
															<h4 style="color: black">내 여행계획</h4>
														</div>
													</div>
													<c:forEach var="plan" items="${plans}">
														<div class="col-lg-3 col-sm-6">
<<<<<<< HEAD
															<div class="item">
																<h4 class="plan-title" data-no="${plan.planId}"
																	style="margin: 0px">${plan.title}</h4>
=======
															<div class="item" data-no="${plan.planId}">
																<h4 style="margin: 0px">
																	${plan.title}</h4>
>>>>>>> 7198cf9b4c56d90caa1d795204cb21e653342f98
																<br /> <span>${plan.startDate} <%="-"%>
																	${plan.endDate}
																</span>
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
						<!-- ***** Banner End ***** -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ProfileEdit Modal start -->
	<div class="modal modal-md fade" id="profileModal">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원정보수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<form id="profile-update-form" method="POST" action="">
					<input type="hidden" name="action" value="profile-update" />
					<!-- Modal body -->
					<div class="modal-body">
						<input type="hidden" name="userpk" value=<%=user.getId()%> />
						<div class="input-group">
							<input type="text" class="form-control" placeholder="닉네임"
								id="username" name="username" />
						</div>
						<div class="input-group mt-2">
							<input type="text" class="form-control" placeholder="상태메세지"
								id="usermsg" name="usermsg" />
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal" id="profile-update-button">수정완료
						</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- ProfileEdit Modal end -->
	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="${root}/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="${root}/assets/js/profile.js"></script>
	<script>
		let titles = document.querySelectorAll(".item");
		console.log(titles);
		titles.forEach(function(title) {
			title.addEventListener("click", function() {
				console.log(this.getAttribute("data-no"));
				location.href = "${root}/plan?action=view&planNo="
						+ this.getAttribute("data-no");
			});
		});
		document.querySelector("#logout-button").addEventListener("click",
				function() {
					location.href = "${root}/user?action=logout"
				});
		document.querySelector("#mvwithdraw-button").addEventListener("click",
				function() {
					let form = document.querySelector("#auth-form");
					form.setAttribute("action", "${root}/user");
					form.submit();
				});
		document.querySelector("#profile-update-button").addEventListener(
				"click",
				function() {
					if (!document.querySelector("#username").value
							&& !document.querySelector("#usermsg").value) {
						alert("수정 사항을 입력해주십시오.");
						return;
					} else {
						console.log(document.querySelector("#username").value);
						let form = document
								.querySelector("#profile-update-form");
						form.setAttribute("action", "${root}/user");
						form.submit();
					}
				});
	</script>
</body>
</html>
