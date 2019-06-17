<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
function patternDetail(param){
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
					+'<td colspan="5" align="right" Style="border-style:hidden;">'
					+'<input type="hidden" class="insertPatternDetail" name="ed_id" value="'+returndata.eventDetailDTO.ed_id+'" />'	
					+'<input type="button" id="addPatternDetail" value="�߰�" Style="width:20%"/>'	
					+'</td></tr>'
					+"<th>img</th>"
					+"<th>comment</th>"
					+"<th>mv</th>"
					+"<th>sort</th>"
					+"<th>btn</th></tr>"
			);
			
			for(var i = 0 ; i<Object.keys(returndata.patternDetailList).length;i++){
					$j("#pd_table > tbody:last").append(
							"<tr><td><img src='/resources/patternDetailFileUpload/" + returndata.patternDetailList[i].pd_img+"' alt ='"+ returndata.patternDetailList[i].pd_img+"'/>"
							+"<input type='hidden' name='pd_img' value='"+returndata.patternDetailList[i].pd_img+"'/>"
							+"</td><td>" + returndata.patternDetailList[i].pd_com
							+"</td><td>" + returndata.patternDetailList[i].pd_mv
							+"</td><td>" + returndata.patternDetailList[i].pd_sort
							+"</td><td>"
							+"<input type='button' class='deletePatternDetail' value='����'/>"
							+"<input type='hidden' name='pd_id' value='"+returndata.patternDetailList[i].pd_id+"'/></td></tr>"
					);
			}
			$j("#pd_table > tbody:last").append(
					"<tr></tr>"
					);
		},
		error : function(jqXHR, textStatus, errorThrown){
			alert("����");
	    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);

		}
	});
}
	$j(document).ready(function(){
		$j("#ed_table").children().children().next().next().not(":last").on("click",function(){
			var $frm = $j(this).children().children();
			var param = $frm.serialize();
			
			new patternDetail(param);
			
		});
		
	}).on("click","#addEventDetail",function(){
		if($j("#insertEventDetail").length == 0){
			var optionHtml= "";
			<c:forEach var="pl" items="${patternList }">
			optionHtml += '<option value=${pl.p_id}>${pl.p_name}</option>';
			</c:forEach>
			$j("#ed_table").children().children().last().html(
					'<td>'
					+'<input type="hidden" name="e_id" class="insertEventDetail" value="${eventDTO.e_id }">'
					+'<select name="p_id" class="insertEventDetail">'
					+optionHtml
					+'</select>'
					+'</td><td> '
					+(($j("#ed_table").children().children().length)-2)
					+'<input type="hidden" class="insertEventDetail" name="p_sort" value="'
					+(Number($j("#ed_table").children().children(":last").children().eq(1).text().replace(/[^0-9]||[^0-9]$/gi,""))+1)
					+'">'
					+'</td><td>'
					+'<input id="insertEventDetail" type="button" value="Ȯ��">'
					+'<input id="cancleEventDetail" type="button" value="���"></td>'
					);
			$j("#insertEventDetail").focus();
		}
	}).on("click","#insertEventDetail",function(){
		var $frm = $j(this).parent().parent().children().children(":input").not(":last");
		var param = $frm.serialize();
		
		$j.ajax({
			url : "/event/insertEventDetail?p_sort="+($j("#ed_table input[value='����']").length+1),
			data : param,
			dataType : "json",
			type : "POST",
			success : function(returndata, textStatus, jqXHR){
				location.href = "/event/eventDetail?e_id="+returndata.e_id;
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("����");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
			}
		});
	}).on("click","#addPatternDetail",function(){
		
		$j.ajax({
			url : "/pattern/patternDetail",
			dataType : "json",
			type : "GET",
			// async: false,
			success : function(returndata, textStatus, jqXHR){
		$j("#pd_table").children().children().last().html(
				'<td>'
				+'<input type="file" class="insertPatternDetail" name="pd_img">'
				+'</td><td>'
 				+'<input type="text" class="insertPatternDetail" name="pd_com">'
				+'</td><td>'
				+'<input type="URL" class="insertPatternDetail" name="pd_mv">'
				+'</td><td>'
				+(($j("#pd_table").children().children().length)-2)
				+'<input type="hidden" class="insertPatternDetail" name="pd_sort" value="'
				+(Number($j("#pd_table").children().children(":last").children().eq(3).text().replace(/[^0-9]||[^0-9]$/gi,""))+1)
				+'">'
				+'</td><td> '
				+'<input id="insertPatternDetail" type="button" value="Ȯ��">'
				+'<input id="canclePatternDetail" type="button" value="���">'
				+'</td>'
				);
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("����");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
			}
		});
	}).on("click","#insertPatternDetail",function(){//end document.ready
		if($j(".insertPatternDetail").eq(1).val() == ''){
			//insert�� �ʿ��� �� ��������
			alert("�̹�������");
			var $frm = $j(".insertPatternDetail");
			var param = $frm.serialize();
			//������
			$j.ajax({
				url : "/pattern/insertPatternDetail?pd_sort="+($j("#pd_table input[value='����']").length+1),
				dataType: "json",
			    type: "GET",
			    data : param,
			    timeout: 3000,
			    success: function(returndata, textStatus, jqXHR)
			    {
			    	var json = {
			    			ed_id : returndata.ed_id
			    	}
			    	new patternDetail(json);
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
			var $frm = $j(".insertPatternDetail");
			var param = $frm.serialize();
			//������
			$j.ajax({
				url : "/pattern/insertPatternDetail?pd_sort="+($j("#pd_table input[value='����']").length+1),
				dataType: "json",
			    type: "GET",
			    data : param,
			    timeout: 3000,
			    success: function(returndata, textStatus, jqXHR)
			    {
			    	var json = {
			    			ed_id : returndata.ed_id
			    	}
			    	//���� ���ۿ� �ʿ��� form������ ������
					var formData = new FormData($j("form")[0]);
					//���Ͼ��ε忡 �ʿ��� �� ����
					$j.ajax({
						url : "/pattern/"+returndata.pd_id+"/fileUpload",
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
								url : "/pattern/"+returndata.pd_id+"/"+retuendata.fileName+"/fileNameUpdate",
								dataType: "json",
							    type: "GET",
							    timeout: 3000,
							    success: function(returndata, textStatus, jqXHR)
							    {
							    	new patternDetail(json);
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
		}
	}).on("click","#cancleEventDetail",function(){
		$j(this).parent().parent().remove();
		$j("#patternTable > tbody:last").append(
				"<tr></tr>"
				);
	}).on("click","#canclePatternDetail",function(){
		$j(this).parent().parent().remove();
		$j("#detailTable > tbody:last").append(
				"<tr></tr>"
				);
	}).on("click",".sortUpEvent",function(){
		if($j(this).parent().parent().prev().children().eq(1).text().replace(/	/g, "").replace(/\n/g, "") == "PatternSort" || $j(this).parent().parent().prev().children().eq(1).text() == null){
			alert("ó���Դϴ�.");
		}else{
			$savePrev = $j(this).parent().parent().prev().children().eq(1).text();
			$resavePrev = $savePrev.replace(/	/g, "");
			$saveThis = $j(this).parent().text();
			$resaveThis = $saveThis.replace(/	/g, "");
			
			var $frm = $j("#e_id");
			var param = $frm.serialize();
			
			$j.ajax({
				url : "/event/sortChange?prev="+$resavePrev+"&this="+$resaveThis,
				type : "POST",
				data : param,
				dataType : "JSON",
				success : function(returndata, textStatus, jqXHR){
					location.href = "/event/eventDetail?e_id="+returndata.e_id;
				},
				error : function(jqXHR, textStatus, errorThrown){
					alert("����");
			    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
				}
			});
		}
		
	}).on("click",".sortDownEvent",function(){
		if($j(this).parent().parent().next().children().eq(1).text() == "" || $j(this).parent().parent().next().children().eq(1).text() == null){
			alert("������ �Դϴ�.");
		}else{
			$saveNext = $j(this).parent().parent().next().children().eq(1).text();
			$resaveNext = $saveNext.replace(/	/g, "");
			$saveThis = $j(this).parent().text();
			$resaveThis = $saveThis.replace(/	/g, "");
			
			var $frm = $j("#e_id");
			var param = $frm.serialize();
			
			$j.ajax({
				url : "/event/sortChange?next="+$resaveNext+"&this="+$resaveThis,
				type : "POST",
				data : param,
				dataType : "JSON",
				success : function(returndata, textStatus, jqXHR){
					location.href = "/event/eventDetail?e_id="+returndata.e_id;
				},
				error : function(jqXHR, textStatus, errorThrown){
					alert("����");
			    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
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
<input type="hidden" id="e_id" value="${eventDTO.e_id }">
<table id= "ed_table">
	<caption>
		EventDetail :: ${eventDTO.e_name }
	</caption>
	<tr>
		<td colspan="3" align="right" Style="border-style:hidden;">
			<input type="button" id="addEventDetail" value="�߰�" Style="width:20%"/>
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
			<input type="button" class="sortUpEvent" value="��">
			${edl.p_sort }<input type="hidden"  name="p_sort" value="${edl.p_sort }">
			<input type="button" class="sortDownEvent" value="��">
		
		</td>
		<td>
			<input class="deleteEventDetail" type="button" value="����">
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
<form enctype="multipart/form-data" method="post">
<table id="pd_table">
<caption>
	PatternDetail
</caption>
	<tr>
		<td colspan="5" align="right" Style="border-style:hidden;">
			<input type="button" id="addPatternDetail" value="�߰�" style="visibility: hidden;"/>
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
			sort
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