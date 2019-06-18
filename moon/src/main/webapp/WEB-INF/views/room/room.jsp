<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$j(document).ready(function() {
	
	}).on("click","#insertRoom",function(){//end document.ready
		//Name�Է�â�� ��ĭ�ϰ�� ���â �Ŀ� Name�Է�â�� Ŀ���̵�
		if($j(".insertRoom").eq(0).val() == ''){
			alert("Name�� �Է����ֽʽÿ�.");
			$j(".insertRoom").eq(0).focus();
		//Price�Է�â�� ��ĭ�ϰ�� ���â �� Price�Է�â�� Ŀ���̵�
		}else if($j(".insertRoom").eq(2).val() == ''){//end if
			alert("Price�� �Է��� �ֽʽÿ�.");
			$j(".insertRoom").eq(2).focus();
		//Image�Է�â�� ���õ� �����̾������
		}else if($j(".insertRoom").eq(3).val() == ''){//end elseif
			//insert�� �ʿ��� �� ��������
			alert("�̹�������");
			var $frm = $j(".insertRoom");
			var param = $frm.serialize();
			//������
			$j.ajax({
				url : "/room/insertRoom",
				dataType: "json",
			    type: "GET",
			    data : param,
			    timeout: 3000,
			    success: function(returndata, textStatus, jqXHR)
			    {
			    	//���� �ּҷ� �̵�
			    	//�̵��� �����ִ� ȭ�鿡 insert�߰��� �ѷ���
			    	location.href = "/room/room";
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
			var $frm = $j(".insertRoom");
			var param = $frm.serialize();
			//������
			$j.ajax({
				url : "/room/insertRoom",
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
						url : "/room/"+returndata.r_id+"/fileUpload",
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
								url : "/room/"+returndata.r_id+"/"+retuendata.fileName+"/fileNameUpdate",
								dataType: "json",
							    type: "GET",
							    timeout: 3000,
							    success: function(returndata, textStatus, jqXHR)
							    {
							    	location.href = "/room/room";
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
	}).on("click","#deleteRoom",function(){
		var $frm = $j(this).parent().parent().children().children(".deleteRoom");
		var param = $frm.serialize();
		if(confirm("�����Ͻðڽ��ϱ�?")){
			$j.ajax({
				
				url : "/room/deleteRoom",
				type : "GET",
				dataType : "json",
				data : param,
				success : function(returndata, textStatus, jqXHR){
					
						$j.ajax({
							url : "/room/fileRemove",
							dataType: "json",
						    type: "POST",
						    data : param,
						    success: function(returndata, textStatus, jqXHR)
						    {
//									alert("�����ִ����ϻ���");
						    	location.href = "/room/room";
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
		
	}).on("click","#updateRoom",function(){
		$saveName = $j(this).parent().parent().children().eq(0).text();
		$resaveName=$saveName.replace(/	/g, "");
		$saveCom = $j(this).parent().parent().children().eq(1).text();
		$resaveCom=$saveCom.replace(/	/g, "");
		$savePrice = $j(this).parent().parent().children().eq(2).text();
		$resavePrice=$savePrice.replace(/	/g, "");
		$saveId = $j(this).next().next().val();
		$saveImgName = $j(this).parent().parent().children().eq(3).children("input").val();
		
		if($j("#updateRoomAction").length == 0){
		$j(this).parent().parent().children().eq(0).html(
		'<input type="text" name="r_name" class="updateRoom" value="'+$resaveName+'">'
					);
		$j(this).parent().parent().children().eq(1).html(
		'<input type="text" name="r_com" class="updateRoom" value="'+$resaveCom+'">'
					);
		$j(this).parent().parent().children().eq(2).html(
		'<input type="text" name="r_price" class="updateRoom" value="'+$resavePrice+'">'
					);
		$j(this).parent().parent().children().eq(3).html($saveImgName
				+'<hr/><input type="file" name="r_img" id="r_img" class="updateRoom">'
				+'<input type="hidden" name="r_img" id="fileRemove" value="'+$saveImgName+'">'
				);
		$j(this).parent().html(
				'<input type="button" id="updateRoomAction" value="Ȯ��"><input type="button" id="deleteRoom" value="����">'
				+'<input type="hidden" name="r_id" class="deleteRoom updateRoom" value="'+$saveId+'">'
				);
		}else{
			location.href = "/room/room";
		}
		
	}).on("click","#updateRoomAction",function(){
		var $frm = $j(this).parent().parent().children().children(".updateRoom");
		var param = $frm.serialize();
	
			$j.ajax({
				url : "/room/updateRoomAction",
				dataType : "json",
				type : "GET",
				data : param,
				async : "false",
				success: function(returndata, textStatus, jqXHR)
			    {
					if($j("#r_img").val() == ""){
						location.href = "/room/room";
					}else{
						var formData = new FormData($j("form")[1]);
	
						$j.ajax({
							url : "/room/"+returndata.r_id+"/fileUpload",
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
									url : "/room/fileRemove",
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
									url : "/room/"+returndata.r_id+"/"+retuendata.fileName+"/fileNameUpdate",
									dataType: "json",
								    type: "GET",
								    timeout: 3000,
								    success: function(returndata, textStatus, jqXHR)
								    {
								    	location.href = "/room/room";
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
		

	});;
	
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
			<td><input type="text" name="r_name"
				class="insertRoom"></td>
			<td><input type="text" name="r_com"
				class="insertRoom"></td>
			<td><input type="text" name="r_price"
				class="insertRoom"></td>
			<td><input type="file" name="r_img"
				class="insertRoom"></td>
			<td><input type="submit" id="insertRoom"
				value="�߰�"></td>
		</tr>
	</table>
</form>
 <form enctype="multipart/form-data" method="post">
	<table>
		<tr>
			<th>name</th>
			<th>comment</th>
			<th>price</th>
			<th>img</th>
			<th>btn</th>
		</tr>

		<c:forEach var="rl" items="${roomList}">
			<tr>
				<td>${rl.r_name }</td>
				<td>${rl.r_com }</td>
				<td>${rl.r_price }</td>
				<td><input type="hidden" class="deleteRoom" name="r_img" value="${rl.r_img }">
				<img src="/resources/roomFileUpload/${rl.r_img }" alt="${rl.r_img }">
				</td>
				<td><input type="submit" id="updateRoom" value="����">
				<input type="submit" id="deleteRoom" value="����">
				<input type="hidden" class="deleteRoom updateRoom" name="r_id" value="${rl.r_id }"></td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>