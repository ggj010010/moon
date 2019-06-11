<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$j(document).ready(function() {

	}).on("click","#deleteCustomer",function() {//end click.#deleteCustomer
				//삭제에 필요하값 불러옴
				var $frm = $j(this).parent().prev().prev().prev().prev().prev().prev().children();
				var param = $frm.serialize();
				//ajax 선택한 comcode data 조회
				//변수에 데이터 여부값 저장
				$j.ajax({
					url : "/customer/deleteCustomer",
					dataType : "json",
					type : "GET",
					data : param,
					success : function(returndata, textStatus, jqXHR) {
						location.href = "/customer/customer";
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("실패");
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
			<th>id</th>
			<th>pw</th>
			<th>tel</th>
			<th>sex</th>
			<th>name</th>
			<th>birth</th>
			<th>삭제</th>
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
					name="deleteCustomer" value="삭제"></td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>