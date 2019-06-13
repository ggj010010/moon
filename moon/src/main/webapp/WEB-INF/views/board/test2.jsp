<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <!-- css 가져오기 -->
    <link rel="stylesheet" type="text/css" href="/resources/js/semantic.min.css">

    <style type="text/css">
        body {
            background-color: #DADADA;
        }

        body>.grid {
            height: 100%;
        }

        .image {
            margin-top: -100px;
        }

        .column {
            max-width: 1000px;
        }

        .view_btn {
            cursor: pointer;
        }

    </style>
</head>

<body>
    <div class="ui middle aligned center aligned grid">
        <div class="column">
            <div class="ui large form">
                <div class="ui stacked segment">
                    <a href="/write_bbs"><button class="ui fluid large teal submit button">게시글 작성하기</button></a>
                    <table class="ui celled table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>제목</th>
                                <th>등록자</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody id="list">
                        </tbody>
                    </table>
                </div>

                <div class="ui error message"></div>

            </div>
        </div>
    </div>

    <div class="ui modal" id='view_modal'>
        <i class="close">x</i>
        <div class="header" id="b_title">
            
        </div>
        <div class="content">
            <div class="description">
            	<p style = "text-align: right" id = "b_review"></p>
            	<div id = 'b_content'></div>
            </div>
        </div>
        <div class="actions">
            <div class="ui black deny button">
                닫기
            </div>
        </div>
    </div>

    <!-- js 가져오기 -->
    <script src="/resources/js/jquery3.3.1.min.js"></script>
    <script src="/resources/js/semantic.min.js"></script>

    <script>
        $(document).ready(function() {
            $.ajax({
                type: "get",
                url: "/bbs_all",
                success: function(data) {
                    console.log(data);
                    var i = 1;
                    for (var str in data) {
                        var tr = $("<tr></tr>").attr("data-id", data[str]['b_id']).appendTo("#list");
                        $("<td></td>").text(i).addClass("view_btn").appendTo(tr);
                        $("<td></td>").text(data[str]['b_title']).addClass("view_btn").appendTo(tr);
                        $("<td></td>").text(data[str]['b_content']).addClass("view_btn").appendTo(tr);
                        $("<td></td>").text(data[str]['b_date']).addClass("view_btn").appendTo(tr);
                        i++;
                    }
                },
                error: function(error) {
                    alert("오류 발생" + error);
                }
            });

            $(document).on("click", ".view_btn", function() {
                var b_no = $(this).parent().attr("data-id");

                $.ajax({
                    type: "get",
                    url: "get_bbs",
                    data: {
                        b_no: b_no
                    },
                    success: function(data) {
                    	console.log(data);
                    	$("#b_title").text(data['b_title']);
                    	$("#b_review").text(data['b_ownernick'] + " - " +  FormatToUnixtime(data['b_regdate']));
                    	$("#b_content").text(data['b_content']);
                    	$('#view_modal').modal('show');
                    },
                    error: function(error) {
                        alert("오류 발생" + error);
                    }
                });
            });

            function FormatToUnixtime(unixtime) {
                var u = new Date(unixtime);
                return u.getUTCFullYear() +
                    '-' + ('0' + u.getUTCMonth()).slice(-2) +
                    '-' + ('0' + u.getUTCDate()).slice(-2) +
                    ' ' + ('0' + u.getUTCHours()).slice(-2) +
                    ':' + ('0' + u.getUTCMinutes()).slice(-2) +
                    ':' + ('0' + u.getUTCSeconds()).slice(-2)
            };
        });

    </script>
</body>

</html>
