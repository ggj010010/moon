<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
</body>
</html>