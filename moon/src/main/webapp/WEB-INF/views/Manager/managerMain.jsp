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
			<td><input type="button" value="����" onClick="location.href='/manager/managerMain'"></td>
			<td><input type="button" value="�� ����" onClick="location.href='/room/room'"></td>
			<td><input type="button" value="�̺�Ʈ ����" onClick="location.href='/event/event'"></td>
			<td><input type="button" value="���� ����" onClick="location.href='/schedule/schedule'"></td>
			<td><input type="button" value="�� ����" onClick="location.href='/customer/customer'"></td>
		</tr>
	</table>
</body>
</html>
