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
		//값전송
		$j.ajax({
			url : "/pattern/insertPattern",
			dataType: "json",
		    type: "GET",
		    data : param,
		    timeout: 3000,
		    success: function(returndata, textStatus, jqXHR)
		    {
		    	//하위 주소로 이동
		    	//이동시 보고있던 화면에 insert추가후 뿌려줌
		    	location.href = "/pattern/pattern";
		    },//end success
		    error : function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("실패");
		    	console.log(error);
                console.log(error.status);
		    }//end error
		});
	
		
	}).on("click","#deletePattern",function(){
		var $frm = $j(this).parent().parent().children().children(".deletePattern");
		var param = $frm.serialize();
		if(confirm("삭제하시겠습니까?")){
			$j.ajax({
				
				url : "/pattern/deletePattern",
				type : "GET",
				dataType : "json",
				data : param,
				success : function(returndata, textStatus, jqXHR){

					location.href = "/pattern/pattern";
				},
				error : function(jqXHR, textStatus, errorThrown){
				
					alert("실패");
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
			<td><input type="submit" id="insertPattern" value="추가"></td>
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
				<td><input type="submit" id="deletePattern" value="삭제">
					<input type="hidden" class="deletePattern" name="p_id"
					value="${pl.p_id }"></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>