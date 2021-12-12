<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>院校管理</title>
<link href="/ccms/commons/css/qy-style.css" rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/animate.min.css"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/style.min.css"
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
					<div class="col-sm-1">
						<button class="btn btn-gmtx-define1" onclick="showAdd()"
							id="btn_add">新增</button>
					</div>
					<div class="col-sm-1">
						<button class="btn btn-gmtx-define1" onclick="delModule()"
							id="btn_del">删除</button>
					</div>
				</div>
			</div>
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-3">
						<ul id="schooltree" class="ztree" style="background: #fff"></ul>
					</div>
					<div class="col-sm-9 ">
						<!-- 添加 -->
						<div class="ibox" id="addwin" style="display: none">
							<div class="ibox-title">
								<h5>添加院校</h5>
							</div>
							<div class="ibox-content">
								<div class="ibox-body">
									<div class="row">
										<form method="post" class="form-horizontal" id="addform">
											<div class="form-group">
												<label class="col-sm-3 control-label"> 父节点 </label>
												<div class="col-sm-8 controls">
													<input type="text" value="" class="form-control"
														id="pname_add" disabled /> <input type="text"
														style="display: none" id="parentCode" name="parentCode" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label"> 编号 </label>
												<div class="col-sm-8 controls">
													<input type="text" value="" class="form-control" name="id"
														id="id" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label"> 名称 </label>
												<div class="col-sm-8 controls">
													<input type="text" value="" class="form-control"
														name="moduleName" id="moduleName" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label"> 类别 </label>
												<div class="col-sm-8 controls">
													<select data-placeholder="请选择类型" class="form-control"
														name="areatype" id="areatype" tabindex="3">
														<option value>请选择</option>
														<option value='1'>省</option>
														<option value='2'>市</option>
														<option value='3'>院校</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label"> 是否叶子节点 </label>
												<div class="col-sm-8 " id="isLeaf_add">
													<div class="radio radio-inline">
														<input type="radio" value="1" name="isLeaf" id="isLeaf1">
														<label for="isLeaf1"> 是 </label>
													</div>
													<div class="radio radio-inline">
														<input type="radio" value="0" name="isLeaf" id="isLeaf0">
														<label for="isLeaf0"> 否 </label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label"> 排序号 </label>
												<div class="col-sm-8 ">
													<input type="text" value="" class="form-control"
														name="sortNumber" id="sortNumber" />
												</div>
											</div>
											<div class="control-group">
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

						<!-- 修改 -->
						<div class="ibox" id="upwin" style="display: none">
							<div class="ibox-title">
								<h5>修改院校</h5>
							</div>
							<div class="ibox-content">
								<div class="ibox-body">
									<div class="ibox-body">
										<div class="row">
											<form method="post" class="form-horizontal" id="upform">
												<div class="form-group">
													<label class="col-sm-3 control-label"> 父节点 </label>
													<div class="col-sm-8 controls">
														<input type="text" value="" class="form-control"
															id="pname_edit" disabled /> <input type="text"
															style="display: none" id="parentCode_edit"
															name="parentCode" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label"> 编号 </label>
													<div class="col-sm-8 controls">
														<input type="text" value="" class="form-control" name="id"
															id="id_up" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label"> 院校名称 </label>
													<div class="col-sm-8 controls">
														<input type="text" value="" class="form-control"
															name="moduleName" id="moduleName_edit" /> <input
															type="text" style="display: none" name="moduleCode"
															id="moduleCode_edit" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label"> 类别 </label>
													<div class="col-sm-8 controls">
														<select data-placeholder="请选择类型" class="form-control"
															name="areatype" id="areatype_up" tabindex="3">
															<option value>请选择</option>
															<option value='1'>省</option>
															<option value='2'>市</option>
															<option value='3'>院校</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label"> 是否叶子节点 </label>
													<div class="col-sm-8" id="isLeaf_edit">
														<div class="radio radio-inline">
															<input type="radio" value="1" name="isLeaf"
																id="isLeaf1_edit"> <label for="isLeaf1_edit">
																是 </label>
														</div>
														<div class="radio radio-inline">
															<input type="radio" value="0" name="isLeaf"
																id="isLeaf0_edit"> <label for="isLeaf0_edit">
																否 </label>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label"> 排序号 </label>
													<div class="col-sm-8 ">
														<input type="text" value="" class="form-control"
															name="sortNumber" id="sortNumber_edit" />
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														<button type="submit"
															class="btn btn-gmtx-define1 center-block">修改</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
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

		<script type="text/javascript"
			src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
		<script type="text/javascript"
			src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
		<script type="text/javascript"
			src="/ccms/commons/jslib/hplus/js/bootstrap.min.js"></script>
		<script type="text/javascript"
			src="/ccms/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
		<script type="text/javascript"
			src="/ccms/commons/jslib/js-gmxt-define/ztreeTool.js"></script>
		<script type="text/javascript"
			src="/ccms/commons/jslib/hplus/js/plugins/jasny/jasny-bootstrap.min.js"></script>
		<script type="text/javascript"
			src="/ccms/commons/jslib/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>
		<script type="text/javascript">
			/**share---*/
			function vform(dom, func) {
				$("#" + dom).validate({
					rules : {
						id : {
							required : true,
							maxlength : 50,
						},
						moduleName : {
							required : true,
							maxlength : 50,
						},
						modulePath : {
							maxlength : 100
						},
						parentCode : {

						},
						isLeaf : {

						},
						areatype : {
							required : true,
						},
						sortNumber : {
							required : true,
							digits : true,
							maxlength : 10
						}
					},
					messages : {
						id : {
							required : "请输入编号",
							maxlength : "编号超出长度"
						},
						moduleName : {
							required : "请输入模板名称",
							maxlength : "名称超出长度"
						},
						parentCode : {

						},
						isLeaf : {

						},
						areatype : {
							required : "请选择类别",
						},
						sortNumber : {
							required : "请输入排序号",
							digits : "请输入数字",
							maxlength : "参数名过长"
						}
					},
					submitHandler : function() {
						func();
						return false;
					}
				});
			}
			/*---share end**/
			var setting = {
				check : {
					enable : true,
					autoCheckTrigger : true,
					chkStyle : "checkbox",
					chkboxType : {
						"Y" : "s",
						"N" : "ps"
					}
				},
				data : {
					simpleData : {
						enable : false,
					}
				},
				edit : {
					enable : true,
					showRemoveBtn : false,
					showRenameBtn : false,
					drag : {
						autoExpandTrigger : true,
						prev : false,
						inner : true,
						next : false
					}
				},
				callback : {
					onClick : zTreeOnClick,
					onDrop : zTreeOnDrop,
					beforeDrop : zTreeBeforeDrop
				}
			};

			$(function() {
				vform('addform', addModule);
				vform('upform', upModule);
				loadSchoolTree();
			});
			//加载数据树
			function loadSchoolTree() {
				$
						.ajax({
							url : '/ccms/school/getTreeList',
							type : 'post',
							async : 'true',
							cache : false,
							data : {},
							dataType : 'json',
							success : function(data) {
								$.fn.zTree.init($("#schooltree"), setting,
										data.zNodes);
							}
						});
			}
			//节点点击事件
			function zTreeOnClick(event, treeId, treeNode) {
				$('#addwin').hide();
				if (isSelected("schooltree")) {
					if (getSelected("schooltree").id != "null") {
						$('#upwin').show();
						loadSingleData(getSelected("schooltree").id);
					} else {
						$("#addwin").hide();
						$("#upwin").hide();
					}
				}
			}
			//加载单条数据
			function loadSingleData(id) {
				$.ajax({
					url : '/ccms/school/getSingleData',
					dataType : 'json',
					data : {
						id : id
					},
					type : 'post',
					success : function(data) {
						$("#pname_edit").val(data.moduleData.parentName);
						$("#id_up").val(data.moduleData.areaNumber);
						$("#moduleCode_edit").val(data.moduleData.areaNumber);
						$("#moduleName_edit").val(data.moduleData.name);
						$("#parentCode_edit").val(data.moduleData.parentId);
						$("#isLeaf_edit>input[name='isLeaf']:checked").prop(
								'checked', false);
						$("#isLeaf" + data.moduleData.isLeaf + "_edit").prop(
								'checked', true);
						$("#sortNumber_edit").val(data.moduleData.sortNum);
						$("#areatype_up").val(data.moduleData.type);

						if (data.moduleData.areaNumber == '') {
							$("#id_up").attr('disabled', true);
							$("#moduleName_edit").attr('disabled', true);
							$("#moduleCode_edit").attr('disabled', true);
							$("#modulePath_edit").attr('disabled', true);
							$("#parentCode_edit").attr('disabled', true);
							$("#areatype_up").attr('disabled', true);
							$("#isLeaf_edit input[name='isLeaf']").attr(
									'disabled', true);
							$("#sortNumber_edit").attr('disabled', true);
						} else {
							$("#id_up").attr('disabled', true);
							$("#moduleName_edit").attr('disabled', false);
							$("#areatype_up").attr('disabled', false);
							$("#moduleCode_edit").attr('disabled', false);
							$("#modulePath_edit").attr('disabled', false);
							$("#parentCode_edit").attr('disabled', false);
							$("#isLeaf_edit input[name='isLeaf']").attr(
									'disabled', false);
							$("#sortNumber_edit").attr('disabled', false);
						}
					},
					error : function() {
						swal('系统提示', '抱歉，数据加载失败。', 'info');
					}
				});
			}
			//显示添加窗口
			function showAdd() {
				if (isSelected("schooltree")) {
					// 判断院校树上选择的节点是否为叶子节点
					var node = jsonToObj(getSelected("schooltree").attributes);
					if (node.isLeaf == '1') {
						swal('系统提示', '该节点为叶子节点!', 'warning');
						return;
					}
					// 获取选择的节点中的区域/院校名称
					$("#pname_add").val(getSelected("schooltree").name);
					// 获取选择的节点中的区域/院校编号
					$("#parentCode").val(getSelected("schooltree").id);
					// 隐藏修改院校表单
					$('#upwin').hide();
					// 显示添加院校表单
					$('#addwin').show();
				} else {
					swal("系统提示", "请选择父节点", "warning");
				}
			}
			//添加
			function addModule() {
				var id = $("#id").val();
				var name = $("#moduleName").val();
				var areatype = $("#areatype").val();
				if (areatype == 0) {
					swal({
						title : "系统提示",
						text : "请选择类别",
						type : "warning"
					});
				}
				var parentId = $("#parentCode").val();
				var isLeaf = $("#isLeaf_add input[name='isLeaf']:checked")
						.val();
				var sortNumber = $("#sortNumber").val();
				if (sortNumber == '') {
					sortNumber = 0;
				}
				$.ajax({
					url : '/ccms/school/addSchool',
					type : 'post',
					async : 'true',
					cache : false,
					data : {
						areaNumber : id,
						name : name,
						parentId : parentId,
						isLeaf : isLeaf,
						sortNum : sortNumber,
						type : areatype
					},
					dataType : 'json',
					success : function(data) {
						if (data.exist == 'existName') {
							swal({
								title : "系统提示",
								text : "已存在该名称",
								type : "warning"
							}, function() {
								$("#moduleName").val('');
							});
						} else if (data.success) {
							swal({
								title : "系统提示",
								text : "添加成功",
								type : "success"
							}, function() {
								$("#id").val('');
								$("#moduleName").val('');
								$("#modulePath").val('');
								$("#parentCode").val('');
								$("#isLeaf_add input[name='isLeaf']:checked")
										.attr('checked', false);
								$("#sortNumber").val('');
								$("#addwin").modal('hide');
								loadSchoolTree();
							});
						} else {
							swal({
								title : "系统提示",
								text : "添加失败",
								type : "warning"
							});
						}
					},
					error : function(aa, ee, rr) {
						swal({
							title : "系统提示",
							text : "请求服务器失败,清稍候再试",
							type : "warning"
						}, function() {
						});
					}
				});
			}
			/**-删除---*/

			function delModule() {
				var ids = '';
				var selects = getCheckeds('schooltree', true);
				if (selects == null) {
					swal('系统提示', '请选择要删除的模板！', 'warning');
					return;
				}
				ids = "'" + selects[0].id + "'";
				for (var i = 1; i < selects.length; i++) {
					if (selects[i].id == 0) {
						swal('系统提示', '请勿删除根节点！', 'warning');
						return;
					}
					ids += ",'" + selects[i].id + "'";
				}
				swal(
				{
					title : "您确定要删除吗",
					text : "删除后将无法恢复，请谨慎操作！",
					type : "warning",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "删除",
					cancelButtonText : "取消",
					closeOnConfirm : false,
					closeOnCancel : false
				},
				function(isConfirm) {
					if (isConfirm) {
						$.ajax({
							url : '/ccms/school/delSchool',
							type : 'post',
							async : 'true',
							cache : false,
							contentType : "application/x-www-form-urlencoded; charset=utf-8",
							data : {
								ids : ids
							},
							dataType : 'json',
							success : function(data) {
								if (data.success) {
									swal("系统提示！", "删除成功!",
											"success");
									loadSchoolTree();
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
			//修改
			function upModule() {
				var id = $("#id_up").val();
				var moduleName = $("#moduleName_edit").val();
				var moduleCode = $("#moduleCode_edit").val();
				var modulePath = $("#modulePath_edit").val();
				var parentCode = $("#parentCode_edit").val();
				var isLeaf = $("#isLeaf_edit input[name='isLeaf']:checked")
						.val();
				var sortNumber = $("#sortNumber_edit").val();
				var areatype = $("#areatype_up").val();
				if (areatype == 0) {
					swal({
						title : "系统提示",
						text : "请选择类别",
						type : "warning"
					});
				}
				$.ajax({
					url : '/ccms/school/upSchool',
					type : 'post',
					async : 'true',
					cache : false,
					data : {
						areaNumber : id,
						areaNumber : moduleCode,
						name : moduleName,
						parentId : parentCode,
						isLeaf : isLeaf,
						sortNum : sortNumber,
						type : areatype
					},
					dataType : 'json',
					success : function(data) {
						if (data.exist == 'existName') {
							swal({
								title : "系统提示",
								text : "已存在该名称",
								type : "warning"
							}, function() {
								$("#moduleName_edit").val('');
							});
						} else if (data.success) {
							swal({
								title : "系统提示",
								text : "修改成功",
								type : "success"
							}, function() {
								loadSchoolTree();
							});
						} else {
							swal({
								title : "系统提示",
								text : "修改失败",
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
			function zTreeOnDrop(event, treeId, treeNodes, targetNode, moveType) {
				var selfId = treeNodes[0].id;
				var parentId = targetNode.id;

				$.ajax({
					url : '/ccms/school/changeJoin',
					dataType : 'json',
					data : {
						selfId : selfId,
						parentId : parentId
					},
					type : 'post',
					success : function(jsonData) {
						if (jsonData.rtnCode = 0) {
							swal('系统提示', "修改层级关系成功", 'info');
							loadSchoolTree();
						}

					},
					error : function() {
						swal('系统提示', "修改层级关系失败~~", 'info');
					}
				});

			};

			function zTreeBeforeDrop(treeId, treeNodes, targetNode, moveType) {

				if (jsonToObj(targetNode.attributes).isLeaf == '1') {
					swal('系统提示', "目标节点已是末节点，不可进行拖拽~~", 'info');
					return false;
				} else {
					return true;

				}
			};
		</script>
</body>
</html>