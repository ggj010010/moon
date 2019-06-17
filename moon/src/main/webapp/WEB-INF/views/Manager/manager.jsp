<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Moon관리자 페이지</title>
    <!-- css 가져오기 -->
    <link rel="stylesheet" type="text/css" href="/resources/js/semantic.min.css">

    <style type="text/css">
        body {
            background-color: #FFFFFF;
        }
        body>.grid {
            height: 100%;
        }
        .image {
            margin-top: -100px;
        }
        .column {
            max-width: 450px;
        }

    </style>
</head>

<body>
    <div class="ui middle aligned center aligned grid">
        <div class="column">
            <h2 class="ui teal image header">
 				Moon관리자 페이지
            </h2>
            <form class="ui large form">
                <div class="ui stacked segment">
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="text" id="c_id" placeholder="아이디">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="password" id="c_pw" placeholder="비밀번호">
                        </div>
                    </div>
                    <div class="ui fluid large teal submit button" id = "login_btn">로그인</div>
                </div>

                <div class="ui error message"></div>

            </form>

           
        </div>
    </div>
    <!-- js 가져오기 -->
    <script src="/resources/js/jquery3.3.1.min.js"></script>
    <script src="/resources/js/semantic.min.js"></script>
    <script>
	    $(document).ready(function(){
			$("#login_btn").click(function(){
				
					c_id = $("#c_id").val();
					c_pw = $("#c_pw").val();
				if(c_id == "moon" && c_pw == "moon"){
					window.location.href = "/manager/managerMain";
				}
				else{
					alert("아이디 또는 패스워드가 일치하지 않습니다.");
					$("#c_id").text("");
					$("#c_pw").text("");
				}
			});
		});
    </script>
</body>

</html>