<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$j(document).ready(function() {
	
	}).on("click","#insertEvent",function(){//end document.ready
		//Name�Է�â�� ��ĭ�ϰ�� ���â �Ŀ� Name�Է�â�� Ŀ���̵�
		if($j(".insertEvent").eq(0).val() == ''){
			alert("Name�� �Է����ֽʽÿ�.");
			$j(".insertEvent").eq(0).focus();
		//Image�Է�â�� ���õ� �����̾������
		}else if($j(".insertEvent").eq(1).val() == ''){//end elseif
			//insert�� �ʿ��� �� ��������
			alert("�̹�������");
			var $frm = $j(".insertEvent");
			var param = $frm.serialize();
			//������
			$j.ajax({
				url : "/event/insertEvent",
				dataType: "json",
			    type: "GET",
			    data : param,
			    timeout: 3000,
			    success: function(returndata, textStatus, jqXHR)
			    {
			    	//���� �ּҷ� �̵�
			    	//�̵��� �����ִ� ȭ�鿡 insert�߰��� �ѷ���
			    	location.href = "/event/event";
			    },//end success
			    error : function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    	console.log(error);
	                console.log(error.status);
			    }//end error
			});//end ajax.productInfoWriteAction
		//Image�� ���õ� ������ �������
		}else{//end elseif
			//insert�� �ʿ��� �� ��������
			var $frm = $j(".insertEvent");
			var param = $frm.serialize();
			//������
			$j.ajax({
				url : "/event/insertEvent",
				dataType: "json",
			    type: "GET",
			    data : param,
			    timeout: 3000,
			    success: function(returndata, textStatus, jqXHR)
			    {
			    	//���� ���ۿ� �ʿ��� form������ ������
					var formData = new FormData($j("form")[0]);
					//���Ͼ��ε忡 �ʿ��� �� ����
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
							//���� ���ε��Ŀ� �޾ƿ� fileName�� prdIdx���� ���� ���� prdImg������Ʈ
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
							    	alert("������Ʈ ����");
							    }//end error
							});//end ajax.fileNameUpload
						},//end success
						error : function(jqXHR, textStatus, errorThrown)
						{
							alert("���ε� ����");
							alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
						}//end error
					});//end ajax.fileUpload
			    },//end success
			    error : function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    	console.log(error);
	                console.log(error.status);
			    }//end error
			});
		}//end else
	}).on("click","#deleteEvent",function(){
		var $frm = $j(this).parent().parent().children().children(".deleteEvent");
		var param = $frm.serialize();
		if(confirm("�����Ͻðڽ��ϱ�?")){
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
//									alert("�����ִ����ϻ���");
						    	location.href = "/event/event";
						    },
						    error : function(jqXHR, textStatus, errorThrown)
						    {
						    	alert("���� ���� ����");
						    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);

						    }
						});
						
					},
				error : function(jqXHR, textStatus, errorThrown){
					alert("����");
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
				'<input type="button" id="updateEventAction" value="Ȯ��"><input type="button" id="deleteEvent" value="����">'
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
								alert("���ε� ����");
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
	// 									alert("�����ִ����ϻ���");
								    },
								    error : function(jqXHR, textStatus, errorThrown)
								    {
								    	alert("���� ���� ����");
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
								    	alert("������Ʈ ����");
								    }
								});
							},
							error : function(jqXHR, textStatus, errorThrown)
							{
								alert("���ε� ����");
								alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
							}
							
						});
					}
					
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
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
			<td><input type="button" value="����" onClick="location.href='/manager/managerMain'"></td>
			<td><input type="button" value="�� ����" onClick="location.href='/room/room'"></td>
			<td><input type="button" value="�̺�Ʈ ����" onClick="location.href='/event/event'"></td>
			<td><input type="button" value="���� ����" onClick="location.href='/schedule/schedule'"></td>
			<td><input type="button" value="�� ����" onClick="location.href='/customer/customer'"></td>
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
				value="�߰�"></td>
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
				<td><input type="submit" id="updateEvent" value="����">
				<input type="submit" id="deleteEvent" value="����">
				<input type="hidden" class="deleteEvent updateEvent" name="e_id" value="${el.e_id }"></td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>