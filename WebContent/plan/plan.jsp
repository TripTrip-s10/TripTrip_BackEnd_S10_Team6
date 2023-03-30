<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="icon" href="${root}/assets/img/title-icon.png"
	type="image/icon type" />

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
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
							<li><a href="${root}/index.jsp">Home</a></li>
							<li><a href="browse.html">Browse</a></li>
							<li><a href="board.html">Board</a></li>
							<li style="display: none"><a href="profile.html">Profile
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
					<!-- ***** Featured Games Start ***** -->
					<div class="row">
						<div>
							<form class="row g-3 form-inline" id="plan-form" role="form"
								method="POST" action="#">
								<div class="col-md-12">
									<span>제목</span> <input type="text" class="form-control"
										id="title" />
								</div>
								<div class="col-md-6" style="margin-top: 10px">
									<span>시작일</span> <input type="date" class="form-control"
										id="start-date" onchange="getStartDate()" />
								</div>
								<div class="col-md-6" style="margin-top: 10px">
									<span>종료일</span> <input type="date" class="form-control"
										id="end-date" onchange="getEndDate()" />
								</div>
							</form>
						</div>
						<div class="col-lg-8" style="margin-top: 20px">
							<div class="featured-games header-text"
								style="position: relative">
								<div id="map"
									style="width: 100%; height: 616px; position: relative; overflow: hidden"></div>
								<div id="menu-wrap">
									<div class="option" style="text-align: center">
										<div>
											<form onclick="searchPlaces(); return false">
												<input type="text" id="keyword" />
												<button type="submit">검색</button>
											</form>
										</div>
										<hr />
										<ul id="placesList"></ul>
										<div id="pagination"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4" style="margin-top: 20px">
							<div class="planned-place">
								<div class="heading-section">
									<select class="form-select" id="selectDay"
										aria-label="Default select example"></select>
								</div>
								<ul style="overflow: auto; height: 518px">
									<li><img src="${root}/assets/img/game-01.jpg" alt=""
										class="templatemo-item" />
										<h4>Fortnite</h4>
										<h6>Sandbox</h6></li>
								</ul>
								<div class="text-button" id="create-button">
									<a href="profile.html">Finish!</a>
								</div>
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
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9da8d6f85b070cbbce9075ad5616807&libraries=services"></script>

	<script>
	var planDict = { 1: { id: "hello" } };
    var startDate = 0;
    var endDate = 0;
    // 시작일 가져오기
    function getStartDate() {
      startDate = new Date(document.getElementById("start-date").value);
      getDateDiff();
    }
    // 종료일 가져오기
    function getEndDate() {
      endDate = new Date(document.getElementById("end-date").value);
      getDateDiff();
    }
    // 시작일 ~ 종료일 option 만들어주기
    function getDateDiff() {
      var dateDiff = endDate.getTime() - startDate.getTime();
      var dayTotal = dateDiff / (1000 * 60 * 60 * 24);
      var dayList = document.getElementById("selectDay");
      // dayList 초기화
      dayList.innerHTML = "";
      // dayList 설정
      for (let day = 1; day <= dayTotal + 1; day++) {
        var optionEl = document.createElement("option");
        optionEl.text = "Day " + day;
        optionEl.value = day;
        dayList.appendChild(optionEl);
      }
    }

    function addPlan() {
      var selectedDayNum = document.getElementById("selectDay").value;
      // 아직 해당일자의 값이 없다면
      if (!planDict.hasOwnProperty(selectedDayNum)) {
        let item = getPlanItem();
      }
    }
    function getPlanItem() {
      let title = document.querySelector("#markerInfo").querySelector(".title").innerText;
      let addr = document.querySelector("#markerInfo").querySelector("#addr").innerText;
      console.log(title);
      console.log(addr);
    }
    
      // 마커를 담을 배열입니다
      var markers = [];

      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
          level: 3, // 지도의 확대 레벨
        };

      // 지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // // 장소 검색 객체를 생성합니다
      // var ps = new kakao.maps.services.Places();

      // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

      // 키워드로 장소를 검색합니다
      searchPlaces();

      // 키워드 검색을 요청하는 함수입니다
      function searchPlaces() {
        var keyword = document.getElementById("keyword").value;

        if (!keyword.replace(/^\s+|\s+$/g, "")) {
          // alert("키워드를 입력해주세요!");
          return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        // ps.keywordSearch(keyword, placesSearchCB);
      }

      // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
      function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
          // 정상적으로 검색이 완료됐으면
          // 검색 목록과 마커를 표출합니다
          displayPlaces(data);

          // 페이지 번호를 표출합니다
          displayPagination(pagination);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
          // alert("검색 결과가 존재하지 않습니다.");
          return;
        } else if (status === kakao.maps.services.Status.ERROR) {
          // alert("검색 결과 중 오류가 발생했습니다.");
          return;
        }
      }

      // 검색 결과 목록과 마커를 표출하는 함수입니다
      function displayPlaces(places) {
        var listEl = document.getElementById("placesList");
        var menuEl = document.getElementById("menu-wrap");
        var fragment = document.createDocumentFragment();
        var bounds = new kakao.maps.LatLngBounds();
        var listStr = "";

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        for (var i = 0; i < places.length; i++) {
          // 마커를 생성하고 지도에 표시합니다
          var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);
          var marker = addMarker(placePosition, i);
          var itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
          (function (marker, item) {
            itemEl.onclick = function () {
              removeMarker();
              markers = [];
              marker.setMap(map);
              mapCenterChange(marker);
              markerInfoDisplay(marker, item);
              markers.push(marker);
            };
          })(marker, places[i]);

          // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
          // LatLngBounds 객체에 좌표를 추가합니다
          bounds.extend(placePosition);
          fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;
        // map.setBounds(bounds);
        map.setCenter(bounds[0].getPosition());
        map.setLevel(2);
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
      }

      // 검색결과 항목을 Element로 반환하는 함수입니다
      function getListItem(index, places) {
        var el = document.createElement("li");
        var itemStr =
          '<span class="markerbg marker_' +
          (index + 1) +
          '"></span>' +
          '<div class="info">' +
          "   <h5 class='place-name'>" +
          places.place_name +
          "</h5>";

        if (places.road_address_name) {
          itemStr +=
            "    <span>" +
            places.road_address_name +
            "</span>" +
            '   <span class="jibun gray">' +
            places.address_name +
            "</span>";
        } else {
          itemStr += "    <span>" + places.address_name + "</span>";
        }

        itemStr += '  <span class="tel">' + places.phone + "</span>" + "</div>";

        el.innerHTML = itemStr;
        el.className = "item";

        return el;
      }

      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
      function addMarker(position, idx, title) {
        var imageSrc =
          "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png"; // 마커 이미지 url, 스프라이트 이미지를 씁니다
        var imageSize = new kakao.maps.Size(36, 37); // 마커 이미지의 크기
        var imgOptions = {
          spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
          spriteOrigin: new kakao.maps.Point(0, idx * 46 + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
          offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        };

        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
        var marker = new kakao.maps.Marker({
          position: position, // 마커의 위치
          image: markerImage,
          clickable: true,
        });
        return marker;
      }

      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
      function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
        }
        markers = [];
      }

      // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
      function displayPagination(pagination) {
        var paginationEl = document.getElementById("pagination");
        var fragment = document.createDocumentFragment();
        var i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
          paginationEl.removeChild(paginationEl.lastChild);
        }

        for (i = 1; i <= pagination.last; i++) {
          var el = document.createElement("a");
          el.href = "#";
          el.innerHTML = i;

          if (i === pagination.current) {
            el.className = "on";
          } else {
            el.onclick = (function (i) {
              return function () {
                pagination.gotoPage(i);
              };
            })(i);
          }
          fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
      }

      function mapCenterChange(marker) {
        map.setCenter(marker.getPosition());
        map.setLevel(2);
      }
      var overlay = "";
      function markerInfoDisplay(marker, item) {
        if (overlay) {
          closeOverlay();
        }
        var content = `<div class="wrap">
          <div class="info" id ="markerInfo">
              <div class="title">
                ${item.place_name}
              <div class="close" onclick="closeOverlay()" title="닫기"></div>
              </div>
              <div class="body">
              <div class="img">
                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">
              </div>
              <div class="desc">
                <div class="ellipsis" id="addr">${item.road_address_name}</div>
                    <div class="jibun ellipsis">${item.phone}</div>
                    <a class="add-plan" onclick="addPlan()">일정 추가</a>
                  </div>
              </div>
        </div>
      </div>`;

        overlay = new kakao.maps.CustomOverlay({
          content: content,
          map: map,
          position: marker.getPosition(),
        });

        // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
        kakao.maps.event.addListener(marker, "click", function () {
          overlay.setMap(map);
        });
      }

      // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
      function closeOverlay() {
        overlay.setMap(null);
      }

      // 검색결과 목록의 자식 Element를 제거하는 함수입니다
      function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
          el.removeChild(el.lastChild);
        }
      }
    </script>
</body>
</html>
s
