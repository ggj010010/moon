<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="/resources/js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	var $j = jQuery.noConflict();
</script>
<script type="text/javascript">
(function(){
  var bsa = document.createElement('script');
     bsa.type = 'text/javascript';
     bsa.async = true;
     bsa.src = '//s3.buysellads.com/ac/bsa.js';
  (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(bsa);
})();

$j(document).ready(function() {
	
}).on("click","#insertSchedule",function(){
	
	var $frm = $j(".insertSchedule");
	var param = $frm.serialize();
	//값전송
	$j.ajax({
		url : "/schedule/insertSchedule",
		dataType: "json",
	    type: "GET",
	    data : param,
	    timeout: 3000,
	    success: function(returndata, textStatus, jqXHR)
	    {
	    	//하위 주소로 이동
	    	//이동시 보고있던 화면에 insert추가후 뿌려줌
	    	location.href = "/";
	    },//end success
	    error : function (jqXHR, textStatus, errorThrown)
	    {
	    	alert("실패");
	    	console.log(error);
            console.log(error.status);
	    }//end error
	});
});

</script>
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
      <a class="navbar-brand" href="http://localhost:8181"><img src="assets/images/logo.png" alt="website template image"></a></div>
    <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<c:choose>
      		<c:when test="${sessionScope.c.c_id == null}">
      		    <li><a href="http://localhost:8181/room">방 둘러보기</a></li>
       		    <li><a href="http://localhost:8181/locate">호텔소개</a></li>
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
<div class="banner"><img src="assets/images/photos/banner.jpg" class="img-responsive" alt="website template image">
  <div class="welcome-message">
    <div class="wrap-info">
      <div class="information">
        <h1 class="animated fadeInDown">Hotel Moon</h1>
        <p class="animated fadeInUp">Team Moon`s Hotel</p>
      </div>
      <a href="#information" class="arrow-nav scroll wowload fadeInDownBig"><i class="fa fa-angle-down"></i></a></div>
  </div>
</div>
<div id="information" class="spacer reserve-info">
  <div class="container">
    <div class="row">
      <div class="col-sm-7 col-md-8">
        <div class="embed-responsive embed-responsive-16by9 wowload fadeInLeft">
          <iframe class="embed-responsive-item" src="//player.vimeo.com/video/194467071?title=0" width="100%" height="400" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
        </div>
      </div>
			<c:choose>
				<c:when test="${sessionScope.c.c_id == null}">
					<div class="col-sm-5 col-md-4"></div>
				</c:when>
				<c:otherwise>
					<div class="col-sm-5 col-md-4">
						<h3>예약하기</h3>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="예약자 성명" value="${sessionScope.c.c_id }">
								<input type="hidden" name="c_id" class="insertSchedule" value="${sessionScope.c.c_id }" />
							</div>

							<div class="form-group">
								<input type="Phone" class="form-control" placeholder="휴대폰 번호" value="${sessionScope.c.c_tel }">
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-xs-6">
										<select name="r_id" class="form-control insertSchedule">
											<c:forEach var="rl" items="${roomList }">
												<option value="${rl.r_id }">${rl.r_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="ui left icon input">
									<input class="insertSchedule" name="in" type="date" id="firstday" size="9"
										onKeyPress="addDash(this)" maxlength="10"> 입실날짜
								</div>
								<div class="ui left icon input">
									<input class="insertSchedule" name="out" type="date" id="Lastday" size="9"
										onKeyPress="addDash(this)" maxlength="10"> 퇴실날짜
								</div>
								<button class="btn btn-default" id="insertSchedule">확인</button>
							</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
  </div>
</div>
<div class="spacer services wowload fadeInUp">
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="RoomCarousel" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="item active"><img src="assets/images/photos/8.jpg" class="img-responsive" alt="website template image"></div>
            <div class="item  height-full"><img src="assets/images/photos/9.jpg" class="img-responsive" alt="website template image"></div>
            <div class="item  height-full"><img src="assets/images/photos/10.jpg" class="img-responsive" alt="website template image"></div>
          </div>
          <a class="left carousel-control" href="#RoomCarousel" role="button" data-slide="prev"><i class="fa fa-angle-left"></i></a> <a class="right carousel-control" href="#RoomCarousel" role="button" data-slide="next"><i class="fa fa-angle-right"></i></a></div>
        <div class="caption">방 둘러보기<a href="pages/rooms-tariff.php" class="pull-right"><i class="fa fa-edit"></i></a></div>
      </div>
      <div class="col-sm-4">
        <div id="TourCarousel" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="item active"><img src="assets/images/photos/6.jpg" class="img-responsive" alt="website template image"></div>
            <div class="item  height-full"><img src="assets/images/photos/3.jpg" class="img-responsive" alt="website template image"></div>
            <div class="item  height-full"><img src="assets/images/photos/4.jpg" class="img-responsive" alt="website template image"></div>
          </div>
          <a class="left carousel-control" href="#TourCarousel" role="button" data-slide="prev"><i class="fa fa-angle-left"></i></a> <a class="right carousel-control" href="#TourCarousel" role="button" data-slide="next"><i class="fa fa-angle-right"></i></a></div>
        <div class="caption">근처 관광지<a href="pages/gallery.php" class="pull-right"><i class="fa fa-edit"></i></a></div>
      </div>
      <div class="col-sm-4">
        <div id="FoodCarousel" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="item active"><img src="assets/images/photos/1.jpg" class="img-responsive" alt="website template image"></div>
            <div class="item  height-full"><img src="assets/images/photos/2.jpg" class="img-responsive" alt="website template image"></div>
            <div class="item  height-full"><img src="assets/images/photos/5.jpg" class="img-responsive" alt="website template image"></div>
          </div>
          <a class="left carousel-control" href="#FoodCarousel" role="button" data-slide="prev"><i class="fa fa-angle-left"></i></a> <a class="right carousel-control" href="#FoodCarousel" role="button" data-slide="next"><i class="fa fa-angle-right"></i></a></div>
        <div class="caption">호텔 조식<a href="pages/gallery.php" class="pull-right"><i class="fa fa-edit"></i></a></div>
      </div>
    </div>
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