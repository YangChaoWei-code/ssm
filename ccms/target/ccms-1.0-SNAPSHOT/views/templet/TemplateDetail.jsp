<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0">


		<title>模板内容</title>
		<meta name="keywords" content="医疗管理平台-协议签订">
		<meta name="description" content="医疗管理平台-协议签订">

		<link rel="shortcut icon" href="favicon.ico">
		<link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
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
		
	    <link href="/${appName}/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
	
	    <!-- Morris -->
	    <link href="/${appName}/commons/jslib/hplus/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
	    
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
			
			
		<script
			src="/${appName}/commons/jslib/CommonValue.js"></script>

		<script>
		
		

        $(document).ready(function(){
  			//加载信息
        	loadData();
        });
        
	  function loadDiv(id,datastr){ 
		$("#"+id).append(datastr);
	  }
  
  //跳转至列表页面
	function forwardListPage()
	{
		window.location.href="/${appName}/webviews/templet/Template.jsp";
	}
	
	//加载数据
	function loadData()
	{
		var id=GetQueryString("id");
		$.ajax({
       				url:'/${appName}/manager/ProTempletController/getDataByTempId',	
       				dataType:'json',
       				data:{
       					id:id
       				},
       				type:'post',
       				success:function(data){
       						setIFrameContent("templateHtmlFrame",data.tempdata.templetCntent);
       						$("#tempCode").html(data.tempdata.tempCode);
       						$("#title").html(data.tempdata.tempName);
       						$("#protocolType").html(data.tempdata.protocolType);
       						$("#paramCount").html(data.firparam.length);
       						$("#paramSecCount").html(data.secparam.length);
       						var lenf = data.firparam.length;
       						if(data.firparam==null||data.firparam==''){
       							$('#paramFir').hide();
       						}else{
       							$('#paramFir').show();
       						}
							for(var i=0;i<lenf;i++){
								loadDiv('paramFir','<span class="btn btn-outline btn-default">'+data.firparam[i]+'</span>&nbsp;&nbsp;&nbsp;');
							}
							var lens = data.secparam.length;
							for(var i=0;i<lens;i++){
								loadDiv('paramSec','<span class="btn btn-outline btn-default">'+data.secparam[i]+'</span>&nbsp;&nbsp;&nbsp;');
							}
       				},
       				error:function(){
       					
       				}
       				});
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
									<div class="col-sm-2">
										<button class="btn btn-gmtx-define1 center-block" type="button" onclick="javascript:forwardListPage();">
												返回
										</button>
									</div>
									<div class="col-sm-8 text-center">
										<h1><b id="title"></b></h1>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-2">
									</div>
									<div class="col-sm-8 text-center">
											<label class="col-sm-12 control-label">模板编号:<span id="tempCode"></span></label>
									</div>
								</div>
								<div class="hr-line-dashed"></div>
								<div class="row">
									<div class="col-sm-12">
										<div class="col-sm-3">
											<label class="col-sm-12 control-label">协议类型:<span id="protocolType"></span></label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="col-sm-3">
											<label class="col-sm-12 control-label"><span>甲方参数(<span id="paramCount"></span>):</span></label>
										</div>
										<div class="col-sm-9">
											<div id="paramFir"></div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="col-sm-3">
											<label class="col-sm-12 control-label"><span>乙方参数(<span id="paramSecCount"></span>):</span></label>
										</div>
										<div class="col-sm-9">
											<div id="paramSec" ></div>
										</div>
									</div>
								</div>
								<div style="height:5px"></div>
								<div class="row">
									<div class="col-sm-12">
										<IFRAME width=100% height=400 marginwidth=0 marginheight=0 id="templateHtmlFrame" ></IFRAME>
									</div>
								</div>
						</div>
						<div class="ibox-footer">
						</div>
					</div>
				</div>
			</div>
		</div>

	</body>
	</html>