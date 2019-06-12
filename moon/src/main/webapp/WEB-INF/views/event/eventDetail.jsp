<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$j(document).ready(function(){
		$j("#ed_table").children().children().next().next().not(":last").on("click",function(){
			var $frm = $j(this).children().children();
			var param = $frm.serialize();
			
			$j.ajax({
				url : "/pattern/patternDetail",
				dataType : "json",
				type : "GET",
				data : param,
				success : function(returndata, textStatus, jqXHR){
					$j("#pd_table caption").html(
							"PatternDetail :: "+returndata.eventDetailDTO.p_sort	
					);
					$j("#pd_table > tbody:last").html(
							"<tr>"
							+'<td colspan="4" align="right" Style="border-style:hidden;">'
							+'<input type="hidden" name="ed_id" value="'+returndata.ed_id+'" />'	
							+'<input type="button" id="addPatternDetail" value="추가" Style="width:20%"/>'	
							+'</td></tr>'
							+"<th>img</th>"
							+"<th>comment</th>"
							+"<th>mv</th>"
							+"<th>btn</th></tr>"
					);
					
					for(var i = 0 ; i<Object.keys(returndata.patternDetailList).length;i++){
							$j("#pd_table > tbody:last").append(
									"<tr><td><img width='100' height='100' src='/resources/productPatternDetailFileUpload/" + returndata.patternDetailList[i].pd_img+"' alt ='"+ returndata.patternDetailList[i].pd_img+"'/>"
									+"<input type='hidden' name='pd_img' value='"+returndata.patternDetailList[i].pd_img+"'/>"
									+"</td><td>" + returndata.patternDetailList[i].pd_com
									+"</td><td>" + returndata.patternDetailList[i].pd_mv
									+"</td><td><input type='button' class='updatePatternDetail' value='수정'/>"
									+"<input type='button' class='deletePatternDetail' value='삭제'/>"
									+"<input type='hidden' name='pd_id' value='"+returndata.patternDetailList[i].pd_id+"'/></td></tr>"
							);
					}
					$j("#pd_table > tbody:last").append(
							"<tr></tr>"
							);
				},
				error : function(jqXHR, textStatus, errorThrown){
					alert("실패");
			    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);

				}
			});
			
		});
		
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
			<input type="hidden" name="ed_id" class="deleteEventDetail"  value="${edl.ed_id }">
		</td>
	</tr>
	</c:forEach>
	<tr>
	</tr>
</table>
<br/>
<hr/>
<br/>
<form>
<table id="pd_table">
<caption>
	PatternDetail
</caption>
	<tr>
		<td colspan="4" align="right" Style="border-style:hidden;">
			<input type="button" id="addPatternDetail" value="추가" style="visibility: hidden;"/>
		</td>
	</tr>
	<tr>
		<th>
			img
		</th>
		<th>
			comment
		</th>
		<th>
			mv
		</th>
		<th>
			Btn
		</th>
	</tr>
	<tr>
	</tr>
</table>
</form>

</body>
</html>