<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>

<meta name="keywords" content="用户管理">
<meta name="description" content="用户管理">
<link href="/ccms/commons/css/qy-style.css" rel="stylesheet">
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
	href="/ccms/commons/jslib/hplus/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="/ccms/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="/ccms/commons/jslib/ztreeV3.5.15/css/zTreeStyle/zTreeStyle.css"
	type="text/css"></link>
<style type="text/css">
<!--
.search_div {
	position: relative;
}

.search_ul {
	position: absolute;
	left: 0px
}
-->
</style>
</head>

<body class="gray-bg black-bg-gmtx">
	<div class="wrapper wrapper-content ">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<div class="row">
					<div class="col-sm-4">
						<label class="col-sm-4 control-label"> 用户类型： </label>
						<div class="col-sm-8 controls">
							<select onchange="changeSheBao('_search')"
								data-placeholder="请选择用户类型" class="form-control" tabindex="4"
								name="userType_search" id="userType_search">
								<option value="" hassubinfo="true">请选择</option>
								<option value="1" hassubinfo="true">院方</option>
								<option value="2" hassubinfo="true">单位</option>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
						<label class="col-sm-3 control-label"> 单位： </label>
						<div class="col-sm-9 controls">
							<div class="input-group">
								<input type="text" class="form-control" id="unitId_search">
								<div class="input-group-btn">
									<button type="button" class="btn btn-white dropdown-toggle"
										data-toggle="dropdown">
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu dropdown-menu-right" role="menu">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3 ">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="请输入用户名"
								id="name_search"> <span class="input-group-btn">
								<button id="btn_search" type="button"
									class="btn btn-gmtx-define1" onclick="search()">搜索</button>
							</span>
						</div>
					</div>
					<div class="col-sm-1">
						<button class="btn btn-gmtx-define1" onclick="javascript:reset()"
							id="btn_reset">重置</button>
					</div>
				</div>
				<div class="row" style="margin-top: 10px">
					<div class="col-sm-1">
						<button class="btn btn-gmtx-define1" data-toggle="modal"
							href="#addwin" data-keyboard="true" data-backdrop="false"
							id="btn_add">新增</button>
					</div>
					<div class="col-sm-1">
						<button class="btn btn-gmtx-define1"
							onclick="javascript:delUser()" id="btn_del">删除</button>
					</div>
				</div>
			</div>
			<div class="ibox-content">
				<table id="table">
				</table>
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
					<h4 class="modal-title" id="addwinlable">用户添加</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal" id="addform">
							<div class="form-group">
								<label class="col-sm-3 control-label"> 用户名： </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control" name="name"
										id="username_add" tabindex="1" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 密码： </label>
								<div class="col-sm-8 controls">
									<input type="password" value="" class="form-control" name="psw"
										id="userpsw_add" tabindex="2" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 用户类型： </label>
								<div class="col-sm-8 controls">
									<select onchange="changeSheBao('')" data-placeholder="请选择用户类型"
										class="form-control" tabindex="4" name="userType"
										id="userType">
										<option value="" hassubinfo="true">请选择</option>
										<option value="1" hassubinfo="true">院方</option>
										<option value="2" hassubinfo="true">单位</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 单位： </label>
								<div class="col-sm-8 controls" style="position: relative">
									<div class="input-group search_div">
										<input type="text" class="form-control" id="unitId"
											name="unitId">
										<ul class="dropdown-menu dropdown-menu-right search_ul"
											style="position: absolute; left: 0px" role="menu">
										</ul>
									</div>
								</div>
								<div class="form-group">
									<div class="controls">
										<button type="submit"
											class="btn btn-gmtx-define1 center-block">添加</button>
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
					<h4 class="modal-title" id="upwinlable">用户修改</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal" id="upform">
							<div class="form-group">
								<label class="col-sm-3 control-label"> 用户名： </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control" name="name"
										id="username_up" tabindex="1" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 用户类型： </label>
								<div class="col-sm-8 controls">
									<select onchange="changeSheBao('_up')"
										data-placeholder="请选择用户类型" class="form-control" tabindex="4"
										name="userType" id="userType_up">
										<option value="" hassubinfo="true">请选择</option>
										<option value="1" hassubinfo="true">院方</option>
										<option value="2" hassubinfo="true">单位</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 单位： </label>
								<div class="col-sm-8 controls">
									<div class="input-group search_div">
										<input type="text" class="form-control search_unit"
											id="unitId_up" name="unitId">
										<ul class="dropdown-menu dropdown-menu-right search_ul"
											role="menu">
										</ul>
									</div>
								</div>
							</div>
							<div class="form-group" style="z-index: -100">
								<div class="controls">
									<button type="submit" class="btn btn-gmtx-define1 center-block">
										修改</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 重置密码窗口 -->
	<div class="modal fade" id="resetPswWin">
		<div class="modal-dialog" style="width: 400px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="addwinlable">重置密码</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal" id="resetform">
							<div class="form-group">
								<label class="col-sm-3 control-label"> 用户名： </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control" name="name"
										id="username_reset" disabled tabindex="1" />
								</div>
							</div>
							<div class="form-group">
								<div class="controls">
									<button type="submit" class="btn btn-gmtx-define1 center-block">
										重置</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--配置角色对话框-->
	<div class="modal fade" id="bindRoleWin">
		<div class="modal-dialog" style="width: 400px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">配置角色</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal" id="bindRoleform">
							<div class="form-group">
								<label class="col-sm-3 control-label"> 用户名： </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control" name="name"
										id="username_bindRole" disabled tabindex="1" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 所属角色： </label>
								<div class="col-sm-8 controls" id='roleAccess'></div>
							</div>
							<div class="form-group">
								<div class="controls">
									<button class="btn btn-gmtx-define1 center-block"
										onclick="javascript:bindRole();return false;">确定</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
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

	<script src="/ccms/commons/jslib/hplus/js/plugins/iCheck/icheck.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript"
		src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript"
		src="/ccms/commons/jslib/hplus/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="/ccms/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript"
		src="/ccms/commons/jslib/hplus/js/plugins/suggest/bootstrap-suggest.min.js"></script>
	<script type="text/javascript"
		src="/ccms/commons/jslib/hplus/js/content.min.js"></script>
	<script type="text/javascript">
		//判断为空
		function isNull(variable1) {
			if (variable1 == null || variable1 == undefined || variable1 == '') {
				return true;
			}
		}
		/**share---*/
		var unitId_search; //搜索用机构类别id
		var unitId_add; //添加用机构类别id
		var unitId_up; //更改用机构类别id
		function vform(dom, func) {
			$("#" + dom).validate({
				rules : {
					name : {
						required : true,
						maxlength : 50
					},
					psw : {
						required : true,
						maxlength : 50
					},
					unitId : {
						required : true,
					},
					userType : {
						required : true,
					}
				},
				messages : {
					name : {
						required : "请输入用户名",
						maxlength : "参数名过长"
					},
					psw : {
						required : "请输入密码",
						maxlength : "参数名过长"
					},
					unitId : {
						required : "请选择所属机构",
					},
					userType : {
						required : "请选择用户类型",
					}
				},
				submitHandler : function() {
					func();
				}
			});
		}
		function clearWin(suffix) {
			$("#name" + suffix).val('');
			$("#psw" + suffix).val('');
			$("#unitId" + suffix).val('');
			eval("unitId_" + suffix) = '';
			$("#userType" + suffix).val('');
		}
		/*---share end**/
		$(function() {
			//搜索机构框绑定
			$("#unitId_search").bsSuggest('init', {
				clearable : true,
				url : "/ccms/unitinfo/getUnitList",
				showBtn : false,
				idField : "id",
				keyField : "name",
				effectiveFields : [ "name", "outside_code" ],
				effectiveFieldsAlias : {
					"name" : "机构名",
					"outside_code" : "编码"
				},
			}).on("onSetSelectValue", function(e, keyword) {
				unitId_search = keyword.id;
			}).on("onUnsetSelectValue", function(e) {
				unitId_search = '';
			});
			//添加机构框
			$("#unitId").bsSuggest('init', {
				clearable : true,
				url : "/ccms/unitinfo/getUnitList",
				showBtn : false,
				idField : "id",
				keyField : "name",
				effectiveFields : [ "name", "outside_code" ],
				effectiveFieldsAlias : {
					"name" : "机构名",
					"outside_code" : "编码"
				},
			}).on("onSetSelectValue", function(e, keyword) {
				unitId_add = keyword.id;
			}).on("onUnsetSelectValue", function(e) {
				unitId_add = '';
			});
			//修改机构框
			$("#unitId_up").bsSuggest('init', {
				clearable : true,
				url : "/ccms/unitinfo/getUnitList",
				showBtn : false,
				idField : "id",
				keyField : "name",
				effectiveFields : [ "name", "outside_code" ],
				effectiveFieldsAlias : {
					"name" : "机构名",
					"outside_code" : "编码"
				},
			}).on("onSetSelectValue", function(e, keyword) {
				unitId_up = keyword.id;
			}).on("onUnsetSelectValue", function(e) {
				unitId_up = '';
			});

			//loadUnit("/ccms/manager/CommonController/getUnitList","unitId");
			//loadUnit("/ccms/manager/CommonController/getUnitList","unitId_up");
			//loadUnit("/ccms/manager/CommonController/getUnitList","unitId_search");

			loadRoleChk("/ccms/role/getRoleList", "roleAccess");

			$("#username_add").val('');
			$("#userpsw_add").val('');
			$("#unitId").val('');
			$("#userType").val('');
			vform('upform', upUser);
			vform('addform', addUser);
			vform('resetform', resetPsw);

			var $table = $('#table');
			$table
					.bootstrapTable({
						url : "/ccms/user/getUser",
						method : 'post',
						contentType : "application/x-www-form-urlencoded",
						dataType : "json",
						pagination : true, // 分页
						pageSize : 50,
						pageNumber : 1,
						//toolbar:"#tb",
						singleSelect : false,
						queryParamsType : "undefined",
						queryParams : function queryParams(params) { //设置查询参数
							var param = {
								page : params.pageNumber,
								rows : params.pageSize
							};
							return param;
						},
						cache : false,
						//data-locale: "zh-CN", //表格汉化
						//search: true, //显示搜索框
						sidePagination : "server", //服务端处理分页
						columns : [
								{
									checkbox : true
								},
								{
									title : '用户名',
									field : 'name',
									valign : 'middle'
								},
								{
									title : '所属单位',
									field : 'unitName',
									valign : 'middle'
								},
								{
									title : '用户类型',
									field : 'userType',
									valign : 'middle',
									formatter : function(value, row, index) {
										if (value == '1') {
											return '院方';
										} else if (value = '2') {
											return '单位';
										}
									}
								},
								{
									title : '所属角色',
									field : 'roleNames',
									valign : 'middle'
								},
								{
									title : '操作人',
									field : 'operator',
									valign : 'middle'
								},
								{
									title : '操作时间',
									field : 'operatorTime',
									valign : 'middle',
									formatter : function(value, row, index) {
										return value.substring(0,
												value.length - 2);
									}
								},
								{
									title : '操作',
									field : 'id',
									formatter : function(value, row, index) {
										var e = '<a href="#" class="btn btn-gmtx-define1" onclick="edit(\''
												+ row.userCode
												+ '\',\''
												+ row.name
												+ '\',\''
												+ row.psw
												+ '\',\''
												+ row.unitId
												+ '\',\''
												+ row.userType
												+ '\',\''
												+ row.unitName
												+ '\')">编辑</a> ';
										d = '<a href="#" class="btn btn-gmtx-define1" onclick="resetPsw(\''
												+ row.userCode
												+ '\')">重置密码</a> ';
										//var d = '<a href="#" class="btn btn-gmtx-define1" onclick="showResetPswWin(\''+ row.userCode +'\',\''+row.name+'\')">重置密码</a> '; 
										var f = '<a href="#" class="btn btn-gmtx-define1" onclick="bindRoleShow(\''
												+ row.userCode
												+ '\',\''
												+ row.name + '\')">角色分配</a> ';
										return e + d + f;
									}
								} ]
					});
		});
		/**------添加用户------*/
		function addUser() {
			var name = $("#username_add").val();
			var psw = $("#userpsw_add").val();
			var unitId = unitId_add;
			var userType = $("#userType").val();
			console.info(unitId);
			if (userType != 1) {
				if (isNull(unitId)) {
					swal({
						title : "系统提示",
						text : "请选择机构",
						type : "warning"
					});
					return;
				}
			}
			$.ajax({
				url : '/ccms/user/addUser',
				type : 'post',
				async : 'true',
				cache : false,
				data : {
					name : name,
					psw : psw,
					unitId : unitId,
					userType : userType
				},
				dataType : 'json',
				success : function(data) {
					if (data.isExist) {
						swal({
							title : "系统提示",
							text : "已存在该用户名",
							type : "warning"
						}, function() {
							$("#username_add").val('');
						});
					} else if (data.isExistUnit) {
						swal({
							title : "系统提示",
							text : "该机构已绑定用户名",
							type : "warning"
						}, function() {
							$("#unitId").val('');
						});
					} else if (data.success) {
						swal({
							title : "系统提示",
							text : "添加成功",
							type : "success"
						}, function() {
							$("#username_add").val('');
							$("#userpsw_add").val('');
							$("#unitId").val('');
							$("#userType").val('');
							$("#addwin").modal('hide');
							$('#table').bootstrapTable("refresh");
						});
					} else {
						swal({
							title : "系统提示",
							text : "添加失败",
							type : "warning"
						}, function() {
							$("#name").val('');
							$("#psw").val('');
							$("#unitId").val('');
							$("#userType").val('');
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
						$("#username_add").val('');
						$("#userpsw_add").val('');
						$("#unitId").val('');
						$("#userType").val('');
						$("#addwin").modal('hide');
					});
				}
			});
			//return false;
		}
		/**----删除----*/
		function delUser() {
			var ids = '';
			var selects = $('#table').bootstrapTable('getSelections');
			if (selects.length <= 0) {
				swal('系统提示', '请选择要删除的用户！', 'warning');
				return;
			}

			ids = "'" + selects[0].userCode + "'";
			for (var i = 1; i < selects.length; i++) {
				ids += ",'" + selects[i].userCode + "'";
			}

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
						url : '/ccms/user/delUser',
						type : 'post',
						async : 'true',
						cache : false,
						data : {
							ids : ids
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
		var ucode_up;
		function edit(uCode, uname, upsw, unitId, userType, unitName) {
			unitId_up = '';
			$("#unitId_up").val(''); //先青空
			unitId_up = unitId;
			ucode_up = uCode;
			if (userType == 1) {
				$('#unitId_up').val('');
				$('#unitId_up').attr('disabled', 'disabled');
			} else {
				$('#unitId_up').removeAttr('disabled');
			}
			$("#username_up").val(uname);
			$("#unitId_up").attr("data-id", unitId);
			$("#unitId_up").val(unitName);
			$("#userType_up").val(userType);
			$("#upwin").modal('show');
		}
		function upUser() {
			var name = $("#username_up").val();
			var psw = $("#userpsw_up").val();
			var unitId = unitId_up;
			var userType = $("#userType_up").val();
			if (userType != 1) {
				if (isNull(unitId)) {
					swal({
						title : "系统提示",
						text : "请选择机构",
						type : "warning"
					});
					return;
				}
			}
			$.ajax({
				url : '/ccms/user/upUser',
				type : 'post',
				async : 'true',
				cache : false,
				data : {
					userCode : ucode_up,
					name : name,
					unitId : unitId,
					userType : userType
				},
				dataType : 'json',
				success : function(data) {
					if (data.isExist) {
						swal({
							title : "系统提示",
							text : "已存在该用户名",
							type : "warning"
						}, function() {
							$("#userName").val('');
							$("#addwin").modal('hide');
						});
					} else if (data.isExistUnit) {
						swal({
							title : "系统提示",
							text : "该机构已绑定用户名",
							type : "warning"
						}, function() {
							$("#unitId_edit").val('');
						});
					} else if (data.success) {
						swal({
							title : "系统提示",
							text : "修改成功",
							type : "success"
						}, function() {
							$("#userName_edit").val('');
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
						//$("#userName_edit").val('');
						//$("#upwin").modal('hide');
					});
				}
			});
		}
		var userCode_resetPsw = '';
		function showResetPswWin(userCode, name) {
			userCode_resetPsw = userCode;
			$('#username_reset').val(name);
			$('#psw_reset').val('');
			$("#resetPswWin").modal('show');
		}
		//重置密码
		function resetPsw(userCode_resetPsw) {
			//var psw = $('#psw_reset').val();
			swal({
				title : "系统提示",
				text : "您确定要重置密码吗?",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "重置",
				cancelButtonText : "取消",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						url : '/ccms/user/resetPsw',
						type : 'post',
						async : 'true',
						cache : false,
						data : {
							userCode : userCode_resetPsw
						},
						dataType : 'json',
						success : function(data) {
							if (data.success) {
								swal("您已重置密码！", "密码为111", "success");
								$('#username_reset').val('');
								$('#psw_reset').val('');
								$('#table').bootstrapTable("refresh");
							} else {
								swal({
									title : "系统提示",
									text : "重置密码失败",
									type : "warning"
								});
								$('#username_reset').val('');
								$('#psw_reset').val('');
							}
							$("#resetPswWin").modal('hide');
						},
						error : function(aa, ee, rr) {
							swal({
								title : "系统提示",
								text : "请求服务器失败,清稍候再试",
								type : "warning"
							});
							$('#username_reset').val('');
							$('#psw_reset').val('');
							$("#resetPswWin").modal('hide');
						}
					});
				} else {
					swal("已取消", "您取消了重置密码操作！", "error")
				}
			});
		}
		var userCode_bindRole = '';
		// 显示用户原有角色
		function bindRoleShow(code, name) {
			$("#roleAccess").find("input[type='checkbox']").each(function() {
				$(this).prop('checked', false);
			});
			userCode_bindRole = code;
			$('#username_bindRole').val(name);
			$.ajax({
				url : '/ccms/user/getCheckedRole',
				type : 'post',
				async : false,
				cache : false,
				data : {
					userCode : userCode_bindRole
				},
				dataType : 'json',
				success : function(data) {
					roleIds = data.roleCodes;
					for (var i = 0; i < roleIds.length; i++) {
						if (roleIds[i] != null && roleIds[i] != '') {
							$("#" + roleIds[i]).prop("checked", true);
						}
					}
				},
				error : function(aa, ee, rr) {
				}
			});
			$('#bindRoleWin').modal('show');
		}
		// 绑定新的角色
		function bindRole() {
			var roles = "";
			var r = document.getElementsByName("roles");
			for (var i = 0; i < r.length; i++) {
				if (r[i].checked) {
					roles = roles + r[i].value + ",";
				}
			}
			if (roles == "") {
				swal('系统提示', '请至少选择一个角色!', 'warning');
				return false;
			}
			$.ajax({
				url : '/ccms/user/bindRole',
				type : 'post',
				async : 'true',
				cache : false,
				data : {
					userCode : userCode_bindRole,
					roleCodes : roles
				},
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						swal("系统提示！", "绑定成功。", "success");
						$('#table').bootstrapTable("refresh");
					} else {
						swal({
							title : "系统提示",
							text : "绑定失败",
							type : "warning"
						});
					}
					$('#bindRoleWin').modal('hide');
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
		//查询
		function search() {
			var _name = $('#name_search').val();
			var unitId = unitId_search;
			var userType = $('#userType_search').val();
			$('#table').bootstrapTable('refresh', {
				query : {
					name : _name,
					unitId : unitId,
					userType : userType
				}
			});
		}
		//当用户类型为院方时禁用单位
		function changeSheBao(suffix) {
			if ($('#userType' + suffix).val() == 1) {
				$('#unitId' + suffix).val('');
				$('#unitId' + suffix).attr('disabled', 'disabled');
			} else {
				$('#unitId' + suffix).removeAttr('disabled');
			}
		}
		//重置查询条件
		function reset() {
			$('#unitId_search').val('');
			unitId_search = '';
			$('#userType_search').val('');
			$('#name_search').val('');
			//$('#unitId_search').removeAttr('disabled');
		}
		$(function() {
			$('.search_ul').css({
				left : '0px',
				width : '100%'
			});
		});
	</script>
</body>
</html>