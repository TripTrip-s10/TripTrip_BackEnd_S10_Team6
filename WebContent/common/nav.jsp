<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.triptrip.user.dto.User, com.triptrip.user.service.UserService, com.triptrip.user.service.UserServiceImpl"%>
<%
	User user = (User) session.getAttribute("userinfo");
%>
<!DOCTYPE html>
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
						<li><a href="${root}/board?action=list">Board</a></li>
						<li><a href="${root}/board/createArticle.jsp">Posting</a></li>
						<li><a href="${root}/map/mapList.jsp">Map</a></li>
						<%
							if (user != null) {
						%>
						<li id="profile" style="">
						<a href="${root}/user?action=profile">Profile
								<img src="${root}/assets/img/profile.jpg" alt="" />
						</a></li>
						<%
							}
						%>

					</ul>
					<a class="menu-trigger"> <span>Menu</span>
					</a>
					<!-- ***** Menu End ***** -->
				</nav>
			</div>
		</div>
	</div>
</header>