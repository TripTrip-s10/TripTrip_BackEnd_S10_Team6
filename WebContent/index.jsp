<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="icon" href="../assets/img/title-icon.png" type="image/icon type" />
    <!-- Bootstrap core CSS -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
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
              <a href="index.jsp" class="logo" style="padding-top: 5px">
                <h1 style="color: rgba(0, 151, 60, 1); font-size: x-larger; font-weight: bold">
                  Trip!Trip!
                </h1>
                <!-- <img src="../assets/img/logo.png" alt="" /> -->
              </a>
              <!-- ***** Logo End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="browse.jsp">Browse</a></li>
                <li><a href="board.jsp">Board</a></li>
                <li><a href="createArticle.jsp">Posting</a></li>
                <li id="profile" style="display: none">
                  <a href="profile.jsp"
                    >Profile <img src="../assets/img/profile-header.jpg" alt=""
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
            <div class="main-banner">
              <div class="row">
                <div class="col-lg-7">
                  <div class="header-text">
                    <!-- <h6></h6> -->
                    <h4><em>Trip!Trip!</em><br />Let's travel the world</h4>
                    <div class="index-button">
                      <a data-bs-toggle="modal" data-bs-target="#loginModal" href="#" id="signIn">시작하기</a>
                    </div>
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
                        <img src="../assets/img/popular-01.jpg" alt="" />
                        <h4>서울나들이 신난당<br /><span>서울</span></h4>
                        </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img src="../assets/img/popular-02.jpg" alt="" />
                        <h4>날씨 짱 좋다!!...<br /><span>서울</span></h4>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                        <img src="../assets/img/popular-01.jpg" alt="" />
                        <h4>서울나들이 신난당<br /><span>서울</span></h4>
                        </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?areaCode=1">
                        <img src="../assets/img/popular-01.jpg" alt="" />
                        <h4>서울나들이 신난당<br /><span>서울</span></h4>
                        </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                          <img src="../assets/img/popular-01.jpg" alt="" />
                          <h4>서울나들이 신난당<br /><span>서울</span></h4>
                          </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                          <img src="../assets/img/popular-01.jpg" alt="" />
                          <h4>서울나들이 신난당<br /><span>서울</span></h4>
                          </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                          <img src="../assets/img/popular-01.jpg" alt="" />
                          <h4>서울나들이 신난당<br /><span>서울</span></h4>
                          </a>
                      </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <a href="article.html?articleCode=1">
                          <img src="../assets/img/popular-01.jpg" alt="" />
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
    <!-- SignIn Modal start -->
    <div class="modal modal-md fade" id="loginModal">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">로그인</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <form id="form-login" method="POST" action="">
          <!-- Modal body -->
          <div class="modal-body">
           <input type="hidden" name="action" value="login" />
            <div class="input-group">
              <!-- <span class="input-group-text">Id</span> -->
              <input type="text" class="form-control" placeholder="Id" id="id" name = "id"/>
            </div>
            <div class="input-group mt-2">
              <!-- <span class="input-group-text">passWord</span> -->
              <input type="text" class="form-control" placeholder="passWord" id="password" name = "password"/>
            </div>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="loginBtn">
              로그인
            </button>
            <button type="button" class="btn btn-success" data-bs-dismiss="modal">회원가입</button>
            <!-- <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button> -->
          </div>
		</form>
        </div>

      </div>
    </div>
    <!-- SignIn Modal end -->
    <!-- SignUp Modal start -->
    <div class="modal modal-md fade" id="JoinModal">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">회원가입</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="NickName" id="nickname" name="nickname" />
            </div>
            <div class="input-group mt-2">
              <input type="text" class="form-control" placeholder="Id" id="id" name="id" />
            </div>
            <div class="input-group mt-2">
              <input type="text" class="form-control" placeholder="passWord" id="password" name="password"/>
              
            </div>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal">
              회원가입하기
            </button>
            <!-- <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button> -->
          </div>
        </div>
      </div>
    </div>
    <!-- SignUp Modal end -->
    <!-- Scripts -->
    <!-- Bootstrap core JavaScript -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!--  <script src="assets/js/main.js"></script> -->    
    <script src="assets/js/profile.js"></script>
  </body>
</html>
