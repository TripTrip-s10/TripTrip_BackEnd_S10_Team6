<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.triptrip.user.dto.User" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- 메인 페이지 -->
<%
	User user = (User)session.getAttribute("userinfo");
	
%>
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
    <link rel="icon" href="../assets/img/title-icon.png" type="image/icon type" />

    <!-- Bootstrap core CSS -->
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

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
                <h1 style="color: rgba(0, 151, 60, 1); font-size: x-larger">Trip!Trip!</h1>
              </a>
              <!-- ***** Logo End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">
                <li><a href="${root}/index.jsp" class="active">Home</a></li>
                <li><a href="browse.jsp">Browse</a></li>
                <li><a href="board.jsp">Board</a></li>
                <li><a href="createArticle.jsp">Posting</a></li>
                <li id="profile" style="">
                  <a href="${root}/user/profile.jsp"
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
            <div class="row">
              <div class="col-lg-12">
                <div class="main-profile">
                  <div class="row">
                    <div class="col-lg-2">
                      <img src="../assets/img/profile.jpg" alt="" style="border-radius: 23px" />
                    </div>
                    <div class="col-lg-3 align-self-center">
                      <div class="main-info header-text">
                        <h4>닉네임: <%=user.getName() %></h4>
                        <p>상태메세지: 일본가고싶다아아아아아아아</p>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="main-border-button">
                        <a data-bs-toggle="modal" data-bs-target="#profileModal" href="#"
                          >회원정보 수정</a
                        >
                      </div>
                    </div>
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
                          <div class="col-lg-3 col-sm-6">
                            <div class="item">
                              <img src="../assets/img/popular-01.jpg" alt="" />
                              <h4>서울나들이 <br /><span>서울</span></h4>
                            </div>
                          </div>
                          <div class="col-lg-3 col-sm-6">
                            <div class="item">
                              <img src="../assets/img/popular-02.jpg" alt="" />
                              <h4>한강으로 떠나보자<br /><span>서울</span></h4>
                            </div>
                          </div>
                          <div class="col-lg-3 col-sm-6">
                            <div class="item">
                              <img src="../assets/img/popular-01.jpg" alt="" />
                              <h4>서울나들이 <br /><span>서울</span></h4>
                            </div>
                          </div>
                          <div class="col-lg-3 col-sm-6">
                            <div class="item">
                              <img src="../assets/img/popular-01.jpg" alt="" />
                              <h4>서울나들이 <br /><span>서울</span></h4>
                            </div>
                          </div>
                          <div class="col-lg-12">
                            <div class="main-button">
                              <a href="#">더보기</a>
                            </div>
                          </div>
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
    <!-- ProfileEdit Modal start -->
    <div class="modal modal-md fade" id="profileModal">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">회원정보수정</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="NickName" id="nickname" />
            </div>
            <div class="input-group mt-2">
              <input type="text" class="form-control" placeholder="Id" id="id" />
            </div>
            <div class="input-group mt-2">
              <input type="text" class="form-control" placeholder="passWord" id="password" />
            </div>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="loginBtn">
              수정완료
            </button>
            <!-- <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button> -->
          </div>
        </div>
      </div>
    </div>
    <!-- ProfileEdit Modal end -->
    <!-- Scripts -->
    <!-- Bootstrap core JavaScript -->
    <script src="${root}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${root}/assets/js/profile.js"></script>
  </body>
</html>
