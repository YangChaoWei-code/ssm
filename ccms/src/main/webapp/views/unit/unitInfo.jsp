<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<meta name="keywords" content="单位管理">
<meta name="description" content="单位管理">

<link rel="shortcut icon" href="favicon.ico">
<link href="/ccms/commons/jslib/hplus/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/animate.min.css"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/style.min.css?v=4.0.0"
	rel="stylesheet">
<link
	href="/ccms/commons/jslib/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">


<!-- Sweet Alert -->
<link
	href="/ccms/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<!-- Sweet Alert -->

<link href="/ccms/commons/css/qy-style.css" rel="stylesheet">


<link
	href="/ccms/commons/jslib/hplus/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">

</head>
<body class="gray-bg black-bg-gmtx">
	<div class="wrapper wrapper-content ">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<div class="row text-left">
					<div class="row">
						<label class="col-sm-2 control-label text-right"> 单位名称： </label>
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm"
								id="unitInfoName" placeholder="单位名称或单位编号">
						</div>
						<label class="col-sm-2 control-label text-right"
							id="examLevelLabel"> 单位类别： </label>
						<div class="col-sm-3">
							<select class="form-control" id="unitTypeSel">
							</select>
						</div>

						<div class="col-sm-1 ">
							<button class="btn btn-gmtx-define1" type="button"
								onclick="javascript:search();">搜索</button>
						</div>
						<div class="col-sm-1">
							<button class="btn btn-gmtx-define1" onclick="javascript:reset()"
								id="btn_reset">重置</button>
						</div>
					</div>
					<br />
					<div class="row"></div>
					<div class="row">
						<div class="col-sm-1 col-md-offset-1">
							<button class="btn btn-gmtx-define1" data-toggle="modal"
								href="#addwin" data-keyboard="true" data-backdrop="false"
								id="btn_add">新增</button>
						</div>
						<div class="col-sm-1">
							<button class="btn btn-gmtx-define1" data-toggle="modal" href="#"
								onclick="javascript:showUpWin()" data-keyboard="true"
								data-backdrop="false" id="btn_up">修改</button>
						</div>
						<div class="col-sm-1">
							<button class="btn btn-gmtx-define1" id="btn_del"
								onclick="delUnit()">删除</button>
						</div>
						<div class="col-sm-2">
							<button class="btn btn-gmtx-define1" id="btn_import"
								data-toggle="modal" href="#excelwin" data-keyboard="true"
								data-backdrop="false">Excel批量导入</button>
						</div>
						<div class="col-sm-2 col-md-offset-1">
							<a href="/ccms/download/UnitImportFile.xls"
								download="单位导入文件格式.xls">单位导入文件格式下载</a><br /> <a href=""
								id="downErrorUnit" style="display: none" download="单位导入失败数据.xls">单位导入失败数据下载</a>
						</div>
					</div>
				</div>
			</div>
			<div class="ibox-content">
				<table id="table" data-click-to-select="true">
				</table>
			</div>
		</div>
	</div>
	<!-- 添加 -->
	<div class="modal fade" id="addwin">
		<div class="modal-dialog" style="width: 400px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clear_add()" id="btn_colse_add">
						&times;</button>
					<h4 class="modal-title" id="addwinlable">单位添加</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal" id="addform">
							<div class="form-group">
								<label class="col-sm-3 control-label"> 单位名称 </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control" name="name"
										id="name" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 单位类别 </label>
								<div class="col-sm-8 controls">
									<select class="form-control unitTypeId" name="unitTypeId"
										id="unitTypeId"></select>
								</div>
							</div>							
							<div class="form-group">
								<label class="col-sm-3 control-label"> 编码 </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control"
										name="outside_code" id="outside_code" />
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<button type="submit" class="btn btn-gmtx-define1 center-block">
										添加</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 编辑 -->
	<div class="modal fade" id="upwin">
		<div class="modal-dialog" style="width: 400px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="clear_up()" id="btn_colse_up">
						&times;</button>
					<h4 class="modal-title" id="editwinlable">单位编辑</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal" id="upform">
							<div class="form-group">
								<label class="col-sm-3 control-label"> 单位名称 </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control" name="name"
										id="name_up" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 单位类别 </label>
								<div class="col-sm-8 controls">
									<select class="form-control unitTypeId" name="unitTypeId"
										id="unitTypeId_up"></select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 编码 </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control"
										name="outside_code" id="outside_code_up" />
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<button type="submit" class="btn btn-gmtx-define1 center-block">
										更改</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 批量导入 -->
	<div class="modal fade" id="excelwin">
		<div class="modal-dialog" style="width: 600px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true" onclick="javascript:clearExcelWin()">
						&times;</button>
					<h4 class="modal-title" id="winlable">Excel批量导入</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal"
							enctype="multipart/form-data" id="excelform">
							<div class="form-group">
								<label class="col-sm-3 control-label"> 上传附件: </label>
								<div class="col-sm-8">
									<input type="file" id="unitFile" name="unitFile">
									<p class="help-block">文件类型限定为word2003(xls|XLS)或word
										2007(xlsx|XLSX);文件大小不能超过2M;</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 角色: </label>

								<div class="col-sm-8">
									<div id='roleAccess'></div>
									<p class="help-block">批量导入的单位自动生成账号密码(账号:编码,密码:编码)</p>
								</div>
							</div>
							<div class="form-group" id="processDiv" style="display: none;">
								<div class="col-sm-12">
									<div class="progress">
										<div class="progress-bar progress-bar-striped active"
											role="progressbar" aria-valuenow="4" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%;" id="progressContent">
											文件上传中,请耐心等待...</div>
									</div>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<button type="submit" id=""
										class="btn btn-gmtx-define1 center-block">上传</button>
								</div>
							</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script src="/ccms/commons/jslib/hplus/js/jquery.min.js?v=2.1.4"></script>
	<script src="/ccms/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>
	<script
		src="/ccms/commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="/ccms/commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>

	<script type="text/javascript" src="/ccms/commons/jslib/jquery-form.js"></script>

	<script src="/ccms/commons/jslib/hplus/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="/ccms/commons/jslib/hplus/js/content.min.js?v=1.0.0"></script>

	<!-- Sweet Alert -->
	<script type="text/javascript"
		src="/ccms/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
	<!-- Sweet Alert -->
	<script src="/ccms/commons/jslib/hplus/js/plugins/iCheck/icheck.min.js"></script>
	<script src="/ccms/commons/jslib/CommonValue.js"></script>
	<script
		src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"
		type="text/javascript"></script>
	<script
		src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"
		type="text/javascript"></script>

	<script
		src="/ccms/commons/jslib/hplus/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
	<script>
			//验证添加表单
			function vform(dom,func){
					$("#"+dom).validate({
							rules : {
								name : {
									required : true,
									maxlength: 50,
								},
								outside_code : {
									required : true,
									maxlength: 50,
								},
								unitTypeId: {
									required : true,								
								},
								/*unitGradeId: {
									required : true,								
								}*/
							},
							messages : {
								name : {
									required : "请输入参数名称",
									maxlength: "参数名过长"
								},
								outside_code : {
									required : "请输入编号(学号)",
									maxlength: "参数名过长"
								},
								unitTypeId: {
									required : "请选择单位类别",							
								},
								/*unitGradeId: {
									required : "请选择单位等级",							
								}*/
							},
							submitHandler : function() {
								func();
							}
					});
				}
			//清空窗口
			function clearExcelWin(){
				$('#unitFile').val('');
				$("#roleAccess").find("input[type='checkbox']").each(function () {
			        $(this).prop('checked',false);
				});
			}
			$(function(){
				vform('addform',addUnit);
				vform('upform',upUnit);
				$("#excelform").validate({ 
				rules: {
		           unitFile:{
		            	required: true,
		            	checkExcel: true
		            }
		 	       },  
		 	       messages:{
						unitFile: {
							required: "上传附件不能为空"
						}
		 	       },
		  	      submitHandler:function(form){ 
		  	      		 ajaxSubmitForm();
		   	       }
			    }); 
				// 加载下拉框
				loadUnitType("/ccms/unitinfo/getUnitTypeList","unitTypeSel");
				loadUnitGrade("/ccms/unitinfo/getUnitGradeList","unitGradeSel");
				
				loadUnitType("/ccms/unitinfo/getUnitTypeList","unitTypeId");
				loadUnitGrade("/ccms/unitinfo/getUnitGradeList","unitGradeId");
				
				loadUnitType("/ccms/unitinfo/getUnitTypeList","unitTypeId_up");
				loadUnitGrade("/ccms/unitinfo/getUnitGradeList","unitGradeId_up");
				
				loadRoleChk("/ccms/manager/CommonController/getRoleList","roleAccess");  //加载角色
				var $table = $('#table');
				   $table.bootstrapTable({
				    url: "/ccms/unitinfo/queryUnitInfoList_table",
				    dataType: "json",
				    method: 'post',
					contentType: "application/x-www-form-urlencoded",
				    pagination: true,
				    pageSize: 30,
				    pageNumber:1,
				    singleSelect: false,
				    checkboxHeader: true,
				    clickToSelect: true,
				    queryParamsType : "undefined",
				    queryParams: function queryParams(params) {  // 设置查询参数
				       var param = {
				       	page: params.pageNumber,
				       	rows: params.pageSize
				       };
				       return param;
				       },
				    cache: false,
				    sidePagination: "server", //服务端处理分页
				       columns: [{
				          			checkbox: true
				     				},
				            {
				                title: '单位名称',
				                field: 'name',			                   
				                valign: 'middle'
				            },
				            {
				                title: '单位类别',
				                field: 'unitType',
				                //align: 'center',
				                valign: 'middle'
				            },
				            {
				                title: '编码',
				                field: 'outside_code',
				                //align: 'center',
				                valign: 'middle'
				            }
				        ]
				    });
				});
				//验证文件格式
				jQuery.validator.addMethod("checkExcel", function(value, element) {

				    var filepath=$("#unitFile").val();
				
				    // 获得上传文件名
				
				    var fileArr=filepath.split("\\");
				    
				    var fileTArr=fileArr[fileArr.length-1].toLowerCase().split(".");
				
				    var filetype=fileTArr[fileTArr.length-1];
				
				    //切割出后缀文件名
				
				    if(filetype != "xls"&&filetype != "XLS"&&filetype != "xlsx"&&filetype != "XLSX"){
				
				        return false;
				
				    }else{
				
				        return true;
				
				    }
				
				}, "上传模版格式不正确，只能上传xls|XLS|xlsx|XLSX格式");
				//查询
				function search(){
				   var _name = $('#_search').val();
				 	$('#table').bootstrapTable('refresh', {
						query: {
							nameOrCode:$("#unitInfoName").val(),
							unitTypeId:$("#unitTypeSel  option:selected").val(),
							unitGradeId:$("#unitGradeSel  option:selected").val()
				       }
				   });
				}
		      //上传文件
		      function ajaxSubmitForm() {
				    var roles = "";
			        var r=document.getElementsByName("roles");
					for(var i=0;i<r.length;i++){
			        		if(r[i].checked){
			       			roles = roles + r[i].value + ",";
			     		}
			   		}
			   		if(roles == "")
			   		{
			   			swal('系统提示','请至少选择一个角色!','warning'); 
			   			return false;
			   		}
					startProcess();
			   　　　　var option = {
			         　　		url:'/ccms/manager/ProUnitinfoController/addExcel',
				         	data:{'roleIds':roles},
				        　　  type:'POST',
				         　　 dataType:'json',
			        　　  	  	success : function(data) {
			        		  if(data.isTitle==false){
			        		  	$('#excelform')[0].reset();
			        		  	swal('系统提示','该文件格式不符合要求,请下载模板文件','error');
							  	stopProcess();
			        		  	return ;
			        		  }
			        		  if(data.operateSuccess && data.wrongData<=0)
			        		  {
			        			$('#excelform')[0].reset();
							  	stopProcess();
			        			swal({
								title:"系统提示",
								text:"导入成功,导入"+data.operateCount+"条数据",
								type:"success"
							  	});
					         	$("#excelwin").modal('hide');
					         	$('#table').bootstrapTable("refresh");
			        		  }else if(data.operateSuccess && data.wrongData>0){
			        		  	$('#excelform')[0].reset();
							  	stopProcess();
			        			swal({
								title:"系统提示",
								text:data.operateCount+"条数据导入成功,"+data.wrongData+"条数据导入失败",
								type:"warning",
			                    confirmButtonText: "下载失败数据",
			                    closeOnConfirm: true,
				                }, function (isConfirm) {
				                    if (isConfirm) {
				                        $('#downErrorUnit').show();
				                        $('#downErrorUnit').attr('href',data.xslpath);
				                        $('#downErrorUnit')[0].click();
				                    }
				                });
						         	$("#excelwin").modal('hide');
						         	$('#table').bootstrapTable("refresh");
			        		  }else{
				          		stopProcess();
				              	swal({title:"导入失败",text:"",type:"error"});
			        		  }
			        		  stopProcess();
			          },
			          error: function(data) {
			          		stopProcess();
			              	swal({title:"导入失败",text:""});
			          }
			       };
			      $("#excelform").ajaxSubmit(option);
			      return false;
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
		      /**------添加------*/
				function addUnit(){
				   	var name = $("#name").val();
				   	var outside = $("#outside_code").val();
				   	var unitTypeId = $("#unitTypeId").val();
				   	var unitGradeId = $("#unitGradeId").val();
					$.ajax({
						url:'/ccms/unitinfo/addUnit',
						type:'post',
						async:'true',
						cache:false,
						data:{name:name,outside_code:outside,unitTypeId:unitTypeId,unitGradeId:unitGradeId},
						dataType:'json',
						success: function(data){
						  if(data.exist=='exitOutCode'){
						  	 swal({
				         			 title: "系统提示",
						             text: "已存在该编码",
						             type: "warning"
						         },function(){
				     	                $("#outside_code").val('');
						         });
						  	}else if(data.success){
						  		swal({
				          			 title: "系统提示",
						             text: "添加成功",
						             type: "success"
						         });
				    	        $("#name").val('');
				    	        $("#outside_code").val('');
								$("#unitTypeId").val('');
								$("#unitGradeId").val('');
					         	$("#addwin").modal('hide');
					         	$('#table').bootstrapTable("refresh");
						  	}else{
				                 swal({
				          			 title: "系统提示",
						             text: "添加失败",
						             type: "warning"
						         });
				             	}
					    },
				        error: function (aa, ee, rr) {
				             swal({
				         		title: "系统提示",
					             text: "请求服务器失败,清稍候再试",
					             type: "warning"
					         	},function(){
						   });
				        }
					});
				}
			  /**-删除---*/
			  function delUnit(){
		  	    var ids = '';
		        var selects =$('#table').bootstrapTable('getSelections');
		        if(selects.length<=0){
					swal('系统提示','请选择要删除的单位！','warning');
					return ;
				}
				ids = "'"+selects[0].id+"'";
		        for(var i = 1;i<selects.length;i++){
		    		ids+=",'"+selects[i].id+"'";
		        }
			  	swal({
		            title: "您确定要删除选中单位吗",
		            text: "",
		            type: "warning",
		            showCancelButton: true,
		            confirmButtonColor: "#DD6B55",
		            confirmButtonText: "删除",
		            cancelButtonText: "取消",
		            closeOnConfirm: false,
		            closeOnCancel: false
		        	}, function (isConfirm) {
		            if (isConfirm) {
		                $.ajax({
							url:'/ccms/unitinfo/delUnit',
							type:'post',
							async:'true',
							cache:false,
							contentType: "application/x-www-form-urlencoded; charset=utf-8", 
							data:{ids:ids},
							dataType:'json',
							success: function(data){
									  if(data.success){
									        swal("删除成功！", "您已经删除了这条信息。", "success");
							         		$('#table').bootstrapTable("refresh");
						              }else{
						                  swal({
				             					 title: "系统提示",
									             text: "删除失败",
									             type: "warning"
									         });
						              }
						    },
				            error: function (aa, ee, rr) {
					                  swal({
				            				 title: "系统提示",
								             text: "请求服务器失败,清稍候再试",
								             type: "warning"
								         	});
				            }
						});
		            } else {
		                swal("已取消", "您取消了删除操作！", "error")
		            }
		        });
			  }
		      /**------修改------*/
		      function upUnit(){
		      	var name = $("#name_up").val();
		      	var outside = $("#outside_code_up").val();
		      	var unitTypeId = $("#unitTypeId_up").val();
		      	var unitGradeId = $("#unitGradeId_up").val();
				$.ajax({
					url:'/ccms/unitinfo/upUnit',
					type:'post',
					async:true,
					cache:false,
					data:{id:id_up,name:name,outside_code:outside,unitTypeId:unitTypeId,unitGradeId:unitGradeId},
					dataType:'json',
					success: function(data){
							  if(data.exist=='exitOutCode'){
							  	 swal({
		             					 title: "系统提示",
							             text: "已存在该编码",
							             type: "warning"
							         },function(){
				      	                $("#outside_code_up").val('');
							         });
							  	}else if(data.success){
							  		swal({
		             					 title: "系统提示",
							             text: "修改成功",
							             type: "success"
							         });
			      	                $("#name_up").val('');
			      	                $("#outside_code_up").val('');
									$("#unitTypeId_up").val('');
									$("#unitGradeId_up").val('');
						         	$("#upwin").modal('hide');
						         	$('#table').bootstrapTable("refresh");
							  	}else{
				                  swal({
		             					 title: "系统提示",
							             text: "添加失败",
							             type: "warning"
							         });
				              	}
				    },
		            error: function (aa, ee, rr) {
			                  swal({
		            				 title: "系统提示",
						             text: "请求服务器失败,清稍候再试",
						             type: "warning"
						         	},function(){
							         });
		            }
				});
			  }
			  var id_up = '';
			  function showUpWin(){
		        var selects =$('#table').bootstrapTable('getSelections');
		        if(selects.length<=0){
					swal('系统提示','请选择要编辑的单位！','warning');
					return ;
				}
				
				if(selects.length>1){
					swal('系统提示','不能同时编辑多个单位！','warning');
					return ;
				}
				id_up = selects[0].id;
		      	$("#name_up").val(selects[0].name);
		      	$("#outside_code_up").val(selects[0].outside_code);
		      	$("#unitTypeId_up").val(selects[0].unitTypeId);
		      	$("#unitGradeId_up").val(selects[0].unitGradeId);
				$("#upwin").modal('show');
			  }
			  //重置查询条件
			  function reset(){
			  	  $('#unitInfoName').val('');
			  	  $('#unitGradeSel').val('');
			  	  $('#unitTypeSel').val('');
			  }
		</script>
</body>
</html>