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
			<td><input type="button" value="메인" onClick="location.href='/manager/managerMain'"></td>
			<td><input type="button" value="방 관리" onClick="location.href='/room/room'"></td>
			<td><input type="button" value="이벤트 관리" onClick="location.href='/event/event'"></td>
			<td><input type="button" value="예약 관리" onClick="location.href='/schedule/schedule'"></td>
			<td><input type="button" value="고객 관리" onClick="location.href='/customer/customer'"></td>
		</tr>
	</table>
</body>
</html>
