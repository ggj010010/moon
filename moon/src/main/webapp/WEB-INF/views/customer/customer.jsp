<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$j(document).ready(function() {

	}).on("click","#deleteCustomer",function() {//end click.#deleteCustomer
				//������ �ʿ��ϰ� �ҷ���
				var $frm = $j(this).parent().prev().prev().prev().prev().prev().prev().children();
				var param = $frm.serialize();
				//ajax ������ comcode data ��ȸ
				//������ ������ ���ΰ� ����
				$j.ajax({
					url : "/customer/deleteCustomer",
					dataType : "json",
					type : "GET",
					data : param,
					success : function(returndata, textStatus, jqXHR) {
						location.href = "/customer/customer";
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
			<th>id</th>
			<th>pw</th>
			<th>tel</th>
			<th>sex</th>
			<th>name</th>
			<th>birth</th>
			<th>����</th>
		</tr>
		<c:forEach var="cl" items="${customerList }">
			<tr>
				<td>${cl.c_id }<input type="hidden" name="c_id" value="${cl.c_id }"></td>
				<td>${cl.c_pw }</td>
				<td>${cl.c_tel }</td>
				<td>${cl.c_sex }</td>
				<td>${cl.c_name }</td>
				<td>${cl.c_birth }</td>
				<td><input type="submit" id="deleteCustomer"
					name="deleteCustomer" value="����"></td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>