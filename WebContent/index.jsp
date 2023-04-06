<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
    <link rel="icon" href="assets/img/title-icon.png" type="image/icon type" />
    <!-- Bootstrap core CSS -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
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
            <div class="main-banner">
              <div class="row">
                <div class="col-lg-7">
                  <div class="header-text">
                    <!-- <h6></h6> -->
                    <h4><em>Trip!Trip!</em><br />Let's travel the world</h4>
                    <% if(user == null){ %>
                    <div class="index-button">
                      <a href="user/login.jsp" id="signIn">시작하기</a>
                    </div><%} %>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Banner End ***** -->

            <!-- ***** Most Popular Start ***** -->
            <div class="most-popular">
              <div class="row">
                <div class="col-lg-12">
                  <div class="heading-section">
                    <h4><em>요즘 가장 인기있는</em>&nbsp;&nbsp;여행 게시물</h4>
                  </div>
                  <div class="row">
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                        <img src="assets/img/popular-01.jpg" alt="" />
                        <h4>서울나들이 신난당<br /><span>서울</span></h4>
                        </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img src="assets/img/popular-02.jpg" alt="" />
                        <h4>날씨 짱 좋다!!...<br /><span>서울</span></h4>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                        <img src="assets/img/popular-01.jpg" alt="" />
                        <h4>서울나들이 신난당<br /><span>서울</span></h4>
                        </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?areaCode=1">
                        <img src="assets/img/popular-01.jpg" alt="" />
                        <h4>서울나들이 신난당<br /><span>서울</span></h4>
                        </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                          <img src="assets/img/popular-01.jpg" alt="" />
                          <h4>서울나들이 신난당<br /><span>서울</span></h4>
                          </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                          <img src="assets/img/popular-01.jpg" alt="" />
                          <h4>서울나들이 신난당<br /><span>서울</span></h4>
                          </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                          <img src="assets/img/popular-01.jpg" alt="" />
                          <h4>서울나들이 신난당<br /><span>서울</span></h4>
                          </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                          <img src="assets/img/popular-01.jpg" alt="" />
                          <h4>서울나들이 신난당<br /><span>서울</span></h4>
                          </a>
                      </div>
                    </div>
                  </div>
                </div>
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
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!--  <script src="assets/js/main.js"></script> -->    
    <script src="assets/js/profile.js"></script>

  </body>
</html>
