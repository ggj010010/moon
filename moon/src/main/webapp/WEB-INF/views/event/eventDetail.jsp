<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$j(document).ready(function(){
		
	}).on("click","#addEventDetail",function(){
		if($j("#insertEventDetail").length == 0){
			var optionHtml= "";
			<c:forEach var="pl" items="${patternList }">
			optionHtml += '<option value=${pl.p_id}>${pl.p_name}</option>';
			</c:forEach>
			$j("#ed_table").children().children().last().html(
					'<td>'
					+'<input type="hidden" id="e_id" class="insertEventDetail" value="${eventDTO.e_id }">'
					+'<select name="p_id" class="insertEventDetail">'
					+optionHtml
					+'</select>'
					+'</td><td> '
					+(($j("#ed_table").children().children().length)-2)
					+'<input type="hidden" class="insertEventDetail" name="p_sort" value="'
					+(Number($j("#ed_table").children().children(":last").children().eq(1).text().replace(/[^0-9]||[^0-9]$/gi,""))+1)
					+'">'
					+'</td><td>'
					+'<input id="insertEventDetail" type="button" value="확인">'
					+'<input id="cancleEventDetail" type="button" value="취소"></td>'
					);
			$j("#insertEventDetail").focus();
		}
	}).on("click","#insertEventDetail",function(){
		var $frm = $j(this).parent().parent().children().children(":input").not(":last");
		var param = $frm.serialize();
		
		$j.ajax({
			url : "/event/insertEventDetail?p_sort="+($j("input[value='삭제']").length+1),
			data : param,
			dataType : "json",
			type : "POST",
			success : function(returndata, textStatus, jqXHR){
				location.href = "/event/eventDetail?e_id="+returndata.e_id;
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("실패");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
			}
		});
	});
</script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="e_id" value="${eventDTO.e_id }">
<table id= "ed_table">
	<caption>
		EventDetail :: ${eventDTO.e_name }
	</caption>
	<tr>
		<td colspan="3" align="right" Style="border-style:hidden;">
			<input type="button" id="addEventDetail" value="추가" Style="width:20%"/>
		</td>
	</tr>
	<tr>
		<th>
			PatternName
		</th>
		<th>
			PatternSort
		</th>
		<th>
			btn
		</th>
	</tr>
	<c:forEach var="edl" items="${eventDetailList }">
	<tr>
		<td>
			<select class="selectEventDetail" name="p_name">
			<c:forEach var="pl" items="${patternList }">
			<option value="${pl.p_id }" ${edl.p_id  == pl.p_id ? 'selected="selected"' : '' }>
			${pl.p_name }
			</option>
			</c:forEach>
			</select>
		</td>
		<td>
			<input type="button" class="sortUp" value="△">
			${edl.p_sort }<input type="hidden"  name="p_sort" value="${edl.p_sort }">
			<input type="button" class="sortDown" value="▽">
		
		</td>
		<td>
			<input class="deleteEventDetail" type="button" value="삭제">
		</td>
	</tr>
	</c:forEach>
	<tr>
	</tr>
</table>

</body>
</html>