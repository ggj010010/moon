<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<link rel="stylesheet" type="text/css" href="/resources/js/semantic.min.css">
               <script src="/resources/js/jquery3.3.1.min.js"></script>
    <script src="/resources/js/semantic.min.js"></script>         
<script>
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			// 페이지 주소 변경(이동)
			location.href = "/board/write";
		});
	});
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
		location.href="/board/test2?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
	}
</script>
</head>
<body>
	<h2>게시글 목록</h2>
	<!-- 레코드의 갯수를 출력 -->
	<c:if test="${sessionScope.c.c_id != null}">
		<button type="button" id="btnWrite">글쓰기</button>
	</c:if>
	${map.count}개의 게시물이 있습니다.
	<table border="1" width="600px" class="ui celled table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			
		</tr>
	
	<c:forEach var="row" items="${map.list}">
		<c:choose>
			 <c:when test="${row.b_id > 0}"> 
		<!-- show 컬럼이 y일때(삭제X 글) -->
		<tr>
			<td>${row.b_id}</td>
			<!-- 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
			<td>
				<a href="${path}/board/view?bno=${row.b_id}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.b_title} 
					<!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
				<%-- 	<c:if test="${row.recnt > 0}">
						<span style="color: red;">(${row.recnt})
						</span>
					</c:if> --%>
				</a>
			</td>
			<td>${row.bc_id}</td>
			<td>
				<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
				<fmt:formatDate value="${row.b_date}" pattern="yyyy-MM-dd"/>
			</td>
			<%-- <td>${row.viewcnt}</td> --%>
		</tr>
			</c:when> 
			<c:otherwise>
		<!-- show 컬럼이 n일때(삭제된 글) -->
		<%-- <tr>
			<td colspan="5" align="left">
				<c:if test="${row.recnt > 0}">
					<a href="${path}/board/view.do?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">삭제된 게시물입니다.
					<!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
						<span style="color: red;">(${row.recnt})
						</span>
					</a>
				</c:if>
				<c:if test="${row.recnt == 0 }">
					삭제된 게시물입니다.
				</c:if>	
			</td>
		</tr> --%>
			</c:otherwise>
		</c:choose>
	</c:forEach>
		
		<!-- 페이징 -->
		<tr>
			<td colspan="4">
				<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('1')">[처음]</a>
				</c:if>
				
				<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
				</c:if>
				
				<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<!-- 현재페이지이면 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == map.boardPager.curPage}">
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
				</c:if>
				
				<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
					<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
		<!-- 페이징 -->
</table>
</body>
</html>