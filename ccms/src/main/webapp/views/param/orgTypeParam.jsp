<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>单位类型</title>

		<meta name="keywords" content="单位类型">
		<meta name="description" content="单位类型">
		<link href="/${appName}/commons/css/qy-style.css" rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/bootstrap.min.css" rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/animate.min.css" rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/style.min.css" rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/${appName}/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css" type="text/css"></link>
		<link rel="stylesheet" href="/${appName}/commons/jslib/ztreeV3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css"></link>
		<!-- jQuery -->
		<script src="/${appName}/commons/jslib/hplus/js/jquery.min.js"></script>
		<script src="/${appName}/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>
		<script src="/${appName}/commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>
		<script src="/${appName}/commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>
		<script src="/${appName}/commons/jslib/CommonValue.js"></script>

		<script type="text/javascript" src="/${appName}/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
		<script type="text/javascript" src="/${appName}/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
		<script type="text/javascript" src="/${appName}/commons/jslib/hplus/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/${appName}/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
		<script type="text/javascript">
			/**share---*/
			function vform(dom,func){
				$("#"+dom).validate({
						rules : {
							name : {
								required : true,
								maxlength: 50,
							},
							outside_code : {
								required : true,
								maxlength: 50
							},
							sortNum: {
								maxlength: 10,
								digits:true									
							}
						},
						messages : {
							name : {
								required : "请输入参数名称",
								maxlength: "参数名过长"
							},
							outside_code : {
								required : "请输入外部编码",
								maxlength: "参数名过长"
							},
							sortNum: {
								maxlength: "参数名过长"								
							}
						},
						submitHandler : function() {
							func();
						}
				});
			}
			/*---share end**/
			
			$(function(){
				vform('addform',addOrgType);
				vform('upform',upOrgType);
				var $table = $('#table');
			    $table.bootstrapTable({
			    url: "/${appName}/manager/ProParamInfoController_OrgType_Set/getAllOrgType",
			    dataType: "json",
			    method: 'post',
				contentType: "application/x-www-form-urlencoded",
			    pagination: true,
			    pageSize: 50,
			    pageNumber:1,
			    singleSelect: false,
        		checkboxHeader: true,
        		clickToSelect: true,
			    queryParamsType : "undefined",
			    queryParams: function queryParams(params) {  //设置查询参数
		          var param = {
		            pageNo: params.pageNumber,
		            pageSize: params.pageSize
		          };
		          return param;
		        },
			    cache: false,
			    //search: true, //显示搜索框
			    sidePagination: "server", //服务端处理分页
		        columns: [{
                			checkbox: true
           				},
		                {
		                    title: '参数名称',
		                    field: 'name',
		                    //width: '50%',
		                    //align: 'center',
		                    valign: 'middle'
		                },
		                {
		                    title: '外部编码',
		                    field: 'outside_code',
		                    //width: '50%',
		                    //align: 'center',
		                    valign: 'middle'
		                },
		                {
		                    title: '排序号',
		                    field: 'sortNum',
		                    //width: '50%',
		                    //align: 'center',
		                    valign: 'middle'
		                },
		                {
		                    title: '操作',
		                    field: 'id',
		                    //align: 'center',
		                    formatter:function(value,row,index){
			                 var e = '<a href="#" class="btn btn-gmtx-define1" onclick="edit(\''+ row.id +'\',\''+row.name+'\',\''+row.outside_code+'\',\''+row.sortNum+'\')">编辑</a> ';
		                     return e; 
		                  }
		                }
		            ]
			      });
		      });	
		      
		      function clear_add(){
		      		$("#name").val('');
   	                $("#outside_code").val('');
   	                $("#sortNum").val('');
		      }
		      /**-ready()---end-*/
		      function search(){
		        var _name = $('#_search').val();
		      	$('#table').bootstrapTable('refresh', {
		      		 query: {
		                name:_name,
		             }
		        });
		      }
		      /**-查询---*/
		      /**------添加------*/
		      function addOrgType(){
		      	var name = $("#name").val();
		      	var outside = $("#outside_code").val();
		      	var sortNum = $("#sortNum").val();
		      	if(sortNum==''){
		      		sortNum=0;
		      	}
				$.ajax({
					url:'/${appName}/manager/ProParamInfoController_OrgType_Set/addOrgType',
					type:'post',
					async:'true',
					cache:false,
					data:{name:name,'outside_code':outside,sortNum:sortNum},
					dataType:'json',
					success: function(data){
							  if(data.exist=='exitOutCode'){
							  	 swal({
		             					 title: "系统提示",
							             text: "已存在该外部编码",
							             type: "warning"
							         },function(){
				      	                $("#outside_code").val('');
							         });
							  }else if(data.exist=='existName'){
							  	  swal({
		             					 title: "系统提示",
							             text: "已存在该名称",
							             type: "warning"
							         },function(){
				      	                $("#name").val('');
							         });
							  }else if(data.success){
				                  swal({
		             					 title: "系统提示",
							             text: "添加成功",
							             type: "success"
							         },function(){
				      	                $("#name").val('');
				      	                $("#outside_code").val('');
				      	                $("#sortNum").val('');
							         	$("#addwin").modal('hide');
							         	$('#table').bootstrapTable("refresh");
							         });
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
				      	                $("#name").val('');
				      	                $("#outside_code").val('');
				      	                $("#sortNum").val('');
							         });
		            }
				});
			  }
			  /**-删除---*/
			  function delOrgType(){
		  	    var ids = '';
		        var selects =$('#table').bootstrapTable('getSelections');
		        if(selects.length<=0){
					swal('系统提示','请选择要删除的机构类别！','warning');
				}
				ids = "'"+selects[0].id+"'";
		        for(var i = 1;i<selects.length;i++){
		    		ids+=",'"+selects[i].id+"'";
		        }
			  	swal({
		            title: "您确定要删除这条信息吗",
		            text: "删除后将无法恢复，请谨慎操作！",
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
							url:'/${appName}/manager/ProParamInfoController_OrgType_Set/delOrgType',
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
			  /**-修改---*/
			  var id_edit;
			  function edit(id,name,outside_code,sortNum){
			  		if(outside_code=="undefined"){
			  			outside_code='';
			  		}
			  		id_edit=id;
			      	$("#name_edit").val(name);
			      	$("#outside_code_edit").val(outside_code);
			      	$("#sortNum_edit").val(sortNum);
			      	$("#upwin").modal('show');
			  }
				function upOrgType(){
			      	var name = $("#name_edit").val();
			      	var oc =$("#outside_code_edit").val();
			      	var sn =$("#sortNum_edit").val();
			      	if(sn==''){
			      		sn=0;
			      	}
					$.ajax({
					url:'/${appName}/manager/ProParamInfoController_OrgType_Set/upOrgType',
					type:'post',
					async:'true',
					cache:false,
					data:{id:id_edit,name:name,'outside_code':oc,sortNum:sn},
					dataType:'json',
					success: function(data){
								if(data.exist=='exitOutCode'){
							  	 swal({
		             					 title: "系统提示",
							             text: "已存在该外部编码",
							             type: "warning"
							         },function(){
				      	                $("#outside_code_edit").val('');
							         });
							  }else if(data.exist=='existName'){
							  	  swal({
		             					 title: "系统提示",
							             text: "已存在该名称",
							             type: "warning"
							         },function(){
				      	                $("#name_edit").val('');
							         });
							  }else if(data.success){
				                  swal({
		             					 title: "系统提示",
							             text: "修改成功",
							             type: "success"
							         },function(){
				      	                $("#name_edit").val('');
				      	                $("#outside_code_edit").val('');
				      	                $("#sortNum_edit").val('');
							         	$("#upwin").modal('hide');
							         	$('#table').bootstrapTable("refresh");
							         });
				              }else{
				                  swal({
		             					 title: "系统提示",
							             text: "修改失败",
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
						      	                $("#name_edit").val('');
						      	                $("#outside_code_edit").val('');
						      	                $("#sortNum_edit").val('');
									         });
		            
							}  
					});
				}
			  //重置查询条件
			  function reset(){
			  	  $('#_search').val('');
			  }
		</script>
	</head>
	<body class="gray-bg black-bg-gmtx">
		<div class="wrapper wrapper-content ">
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox">
						<div class="ibox-title">
							<div class="row">
								<div class="col-sm-1">
									<button class="btn btn-gmtx-define1" data-toggle="modal" href="#addwin" data-keyboard="true" data-backdrop="false" id="btn_add">
										新增
									</button>
								</div>
								<div class="col-sm-1">
									<button class="btn btn-gmtx-define1" onclick="delOrgType()" data-keyboard="true" data-backdrop="false" id="btn_del">
										删除
									</button>
								</div>
								<div class="col-sm-3 col-md-offset-6">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="请输入参数名称"  id="_search">
										<span class="input-group-btn">
											<button id="btn_search" type="button" class="btn btn-gmtx-define1" onclick="search()">
												搜索
											</button> </span>
									</div>
								</div>
								<div class="col-sm-1">
									<button class="btn btn-gmtx-define1" onclick="javascript:reset()" id="btn_reset">
										重置
									</button>
								</div>
							</div>
						</div>
						<div class="ibox-content">
							<table id="table" data-click-to-select="true" >
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 添加 -->
		<div class="modal fade" id="addwin">
			<div class="modal-dialog" style="width: 400px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="clear_add()" id="btn_colse_add">
							&times;
						</button>
						<h4 class="modal-title" id="addwinlable">
							机构类别添加
						</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<form method="post" class="form-horizontal" id="addform">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										参数名称
									</label>
									<div class="col-sm-8 controls">
										<input type="text" value="" class="form-control" name="name" id="name" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">
										外部编码
									</label>
									<div class="col-sm-8 controls">
										<input type="text" value="" class="form-control" name="outside_code" id="outside_code" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">
										排序号
									</label>
									<div class="col-sm-8 ">
										<input type="text" value="" class="form-control" name="sortNum" id="sortNum" />
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<button type="submit" class="btn btn-gmtx-define1 center-block">
											添加
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 修改 -->
		<div class="modal fade" id="upwin">
			<div class="modal-dialog" style="width: 400px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="winlable">
							机构类别修改
						</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<form method="post" class="form-horizontal" id="upform">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										参数名称
									</label>
									<div class="col-sm-8 controls">
										<input type="text" value="" class="form-control" name="name" id="name_edit" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">
										外部编码
									</label>
									<div class="col-sm-8 controls">
										<input type="text" value="" class="form-control" name="outside_code" id="outside_code_edit" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">
										排序号
									</label>
									<div class="col-sm-8 ">
										<input type="text" value="" class="form-control" name="sortNum" id="sortNum_edit" />
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<button type="submit" class="btn btn-gmtx-define1 center-block">
											修改
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