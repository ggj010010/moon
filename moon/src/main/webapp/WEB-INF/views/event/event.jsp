<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$j(document).ready(function() {
	
	}).on("click","#insertEvent",function(){//end document.ready
		//Name입력창이 빈칸일경우 경고창 후에 Name입력창에 커서이동
		if($j(".insertEvent").eq(0).val() == ''){
			alert("Name을 입력해주십시오.");
			$j(".insertEvent").eq(0).focus();
		//Image입력창에 선택된 파일이없을경우
		}else if($j(".insertEvent").eq(1).val() == ''){//end elseif
			//insert에 필요한 값 가져오기
			alert("이미지없음");
			var $frm = $j(".insertEvent");
			var param = $frm.serialize();
			//값전송
			$j.ajax({
				url : "/event/insertEvent",
				dataType: "json",
			    type: "GET",
			    data : param,
			    timeout: 3000,
			    success: function(returndata, textStatus, jqXHR)
			    {
			    	//하위 주소로 이동
			    	//이동시 보고있던 화면에 insert추가후 뿌려줌
			    	location.href = "/event/event";
			    },//end success
			    error : function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    	console.log(error);
	                console.log(error.status);
			    }//end error
			});//end ajax.productInfoWriteAction
		//Image에 선택된 파일이 있을경우
		}else{//end elseif
			//insert에 필요한 값 가져오기
			var $frm = $j(".insertEvent");
			var param = $frm.serialize();
			//값전송
			$j.ajax({
				url : "/event/insertEvent",
				dataType: "json",
			    type: "GET",
			    data : param,
			    timeout: 3000,
			    success: function(returndata, textStatus, jqXHR)
			    {
			    	//파일 전송에 필요한 form데이터 가져옴
					var formData = new FormData($j("form")[0]);
					//파일업로드에 필요하 값 전송
					$j.ajax({
						url : "/event/"+returndata.e_id+"/fileUpload",
						type : "POST",
						dataType: "json",
						data : formData,
						timeout: 3000,
						processData : false,
						contentType : false,
						success : function(retuendata, textStatus, jqXHT)
						{
							//파일 업로드후에 받아온 fileName을 prdIdx값이 같은 곳에 prdImg업데이트
							$j.ajax({
								url : "/event/"+returndata.e_id+"/"+retuendata.fileName+"/fileNameUpdate",
								dataType: "json",
							    type: "GET",
							    timeout: 3000,
							    success: function(returndata, textStatus, jqXHR)
							    {
							    	location.href = "/event/event";
							    },//end success
							    error : function(jqXHR, textStatus, errorThrown)
							    {
							    	alert("업데이트 실패");
							    }//end error
							});//end ajax.fileNameUpload
						},//end success
						error : function(jqXHR, textStatus, errorThrown)
						{
							alert("업로드 실패");
							alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
						}//end error
					});//end ajax.fileUpload
			    },//end success
			    error : function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    	console.log(error);
	                console.log(error.status);
			    }//end error
			});
		}//end else
	}).on("click","#deleteEvent",function(){
		var $frm = $j(this).parent().parent().children().children(".deleteEvent");
		var param = $frm.serialize();
		if(confirm("삭제하시겠습니까?")){
			$j.ajax({
				
				url : "/event/deleteEvent",
				type : "GET",
				dataType : "json",
				data : param,
				success : function(returndata, textStatus, jqXHR){
					
						$j.ajax({
							url : "/event/fileRemove",
							dataType: "json",
						    type: "POST",
						    data : param,
						    success: function(returndata, textStatus, jqXHR)
						    {
//									alert("원래있던파일삭제");
						    	location.href = "/event/event";
						    },
						    error : function(jqXHR, textStatus, errorThrown)
						    {
						    	alert("파일 삭제 실패");
						    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);

						    }
						});
						
					},
				error : function(jqXHR, textStatus, errorThrown){
					alert("실패");
				}
			});
		}
		
	}).on("click","#updateEvent",function(){
		$saveName = $j(this).parent().parent().children().eq(0).text();
		$resaveName=$saveName.replace(/	/g, "");
		$saveCom = $j(this).parent().parent().children().eq(2).text();
		$resaveCom=$saveCom.replace(/	/g, "");
		$saveStart = $j(this).parent().parent().children().eq(3).text();
		$resaveStart=$saveStart.replace(/	/g, "");
		$saveEnd = $j(this).parent().parent().children().eq(4).text();
		$resaveEnd=$saveEnd.replace(/	/g, "");
		$saveId = $j(this).next().next().val();
		$saveImgName = $j(this).parent().parent().children().eq(1).children("input").val();
		
		if($j("#updateEventAction").length == 0){
		$j(this).parent().parent().children().eq(0).html(
		'<input type="text" name="e_name" class="updateEvent" value="'+$resaveName+'">'
					);
		$j(this).parent().parent().children().eq(1).html($saveImgName
				+'<hr/><input type="file" name="e_img" id="e_img" class="updateEvent">'
				+'<input type="hidden" name="e_img" id="fileRemove" value="'+$saveImgName+'">'
				);
		$j(this).parent().parent().children().eq(2).html(
		'<input type="text" name="e_com" class="updateEvent" value="'+$resaveCom+'">'
					);
		$j(this).parent().parent().children().eq(3).html(
		'<input type="date" name="e_start" class="updateEvent" value="'+$resaveStart+'">'
					);
		$j(this).parent().parent().children().eq(4).html(
		'<input type="date" name="e_end" class="updateEvent" value="'+$resaveEnd+'">'
					);
		$j(this).parent().html(
				'<input type="button" id="updateEventAction" value="확인"><input type="button" id="deleteEvent" value="삭제">'
				+'<input type="hidden" name="e_id" class="deleteEvent updateEvent" value="'+$saveId+'">'
				);
		}else{
			location.href = "/event/event";
		}
		
	}).on("click","#updateEventAction",function(){
		var $frm = $j(this).parent().parent().children().children(".updateEvent");
		var param = $frm.serialize();
	
			$j.ajax({
				url : "/event/updateEventAction",
				dataType : "json",
				type : "GET",
				data : param,
				async : "false",
				success: function(returndata, textStatus, jqXHR)
			    {
					if($j("#e_img").val() == ""){
						location.href = "/event/event";
					}else{
						var formData = new FormData($j("form")[1]);
	
						$j.ajax({
							url : "/event/"+returndata.e_id+"/fileUpload",
							type : "POST",
							dataType: "json",
							data : formData,
							timeout: 3000,
							processData : false,
							contentType : false,
							success : function(retuendata, textStatus, jqXHT)
							{
								alert("업로드 성공");
								alert(retuendata.fileName);
								
								var $frm = $j("#fileRemove");
								var param = $frm.serialize();
								$j.ajax({
									url : "/event/fileRemove",
									dataType: "json",
								    type: "POST",
								    data : param,
								    success: function(returndata, textStatus, jqXHR)
								    {
	// 									alert("원래있던파일삭제");
								    },
								    error : function(jqXHR, textStatus, errorThrown)
								    {
								    	alert("파일 삭제 실패");
								    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
	
								    }
								});
								
								$j.ajax({
									url : "/event/"+returndata.e_id+"/"+retuendata.fileName+"/fileNameUpdate",
									dataType: "json",
								    type: "GET",
								    timeout: 3000,
								    success: function(returndata, textStatus, jqXHR)
								    {
								    	location.href = "/event/event";
								    },
								    error : function(jqXHR, textStatus, errorThrown)
								    {
								    	alert("업데이트 실패");
								    }
								});
							},
							error : function(jqXHR, textStatus, errorThrown)
							{
								alert("업로드 실패");
								alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
							}
							
						});
					}
					
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
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
<form enctype="multipart/form-data" method="post">
 	<table>
		<tr>
			<td><input type="button" value="메인" onClick="location.href='/manager/managerMain'"></td>
			<td><input type="button" value="방 관리" onClick="location.href='/room/room'"></td>
			<td><input type="button" value="이벤트 관리" onClick="location.href='/event/event'"></td>
			<td><input type="button" value="예약 관리" onClick="location.href='/schedule/schedule'"></td>
			<td><input type="button" value="고객 관리" onClick="location.href='/customer/customer'"></td>
		</tr>
	</table>
	<table>
		<tr>
			<td><input type="text" name="e_name"
				class="insertEvent"></td>
			<td><input type="file" name="e_img"
				class="insertEvent"></td>
			<td><input type="text" name="e_com"
				class="insertEvent"></td>
			<td><input type="date" name="e_start"
				class="insertEvent"></td>
			<td><input type="date" name="e_end"
				class="insertEvent"></td>
			<td><input type="submit" id="insertEvent"
				value="추가"></td>
		</tr>
	</table>
</form>
<form enctype="multipart/form-data" method="post">
	<table>
		<tr>
			<th>name</th>
			<th>img</th>
			<th>comment</th>
			<th>start</th>
			<th>end</th>
			<th>btn</th>
		</tr>
		<c:forEach var="el" items="${eventList }">
			<tr>
				<td><a href = "/event/eventDetail?e_id=${el.e_id }">${el.e_name }</a></td>
				<td><input type="hidden" class="deleteEvent" name="e_img" value="${el.e_img }">
				<img src="/resources/eventFileUpload/${el.e_img }" alt="${el.e_img }">
				</td>
				<td>${el.e_com }</td>
				<td>${el.e_start }</td>
				<td>${el.e_end }</td>
				<td><input type="submit" id="updateEvent" value="수정">
				<input type="submit" id="deleteEvent" value="삭제">
				<input type="hidden" class="deleteEvent updateEvent" name="e_id" value="${el.e_id }"></td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>