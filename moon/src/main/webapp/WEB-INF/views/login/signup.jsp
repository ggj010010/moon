<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<script>
   function addDash(dateCtl){
      if(dateCtl.value.length == 4 || dateCtl.value.length == 7){
         dateCtl.value += "-";
      }
   }
</script>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<!-- css 가져오기 -->
<link rel="stylesheet" type="text/css"
   href="/resources/js/semantic.min.css">

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
         <h2 class="ui teal image header">회원가입 페이지</h2>
         <div class="ui large form">
            <div class="ui stacked segment">
               <div class="field">
                  <div class="ui left icon input">
                     <input type="text" id="c_id" placeholder="아이디" autofocus
                        autocomplete="off">
                  </div>
               </div>
               <div class="field">
                  <div class="ui left icon input">
                     <input type="text" id="c_name" placeholder="이름">
                  </div>
               </div>

               <div class="field">
                  <div class="ui left icon input">
                     <input type="password" id="c_pw" placeholder="비밀번호">
                  </div>
               </div>
               <div class="field">
                  <div class="ui left icon input">
                     <input type="password" id="c_pw2" placeholder="비밀번호 확인">
                  </div>
               </div>
               <div class="field">
                  <div class="ui left icon input">
                     <input type="text" id="c_tel" placeholder="연락처(-없이 입력)">
                  </div>
               </div>
               <div class="field">
                  <div class="ui left icon input">
          <div class="field" >
                     남 <input type="radio" id="c_sex" value="0"style="margin-right:25px;"/>

                      여 <input type="radio" id="c_sex" value="1"/>
                     </div>
                  </div>
               </div>
               <div class="field">
                  <div class="ui left icon input">
                     <input type="date" id="c_birth" size="9" 
                     placeholder="생년월일  ex)20190606" 
                     onKeyPress="addDash(this)"
                     maxlength="10">
                  </div>
               </div>
               <button class="ui fluid large teal submit button" id="register_btn">회원가입</button>
            </div>

            <div class="ui error message"></div>

         </div>

         <div class="ui message">
            로그인 할 계정이 있다면 <a href="/login/login">여기</a>를 눌러주세요.
         </div>
      </div>
   </div>
   <!-- js 가져오기 -->
   <script src="/resources/js/jquery3.3.1.min.js"></script>
   <script src="/resources/js/semantic.min.js"></script>
   <script>
      $(document)
            .ready(
                  function() {
                     $("#register_btn")
                           .click(
                                 function() {
                                    var json = {
                                       c_id : $("#c_id").val(),
                                       c_pw : $("#c_pw").val(),
                                       c_name : $("#c_name").val(),
                                       c_tel : $("#c_tel").val(),
                                       
                                       c_sex : $("#c_sex").val(),
                                       c_birth : $("#c_birth").val()
                                       
                                    };
                                    
                                    for ( var str in json) {
                                       if (json[str].length == 0) {
                                          alert($("#" + str)
                                                .attr(
                                                      "placeholder")
                                                + " 정보를 입력해주세요.");
                                          $("#" + str).focus();
                                          return false;
                                       }
                                    }
                                    if($("#c_pw").val() == $("#c_pw2").val()){
                                    $.ajax({
                                             type : "post",
                                             url : "/insertCustomer",
                                             data : json,
                                             success : function(
                                                   data) {
                                                switch (Number(data)) {
                                                case 0:
                                                   alert("정상적으로 회원가입 되었습니다.");
                                                   window.location.href = "/login/login";
                                                   break;
                                                case 1:
                                                   alert("아이디가 중복 되었습니다.");
                                                   
                                                   break;
                                             
                                                default:
                                                   alert("알수없는 오류가 발생 했습니다. [Error Code :"
                                                         + Number(data)
                                                         + "]");
                                                   break;
                                                }
                                             },
                                             error : function(
                                                   error) {
                                                alert("오류 발생"
                                                      + error);
                                             }
                                          });
                                    }
                                    else{
                                       alert('비밀번호 가 일치하지 않습니다.');
                                    }
                                 });
                  });
   </script>
</body>

