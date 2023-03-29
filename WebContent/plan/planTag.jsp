<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css" />
    <link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="../assets/css/animate.css" />
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
              <a href="index.html" class="logo" style="padding-top: 5px">
                <h1 style="color: rgba(0, 151, 60, 1); font-size: x-larger">Trip!Trip!</h1>
              </a>
              <!-- ***** Logo End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">
                <li><a href="index.html">Home</a></li>
                <li><a href="browse.html">Browse</a></li>
                <li><a href="board.html">Board</a></li>
                <li><a href="createArticle.html">Posting</a></li>
                <li id="profile" style="display: none">
                  <a href="profile.html">Profile <img src="../assets/img/profile.jpg" alt="" /></a>
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
            <!-- ***** Featured Games Start ***** -->
            <div class="row-8">
              <div class="col-lg-12 planTag-content">
                <div class="featured-games header-text" style="position: relative">
                  <div
                    id="map"
                    style="width: 100%; height: 616px; position: relative; overflow: hidden"
                  >
                    <form
                      class="row g-3 form-inline"
                      id="plan-form"
                      role="form"
                      method="POST"
                      action="#"
                    >
                      <div class="col-12">
                        <span>제목</span>
                        <input type="text" class="form-control" id="title" />
                      </div>
                      <div class="col-md-6" style="margin-top: 10px">
                        <span>시작일</span>
                        <input type="date" class="form-control" id="start-date" />
                      </div>
                      <div class="col-md-6" style="margin-top: 10px">
                        <span>종료일</span>
                        <input type="date" class="form-control" id="end-date" />
                      </div>
                      <span>메모</span>
                      <div class="col-12" style="margin-top: 10px">
                        <textarea
                          class="form-control"
                          id="page-content"
                          style="height: 540px; font-size: small"
                        ></textarea>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <div class="planTag-content">
                <div class="text-button" id="plan-button" style="margin-top: 20px; float: right">
                  <a href="plan.html">다음</a>
                </div>
              </div>
            </div>
            <!-- ***** Featured Games End ***** -->
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
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/profile.js"></script>
  </body>
</html>
