<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel Moon`s HomePage</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<%-- <link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.min.css?version=<%=System.currentTimeMillis()%>"> --%>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css?version=<%=System.currentTimeMillis()%>">

<link rel="stylesheet" type="text/css"
	href="assets/css/uniform.default.min.css?version=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css"
	href="assets/css/animate.css?version=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css"
	href="assets/css/blueimp-gallery.min.css?version=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css"
	href="assets/css/style.css?version=<%=System.currentTimeMillis()%>">
<style type="text/css">
#freecssfooter {
	display: block;
	width: 100%;
	padding: 120px 0 20px;
	overflow: hidden;
	background-color: transparent;
	z-index: 5000;
	text-align: center;
}

#freecssfooter div#fcssholder div {
	display: none;
}

#freecssfooter div#fcssholder div:first-child {
	display: block;
}

#freecssfooter div#fcssholder div:first-child a {
	float: none;
	margin: 0 auto;
}
</style>
</head>
<body id="home">
	<script type="text/javascript">
		(function() {
			var bsa = document.createElement('script');
			bsa.type = 'text/javascript';
			bsa.async = true;
			bsa.src = '//s3.buysellads.com/ac/bsa.js';
			(document.getElementsByTagName('head')[0] || document
					.getElementsByTagName('body')[0]).appendChild(bsa);
		})();
	</script>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="http://localhost:8181"><img
					src="assets/images/logo.png" alt="website template image"></a>
			</div>
			<div class="collapse navbar-collapse navbar-right"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<c:choose>
						<c:when test="${sessionScope.c.c_id == null}">
							<li><a href="http://localhost:8181/room">방 둘러보기</a></li>
							<li><a href="http://localhost:8181/locate">호텔소개</a></li>
							<li><a href="/board/test2">게시판</a></li>
							<li><a href="http://localhost:8181/login/login">로그인</a></li>
						</c:when>
						<c:otherwise>

							<li><a href="http://localhost:8181/room">방 둘러보기</a></li>
							<li><a href="http://localhost:8181/locate">호텔소개</a></li>
							<li><a href="http://localhost:8181/check">예약확인</a></li>
							<li><a href="/board/test2">게시판</a></li>
							<li><a>${sessionScope.c.c_id}님</a></li>
							<li><a href="/logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>




	<div class="container">


		<!-- form -->
		<div class="contact">

			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<div class="spacer">
						<h1 class="title">예약 확인</h1>
						<table border="1" width="100%" ,height="200%">
							<tr>
								<th>User_Name</th>
								<th>Room_Name</th>
								<th>Check_In</th>
								<th>Check_Out</th>
							</tr>
							<c:forEach var="s" items="${scheduleList}">
							<tr>
								<td>${s.customerDTO.c_name }</td>
								<td>${s.roomDTO.r_name }</td>
								<td>${s.in }</td>
								<td>${s.out }</td>
							</tr>
							</c:forEach>
						</table>
					</div>


				</div>





			</div>
		</div>
	</div>
	<!-- form -->

	</div>
<br><br><br><br><br><br>
<br>
	</div>
<footer class="spacer">
  <div class="container">
    <div class="row">
      <div class="col-sm-5">
        <h4>Company Moon</h4>
        <p>Hotel Moon을 통한 호텔사업을 기반으로 성장하였으며
        요식업, 건축업 등 <br>다양한 분야에 도전하고 있습니다.</p>
      </div>
      <div class="col-sm-3">
        <ul class="list-unstyled">
	
        </ul>
      </div>
     
     <div class="col-sm-4 subscribe">
                    <div class="input-group">
                        <h4>Quick Manual</h4>
        <ul class="list-unstyled">
	<c:choose>
      		<c:when test="${sessionScope.c.c_id == null}">
      		    <li><a href="http://localhost:8181/room">방 둘러보기</a></li>
       		    <li><a href="http://localhost:8181/locate">호텔소개</a></li>
       		    <li><a href="/board/test2">게시판</a></li>
        	</c:when>
        	<c:otherwise> 

        	    <li><a href="http://localhost:8181/room">방 둘러보기</a></li>
       		    <li><a href="http://localhost:8181/locate">호텔소개</a></li>
                <li><a href="http://localhost:8181/check">예약확인</a></li>
                <li><a href="/board/test2">게시판</a></li>
        	</c:otherwise>
        </c:choose>
        </ul>
                    </div>
     
     
     
        <div class="social"><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-facebook-square" data-toggle="tooltip" data-placement="top" data-original-title="facebook"></i></a><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-instagram"  data-toggle="tooltip" data-placement="top" data-original-title="instragram"></i></a><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-twitter-square" data-toggle="tooltip" data-placement="top" data-original-title="twitter"></i></a><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-pinterest-square" data-toggle="tooltip" data-placement="top" data-original-title="pinterest"></i></a><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-tumblr-square" data-toggle="tooltip" data-placement="top" data-original-title="tumblr"></i></a><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-youtube-square" data-toggle="tooltip" data-placement="top" data-original-title="youtube"></i></a></div>
      </div>
    </div>
  </div>
</footer>
<div class="text-center copyright">Powered by <a target="_blank" rel="nofollow noopener" >Moon(주)</a></div>
<a href="#home" class="toTop scroll"><img src ="assets/images/drop.png"></i></a>
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
  <div class="slides"></div>
  <h3 class="title">title</h3>
  <a class="prev">&lsaquo;</a> <a class="next">&rsaquo;</a> <a class="close">&times;</a></div>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/jquery.uniform.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/touchSwipe.min.js"></script>
<script src="assets/js/respond.js"></script>
<script src="assets/js/jquery.blueimp-gallery.min.js"></script>
<script src="assets/js/script.js"></script>
<script type="text/javascript">
var gaProperty = 'UA-120201777-1';var disableStr = 'ga-disable-' + gaProperty;if (document.cookie.indexOf(disableStr + '=true') > -1) {window[disableStr] = true;}
function gaOptout(){document.cookie = disableStr + '=true; expires=Thu, 31 Dec 2045 23:59:59 UTC; path=/';window[disableStr] = true;alert('Google Tracking has been deactivated');}
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-120201777-1', 'auto');ga('set', 'anonymizeIp', true);ga('send', 'pageview');
</script>
</body>
</html>