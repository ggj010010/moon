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
<input type="hidden" id="e_id" value="${eventDTO.e_id }">
<table id= "eventDetail">
	<caption>
		EventDetail :: ${eventDTO.e_name }
	</caption>
	<tr>
		<td colspan="3" align="right" Style="border-style:hidden;">
			<input type="button" id="patternAdd" value="추가" Style="width:20%"/>
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
			<select class="patternSelect" name="patternName">
			<c:forEach var="pl" items="${patternList }">
			<option value="${pl.p_id }" ${edl.p_id  == pl.p_id ? 'select="selected"' : '' }>
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
		</td>
		
	</tr>
	</c:forEach>
</table>

</body>
</html>