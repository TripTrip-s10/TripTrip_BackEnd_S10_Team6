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
					<div class="sub-banner">
						<div class="row">
							<div class="col-lg-7">
								<div class="header-text">
									<!-- <h6></h6> -->
									<h4>
										<em></em><br />로그인
									</h4>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Banner End ***** -->

					<!-- ***** Most Popular Start ***** -->
					<div class="most-popular">
						<div class="row">
							<form id="auth-form" method="POST" action="">
								<input type="hidden" name="action" value="login" />
								<div class="col-12 login-box">
									<input type="text" id="userid" name="userid"
										class="form-control" placeholder="아이디" />
								</div>
								<div class="col-12 login-box">
									<input type="text" id="userpwd" name="userpwd"
										class="form-control" placeholder="비밀번호" />
								</div>
								<div style="float: right">
									<span class="login-button" id="login-button"> <a
										id="signIn">로그인</a>
									</span> <span class="join-button" id="mvjoin-button"> <a
										href="join.jsp" id="signUp">회원가입</a>
									</span> <span class="join-button" id="find-pw-button"> <a
										href="#" data-bs-toggle="modal" data-bs-target="find-pw-modal"
										id="findPw">비밀번호 찾기</a>
									</span>
								</div>

							</form>
						</div>
					</div>
					<!-- ***** Most Popular End ***** -->
				</div>
			</div>
		</div>
	</div>
	<!-- ProfileEdit Modal start -->
	<div class="modal modal-md fade" id="find-pw-modal">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 찾기</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<form id="find-pw-form" method="POST" action="">
					<input type="hidden" name="action" value="find-pw" />
					<!-- Modal body -->
					<div class="modal-body">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="이메일 주소"
								id="userid" name="userid" />
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal" id="find-pw-btn">메일인증하기</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!-- ProfileEdit Modal end -->

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
      document.querySelector("#mvjoin-button").addEventListener("click", function () {
    	location.href = "${root}/user?action=mvjoin";
      });
      
      document.querySelector("#login-button").addEventListener("click", function () {
        if (!document.querySelector("#userid").value) {
          alert("아이디 입력!!");
          return;
        } else if (!document.querySelector("#userpwd").value) {
          alert("비밀번호 입력!!");
          return;
        } else {
          let form = document.querySelector("#auth-form");
          form.setAttribute("action", "${root}/user");
          form.submit();
        }
      });
    </script>
</body>
</html>
