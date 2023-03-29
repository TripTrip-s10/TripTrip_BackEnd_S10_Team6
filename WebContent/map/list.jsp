<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!-- 추천 지역 페이지 -->
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

<link href="${root}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<!-- Additional CSS Files -->
<link rel="stylesheet" href="${root}/assets/css/fontawesome.css" />
<link rel="stylesheet" href="${root}/assets/css/template.css" />
<link rel="stylesheet" href="${root}/assets/css/animate.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
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
							<li id="profile" style="display: none"><a
								href="profile.html">Profile <img
									src="../assets/img/profile.jpg" alt="" /></a></li>
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
					<div class="row">
						<div class="col-lg-8">
							<div class="featured-games header-text">
								<div class="heading-section">
									<form class="d-flex my-3" id="form-search" action="">
										<input type="hidden" name="action" value="list">
										<select id="searchArea" name = "areaCode" class="form-select me-2">
											<option value="1" <c:if test="${param.areaCode == '1'}">selected="selected"</c:if>>서울</option>
											<option value="2" <c:if test="${param.areaCode == '2'}">selected="selected"</c:if>>인천</option>
											<option value="3" <c:if test="${param.areaCode == '3'}">selected="selected"</c:if>>대전</option>
											<option value="4" <c:if test="${param.areaCode == '4'}">selected="selected"</c:if>>대구</option>
											<option value="5" <c:if test="${param.areaCode == '5'}">selected="selected"</c:if>>광주</option>
										</select>
										<button id="btn-search" class="btn btn-outline-success" type="button">검색</button>
									</form>
								</div>
								<div id="map" style="width: 100%; height: 540px"></div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="recommended-place">
								<div class="row-4">
									<div class="heading-section" style="height: 15px">
										<div class="text-button">
											<a href="${root}/map?action=list" class="active">전체</a>
										</div>
										<div class="text-button">
											<a href="${root}/map?action=list" class="non-active">음식점</a>
										</div>
										<div class="text-button">
											<a href="#" class="non-active" onclick="getLodgingList()">숙소</a>
										</div>
										<div class="text-button">
											<a href="#" class="non-active" onclick="getDestinationList()">관광지</a>
										</div>
										<div class="text-button">
											<a href="#" class="non-active" onclick="getAllList()">문화시설</a>
										</div>
										<div class="text-button">
											<a href="#" class="non-active" onclick="getAllList()">행사</a>
										</div>
										<div class="text-button">
											<a href="#" class="non-active" onclick="getAllList()">여행코스</a>
										</div>
										<div class="text-button">
											<a href="#" class="non-active" onclick="getAllList()">쇼핑</a>
										</div>
									</div>
								</div>
								<div class="row">
									<ul style="overflow: auto; height: 518px" id="area-list">
										<c:forEach var="list" items="${mapList}">
											<li>
												<div class="place" onclick="clickPlace(this)">
													<img src="${list.imageUrl}"alt="" class="templatemo-item" />
													<h4 id="area-title">${list.title}</h4>
													<h6>${list.addr}</h6>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div class="text-button" id="plan-button">
									<a href="planTag.html">일정 만들기</a>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Featured Games End ***** -->
				</div>
			</div>
		</div>
	</div>
	<form id="form-param" method="get" action="">
      <input type="hidden" id="p-action" name="action" value="list">
      <input type="hidden" id="p-areaCode" name="areaCode" value="">
      <input type="hidden" id="p-categoryCode" name="categoryCode" value="">
    </form>
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
	<!-- JS File -->
	<!-- <script src="../assets/js/map.js"></script> -->
	<script src="${root}/assets/js/main.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9da8d6f85b070cbbce9075ad5616807"></script>
	<script>
	  // 시/도 선택 
      document.getElementById("btn-search").addEventListener("click", function(){
        let form = document.querySelector("#form-search");
       	form.setAttribute("action","${root}/map");
       	form.submit();
      });
	
	  // parameter hidden 
	  var tagList = document.querySelectorAll(".text-button");
      tagList.forEach((tag) => tag.addEventListener("click",function(){
		  console.log("clicked!!");
		  document.querySelector("#p-areaCode").value = "${param.areaCode}";
		//  document.querySelector("#p-categoryCode").value = "${param.categoryCode}";
		  document.querySelector("#form-param").submit();
	  }));
      // 인증키
      var serviceKey =
        "JCyOGVbsb1Yqpl0GcIpGaNz0ymTTpdCqWV1IOSvYucmTFnyhHyfiBZzy0C2zR45oWXCw%2FO96GtOOsAPPQYsm8A%3D%3D";

      // 마커 이미지의 이미지 주소입니다
      var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
      // 마커 이미지의 이미지 크기 입니다
      var imageSize = new kakao.maps.Size(24, 35);
      // 마커 이미지를 생성합니다
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

      var mapContainer = document.getElementById("map"); // 지도를 표시할 div
      var mapOption = {
        center: new kakao.maps.LatLng(37, 127), // 지도의 중심좌표
        level: 3, // 지도의 확대 레벨
      };

      // 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);
      var areaCode = location.href.split("?areaCode=")[1];
      getAreaName();
      var contentTypeId = 0;
      var startflag = 0;
      var searchUrl;
      getAllList();

      // 지역명 추출을 위한 json 받아오기
      function getAreaName() {
        url = `https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=${serviceKey}&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json`;
        fetch(url)
          .then((response) => response.json())
          .then((data) => getNameList(data));
      }

      // 지역명 추출
      function getNameList(data) {
        let areaName;
        let areaNames = data.response.body.items.item;
        for (let i = 0; i < areaNames.length; i++) {
          if (areaNames[i].code == areaCode) {
            areaName = areaNames[i].name;
            document.querySelector(
              ".heading-section"
            ).innerHTML = `<h4><em style="color: black">${areaName}</em> 추천지역</h4>`;
            return;
          }
        }
      }

      // searchUrl 변경
      function changeUrl() {
        if (areaCode != 0) {
          searchUrl = `https://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&areaCode=${areaCode}`;
        }
        if (contentTypeId != 0) {
          searchUrl = `https://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&areaCode=${areaCode}&contentTypeId=${contentTypeId}`;
        }
      }

      // 전체 관광지 정보 불러오기
      function getAllList() {
        changeButtonDesign(0);
        contentTypeId = 0;
        changeUrl();
        fetch(searchUrl)
          .then((response) => response.json())
          .then((data) => makeList(data));
      }

      // 맛집 정보 불러오기
      function getFoodList() {
        changeButtonDesign(1);
        contentTypeId = 39;
        changeUrl();
        fetch(searchUrl)
          .then((response) => response.json())
          .then((data) => makeList(data));
      }
      // 숙소 정보 불러오기
      function getLodgingList() {
        changeButtonDesign(2);
        contentTypeId = 32;
        changeUrl();
        fetch(searchUrl)
          .then((response) => response.json())
          .then((data) => makeList(data));
      }
      // 여행지 정보 불러오기
      function getDestinationList() {
        changeButtonDesign(3);
        contentTypeId = 12;
        changeUrl();
        fetch(searchUrl)
          .then((response) => response.json())
          .then((data) => makeList(data));
      }

      // 버튼 클릭 디자인 변경
      function changeButtonDesign(idx) {
        let btnList = document.querySelectorAll(".text-button");
        for (let i = 0; i < 8; i++) {
          if (i == idx) {
            btnList[i].childNodes[0].nextSibling.setAttribute("class", "active");
          } else {
            btnList[i].childNodes[0].nextSibling.setAttribute("class", "non-active");
          }
        }
      }
      // 관광지 리스트 생성하기
      var positions;
      function makeList(data) {
        let trips = data.response.body.items.item;
        let tripList = ``;
        positions = [];
        trips.forEach((area) => {
          tripList += `
            <li>
              <div class="place" onclick="clickPlace(this)">
            `;
          // 이미지 존재 유무 체크
          if (area.firstimage.length == 0) {
            tripList += `<img src="../assets/img/nophoto.png" style="transform:scale(1.4)" alt="" class="templatemo-item" />`;
          } else {
            tripList += `<img src="${area.firstimage}" alt="" class="templatemo-item" />`;
          }
          tripList += `
                <h4 id="area-title">${area.title}</h4>
                <h6>${area.addr1}</h6>
              </div>
            </li>
          `;
          let markerInfo = {
            title: area.title,
            latlng: new kakao.maps.LatLng(area.mapy, area.mapx),
          };
          positions.push(markerInfo);
        });
        document.getElementById("area-list").innerHTML = tripList;
        displayMarker();
        map.setCenter(positions[0].latlng);
      }

      // 마커 생성
      var markers;
      function displayMarker() {
        if (startflag) {
          removeMarker();
        }
        markers = [];
        // 마커를 표시할 위치와 title 객체 배열입니다
        for (var i = 0; i < positions.length; i++) {
          // 마커를 생성합니다
          var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            // image: markerImage, // 마커 이미지
          });
          markers.push(marker);
        }
        startflag = 1;
      }

      // 마커 삭제
      function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
        }
      }

      // 장소 선택시 지도 위치 변경
      function clickPlace(childNodes) {
        let placeTitle = childNodes.querySelector("#area-title").innerHTML;
        for (const marker of positions) {
          if (marker.title == placeTitle) {
            map.setCenter(marker.latlng);
            break;
          }
        }
        map.setLevel(2);
      }
    </script>
	<script src="../assets/js/profile.js"></script>
</body>
</html>
