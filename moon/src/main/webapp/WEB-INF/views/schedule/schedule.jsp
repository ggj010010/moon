<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$j(document).ready(function() {

	}).on("click","#deleteSchedule",function() {
				//������ �ʿ��ϰ� �ҷ���
				var $frm = $j(this).next();
				var param = $frm.serialize();
				//ajax ������ comcode data ��ȸ
				//������ ������ ���ΰ� ����
				$j.ajax({
					url : "/schedule/deleteSchedule",
					dataType : "json",
					type : "GET",
					data : param,
					success : function(returndata, textStatus, jqXHR) {
						location.href = "/schedule/schedule";
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("����");
						alert("code:" + jqXHR.status + "\n" + "message:"
								+ jqXHR.responseText + "\n" + "error:"
								+ errorThrown);
					}//end error
				});
			});
</script>
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
	<table>
		<tr>
			<th>c_id</th>
			<th>c_name</th>
			<th>c_tel</th>
			<th>r_name</th>
			<th>check_in</th>
			<th>check_out</th>
			<th>����</th>
		</tr>
		<c:forEach var="sl" items="${scheduleList }">
			<tr>
				<td>${sl.c_id }</td>
				<td>${sl.customerDTO.c_name }</td>
				<td>${sl.customerDTO.c_tel }</td>
				<td>${sl.roomDTO.r_name }</td>
				<td>${sl.in }</td>
				<td>${sl.out }</td>
				<td><input type="submit" id="deleteSchedule"
					name="deleteSchedule" value="����"><input type="hidden" name="s_id" value="${sl.s_id }"></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>