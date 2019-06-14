<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel Moon`s HomePage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css?version=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css?version=<%=System.currentTimeMillis()%>">

<link rel="stylesheet" type="text/css" href="assets/css/uniform.default.min.css?version=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="assets/css/animate.css?version=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="assets/css/blueimp-gallery.min.css?version=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css" href="assets/css/style.css?version=<%=System.currentTimeMillis()%>">
<style type="text/css">
#freecssfooter{display:block;width:100%;padding:120px 0 20px;overflow:hidden;background-color:transparent;z-index:5000;text-align:center;}
#freecssfooter div#fcssholder div{display:none;}
#freecssfooter div#fcssholder div:first-child{display:block;}
#freecssfooter div#fcssholder div:first-child a{float:none;margin:0 auto;}
</style></head>
<body id="home">
<script type="text/javascript">
(function(){
  var bsa = document.createElement('script');
     bsa.type = 'text/javascript';
     bsa.async = true;
     bsa.src = '//s3.buysellads.com/ac/bsa.js';
  (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(bsa);
})();
</script>
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
      <a class="navbar-brand" href="http://localhost:8181"><img src="assets/images/logo.png" alt="website template image"></a></div>
    <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="http://localhost:8181/test">메인화면</a></li>
        <li><a href="http://localhost:8181/login/login"> 로그인</a></li>
        <li><a href="pages/introduction.php">호텔 소개</a></li>
        <li><a href="http://localhost:8181/login/signup">회원가입</a></li>
        <li><a href="pages/contact.php">예약하기</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container">

<h2>Rooms & Tariff</h2>

<!-- form -->

	<div class="row">
		<c:forEach var = "rl" items="${roomList }">
		  <div class="col-sm-6 wowload fadeInUp">
		  	<div class="rooms">
		  		<img src="resources/roomFileUpload/${rl.r_img }" class="img-responsive">
		  			<div class="info">
		  				<h3>${rl.r_name }</h3>
		  				<p> ${rl.r_com }</p>
		  				<a href="http://localhost:8181/roomdetail" class="btn btn-default">자세히 보기</a>
		  			</div>
		  		</div>
		  	</div>
		</c:forEach>
	</div>

	<div class="text-center">
		<c:if test="${totalCnt/4 >1 }">
			<ul class="pagination">
				<li class="disabled"><a href="#">«</a></li>
				<c:forEach var="i" begin="1" end="${totalCnt/4 +1}">
					<c:choose>
						<c:when test="${pageNo==i }">
							<li class="active"><a href="room?pageNo=${i }">${i } <span class="sr-only">(current)</span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="room?pageNo=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="disabled"><a href="#">»</a></li>
			</ul>
		</c:if>
	</div>


</div>

<footer class="spacer">
  <div class="container">
    <div class="row">
      <div class="col-sm-5">
        <h4>Company Moon</h4>
        <p>Hotel Moon을 통한 호텔사업을 기반으로 성장하였으며
        요식업, 건축업 등 다양한 분야에 도전하고 있습니다.</p>
      </div>
      <div class="col-sm-3">
        <h4>Quick Menual</h4>
        <ul class="list-unstyled">
          <li><a href="http://localhost:8181/room">방 둘러보기</a></li>
          <li><a href="http://localhost:8181/locate">호텔소개</a></li>
          <li><a href="http://localhost:8181/report">문의하기</a></li>
        </ul>
      </div>
      <div class="col-sm-4 subscribe">
        <h4>Check Reservation</h4>
        <div class="input-group">
          <input type="text" class="form-control" placeholder="ID를 입력해주세요">
          <span class="input-group-btn">
          <button class="btn btn-default" type="button">예약 확인</button>
          </span></div>
        <div class="social"><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-facebook-square" data-toggle="tooltip" data-placement="top" data-original-title="facebook"></i></a><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-instagram"  data-toggle="tooltip" data-placement="top" data-original-title="instragram"></i></a><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-twitter-square" data-toggle="tooltip" data-placement="top" data-original-title="twitter"></i></a><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-pinterest-square" data-toggle="tooltip" data-placement="top" data-original-title="pinterest"></i></a><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-tumblr-square" data-toggle="tooltip" data-placement="top" data-original-title="tumblr"></i></a><a href="https://www.free-css.com/free-css-templates"><i class="fa fa-youtube-square" data-toggle="tooltip" data-placement="top" data-original-title="youtube"></i></a></div>
      </div>
    </div>
  </div>
</footer>
<div class="text-center copyright">Powered by <a target="_blank" rel="nofollow noopener" href="http://www.kyungmin.ac.kr/index.html">Moon(주)</a></div>
<a href="#home" class="toTop scroll"><i class="fa fa-angle-up"></i></a>
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