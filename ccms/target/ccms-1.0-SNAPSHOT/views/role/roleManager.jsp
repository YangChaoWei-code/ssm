<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>

<meta name="keywords" content="角色管理">
<meta name="description" content="角色管理">
<link href="/ccms/commons/jslib/hplus/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/animate.min.css"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/style.min.css"
	rel="stylesheet">
<link
	href="/ccms/commons/jslib/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="/ccms/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="/ccms/commons/jslib/ztreeV3.5.15/css/zTreeStyle/zTreeStyle.css"
	type="text/css"></link>
<link href="/ccms/commons/css/qy-style.css" rel="stylesheet">
<!-- jQuery -->
<script src="/ccms/commons/jslib/hplus/js/jquery.min.js"></script>
<script src="/ccms/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>
<script
	src="/ccms/commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>
<script
	src="/ccms/commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>
<script src="/ccms/commons/jslib/CommonValue.js"></script>
<script type="text/javascript"
	src="/ccms/commons/jslib/ztreeV3.5.15/jquery.ztree.all-3.5.js"></script>

<script type="text/javascript"
	src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript"
	src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript"
	src="/ccms/commons/jslib/hplus/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/ccms/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
</head>
<script type="text/javascript">
	/**share---*/
	function vform(dom, func) {
		$("#" + dom).validate({
			rules : {
				roleName : {
					required : true,
					maxlength : 50
				}
			},
			messages : {
				roleName : {
					required : "请输入用户名",
					maxlength : "参数名过长"
				}
			},
			submitHandler : function() {
				func();
			}
		});
	}
	/*---share end**/
		$(function() {
			vform('upform', upRole);
			vform('addform', addRole);
			var $table = $('#table');
			$table.bootstrapTable({
				url : "/ccms/role/getAllRole",
				method : 'post',
				contentType : "application/x-www-form-urlencoded",
				dataType : "json",
				pagination : true, //分页
				pageSize : 3,
				pageNumber : 1,
				singleSelect : false,
				queryParamsType : "undefined",
				queryParams : function queryParams(params) { //设置查询参数
					var param = {
						page : params.pageNumber,
						rows : params.pageSize,
					};
					return param;
				},
				cache : false,
				sidePagination : "server", //服务端处理分页
				columns : [
				{
					title : '角色',
					field : 'roleName',
					width : '50%',
					valign : 'middle'
				},
				{
					title : '操作',
					field : 'id',
					formatter : function(value, row, index) {
						var e = '<a href="#" class="btn btn-gmtx-define1" onclick="edit(\''
								+ row.roleCode
								+ '\',\''
								+ row.roleName + '\')">编辑</a> ';
						var d = '<a href="#" class="btn btn-gmtx-define1" onclick="delRole(\''
								+ row.roleCode + '\')">删除</a> ';
						var f = '<a href="#" class="btn btn-gmtx-define1" onclick="accessShow(\''
								+ row.roleCode + '\')">权限设置</a> ';
						return e + d + f;
					}
				} ]
			});
		});
	/**------添加角色------*/
	function addRole() {
		var roleName = $("#roleName").val();
		$.ajax({
			url : '/ccms/role/addRole',
			type : 'post',
			async : 'true',
			cache : false,
			data : {
				roleName : roleName
			},
			dataType : 'json',
			success : function(data) {
				if (data.isExist) {
					swal({
						title : "系统提示",
						text : "已存在该角色名",
						type : "warning"
					}, function() {
						$("#roleName").val('');
						$("#addwin").modal('hide');
					});
				} else if (data.success) {
					swal({
						title : "系统提示",
						text : "添加成功",
						type : "success"
					}, function() {
						$("#roleName").val('');
						$("#addwin").modal('hide');
						$('#table').bootstrapTable("refresh");
					});
				} else {
					swal({
						title : "系统提示",
						text : "添加失败",
						type : "warning"
					}, function() {
						$("#roleName").val('');
						$("#addwin").modal('hide');
					});
				}
			},
			error : function(aa, ee, rr) {
				swal({
					title : "系统提示",
					text : "请求服务器失败,清稍候再试",
					type : "warning"
				}, function() {
					$("#roleName").val('');
					$("#addwin").modal('hide');
				});
			}
		});
	}
	/**----删除----*/
	function delRole(rolecode) {
		swal({
			title : "您确定要删除这条信息吗",
			text : "删除后将无法恢复，请谨慎操作！",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "删除",
			cancelButtonText : "取消",
			closeOnConfirm : false,
			closeOnCancel : false
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({
					url : '/ccms/role/delRole',
					type : 'post',
					async : 'true',
					cache : false,
					data : {
						roleCode : rolecode
					},
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							swal("删除成功！", "您已经删除了这条信息。", "success");
							$('#table').bootstrapTable("refresh");
						} else {
							swal({
								title : "系统提示",
								text : "删除失败",
								type : "warning"
							});
						}
					},
					error : function(aa, ee, rr) {
						swal({
							title : "系统提示",
							text : "请求服务器失败,清稍候再试",
							type : "warning"
						});
					}
				});
			} else {
				swal("已取消", "您取消了删除操作！", "error")
			}
		});
	}
	/**----修改----*/
	var rcode_edit;
	function edit(rcode, rname) {
		rcode_edit = rcode;
		$("#roleName_edit").val(rname);
		$("#upwin").modal('show');
	}
	function upRole() {
		var roleName = $("#roleName_edit").val();
		/*if(roleName!=rcode_edit){
			 swal({
				title: "系统提示",
		         text: "角色名未更改,请改变角色名",
		         type: "warning"
		     });	
		}*/
		$.ajax({
			url : '/ccms/role/upRole',
			type : 'post',
			async : 'true',
			cache : false,
			data : {
				roleCode : rcode_edit,
				roleName : roleName
			},
			dataType : 'json',
			success : function(data) {
				if (data.isExist) {
					swal({
						title : "系统提示",
						text : "已存在该角色名",
						type : "warning"
					}, function() {
						$("#roleName").val('');
						$("#addwin").modal('hide');
					});
				} else if (data.success) {
					swal({
						title : "系统提示",
						text : "修改成功",
						type : "success"
					}, function() {
						$("#roleName_edit").val('');
						$("#upwin").modal('hide');
						$('#table').bootstrapTable("refresh");
					});
				} else {
					swal({
						title : "系统提示",
						text : "修改失败",
						type : "warning"
					}, function() {
						$("#upwin").modal('hide');
						$('#table').bootstrapTable("refresh");
					});
				}
			},
			error : function(aa, ee, rr) {
				swal({
					title : "系统提示",
					text : "请求服务器失败,清稍候再试",
					type : "warning"
				}, function() {
					//$("#roleName_edit").val('');
					//$("#upwin").modal('hide');
				});
			}
		});
	}
	/**菜单显示*/
	var roleCode_access;
	function accessShow(roleCode) {
		roleCode_access = roleCode;
		// 显示绑定菜单窗口
		$('#accesswin').modal('show');
		//树
		$.ajax({
			url : '/ccms/role/getModule',
			type : 'post',
			async : 'true',
			cache : false,
			data : {
				roleCode : roleCode_access
			},
			dataType : 'json',
			success : function(data) {
				$.fn.zTree.init($("#treeModule"), setting, data);
				$("#py").bind("change", setCheck);
				$("#sy").bind("change", setCheck);
				$("#pn").bind("change", setCheck);
				$("#sn").bind("change", setCheck);
			}
		});
	}
	var setting = {
		check : {
			enable : true,
			autoCheckTrigger : true,
			chkStyle : "checkbox",
			chkboxType : {
				"Y" : "ps",
				"N" : "ps"
			}
		},
		data : {
			simpleData : {
				enable : true
			}
		}
	};
//保存菜单
function saveAccess() {
	var mids = '';
	var treeObj = $.fn.zTree.getZTreeObj("treeModule");
	var nodes = treeObj.getCheckedNodes(true);
	for (i = 0; i < nodes.length; i++) {
		mids = mids + nodes[i].id + ',';
	}
	$.ajax({
		url : '/ccms/role/bindModule',
		type : 'post',
		async : 'true',
		cache : false,
		data : {
			roleCode : roleCode_access,
			mids : mids
		},
		dataType : 'json',
		success : function(data) {
			if (data.success) {
				swal("系统提示！", "绑定成功。", "success");
			} else {
				swal({
					title : "系统提示",
					text : "绑定失败",
					type : "warning"
				});
			}
		},
		error : function(aa, ee, rr) {
			swal({
				title : "系统提示",
				text : "请求服务器失败,清稍候再试",
				type : "warning"
			});
		}
	});
}
</script>
<body class="gray-bg black-bg-gmtx">
	<div class="wrapper wrapper-content ">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox">
					<div class="ibox-title">
						<div id="tb">
							<button class="btn btn-gmtx-define1" data-toggle="modal"
								href="#addwin" data-keyboard="true" data-backdrop="false"
								id="btn_add">新增</button>
						</div>
					</div>
					<!-- 角色列表显示 -->
					<div class="ibox-content">
						<table id="table">
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加窗口 -->
	<div class="modal fade" id="addwin">
		<div class="modal-dialog" style="width: 400px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="addwinlable">角色添加</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal" id="addform">
							<div class="control-group">
								<label class="col-sm-3 control-label"> 角色名 </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control"
										name="roleName" id="roleName" />
								</div>
							</div>
							</br>
							</br>
							</br>
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
	<!-- 修改窗口 -->
	<div class="modal fade" id="upwin">
		<div class="modal-dialog" style="width: 400px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="addwinlable">角色修改</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal" id="upform">
							<div class="control-group">
								<label class="col-sm-3 control-label"> 角色名 </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control"
										name="roleName" id="roleName_edit" />
								</div>
								</br>
								</br>
								</br>
								<div class="control-group">
									<div class="controls">
										<button type="submit"
											class="btn btn-gmtx-define1 center-block">修改</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 绑定菜单窗口 -->
	<div class="modal fade" id="accesswin">
		<div class="modal-dialog" style="width: 400px; height: 250px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">绑定菜单</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="center-gmtx">
							<ul id="treeModule" class="ztree" style="height: 280px"></ul>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-gmtx-define1 center-block"
						onclick="saveAccess()">保存</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>