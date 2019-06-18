<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

</style>
<script>
function dragStart(ev) {
	   ev.dataTransfer.effectAllowed='move';
	   ev.dataTransfer.setData("Text", ev.target.getAttribute('id'));   ev.dataTransfer.setDragImage(ev.target,100,100);
	   return true;
	}
function dragEnter(ev) {
	   ev.preventDefault();
	   return true;
	}
	function dragOver(ev) {
	    ev.preventDefault();
	}
	function dragDrop(ev) {
		   var data = ev.dataTransfer.getData("Text");
		   ev.target.appendChild(document.getElementById(data));
		   ev.stopPropagation();
		   return false;
		}
	
</script>
</head>
<body>
	<table>
		<tr>
			<th>num</th>
			<th>name</th>
		</tr>
		<c:forEach var="tl" items="${testList }">
			<tr>
				<td>${tl.num }</td>
				<td>${tl.name }</td>
			</tr>
		</c:forEach>
	</table>
<div id="boxA" draggable="true"><img src="assets/images/photos/favicon.png"></div>
<div id="big" ondragenter="return dragEnter(event)" ondrop="return dragDrop(event)" ondragover="return dragOver(event)"><img src="/resources/images/photos/favicon.png"></div>


</body>
</html>