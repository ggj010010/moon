<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" href="../assets/images/favicon.png"
	type="image/x-icon">
<%-- <link rel="stylesheet" type="text/css"
	href="../assets/css/font-awesome.min.css?version=<%=System.currentTimeMillis()%>"> --%>
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css?version=<%=System.currentTimeMillis()%>">

<link rel="stylesheet" type="text/css"
	href="../assets/css/uniform.default.min.css?version=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css"
	href="../assets/css/animate.css?version=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css"
	href="../assets/css/blueimp-gallery.min.css?version=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" type="text/css"
	href="../assets/css/style.css?version=<%=System.currentTimeMillis()%>">
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
					src="../assets/images/logo.png" alt="website template image"></a>
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


    <script src="/resources/js/jquery3.3.1.min.js"></script>
    <script src="/resources/js/semantic.min.js"></script>
<script>
	
	 $(document).ready(function(){
		// 파일 업로드 영역에서 기본효과를 제한
		/*$(".fileDrop").on("dragenter dragover", function(e){
			e.preventDefault(); // 기본효과 제한
		});
		$(".fileDrop").on("drop", function(e){
			e.preventDefault(); // 기본효과 제한
			var files = e.originalEvent.dataTransfer.files; // 드래그한 파일들
			//console.log(files);
			var file = files[0]; // 첫번째 첨부파일
			var formData = new FormData(); // 폼데이터 객체
			formData.append("file", file); // 첨부파일 추가
			$.ajax({
				url: "${path}/upload/uploadAjax",
				type: "post",
				data: formData,
				dataType: "text",
				processData: false, // processType: false - header가 아닌 body로 전달
				contentType: false,
				success: function(data){
					console.log(data);
					// 첨부 파일의 정보
					var fileInfo = getFileInfo(data);
					// 하이퍼링크
					var html = "<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
					// hidden 태그 추가
					html += "<input type='hidden' class='file' value='"+fileInfo.fullName+"'>";
					// div에 추가
					$("#uploadedList").append(html);
				}
			});
		}); */
		
		$("#btnSave").click(function(){
			//var title = document.form1.title.value; ==> name속성으로 처리할 경우
			//var content = document.form1.content.value;
			//var writer = document.form1.writer.value;
			var b_title = $("#title").val();
			var b_content = $("#content").val();
			//var writer = $("#writer").val();
			if(b_title == ""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if(b_content == ""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			/* if(writer == ""){
				alert("이름을 입력하세요");
				document.form1.writer.focus();
				return;
			} */
			
			// 첨부파일 이름을 form에 추가
			var that = $("#form1");
			var str = "";
			// 태그들.each(함수)
			// id가 uploadedList인 태그 내부에 있는 hidden태그들
			/* $("#uploadedList .file").each(function(i){
				str += "<input type='hidden' name='files["+i+"]' value='"+$(this).val()+"'>";
			}); */
			// form에 hidden태그들을 추가
			$("#form1").append(str);
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
		
	});
	
</script>
<style>
	/* 첨부파일을 드래그할 영역의 스타일 */
	.fileDrop {
		width: 600px;
		height: 70px;
		border: 2px dotted gray;
		background-color: gray;
	}

</style>
</head>
<body>
<h2>게시글 작성</h2>
<form name="form1" id="form1" method="get" action="/board/insert">
	<div>
		
		<input name="b_title" id="title" size="80" placeholder="제목을 입력해주세요">
		<br>
	</div>
	<div>
		<br>
		<textarea name="b_content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
	</div>
<!-- 	<div>
		첨부파일 등록
		<div class="fileDrop"></div>
		첨부파일 목록		
		<div id="uploadedList"></div>
	</div> -->
	<!-- <div>
		이름
		<input name="writer" id="writer" placeholder="이름을 입력해주세요">
	</div> -->
	<div style="width:650px; text-align: center;">
		<button type="button" id="btnSave">확인</button>
		<button type="reset">취소</button>
	</div>
</form>


	</div>


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
     

				<div class="social">
					<a href="https://www.free-css.com/free-css-templates"><i
						class="fa fa-facebook-square" data-toggle="tooltip"
						data-placement="top" data-original-title="facebook"></i></a><a
						href="https://www.free-css.com/free-css-templates"><i
						class="fa fa-instagram" data-toggle="tooltip" data-placement="top"
						data-original-title="instragram"></i></a><a
						href="https://www.free-css.com/free-css-templates"><i
						class="fa fa-twitter-square" data-toggle="tooltip"
						data-placement="top" data-original-title="twitter"></i></a><a
						href="https://www.free-css.com/free-css-templates"><i
						class="fa fa-pinterest-square" data-toggle="tooltip"
						data-placement="top" data-original-title="pinterest"></i></a><a
						href="https://www.free-css.com/free-css-templates"><i
						class="fa fa-tumblr-square" data-toggle="tooltip"
						data-placement="top" data-original-title="tumblr"></i></a><a
						href="https://www.free-css.com/free-css-templates"><i
						class="fa fa-youtube-square" data-toggle="tooltip"
						data-placement="top" data-original-title="youtube"></i></a>
				</div>
			</div>
		</div>
		</div>
	</footer>
	<div class="text-center copyright">
		Powered by <a target="_blank" rel="nofollow noopener"
			href="http://www.kyungmin.ac.kr/index.html">Moon(주)</a>
	</div>
	<a href="#home" class="toTop scroll"><i class="fa fa-angle-up"></i></a>
	<div id="blueimp-gallery"
		class="blueimp-gallery blueimp-gallery-controls">
		<div class="slides"></div>
		<h3 class="title">title</h3>
		<a class="prev">&lsaquo;</a> <a class="next">&rsaquo;</a> <a
			class="close">&times;</a>
	</div>
	<script src="../assets/js/jquery.js"></script>
	<script src="../assets/js/wow.min.js"></script>
	<script src="../assets/js/jquery.uniform.js"></script>
	<script src="../assets/js/bootstrap.js"></script>
	<script src="../assets/js/touchSwipe.min.js"></script>
	<script src="../assets/js/respond.js"></script>
	<script src="../assets/js/jquery.blueimp-gallery.min.js"></script>
	<script src="../assets/js/script.js"></script>
	<script type="text/javascript">
	var gaProperty = 'UA-120201777-1';
	var disableStr = 'ga-disable-' + gaProperty;
	if (document.cookie.indexOf(disableStr + '=true') > -1) {
		window[disableStr] = true;
	}
	function gaOptout() {
		document.cookie = disableStr
				+ '=true; expires=Thu, 31 Dec 2045 23:59:59 UTC; path=/';
		window[disableStr] = true;
		alert('Google Tracking has been deactivated');
	}
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');
	ga('create', 'UA-120201777-1', 'auto');
	ga('set', 'anonymizeIp', true);
	ga('send', 'pageview');
</script>
</body>
</html>