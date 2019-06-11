<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$j(document).ready(function() {
	
	}).on("click","#insertPattern",function(){
		
		var $frm = $j(".insertPattern");
		var param = $frm.serialize();
		//������
		$j.ajax({
			url : "/pattern/insertPattern",
			dataType: "json",
		    type: "GET",
		    data : param,
		    timeout: 3000,
		    success: function(returndata, textStatus, jqXHR)
		    {
		    	//���� �ּҷ� �̵�
		    	//�̵��� �����ִ� ȭ�鿡 insert�߰��� �ѷ���
		    	location.href = "/pattern/pattern";
		    },//end success
		    error : function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("����");
		    	console.log(error);
                console.log(error.status);
		    }//end error
		});
	
		
	}).on("click","#deletePattern",function(){
		var $frm = $j(this).parent().parent().children().children(".deletePattern");
		var param = $frm.serialize();
		if(confirm("�����Ͻðڽ��ϱ�?")){
			$j.ajax({
				
				url : "/pattern/deletePattern",
				type : "GET",
				dataType : "json",
				data : param,
				success : function(returndata, textStatus, jqXHR){

					location.href = "/pattern/pattern";
				},
				error : function(jqXHR, textStatus, errorThrown){
				
					alert("����");
				}
			});
		}
	});
</script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td><input type="text" name="p_name" class="insertPattern"></td>
			<td><input type="submit" id="insertPattern" value="�߰�"></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>name</th>
			<th>btn</th>
		</tr>
		<c:forEach var="pl" items="${patternList }">
			<tr>
				<td>${pl.p_name }</td>
				<td><input type="submit" id="deletePattern" value="����">
					<input type="hidden" class="deletePattern" name="p_id"
					value="${pl.p_id }"></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>