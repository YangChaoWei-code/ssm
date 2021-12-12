<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>院校管理员管理</title>

<meta name="keywords" content="院校管理员管理">
<meta name="description" content="院校管理员管理">
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

</head>

<body class="gray-bg black-bg-gmtx">
	<div class="wrapper wrapper-content ">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<div class="row">
					<div class="col-sm-3">
						<label class="col-sm-2 control-label"> 省： </label>
						<div class="col-sm-10 controls">
							<select data-placeholder="请选择所属省"
								onchange="changeSheng('_search')" class="form-control"
								name="sheng_search" id="sheng_search" tabindex="3">
								<option value>请选择...</option>
							</select>
						</div>
					</div>
					<div class="col-sm-3">
						<label class="col-sm-2 control-label"> 市： </label>
						<div class="col-sm-10 controls">
							<select data-placeholder="请选择所属市" onchange="changeShi('_search')"
								class="form-control" name="shi_search" id="shi_search"
								tabindex="3">
								<option value>请选择</option>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
						<label class="col-sm-3 control-label"> 院校： </label>
						<div class="col-sm-9 controls">
							<select data-placeholder="请选择院校" class="form-control"
								name="xian_search" id="xian_search" tabindex="3">
								<option value>请选择</option>
							</select>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="用户名"
								id="name_search"> <span class="input-group-btn">
								<button id="btn_search" type="button"
									class="btn btn-gmtx-define1" onclick="search()">搜索</button>
							</span>
						</div>
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
					<div class="col-sm-1">
						<button class="btn btn-gmtx-define1" onclick="javascript:reset()"
							id="btn_reset">重置</button>
					</div>
				</div>
			</div>
			<!-- 院校管理员列表显示 -->
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
					<h4 class="modal-title" id="addwinlable">区域管理员添加</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal" id="addform">
							<div class="form-group">
								<label class="col-sm-3 control-label"> 管理员名： </label>
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
								<label class="col-sm-3 control-label"> 省： </label>
								<div class="col-sm-8 controls">
									<select data-placeholder="请选择所属省"
										onchange="changeSheng('_add')" class="form-control"
										name="sheng_add" id="sheng_add" tabindex="3">
										<option value>请选择</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 市： </label>
								<div class="col-sm-8 controls">
									<select data-placeholder="请选择所属市" onchange="changeShi('_add')"
										class="form-control" name="shi_add" id="shi_add" tabindex="3">
										<option value>请选择</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 院校： </label>
								<div class="col-sm-8 controls">
									<select data-placeholder="请选择院校" class="form-control"
										name="xian_add" id="xian_add" tabindex="3">
										<option value>请选择</option>
									</select>
								</div>
							</div>
							<div class="form-group">
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
					<h4 class="modal-title" id="upwinlable">用户修改</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form method="post" class="form-horizontal" id="upform">
							<div class="form-group">
								<label class="col-sm-3 control-label"> 用户名： </label>
								<div class="col-sm-8 controls">
									<input type="text" value="" class="form-control" name="name"
										id="username_up" tabindex="0" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 省： </label>
								<div class="col-sm-8 controls">
									<select data-placeholder="请选择所属省" onchange="changeSheng('_up')"
										class="form-control" name="sheng_up" id="sheng_up"
										tabindex="3">
										<option value=''>请选择</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 市： </label>
								<div class="col-sm-8 controls">
									<select data-placeholder="请选择所属市" onchange="changeShi('_up')"
										class="form-control" name="shi_up" id="shi_up" tabindex="3">
										<option value=''>请选择</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"> 院校： </label>
								<div class="col-sm-8 controls">
									<select data-placeholder="请选择院校" class="form-control"
										name="xian_up" id="xian_up" tabindex="3">
										<option value=''>请选择</option>
									</select>
								</div>
							</div>
							<div class="form-group">
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
		src="/ccms/commons/jslib/hplus/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript"
		src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

	<script type="text/javascript"
		src="/ccms/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
		/**share---*/
		//判断为空
		function isNull(variable1) {
			if (variable1 == null || variable1 == undefined || variable1 == '') {
				return true;
			}
		}
		//验证form
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
					userType : {
						required : "请选择用户类型",
					}
				},
				submitHandler : function() {
					func();
				}
			});
		}
		//清空窗体
		function clearWin(suffix) {
			$("#username" + suffix).val('');
			$("#userpsw" + suffix).val('');
			$("#sheng" + suffix).val('');
			$("#shi" + suffix).val('');
			$("#xian" + suffix).val('');
		}
		function changeSheng(suffix) {
			var shengid = $('#sheng' + suffix).val();
			$('#shi' + suffix).val('');
			loadCity("/ccms/area/getShiAreaList", "shi" + suffix, shengid);
			$('#xian' + suffix).val('');
		}

		function changeShi(suffix) {
			var shiid = $('#shi' + suffix).val();
			$('#xian' + suffix).val('');
			loadCity("/ccms/area/getXianAreaList", "xian" + suffix, shiid);
		}
		/*---share end**/
		$(function() {
			loadCity("/ccms/area/getShengAreaList", "sheng_search", null);
			loadCity("/ccms/area/getShengAreaList", "sheng_add", null);
			loadCity("/ccms/area/getShengAreaList", "sheng_up", null);
			$("#username_add").val('');
			$("#userpsw_add").val('');
			$("#unitId").val('');
			$("#userType").val('');
			vform('upform', upUser);
			vform('addform', addUser);
			vform('resetform', resetPsw);
			//vform('bindRoleform',bindRole);

			var $table = $('#table');
			// 初始化table
			$table.bootstrapTable({
				url : "/ccms/user/getAreaUser",
				method : 'post',
				contentType : "application/x-www-form-urlencoded",
				dataType : "json",
				pagination : true, //分页
				pageSize : 10,
				pageNumber : 1,
				//toolbar:"#tb",
				singleSelect : false,
				queryParamsType : "undefined",
				queryParams : function queryParams(params) { //设置查询参数
					var param = {
						page : params.pageNumber,
						rows : params.pageSize,
						userType : 4
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
						title : '所属区域',
						field : 'areaName',
						valign : 'middle'
					},
					{
						title : '用户类型',
						field : 'userType',
						valign : 'middle',
						formatter : function(value, row, index) {
							if (value == '1') {
								return '院方';
							} else if (value == '2') {
								return '部门';
							} else if (value == '3') {
								return '平台管理员';
							} else if (value == '4') {
								return '院校管理员';
							}
						}
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
									+ row.delState
									+ '\',\''
									+ row.name
									+ '\',\''
									+ row.areaName
									+ '\',\''
									+ row.province
									+ '\',\''
									+ row.city
									+ '\',\''
									+ row.county + '\')">编辑</a> ';
							var d = '<a href="#" class="btn btn-gmtx-define1" onclick="resetPsw(\''
									+ row.userCode
									+ '\')">重置密码</a> ';
							return e + d;
						}
					} ]
			});
		});
		/**------添加用户------*/
		function addUser() {
			var name = $("#username_add").val();
			var psw = $("#userpsw_add").val();
			var sheng = $("#sheng_add").val();
			var shi = $("#shi_add").val();
			var xian = $("#xian_add").val();
			if (isNull(sheng) && isNull(shi) && isNull(xian)) {
				swal({
					title : "系统提示",
					text : "请选择区域",
					type : "warning"
				});
				return;
			}
			var areaId = sheng;
			if (!(shi == undefined || shi == null || shi == '')) {
				areaId = shi
			}
			if (!(xian == undefined || xian == null || xian == '')) {
				areaId = xian
			}
			var userType = $("#userType_add").val();
			$.ajax({
				url : '/ccms/user/addAreaAdmin',
				type : 'post',
				async : 'true',
				cache : false,
				data : {
					name : name,
					psw : psw,
					userType : userType,
					areaId : areaId
				},
				dataType : 'json',
				success : function(data) {
					if (data.isExist) {
						swal({
							title : "系统提示",
							text : "已存在该管理员名",
							type : "warning"
						}, function() {
							$("#username_add").val('');
						});
					} else if (data.existAdmin) {
						swal({
							title : "系统提示",
							text : "该区域已绑定管理员",
							type : "warning"
						}, function() {
							$("#sheng_add").val('');
							$("#shi_add").val('');
							$("#xian_add").val('');
						});
					} else if (data.success) {
						swal({
							title : "系统提示",
							text : "添加成功",
							type : "success"
						}, function() {
							clearWin("_add");
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
							clearWin("_add");
						});
					}
				},
				error : function(aa, ee, rr) {
					swal({
						title : "系统提示",
						text : "请求服务器失败,清稍候再试",
						type : "warning"
					}, function() {
						clearWin("_add");
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
		var del_State;
		function edit(uCode, delState, uname, areaName, province, city, country) {
			clearWin("_up");
			ucode_up = uCode;
			del_State = delState;
			$("#upwin").modal('show');
			$("#username_up").val(uname);
			$("#showArea_up").val(areaName);
			$("#sheng_up").val(province);
			$("#sheng_up").trigger("change");
			$("#shi_up").val(city);
			$("#shi_up").trigger("change");
			$("#xian_up").val(country);
		}
		function upUser() {
			var name = $("#username_up").val();
			var sheng = $("#sheng_up").val();
			var shi = $("#shi_up").val();
			var xian = $("#xian_up").val();
			//未选择区域,提示
			if (isNull(sheng) && isNull(shi) && isNull(xian)) {
				swal({
					title : "系统提示",
					text : "请选择区域",
					type : "warning"
				});
				return;
			}
			var areaId = sheng;
			if (!(shi == undefined || shi == null || shi == '')) {
				areaId = shi
			}
			if (!(xian == undefined || xian == null || xian == '')) {
				areaId = xian
			}
			var userType = 4;
			$.ajax({
				url : '/ccms/user/upAreaAdmin',
				type : 'post',
				async : 'true',
				cache : false,
				data : {
					userCode : ucode_up,
					name : name,
					userType : userType,
					areaId : areaId,
					delState : del_State
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
					} else if (data.existAdmin) {
						swal({
							title : "系统提示",
							text : "该区域已绑定管理员",
							type : "warning"
						}, function() {
							$("#sheng_up").val('');
							$("#shi_up").val('');
							$("#xian_up").val('');
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
						url : '/ccms/manager/UserController/resetPsw',
						type : 'post',
						async : 'true',
						cache : false,
						data : {
							userCode : userCode_resetPsw
						},
						dataType : 'json',
						success : function(data) {
							if (data.success) {
								swal("您已重置密码!", "密码为111", "success");
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
		//查询
		function search() {
			var _name = $('#name_search').val();
			var sheng = $("#sheng_search").val();
			var shi = $("#shi_search").val();
			var xian = $("#xian_search").val();
			var areaId = sheng;
			if (!(shi == undefined || shi == null || shi == '')) {
				areaId = shi
			}
			if (!(xian == undefined || xian == null || xian == '')) {
				areaId = xian
			}
			var userType = $('#userType_search').val();
			$('#table').bootstrapTable('refresh', {
				query : {
					name : _name,
					areaId : areaId,
					userType : '4',
				}
			});
		}
		//重置查询条件
		function reset() {
			$('#name_search').val('');
			$('#sheng_search').val('');
			$('#shi_search').val('');
			$('#xian_search').val('');
			loadCity("/ccms/area/getShengAreaList", "sheng_search", null);
		}
	</script>
</body>
</html>