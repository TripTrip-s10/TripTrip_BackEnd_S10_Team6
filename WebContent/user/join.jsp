<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- 메인 페이지 -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />

    <title>Trip!Trip!</title>
    <link rel="icon" href="${root}/assets/img/title-icon.png" type="image/icon type" />
    <!-- Bootstrap core CSS -->
    <link href="${root}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="${root}/assets/css/fontawesome.css" />
    <link rel="stylesheet" href="${root}/assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="${root}/assets/css/animate.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

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
                    <h4><em></em><br />회원가입</h4>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Banner End ***** -->

            <!-- ***** Most Popular Start ***** -->
            <div class="most-popular">
              <div class="row">
                <form id="auth-form" method="post" action="join">
                <input type="hidden" name="action" value="join" />
                  <div class="col-12 join-box">
                    <input type="text" id="username" name="username" class="form-control" placeholder="닉네임" />
                  </div>
 				<div class="col-12 join-box">
                    <input type="text" id="userid" name="userid" class="form-control" placeholder="아이디" />
                  </div>
                  <div class="col-12 join-box">
                    <input type="text" id="userpwd" name="userpwd" class="form-control" placeholder="비밀번호" />
                  </div>
                  <div style="float: right;">                    
	                  <span class="login-button" id="join-button">
	                      <a id="signUp">회원가입</a>
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

    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <p>
              Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights reserved.

              <br />Design:
              <a href="https://templatemo.com" target="_blank" title="free CSS templates"
                >TemplateMo</a
              >
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
      document.querySelector("#join-button").addEventListener("click", function () {
        if (!document.querySelector("#userid").value || !document.querySelector("#userpwd").value || !document.querySelector("#username").value ) {
          alert("모두 입력하여 주세요.");
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
