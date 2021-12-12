<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0">


		<title>协议信息</title>
		<meta name="keywords" content="医疗管理平台-协议签订">
		<meta name="description" content="医疗管理平台-协议签订">

		<link rel="shortcut icon" href="favicon.ico">
		<link href="/${appName}/commons/jslib/hplus/css/bootstrap.min.css"
			rel="stylesheet">
		<link
			href="/${appName}/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
			rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/animate.min.css"
			rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/style.min.css?v=4.0.0"
			rel="stylesheet">

		<!-- ztree css -->
		<link rel="stylesheet"
			href="/${appName}/commons/jslib/ztreeV3.5.15/css/zTreeStyle/zTreeStyle.css"
			type="text/css">
		<!-- ztree css -->

		<!-- Sweet Alert -->
		<link
			href="/${appName}/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css"
			rel="stylesheet">
		<!-- Sweet Alert -->
		<link href="/${appName}/commons/css/qy-style.css" rel="stylesheet">
		
		<link href="/${appName}/commons/jslib/hplus/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
		
		<link
			href="/${appName}/commons/jslib/hplus/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
			rel="stylesheet">

		<script src="/${appName}/commons/jslib/hplus/js/jquery.min.js?v=2.1.4"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>

		<script
			src="/${appName}/commons/jslib/hplus/js/bootstrap.min.js?v=3.3.5"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/content.min.js?v=1.0.0"></script>


		<!-- jquery validate -->
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>

		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>
		<!-- jquery validate -->

		<!-- ztree js -->
		<script type="text/javascript"
			src="/${appName}/commons/jslib/ztreeV3.5.15/jquery.ztree.core-3.5.min.js"></script>
		<script type="text/javascript"
			src="/${appName}/commons/jslib/ztreeV3.5.15/jquery.ztree.excheck-3.5.min.js"></script>
		<script type="text/javascript"
			src="/${appName}/commons/jslib/js-gmxt-define/protocolType_radio.js"></script>
		<!-- ztree js -->

		<script type="text/javascript"
			src="/${appName}/commons/jslib/jquery-form.js"></script>
		<!-- Sweet Alert -->
		<script type="text/javascript"
			src="/${appName}/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
		<!-- Sweet Alert -->

		<!-- laydate -->
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/layer/laydate/laydate.js"></script>
		<!-- laydate -->
		
		
		<script src="/${appName}/commons/jslib/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>
		
		
		<script src="/${appName}/commons/jslib/layer-master/src/layer.js"></script>
		
		
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/iCheck/icheck.min.js"></script>
			
		
		<script src="/${appName}/commons/jslib/layer/layer.js"></script>
		<script
			src="/${appName}/commons/jslib/CommonValue.js"></script>

		<script>
		
		
		var loading_index;
        $(document).ready(function(){
  
  			//加载信息
        	loadData();
        	
        	$("#protocolForm").validate({ 
				rules: {
					secondName_txt: {
		                required: true,
		                maxlength: 100
		            },
		            secondAddress_txt: {
		             	required: true,
		             	maxlength: 500
		            },
		            secondJurPerson_txt:{
		            	required: true,
		            	maxlength: 100
		            },
		            secJurPerCD_txt:{
		            	//required: true,
		            	maxlength: 50
		            }
		 	       },  
		 	       messages:{  
		 	    	  secondName_txt: {
							required: "乙方名称不能为空",
							maxlength: "必须是100个字符以内"
						},
						secondAddress_txt: {
			             	required: "乙方地址不能为空",
							maxlength: "必须是500个字符以内"
			            },
			            secondJurPerson_txt:{
			            	required: "法人代表不能为空",
							maxlength: "必须是100个字符以内"
			            },
			            secJurPerCD_txt:{
			            	//required: "法人代表身份证号码不能为空",
							maxlength: "必须是50个字符以内"
			            }
						
		 	       },
		  	      submitHandler:function(form){ 

		  	      	swal({
					        title: $("#proText").val(),
					        text: "确定同意协议？",
					        type: "warning",
					        showCancelButton: true,
					        confirmButtonColor: "#DD6B55",
					        confirmButtonText: "确定",
					        closeOnConfirm: false
					    }, function () {
					       ajaxSubmitForm();
					    });
		  	      	
		   	      }
			    });
			    
			    
			    
			    $("#refuseForm").validate({ 
				rules: {
					refuse: {
		                required: true,
		                maxlength: 100
		            }
		 	       },  
		 	       messages:{  
		 	    	  refuse: {
							required: "拒绝理由不能为空",
							maxlength: "必须是200个字符以内"
						}
						
		 	       },
		  	      submitHandler:function(form){ 
		  	      
		  	      		swal({
					        title: "拒绝协议",
					        text: "确定拒绝协议？",
					        type: "warning",
					        showCancelButton: true,
					        confirmButtonColor: "#DD6B55",
					        confirmButtonText: "确定",
					        closeOnConfirm: false
					    }, function () {
					       	ajaxSubmitRefuseForm();
					    });
					    
		  	      	
		   	      }
			    });
        });
        
        
        //表单提交
function ajaxSubmitForm() {
   　　　　var option = {
         　　 url:'/${appName}/manager/UProtocolInfoController/agreeProtocol',
        　　  type : 'POST',
         　　 dataType : 'json',
         	data:{
         	},
        　　  success : function(data) {
        		if(data.success)
        		{
        			$('#protocolForm')[0].reset();
        			reloadData();
        		}
        		
        		swal({
					title:data.message,
					text:""
				});
              
          },
          error: function(data) {
              	swal({title:"操作失败",text:""});
          }
       };
      $("#protocolForm").ajaxSubmit(option);
      return false; //最好返回false，因为如果按钮类型是submit,则表单自己又会提交一次;返回false阻止表单再次提交
  }
  
  
  
         //表单拒绝理由提交
function ajaxSubmitRefuseForm() {
   　　　　var option = {
         　　 url:'/${appName}/manager/UProtocolInfoController/refuseProtocol',
        　　  type : 'POST',
         　　 dataType : 'json',
         	data:{
         		protocolId:$("#protocolId").val()
         	},
        　　  success : function(data) {
        		if(data.success)
        		{
        			$('#refuseForm')[0].reset();
        			$('#refuseWin').modal('hide');
        			reloadData();
        		}
        		
        		swal({
					title:data.message,
					text:""
				});
              
          },
          error: function(data) {
              	swal({title:"操作失败",text:""});
          }
       };
      $("#refuseForm").ajaxSubmit(option);
      return false; //最好返回false，因为如果按钮类型是submit,则表单自己又会提交一次;返回false阻止表单再次提交
  }
        
  
  
  //跳转至列表页面
	function forwardListPage()
	{
		var forwardMode=$("#forwardMode").val();
		
		if(forwardMode=='lst')
		{
			window.location.href="/${appName}/webviews/u_protocolinfo/uprotocolList.jsp"; 
		}else if(forwardMode=='sendRemind'||forwardMode=='exp')
		{
			var expDate=$("#expDate").val();
			window.location.href="/${appName}/webviews/remind/u_remindList.jsp?forwardMode="+forwardMode+"&expDate="+expDate; 
		}
	}
	
	function expProtocol()
	{
		var protocolId=$("#protocolId").val();
		$.ajax({
       				url:'/${appName}/manager/UProtocolInfoController/expProtocol',	
       				dataType:'json',
       				data:{
       					protocolId:protocolId,
       					mode:"Protocol_Part"
       				},
       				type:'post',
       				success:function(data){
						window.location.href ="/${appName}"+data.rtnWebPath;
       				},
       				error:function(){
       					
       				}
       	});
	}
	
	//加载数据
	function loadData()
	{
		var protocolId=GetQueryString("id");
		$("#protocolId").val(protocolId);
		
		var forwardMode=GetQueryString("forwardMode");
		$("#forwardMode").val(forwardMode.split('?')[0]);
		
		var expDate = GetQueryString("expDate");
		
		if($("#forwardMode").val()=='exp')
		{
			$("#expDate").val(expDate.split('?')[0]);
		}
		//loading层
		loading_index = layer.load(1, {
		  	shade: [0.3,'#fff'] //0.1透明度的白色背景
		});
		$.ajax({
       				url:'/${appName}/manager/MProtocolInfoController/getDataByProtocolId_Cache',	
       				dataType:'json',
       				data:{
       					protocolId:protocolId
       				},
       				type:'post',
       				success:function(data){
       					layer.close(loading_index);
       				
       					if(data.dataCount>0)
       					{
       						setIFrameContent("protocolContentFrame",data.ProProtocol.protocolContent);
       						$("#protocolCode").html(data.ProProtocol.code);
       						$("#protocolType").html(data.ProProtocol.protocolTypeName);
       						$("#effectiveStartDate").html(data.ProProtocol.effectiveStartDate);
       						$("#effectiveEndDate").html(data.ProProtocol.effectiveEndDate);
       						if(data.ProProtocol.unitHandleFlag=='01')
       						{
       							$("#unitHandleFlag").html("已处理");
       						}else if(data.ProProtocol.unitHandleFlag=='02')
       						{
       							$("#unitHandleFlag").html("未处理");
       						}else if(data.ProProtocol.unitHandleFlag=='03')
       						{
       							$("#unitHandleFlag").html("<font color=\"#FF0000\">逾期未确认</font>");
       						}
       						
       						if(data.ProProtocol.agreeOrRefuse=='02')
       						{
       							$("#refuse_Div").show();
       							$("#refuse").html(data.ProProtocol.refuse);
       						}else
       						{
       							$("#refuse_Div").hide();
       							$("#refuse").html('');
       						}
       						
       						if(data.ProProtocol.effectFlag=='01')
       						{
       							//中止协议状态（01：未开始；02：中止协议中；03：结束）
       							if(data.ProProtocol.stopState=='02')
       							{
       								$("#effectFlag").html("未生效");
       							}else
       							{
       								$("#effectFlag").html("已生效");
       							}
       						}else if(data.ProProtocol.effectFlag=='02')
       						{
       							$("#effectFlag").html("未生效");
       						}
   
       						if(data.ProProtocol.stopFlag=='02')
       						{
       							$("#stopFlag").html('<font color=\"#FF0000\">终止</font>');
       							
       							$("#stopOrOffReason").html('<font color=\"#FF0000\">'+data.ProProtocol.stopReason+'</font>');
       							$("#offDate_Div").show();
       							$("#stopOrOffReason_Div").show();
       							
       							$("#offLabel").hide();
       							$("#stopLabel").show();
       							$("#stopDate").html(data.ProProtocol.stopDate);
       							$("#offStartDate_span").html('');
       							$("#offEndDate_span").html('');
       						}else if(data.ProProtocol.stopFlag=='01')
       						{
       							//中止协议状态（01：未开始；02：中止协议中；03：结束）
       							if(data.ProProtocol.stopState=='02')
       							{
       								$("#stopFlag").html('<font color=\"#FF0000\">中止</font>');
	       							$("#offDate_Div").show();
	       							
	       							$("#stopOrOffReason").html('<font color=\"#FF0000\">'+data.ProProtocol.offReason+'</font>');
       								$("#stopOrOffReason_Div").show();
	       							
	       							$("#offLabel").show();
	       							$("#stopLabel").hide();
	       							$("#offStartDate_span").html(data.ProProtocol.offStartDate);
	       							$("#offEndDate_span").html(data.ProProtocol.offEndDate);
	       							$("#stopDate").html('');
       							}else
       							{
       								$("#stopFlag").html('');
       								$("#offDate_Div").hide();
       								
       								$("#stopOrOffReason").html('');
       								$("#stopOrOffReason_Div").hide();
       								
       								$("#offLabel").hide();
	       							$("#stopLabel").hide();
	       							$("#offStartDate_span").html('');
	       							$("#offEndDate_span").html('');
	       							$("#stopDate").html('');
       							}
       						}
       						
       						$("#firstName").html(data.ProProtocol.firstName);
       						$("#firstJurPerson").html(data.ProProtocol.firstJurPerson);
       						$("#firstSignDate").html(data.ProProtocol.firstSignDate);
       						$("#firstAddress").html(data.ProProtocol.firstAddress);
       						
       						//根据乙方处理结果显示页面
       						//机构处理状态 01：已处理；02：未处理；03：逾期未确认；
	       						if(data.ProProtocol.unitHandleFlag=='01')
	       						{
	       								$("#secondName_span").html(data.ProProtocol.secondName);
		       							$("#secondAddress_span").html(data.ProProtocol.secondAddress);
		       							$("#secondJurPerson_span").html(data.ProProtocol.secondJurPerson);
		       							$("#secJurPerCD_span").html(data.ProProtocol.secJurPerCD);
		       							
		       							$("#secondName_Label").show();
		       							$("#secondAddress_Label").show();
		       							$("#secondJurPerson_Label").show();
		       							$("#secJurPerCD_Label").show();
		       							
		       							$("#secondName_Div").hide();
		       							$("#secondAddress_Div").hide();
		       							$("#secondJurPerson_Div").hide();
		       							$("#secJurPerCD_Div").hide();

		       							$("#agreeProtocol").hide();
		       							$("#refuseProtocol").hide();
	       						}else if(data.ProProtocol.unitHandleFlag=='03')
	       						{
	       								if(data.ProProtocol.afterDealFlg!='1')
	       								{
	       									$("#secondName_span").html('');
			       							$("#secondAddress_span").html('');
			       							$("#secondJurPerson_span").html('');
			       							$("#secJurPerCD_span").html('');
			       							
			       							$("#secondName_Label").show();
			       							$("#secondAddress_Label").show();
			       							$("#secondJurPerson_Label").show();
			       							$("#secJurPerCD_Label").show();
			       							
			       							$("#secondName_Div").hide();
			       							$("#secondAddress_Div").hide();
			       							$("#secondJurPerson_Div").hide();
			       							$("#secJurPerCD_Div").hide();
			       							
			       							
			       							$("#agreeProtocol").hide();
			       							$("#refuseProtocol").hide();
	       								}
	       								
	       						}else if(data.ProProtocol.unitHandleFlag=='02')
	       						{
	       							//终止
	       							if(data.ProProtocol.stopFlag=='02')
		       						{
		       								$("#secondName_span").html(data.ProProtocol.secondName);
			       							$("#secondAddress_span").html(data.ProProtocol.secondAddress);
			       							$("#secondJurPerson_span").html(data.ProProtocol.secondJurPerson);
			       							$("#secJurPerCD_span").html(data.ProProtocol.secJurPerCD);
			       							
			       							$("#secondName_Label").show();
			       							$("#secondAddress_Label").show();
			       							$("#secondJurPerson_Label").show();
			       							$("#secJurPerCD_Label").show();
			       							
			       							$("#secondName_Div").hide();
			       							$("#secondAddress_Div").hide();
			       							$("#secondJurPerson_Div").hide();
			       							$("#secJurPerCD_Div").hide();
			       							
			       							
			       							$("#agreeProtocol").hide();
			       							$("#refuseProtocol").hide();
		       						}
		       						//中止
		       						else if(data.ProProtocol.stopFlag=='01')
		       						{
		       							//中止协议状态（01：未开始；02：中止协议中；03：结束）
		       							if(data.ProProtocol.stopState=='02')
		       							{
		       								$("#secondName_span").html(data.ProProtocol.secondName);
			       							$("#secondAddress_span").html(data.ProProtocol.secondAddress);
			       							$("#secondJurPerson_span").html(data.ProProtocol.secondJurPerson);
			       							$("#secJurPerCD_span").html(data.ProProtocol.secJurPerCD);
			       							
			       							$("#secondName_Label").show();
			       							$("#secondAddress_Label").show();
			       							$("#secondJurPerson_Label").show();
			       							$("#secJurPerCD_Label").show();
			       							
			       							$("#secondName_Div").hide();
			       							$("#secondAddress_Div").hide();
			       							$("#secondJurPerson_Div").hide();
			       							$("#secJurPerCD_Div").hide();
			       							
			       							
			       							$("#agreeProtocol").hide();
			       							$("#refuseProtocol").hide();
		       							}
		       						}
	       						}
       						
       						$("#secondSignDate").html(data.ProProtocol.secondSignDate);
       					}
       					
       					$("#proText").val(data.proText);
  
       				},
       				error:function(){
       					layer.close(loading_index);
       				}
       				});
	}
	
	
	//加载数据
	function reloadData()
	{
		var protocolId=$("#protocolId").val();
		//loading层
		loading_index = layer.load(1, {
		  	shade: [0.3,'#fff'] //0.1透明度的白色背景
		});
		$.ajax({
       				url:'/${appName}/manager/MProtocolInfoController/getDataByProtocolId_Cache',	
       				dataType:'json',
       				data:{
       					protocolId:protocolId
       				},
       				type:'post',
       				success:function(data){
       				
       					layer.close(loading_index);
       					if(data.dataCount>0)
       					{
       						setIFrameContent("protocolContentFrame",data.ProProtocol.protocolContent);
       						$("#protocolCode").html(data.ProProtocol.code);
       						$("#protocolType").html(data.ProProtocol.protocolTypeName);
       						$("#effectiveStartDate").html(data.ProProtocol.effectiveStartDate);
       						$("#effectiveEndDate").html(data.ProProtocol.effectiveEndDate);
       						if(data.ProProtocol.unitHandleFlag=='01')
       						{
       							$("#unitHandleFlag").html("已处理");
       						}else if(data.ProProtocol.unitHandleFlag=='02')
       						{
       							$("#unitHandleFlag").html("未处理");
       						}else if(data.ProProtocol.unitHandleFlag=='03')
       						{
       							$("#unitHandleFlag").html("<<font color=\"#FF0000\">逾期未确认</font>");
       						}
       					       						
       						if(data.ProProtocol.agreeOrRefuse=='02')
       						{
       							$("#refuse_Div").show();
       							$("#refuse").html(data.ProProtocol.refuse);
       						}else
       						{
       							$("#refuse_Div").hide();
       							$("#refuse").html('');
       						}
       						
       						if(data.ProProtocol.effectFlag=='01')
       						{
       							//中止协议状态（01：未开始；02：中止协议中；03：结束）
       							if(data.ProProtocol.stopState=='02')
       							{
       								$("#effectFlag").html("未生效");
       							}else
       							{
       								$("#effectFlag").html("已生效");
       							}
       						}else if(data.ProProtocol.effectFlag=='02')
       						{
       							$("#effectFlag").html("未生效");
       						}
   
       						if(data.ProProtocol.stopFlag=='02')
       						{
       							$("#stopFlag").html('<font color=\"#FF0000\">终止</font>');
       							
       							$("#stopOrOffReason").html('<font color=\"#FF0000\">'+data.ProProtocol.stopReason+'</font>');
       							$("#offDate_Div").show();
       							$("#stopOrOffReason_Div").show();
       							
       							$("#offLabel").hide();
       							$("#stopLabel").show();
       							$("#stopDate").html(data.ProProtocol.stopDate);
       							$("#offStartDate_span").html('');
       							$("#offEndDate_span").html('');
       						}else if(data.ProProtocol.stopFlag=='01')
       						{
       							//中止协议状态（01：未开始；02：中止协议中；03：结束）
       							if(data.ProProtocol.stopState=='02')
       							{
       								$("#stopFlag").html('<font color=\"#FF0000\">中止</font>');
	       							$("#offDate_Div").show();
	       							
	       							$("#stopOrOffReason").html('<font color=\"#FF0000\">'+data.ProProtocol.offReason+'</font>');
       								$("#stopOrOffReason_Div").show();
	       							
	       							$("#offLabel").show();
	       							$("#stopLabel").hide();
	       							$("#offStartDate_span").html(data.ProProtocol.offStartDate);
	       							$("#offEndDate_span").html(data.ProProtocol.offEndDate);
	       							$("#stopDate").html('');
       							}else
       							{
       								$("#stopFlag").html('');
       								$("#offDate_Div").hide();
       								
       								$("#stopOrOffReason").html('');
       								$("#stopOrOffReason_Div").hide();
       								
       								$("#offLabel").hide();
	       							$("#stopLabel").hide();
	       							$("#offStartDate_span").html('');
	       							$("#offEndDate_span").html('');
	       							$("#stopDate").html('');
       							}
       						}
       						
       						$("#firstName").html(data.ProProtocol.firstName);
       						$("#firstJurPerson").html(data.ProProtocol.firstJurPerson);
       						$("#firstSignDate").html(data.ProProtocol.firstSignDate);
       						$("#firstAddress").html(data.ProProtocol.firstAddress);
       						
       						//根据乙方处理结果显示页面
       						//机构处理状态 01：已处理；02：未处理；03：逾期未确认；
	       						if(data.ProProtocol.unitHandleFlag=='01')
	       						{
	       								$("#secondName_span").html(data.ProProtocol.secondName);
		       							$("#secondAddress_span").html(data.ProProtocol.secondAddress);
		       							$("#secondJurPerson_span").html(data.ProProtocol.secondJurPerson);
		       							$("#secJurPerCD_span").html(data.ProProtocol.secJurPerCD);
		       							
		       							$("#secondName_Label").show();
		       							$("#secondAddress_Label").show();
		       							$("#secondJurPerson_Label").show();
		       							$("#secJurPerCD_Label").show();
		       							
		       							$("#secondName_Div").hide();
		       							$("#secondAddress_Div").hide();
		       							$("#secondJurPerson_Div").hide();
		       							$("#secJurPerCD_Div").hide();

		       							$("#agreeProtocol").hide();
		       							$("#refuseProtocol").hide();
	       						}else if(data.ProProtocol.unitHandleFlag=='03')
	       						{
	       								if(data.ProProtocol.afterDealFlg!='1')
	       								{
	       									$("#secondName_span").html('');
			       							$("#secondAddress_span").html('');
			       							$("#secondJurPerson_span").html('');
			       							$("#secJurPerCD_span").html('');
			       							
			       							$("#secondName_Label").show();
			       							$("#secondAddress_Label").show();
			       							$("#secondJurPerson_Label").show();
			       							$("#secJurPerCD_Label").show();
			       							
			       							$("#secondName_Div").hide();
			       							$("#secondAddress_Div").hide();
			       							$("#secondJurPerson_Div").hide();
			       							$("#secJurPerCD_Div").hide();
			       							
			       							
			       							$("#agreeProtocol").hide();
			       							$("#refuseProtocol").hide();
	       								}
	       						}else if(data.ProProtocol.unitHandleFlag=='02')
	       						{
	       							//终止
	       							if(data.ProProtocol.stopFlag=='02')
		       						{
		       								$("#secondName_span").html(data.ProProtocol.secondName);
			       							$("#secondAddress_span").html(data.ProProtocol.secondAddress);
			       							$("#secondJurPerson_span").html(data.ProProtocol.secondJurPerson);
			       							$("#secJurPerCD_span").html(data.ProProtocol.secJurPerCD);
			       							
			       							$("#secondName_Label").show();
			       							$("#secondAddress_Label").show();
			       							$("#secondJurPerson_Label").show();
			       							$("#secJurPerCD_Label").show();
			       							
			       							$("#secondName_Div").hide();
			       							$("#secondAddress_Div").hide();
			       							$("#secondJurPerson_Div").hide();
			       							$("#secJurPerCD_Div").hide();
			       							
			       							
			       							$("#agreeProtocol").hide();
			       							$("#refuseProtocol").hide();
		       						}
		       						//中止
		       						else if(data.ProProtocol.stopFlag=='01')
		       						{
		       							//中止协议状态（01：未开始；02：中止协议中；03：结束）
		       							if(data.ProProtocol.stopState=='02')
		       							{
		       								$("#secondName_span").html(data.ProProtocol.secondName);
			       							$("#secondAddress_span").html(data.ProProtocol.secondAddress);
			       							$("#secondJurPerson_span").html(data.ProProtocol.secondJurPerson);
			       							$("#secJurPerCD_span").html(data.ProProtocol.secJurPerCD);
			       							
			       							$("#secondName_Label").show();
			       							$("#secondAddress_Label").show();
			       							$("#secondJurPerson_Label").show();
			       							$("#secJurPerCD_Label").show();
			       							
			       							$("#secondName_Div").hide();
			       							$("#secondAddress_Div").hide();
			       							$("#secondJurPerson_Div").hide();
			       							$("#secJurPerCD_Div").hide();
			       							
			       							
			       							$("#agreeProtocol").hide();
			       							$("#refuseProtocol").hide();
		       							}
		       						}
	       						}
       						
       						$("#secondSignDate").html(data.ProProtocol.secondSignDate);
       					}
  
       				},
       				error:function(){
       					layer.close(loading_index);
       				}
       				});
	}
	
	
	function clear_refuseWin(){
	
		 $("#refuse").val('');     		
	}
	
		</script>

	</head>

	<body class="gray-bg black-bg-gmtx">
		<div class="wrapper wrapper-content ">
		
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox float-e-margins">
						<div class="ibox-content">
								<div class="row">
									<div class="col-sm-12 text-left">
										<button class="btn btn-gmtx-define1" type="button" onclick="javascript:forwardListPage();">
											返回
										</button>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 text-center">
									
										<h1><b>协议<span id="protocolCode"></span></b></h1>
									</div>
								</div>
								<div class="hr-line-dashed"></div>
								<div class="row">
									<div class="col-sm-9 text-left">
										<label class="col-sm-12 control-label">协议类型：<span id="protocolType"></span></label>
									</div>
									<div class="col-sm-3 text-left">
										<label class="col-sm-12 control-label">有效日期：<span id="effectiveStartDate"></span>至<span id="effectiveEndDate"></span></label>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-9 text-left">
										<label class="col-sm-12 control-label">机构处理：<span id="unitHandleFlag"></span></label>
									</div>
									<div class="col-sm-3 text-left">
										<label class="col-sm-12 control-label">生效标志：<span id="effectFlag"></span></label>
									</div>
								</div>
								<div class="row" id="refuse_Div" style="display:none;">
									<div class="col-sm-12 text-left">
										<label class="col-sm-12 control-label">机构处理结果：<font color="#FF0000">拒绝协议</font></label>
									</div>
									<div class="col-sm-12 text-left">
										<label class="col-sm-12 control-label">拒绝理由：<span id="refuse"></span></label>
									</div>
								</div>
								<div class="row" id="offDate_Div" style="display: none;">
									<div class="col-sm-9 text-left">
										<label class="col-sm-12 control-label">
											终\中止标识：
											<span id="stopFlag"></span>
										</label>
									</div>
									<div class="col-sm-3 text-left">
										
										<label class="col-sm-12 control-label" style="display:none;" id="offLabel">
											中止日期：
											<span id="offStartDate_span"></span>至
											<span id="offEndDate_span"></span>
										</label>
										
										<label class="col-sm-12 control-label" style="display:none;" id="stopLabel">
											终止日期：
											<span id="stopDate"></span>
										</label>
									</div>
								</div>
								
								<div class="row" id="stopOrOffReason_Div" style="display: none;">
									<div class="col-sm-9 text-left">
										<label class="col-sm-12 control-label">
											终\中止理由：
											<span id="stopOrOffReason"></span>
										</label>
									</div>
									<div class="col-sm-3 text-left">
										
										
									</div>
								</div>
								
								
								<div class="row">
									<div class="col-sm-12">
										<!-- <IFRAME width=100% height=400 marginwidth=0 marginheight=0 id="protocolHtmlFrame" SRC="" ></IFRAME> -->
										
										<IFRAME width=100% height=400 marginwidth=0 marginheight=0 id="protocolContentFrame" ></IFRAME>
									</div>
								</div>
								<br/>
								<form method="post" id="protocolForm">
								<div class="row">
									<div class="col-sm-8 text-left">
										<label class="col-sm-12 control-label">甲方名称：<span id="firstName"></span></label>
									</div>
									<div class="col-sm-4 text-left">
										<div id="secondName_Label" style="display:none;">
											<label class="col-sm-12 control-label">乙方名称：<span id="secondName_span"></span></label>
										</div>
										<div id="secondName_Div">
											<label class="col-sm-4 control-label">乙方名称：</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="secondName_txt" name="secondName_txt" placeholder="请输入乙方名称" style="border:1px solid #4D4D4D">
											</div>
										</div>
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-sm-8 text-left">
										<label class="col-sm-12 control-label">甲方地址：<span id="firstAddress"></span></label>
									</div>
									<div class="col-sm-4 text-left">
									
										<div id="secondAddress_Label" style="display:none;">
											<label class="col-sm-12 control-label">乙方地址：<span id="secondAddress_span"></span></label>
										</div>
										<div id="secondAddress_Div">
											<label class="col-sm-4 control-label">乙方地址：</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="secondAddress_txt" name="secondAddress_txt" placeholder="请输入乙方地址" style="border:1px solid #4D4D4D">
											</div>
										</div>
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-sm-8 text-left">
										
										<label class="col-sm-12 control-label">法人代表：<span id="firstJurPerson"></span></label>
									</div>
									<div class="col-sm-4 text-left">
										<div id="secondJurPerson_Label" style="display:none;">
											<label class="col-sm-12 control-label">法人代表：<span id="secondJurPerson_span"></span></label>
										</div>
										<div id="secondJurPerson_Div">
											<label class="col-sm-4 control-label">法人代表：</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="secondJurPerson_txt" name="secondJurPerson_txt" placeholder="请输入法人代表" style="border:1px solid #4D4D4D">
											</div>
										</div>
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-sm-8 text-left">
										<label class="col-sm-12 control-label">签字日期：<span id="firstSignDate"></span></label>
									</div>
									<div class="col-sm-4 text-left">
										<div id="secJurPerCD_Label" style="display:none;">
											<label class="col-sm-12 control-label">法人代表身份证号码：<span id="secJurPerCD_span"></span></label>
										</div>
										<div id="secJurPerCD_Div">
											<label class="col-sm-4 control-label">法人代表身份证号码：</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="secJurPerCD_txt" name="secJurPerCD_txt" placeholder="请输入法人代表身份证号码" style="border:1px solid #4D4D4D">
											</div>
										</div>
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-sm-8 text-left">
										
									</div>
									<div class="col-sm-4 text-left">
										<label class="col-sm-12 control-label">签字日期：<span id="secondSignDate"></span></label>
									</div>
								</div>
								<div class="hr-line-dashed"></div>
								<div class="row">
									<div class="col-sm-12 text-center">
										<button class="btn btn-gmtx-define1" type="button" onclick="javascript:expProtocol();">
											导出协议
										</button>
										<button class="btn btn-gmtx-define1" type="submit" id="agreeProtocol">
											确认协议
										</button>
										<button class="btn btn-gmtx-define1" type="button" data-toggle="modal" href="#refuseWin" data-keyboard="true" data-backdrop="false" id="refuseProtocol">
											拒绝协议
										</button>
									</div>
								</div>
								<input type="hidden" name="protocolId" id="protocolId">
								</form>
								
							
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		
		
		<!-- 拒绝 -->
		<div class="modal fade" id="refuseWin">
			<div class="modal-dialog" style="width: 400px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clear_refuseWin()">
							&times;
						</button>
						<h4 class="modal-title" id="addwinlable">
							拒绝协议
						</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<form method="post" class="form-horizontal" id="refuseForm">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										拒绝理由：
									</label>
									<div class="col-sm-8 controls">
										<textarea rows="10" cols="10" class="form-control" name="refuse" id="refuse"></textarea>
									</div>
								</div>
								
								<div class="control-group">
									<div class="controls">
										<button type="submit" class="btn btn-gmtx-define1 center-block">
											提交
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<input type="hidden" id="proText">
		<input type="hidden" id="forwardMode">
		<input type="hidden" id="expDate">

	</body>
	</html>