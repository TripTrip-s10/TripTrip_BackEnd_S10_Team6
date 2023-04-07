<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!-- 추천 지역 페이지 -->
<!DOCTYPE html>
<html lang="en">
<!-- head start -->
<%@ include file="/common/head.jsp"%>
<!-- head end -->
<body>
	<!-- nav bar start -->
	<%@ include file="/common/nav.jsp"%>
	<!-- nav bar end -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<div class="row">
						<div class="col-lg-8">
							<div class="featured-games header-text">
								<div class="heading-section">
									<form class="d-flex my-3" id="form-search" action="">
										<input type="hidden" name="action" value="list"> <select
											id="searchArea" name="areaCode" class="form-select me-2">
											<option value="1"
												<c:if test="${param.areaCode eq '1'}">selected="selected"</c:if>>서울</option>
											<option value="2"
												<c:if test="${param.areaCode eq  '2'}">selected="selected"</c:if>>인천</option>
											<option value="3"
												<c:if test="${param.areaCode eq  '3'}">selected="selected"</c:if>>대전</option>
											<option value="4"
												<c:if test="${param.areaCode eq  '4'}">selected="selected"</c:if>>대구</option>
											<option value="5"
												<c:if test="${param.areaCode eq  '5'}">selected="selected"</c:if>>광주</option>
											<option value="6"
												<c:if test="${param.areaCode eq '6'}">selected="selected"</c:if>>부산</option>
											<option value="7"
												<c:if test="${param.areaCode eq  '7'}">selected="selected"</c:if>>울산</option>
											<option value="8"
												<c:if test="${param.areaCode eq  '8'}">selected="selected"</c:if>>세종특별자치시</option>
											<option value="31"
												<c:if test="${param.areaCode eq  '31'}">selected="selected"</c:if>>경기도</option>
											<option value="32"
												<c:if test="${param.areaCode eq  '32'}">selected="selected"</c:if>>강원도</option>
											<option value="33"
												<c:if test="${param.areaCode eq '33'}">selected="selected"</c:if>>충청북도</option>
											<option value="34"
												<c:if test="${param.areaCode eq  '34'}">selected="selected"</c:if>>충청남도</option>
											<option value="35"
												<c:if test="${param.areaCode eq  '35'}">selected="selected"</c:if>>경상북도</option>
											<option value="36"
												<c:if test="${param.areaCode eq  '36'}">selected="selected"</c:if>>경상남도</option>
											<option value="37"
												<c:if test="${param.areaCode eq  '37'}">selected="selected"</c:if>>전라북도</option>
											<option value="38"
												<c:if test="${param.areaCode eq  '38'}">selected="selected"</c:if>>전라남도</option>
											<option value="39"
												<c:if test="${param.areaCode eq  '39'}">selected="selected"</c:if>>제주도</option>
										</select>
										<button id="btn-search" class="btn btn-outline-success"
											type="button">검색</button>
									</form>
								</div>
								<div id="map" style="width: 100%; height: 604px"></div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="recommended-place">
								<div class="row">
									<div class="heading-section">
										<div class="text-button">
											<a
												<c:if test="${param.categoryCode eq ''}">class="active"</c:if>>전체</a>
										</div>
										<div class="text-button">
											<a
												<c:if test="${param.categoryCode eq '39'}">class="active"</c:if>
												data-value="39">음식점</a>
										</div>
										<div class="text-button">
											<a
												<c:if test="${param.categoryCode eq '32'}">class="active"</c:if>
												data-value="32">숙소</a>
										</div>
										<div class="text-button">
											<a
												<c:if test="${param.categoryCode eq '12'}">class="active"</c:if>
												data-value="12">관광지</a>
										</div>
										<div class="text-button">
											<a
												<c:if test="${param.categoryCode eq '14'}">class="active"</c:if>
												data-value="14">문화시설</a>
										</div>
										<div class="text-button">
											<a
												<c:if test="${param.categoryCode eq '15'}">class="active"</c:if>
												data-value="15">행사</a>
										</div>
										<div class="text-button">
											<a
												<c:if test="${param.categoryCode eq '25'}">class="active"</c:if>
												data-value="25">여행코스</a>
										</div>
										<div class="text-button">
											<a
												<c:if test="${param.categoryCode eq '38'}">class="active"</c:if>
												data-value="38">쇼핑</a>
										</div>
									</div>
								</div>
								<div class="row">
									<ul style="overflow: auto; height: 518px" id="area-list">
										<c:forEach var="list" items="${mapList}">
											<li>
												<div class="place" onclick="clickPlace(this)">
													<c:choose>
														<c:when test="${list.imageUrl eq ''}">
															<img src="${root}/assets/img/nophoto.png" alt=""
																class="templatemo-item" />
														</c:when>
														<c:otherwise>
															<img src="${list.imageUrl}" alt=""
																class="templatemo-item" />
														</c:otherwise>
													</c:choose>
													<h4 id="area-title">${list.title}</h4>
													<h6>${list.addr}</h6>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div class="text-button" id="plan-button">
									<a href="${root}/plan?action=mvplan">일정 만들기</a>
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
	
	  // form-param 처리
	  var tagList = document.querySelectorAll(".text-button");
      tagList.forEach((tag,idx) => tag.addEventListener("click",function(){
    	 // changeButtonDesign(idx);
    	  let form = document.querySelector("#form-param");
    	  console.log("${param.areaCode}");
 		  document.querySelector("#p-areaCode").value = "${param.areaCode}";
    	  let categoryCode = tag.childNodes[0].nextSibling.getAttribute("data-value");
    	  document.querySelector("#p-categoryCode").value = categoryCode;
    	  form.setAttribute("action","${root}/map");
	      form.submit();
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
      var areaCode = "${param.areaCode}";
     var startflag = 0;
      makeList();
      // 관광지 리스트 생성하기
      var positions;
      function makeList() {
        positions = [];
        <c:forEach var="list" items="${mapList}">
          var markerInfo = {
            title: "${list.title}",
            latlng: new kakao.maps.LatLng("${list.lat}","${list.lng}"),
          };
          positions.push(markerInfo);
        </c:forEach>
        console.log(positions);
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
