<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">


		<title>模版新增</title>
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
    	<link href="/${appName}/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
		<!-- Sweet Alert -->
		<link href="/${appName}/commons/css/qy-style.css" rel="stylesheet">
		

		<script src="/${appName}/commons/jslib/hplus/js/jquery.min.js?v=2.1.4"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>

		<script
			src="/${appName}/commons/jslib/hplus/js/bootstrap.min.js?v=3.3.5"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/content.min.js?v=1.0.0"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/iCheck/icheck.min.js"></script>

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
		<script type="text/javascript" src="/${appName}/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
		<!-- Sweet Alert -->

		<script src="/${appName}/commons/jslib/layer/layer.js"></script>
		
		<script>
		
		var loading_index;

        $(document).ready(function(){

            
        	//加载协议类型单选下拉树
        	loadProtocolTypeRadio("/${appName}/manager/ProParamInfoController/getProtocolTree_radio");
        	
        	
        	   $("#addForm").validate({ 
				rules: {
					name: {
		                required: true,
		                maxlength: 50
		            },
		            protocolTypeSel: {
		             	required: true
		            },
		            templetFile:{
		            	required: true,
		            	checkDoc:true,
		            	checkFileSize:true
		            }
		 	       },  
		 	       messages:{  
		 	    	  name: {
							required: "模版名称不能为空",
							maxlength: "必须是50个字符以内"
						},
						protocolTypeSel: {
							required: "协议类型不能为空"
						},
						templetFile: {
							required: "上传附件不能为空"
						}
						
		 	       },
		  	      submitHandler:function(form){ 
		  	      
		  	      		 validateTempletParams();
		   	       }
			    });  
        	
        });
        
        
        

jQuery.validator.addMethod("checkDoc", function(value, element) {

    var filepath=$("#templetFile").val();

    //获得上传文件名

    var fileArr=filepath.split("\\");
    
    var fileTArr=fileArr[fileArr.length-1].toLowerCase().split(".");

    var filetype=fileTArr[fileTArr.length-1];

    //切割出后缀文件名

    if(filetype != "rtf"&&filetype != "RTF"){

        return false;

    }else{

        return true;

    }

}, "上传模版格式不正确，只能上传rtf格式");


//验证模版参数
function validateTempletParams() {
		startProcess();
   　　　　var option = {
         　　 url:'/${appName}/manager/ProTempletController/validateTempletParam',
        　　  type : 'POST',
         　　 dataType : 'json',
         	data:{},
        　　  success : function(data) {
				stopProcess();
        		if(data.success)
        		{
        			//模版中存在参数
        			if(data.templetParamsCount>0||data.templetParamsFixedCount>0)
        			{
        				$('#validateParamsWin').modal();
						//在模态框显示参数
						var templetParams=data.templetParams;
						var templetParamsStr=templetParams.join("|");
						$("#templetParams").val(templetParamsStr);
						
						$.each(templetParams,function(index,ele){
							loadDiv('paramDiv','<span class="btn btn-outline btn-default">'+ele+'</span>&nbsp;&nbsp;&nbsp;');
						});
						
						$("#firstParamCount").html(data.templetParamsCount);
						
						var templetParamsFixed=data.templetParamsFixed
						$.each(templetParamsFixed,function(index,ele){
							loadDiv('paramDiv_Fixed','<span class="btn btn-outline btn-default">'+ele+'</span>&nbsp;&nbsp;&nbsp;');
						});
						$("#secondParamCount").html(data.templetParamsFixedCount);
        			}
        			
        			$("#templetWebPath").val(data.templetWebPath);
					$("#templetWordSavePath").val(data.templetWordSavePath);
					
					
					$("#rtfTempletWebPath").val(data.rtfTempletWebPath);
					$("#rtfTempletWordSavePath").val(data.rtfTempletWordSavePath);
					
					$("#htmlTempletWebPath").val(data.htmlTempletWebPath);
					$("#htmlTempletSavePath").val(data.htmlTempletSavePath);
					
        		}else
        		{
        			$("#templetFile").val('');
        			$("#templetParams").val('');
        			swal({
						title:data.message,
						text:""
					});
        		}
          },
          error: function(data) {
          		stopProcess();
          }
       };
      $("#addForm").ajaxSubmit(option);
      return false; //最好返回false，因为如果按钮类型是submit,则表单自己又会提交一次;返回false阻止表单再次提交
  }

 function loadDiv(id,datastr){ 
		$("#"+id).append(datastr);
	  }
	  
//表单提交
function ajaxSubmitForm() {
		 //loading层
		loading_index = layer.load(1, {
		  	shade: [0.3,'#fff'] //0.1透明度的白色背景
		});
		var protocolType=(getChecked("treeDemo",true))[0].id;
   　　　　var option = {
         　　 url:'/${appName}/manager/ProTempletController/addTemplet',
        　　  type : 'POST',
         　　 dataType : 'json',
         	data:{protocolType:protocolType},
        　　  success : function(data) {
				
				layer.close(loading_index);
        		
        		swal({
						title:data.message,
						timer: 2000,
						showConfirmButton: true,
						text:""
					},
					function()
					{
						if(data.success)
		        		{
		        			forwardListPage();
		        		}
					}
				);
				
        		
          },
          error: function(data) {
          		layer.close(loading_index);
              	swal({title:"添加失败",text:""});
          }
       };
      $("#addForm").ajaxSubmit(option);
      return false; //最好返回false，因为如果按钮类型是submit,则表单自己又会提交一次;返回false阻止表单再次提交
  }
  
  function startProcess()
  {
  	$("#processDiv").show();
  	$("#subBtn").attr('disabled',true);
  }
  
  function stopProcess()
  {
  	$("#processDiv").hide();
  	$("#subBtn").removeAttr("disabled");
  }
  
 	 //跳转至列表页面
	function forwardListPage()
	{
		window.location.href="/${appName}/webviews/templet/Template.jsp";
	}
	
	
	jQuery.validator.addMethod("checkFileSize", function(value,element) {
	    var fileSize=element.files[0].size;
	    var maxSize = 2*1024*1024;
	    if(fileSize > maxSize){
	        return false;
	    }else{
	        return true;
	    }
	}, "文件大小不能超过2M"); 
	
	
	function clear_validateParamsWin()
	{
		$("#paramDiv").html('');
		$("#paramDiv_Fixed").html('');
		$("#templetWebPath").val('');
		$("#templetWordSavePath").val('');
		
		$("#rtfTempletWebPath").val('');
		$("#rtfTempletWordSavePath").val('');
		
		$("#htmlTempletWebPath").val('');
		$("#htmlTempletSavePath").val('');
	}
	
	function cancleAdd()
	{
		clear_validateParamsWin();
		
		$('#validateParamsWin').modal('hide');
	}

		</script>

	</head>

	<body class="gray-bg black-bg-gmtx">
		<div class="wrapper wrapper-content ">
			<div class="row">
				<div class="col-sm-7 col-md-offset-2">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>
								新增模版
							</h5>
						</div>
						<div class="ibox-content">
							<form method="post" class="form-horizontal"
								enctype="multipart/form-data" id="addForm">
								<div class="form-group">
									<label class="col-sm-2 control-label">
										<span style="color: #FF0000">*</span>模版名称
									</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" id="name" name="name">
									</div>
								</div>

								<div class="hr-line-dashed"></div>
								<div class="form-group">
									<label class="col-sm-2 control-label">
										<span style="color: #FF0000">*</span>协议类型
									</label>
									<div class="col-sm-10">
										<div class="content_wrap">
											<div class="zTreeDemoBackground left">
												<input id="protocolTypeSel" name="protocolTypeSel"
													type="text" readonly value="" style="width: 120px;"
													onclick="showMenu();" />
												&nbsp;
												<a id="menuBtn" href="#" onclick="showMenu(); return false;"
													class="btn btn-gmtx-define1">选择</a>
											</div>
										</div>


									</div>
								</div>
								<div class="hr-line-dashed"></div>
								<div class="form-group">
									<label class="col-sm-2 control-label">
										<span style="color: #FF0000">*</span>上传附件
									</label>

									<div class="col-sm-10">

										<input type="file" id="templetFile" name="templetFile">
										<p class="help-block">
											文件类型限定为rtf(RTF);文件大小不能超过2M;
										</p>
									</div>
								</div>
								<div class="form-group" id="processDiv" style="display:none;">
									<div class="col-sm-12">
										<div class="progress">
										  <div class="progress-bar progress-bar-striped active" role="progressbar" 
										  aria-valuenow="4" aria-valuemin="0" aria-valuemax="100" style="width: 80%;" id="progressContent">
										    模版上传中,请耐心等待...
										  </div>
										</div>
									</div>
								</div>
								
								<div class="hr-line-dashed"></div>
								<div class="form-group">
									<div class="col-sm-1 col-sm-offset-4">
										<button class="btn btn-gmtx-define1" type="submit" id="subBtn">
											完成
										</button>
									</div>
									<div class="col-sm-1 col-sm-offset-1">
										<button class="btn btn-gmtx-define1" type="button" onclick="forwardListPage()">
											返回
										</button>
									</div>
								</div>
								
								<!-- word模版文件 -->
								<input type="hidden" id="templetWebPath" name="templetWebPath"/>
								<input type="hidden" id="templetWordSavePath" name="templetWordSavePath"/>
								
								<!-- rtf模版文件 -->
								<input type="hidden" id="rtfTempletWebPath" name="rtfTempletWebPath"/>
								<input type="hidden" id="rtfTempletWordSavePath" name="rtfTempletWordSavePath"/>
								
								
								<!-- html模版文件 -->
								<input type="hidden" id="htmlTempletWebPath" name="htmlTempletWebPath"/>
								<input type="hidden" id="htmlTempletSavePath" name="htmlTempletSavePath"/>
								
								
								<!-- 模版参数 -->
								<input type="hidden" id="templetParams" name="templetParams"/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div id="menuContent" class="menuContent"
			style="display: none; position: absolute;">
			<ul id="treeDemo" class="ztree"
				style="margin-top: 0; width: 180px; height: 300px;"></ul>
		</div>
		
		
		
		<!-- 预览模版参数 -->
		<div class="modal fade" id="validateParamsWin">
			<div class="modal-dialog" style="width: 800px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true" onclick="clear_validateParamsWin()">
							&times;
						</button>
						<h4 class="modal-title" id="validateParamsWinlable">
							模版参数预览
						</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<form method="post" class="form-horizontal" id="offProtocolForm">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										甲方参数个数：
									</label>
									<div class="col-sm-8 controls">
										<p class="form-control-static" id="firstParamCount"></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">
										甲方参数：
									</label>
									<div class="col-sm-8 controls">
										<div id="paramDiv" ></div>
									</div>
								</div>
								<div class="hr-line-dashed"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label">
										乙方参数个数：
									</label>
									<div class="col-sm-8 controls">
										<p class="form-control-static" id="secondParamCount"></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">
										乙方参数：
									</label>
									<div class="col-sm-8 controls">
										<div id="paramDiv_Fixed" ></div>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-1 col-sm-offset-4">
										<button class="btn btn-gmtx-define1" type="button" id="subBtn" onclick="javascript:ajaxSubmitForm();">
											模版上传
										</button>
									</div>
									<div class="col-sm-1 col-sm-offset-1">
										<button class="btn btn-gmtx-define1" type="button" onclick="javascript:cancleAdd();">
											取消
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</body>
	</html>