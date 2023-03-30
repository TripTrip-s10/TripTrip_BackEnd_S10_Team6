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
    <!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->
  </head>

  <body>
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <nav class="main-nav">
              <!-- ***** Logo Start ***** -->
              <a href="${root}/index.jsp" class="logo" style="padding-top: 5px">
                <h1 style="color: rgba(0, 151, 60, 1); font-size: x-larger; font-weight: bold">
                  Trip!Trip!
                </h1>
                <!-- <img src="../assets/img/logo.png" alt="" /> -->
              </a>
              <!-- ***** Logo End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="browse.jsp">Browse</a></li>
                <li><a href="board.jsp">Board</a></li>
                <li><a href="crateArticle.jsp">Posting</a></li>
                <li id="profile" style="display: none">
                  <a href="profile.jsp"
                    >Profile <img src="${root}/assets/img/profile.jpg" alt=""
                  /></a>
                </li>
              </ul>
              <a class="menu-trigger">
                <span>Menu</span>
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
            <div class="sub-banner">
              <div class="row">
                <div class="col-lg-7">
                  <div class="header-text">
                    <!-- <h6></h6> -->
                    <h4><em></em><br />회원탈퇴</h4>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Banner End ***** -->

            <!-- ***** Most Popular Start ***** -->
            <div class="most-popular">
              <div class="row">
          <form id="auth-form" method="POST" action="">
            <input type="hidden" name="action" value="withdraw" />
                <div class="col-12 login-box">
                    <input type="text" id="userid" name="userid" class="form-control" placeholder="아이디" />
                  </div>
                  <div class="col-12 login-box">
                    <input type="text" id="userpwd" name="userpwd" class="form-control" placeholder="비밀번호" />
                  </div>
                  	<div style="float:right">                    
                  	<span class="withdraw-button" id="withdraw-button">
                        <a id="withdraw">탈퇴하기</a>
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
      document.querySelector("#withdraw-button").addEventListener("click", function () {
        if (!document.querySelector("#userid").value || !document.querySelector("#userpwd").value) {
          alert("모두 기입하시오.");
          return;
        } else {
          let form = document.querySelector("#auth-form");
          form.setAttribute("action", "${root}/user");
          form.submit();
        }
      });
    </script>
    <script>
    var uid = '<%=session.getAttribute("userinfo")%>';
    
    </script>
  </body>
</html>
