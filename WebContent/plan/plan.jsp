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
								method="POST" action="">
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
											<input type="text" id="keyword" name="keyword" />
											<button id="btn-search">검색</button>
										</div>
										<hr />
										<ul id="placesList"></ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4" style="margin-top: 20px">
							<div class="planned-place">
								<div class="heading-section">
									<select class="form-select" id="selectDay"
										aria-label="Default select example" onchange="viewDay()"></select>
								</div>
								<ul class="day-list" style="overflow: auto; height: 518px">
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

	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="${root}/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9da8d6f85b070cbbce9075ad5616807&libraries=services"></script>

	<script>
	var planDict = {};
    var startDate = new Date();
    var endDate = new Date();
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
	
    function viewDay(){
    	let dayListEl = document.querySelector(".day-list");
        removeAllChildNods(dayListEl);
    	let selectedDayNum = document.getElementById("selectDay").value;
        var idx = 0;
        if(planDict.hasOwnProperty(selectedDayNum)){
	        for(var i in planDict[selectedDayNum]){
	        	 var el = document.createElement("li");
	       	  	let item = '<div class="row">'+
					'<div class="col-sm-4 col-md-3 col-xl-4">'+
					' <img src=' + (planDict[selectedDayNum][i]["imageUrl"]===''?"${root}/assets/img/nophoto.png": planDict[selectedDayNum][i]["imageUrl"]) + ' alt="" class="templatemo-item" /></div>'+
			'<div class="col-sm-5 col-md-7 col-xl-6">'+
			'<h4>' + planDict[selectedDayNum][i]["title"] + '</h4>' + 
				'<h6>'+ planDict[selectedDayNum][i]["addr"]+ '</h6></div> ' + 
			'<div class="col-sm-3 col-md-2 col-xl-2 "style="padding: 0px 15px 0px 0px;">'+
				'<button type="button" class="btn-close btn-place-close" onclick="removePlan(' + selectedDayNum +','  + i + ')" aria-label="Close"></button>'+
			'</div></div>';
	       	  	el.innerHTML = item;
	       		el.className = "day-plan";
	       		dayListEl.appendChild(el);
	        }
        }
    }
    // 일정 추가 
    function addPlan(idx) {
      var selectedDayNum = document.getElementById("selectDay").value;
      // 아직 해당일자의 값이 없다면
      if (!planDict.hasOwnProperty(selectedDayNum)) {
    	  planDict[selectedDayNum] = [];
      }
	  let dict = {'contentId':places[idx]["contentId"], 'title': places[idx]["title"], 'addr': places[idx]["addr"], 'imageUrl': places[idx]["imageUrl"], 'lat': places[idx]["lat"],'lng':places[idx]["lng"],'order': planDict[selectedDayNum].length+1};
	  planDict[selectedDayNum].push(dict);
	 console.log(planDict);
	 viewDay();
	   }
    // 일정 삭제 
   	function removePlan(day,idx){
   		delete planDict[day][idx];
   		viewDay();
   		
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

      // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

      // 키워드 검색을 요청하는 함수입니다
       document.querySelector("#btn-search").addEventListener("click", function () {
        var keyword = document.getElementById("keyword").value;
        if (!keyword.replace(/^\s+|\s+$/g, "")) {
          // alert("키워드를 입력해주세요!");
          return false;
        }
        var keywordUrl = encodeURI("${root}/plan?action=keywordList&keyword=" + keyword);
       	fetch(keywordUrl)
         .then(response => response.json())
         .then(data => placeList(data)); 
      });
      
      var places; // 장소 검색 결과를 저장하기 위한 배열
       function placeList(data) {
    	   places = data; // 전달받은 장소 검색 결과 복사 
     	 var listEl = document.getElementById("placesList");
         var menuEl = document.getElementById("menu-wrap");
         var fragment = document.createDocumentFragment();
         var bounds = new kakao.maps.LatLngBounds();
         var listStr = "";
		
         // 검색 결과 목록에 추가된 항목들을 제거합니다
         removeAllChildNods(listEl);

         for (var i = 0; i < places.length; i++) {
           // 마커를 생성하고 지도에 표시합니다
           var placePosition = new kakao.maps.LatLng(places[i]["lat"], places[i]["lng"]);
           // var marker = addMarker(placePosition, i);
           var itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
           // LatLngBounds 객체에 좌표를 추가합니다
           bounds.extend(placePosition);
           fragment.appendChild(itemEl);
         }

         // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
         listEl.appendChild(fragment);
         menuEl.scrollTop = 0;
         //map.setCenter(bounds[0].getPosition());
         map.setLevel(2);
         // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
       }
       // 검색결과 목록의 자식 Element를 제거하는 함수입니다
       function removeAllChildNods(el) {
         while (el.hasChildNodes()) {
           el.removeChild(el.lastChild);
         }
       }
    
      // 검색결과 항목을 Element로 반환하는 함수입니다
      function getListItem(idx, place) {
        var el = document.createElement("li");
        var itemStr =
          '<div class="info"  onclick = "addMarker(' + idx + ')">' +
          '<span class="markerbg marker_' +
          (idx + 1) +
          '></span>'+
          '<a class="place-name" data-no=' + place["contentId"] + '>' +
          '<h4 style="margin:0px">' + place["title"] + '</h4></a>'  +
          '<span>' + place["addr"] + '</span>'
          ;
        el.innerHTML = itemStr;
        el.className = "item";
        return el;
      }
	
      // 마커를 생성하고 지도 위에 마커를 표시하는 함수
      function addMarker(idx){
    	  removeMarker();
          var marker = new kakao.maps.Marker({
              position: new kakao.maps.LatLng(places[idx]["lat"], places[idx]["lng"]),
              clickable: true,
            });
            marker.setMap(map);
      		markers.push(marker);
			mapCenterChange(marker);
			markerInfoDisplay(marker,idx)
      }

      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
      function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
        }
        markers = [];
      }
      
	 // 마커 위치로 지도 이동시키기 
      function mapCenterChange(marker) {
        map.setCenter(marker.getPosition());
        map.setLevel(2);
      }
	 
      var overlay = "";
      function markerInfoDisplay(marker,idx) {
        if (overlay) {
          closeOverlay();
        }
        var content = '<div class="wrap">' + 
          '<div class="info" id ="markerInfo" >' + 
          '<div class="title"> '+ places[idx]["title"] + 
         ' <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
         ' </div>' + 
         '<div class="body">' +
        ' <div class="img">' +
         '  <img src=' + (places[idx]["imageUrl"]===''?"${root}/assets/img/nophoto.png": places[idx]["imageUrl"]) + ' style="width:73px; height:70px;">' +
        ' </div> ' +
        '<div class="desc">' + 
        '<div class="ellipsis" id="addr">' +places[idx]["addr"] + '</div>' +
          '  <a class="add-plan" onclick="addPlan(' + idx + ')">일정 추가</a>' +
          '</div>' +
          '</div>' +
       	'</div>' +
     ' </div>';

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

     
    </script>
</body>
</html>
