<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>批量添加单位</title>

<link rel="shortcut icon" href="favicon.ico">
<link href="/ccms/commons/jslib/hplus/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/animate.min.css"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/style.min.css?v=4.0.0"
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

<script src="/ccms/commons/jslib/hplus/js/jquery.min.js?v=2.1.4"></script>
<script src="/ccms/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>

<script src="/ccms/commons/jslib/hplus/js/bootstrap.min.js?v=3.3.5"></script>
<script src="/ccms/commons/jslib/hplus/js/content.min.js?v=1.0.0"></script>

<!-- Sweet Alert -->
<script type="text/javascript"
	src="/ccms/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
<!-- Sweet Alert -->


<script src="/ccms/commons/jslib/hplus/js/plugins/iCheck/icheck.min.js"></script>

<script src="/ccms/commons/jslib/CommonValue.js"></script>

<script src="/ccms/commons/jslib/layer/layer.js"></script>

<script>
	var loading_index;
	//选中的两定机构
	var unitSelectedArray = new Array();

	$(document).ready(function() {
		loadUnitInfo();

		loadUnitType("/ccms/unitinfo/getUnitTypeList", "unitTypeSel");

		loadUnitGrade("/ccms/unitinfo/getUnitGradeList", "unitGradeSel");

	});

	//加载单位信息
	function loadUnitInfo() {
		//loading层
		loading_index = layer.load(1, {
			shade : [ 0.3, '#fff' ]
		//0.1透明度的白色背景
		});
		var NullMsg = $('<div class="row text-center"><div class="col-sm-12"><span style="color: #FF0000">搜索内容为空</span></div></div>');
		$
				.ajax({
					url : '/ccms/unitinfo/queryUnitInfoList',
					dataType : 'json',
					data : {
						nameOrCode : $("#unitInfoName").val(),
						unitTypeId : $("#unitTypeSel  option:selected").val(),
						unitGradeId : $("#unitGradeSel  option:selected").val()
					},
					type : 'post',
					success : function(data) {
						//将父页面选中的单位添加到数组中来
						parent.$('input[name="checkbox_unit_parent"]:checked')
								.each(
										function() {

											if (unitSelectedArray.indexOf($(
													this).val()) < 0) {
												unitSelectedArray.push($(this)
														.val());
											}
										});
						$("#unitInfoDiv").empty();
						if (data.count > 0) {
							var currentRow = 0;
							var row = $('<div class="row"></div>');
							$
									.each(
											data.unitInfoList,
											function(index, ele) {
												var col_sm_6_nocheck = $('<div class="col-sm-6">'
														+ '<div class="checkbox checkbox-success checkbox-inline">'
														+ '<input type="checkbox" id="checkBox_'
														+ ele.id
														+ '" name="checkbox_unit" onclick="javascript:bindClick(this);" value="'
														+ ele.id
														+ '|'
														+ ele.name
														+ '|'
														+ ele.outside_code
														+ '"'
														+ '>'
														+ '<label for="checkBox_'+ele.id+'">'
														+ ele.name
														+ '</label>'
														+ '</div>');

												var col_sm_6_check = $('<div class="col-sm-6">'
														+ '<div class="checkbox checkbox-success checkbox-inline">'
														+ '<input type="checkbox" id="checkBox_'
														+ ele.id
														+ '" name="checkbox_unit" onclick="javascript:bindClick(this);" value="'
														+ ele.id
														+ '|'
														+ ele.name
														+ '|'
														+ ele.outside_code
														+ '"'
														+ '	checked="">'
														+ '<label for="checkBox_'+ele.id+'">'
														+ ele.name
														+ '</label>'
														+ '</div>');
												var col_sm_6 = "";

												//判断是否之前已选中
												if (unitSelectedArray
														.indexOf(ele.id
																+ "|"
																+ ele.name
																+ "|"
																+ ele.outside_code) >= 0) {
													col_sm_6 = col_sm_6_check;
												} else {
													col_sm_6 = col_sm_6_nocheck;
												}

												if ((index + 1) % 2 == 0) {
													col_sm_6.appendTo(row);
												} else {
													row = $('<div class="row"></div>');
													row
															.appendTo($("#unitInfoDiv"));
													col_sm_6.appendTo(row);
												}
											});
						} else {
							NullMsg.appendTo($("#unitInfoDiv"));
						}
						layer.close(loading_index);
					},
					error : function() {
						layer.close(loading_index);
					}
				});
	}

	function addUnit() {
		parent.$("#parent_unitInfoDiv").html('');
		var indexCount = 0;
		if (unitSelectedArray.length > 0) {
			parent.$("#unitBatchDiv").show();
			parent.$("#parent_unitInfoDiv").css("height", "50px");
		} else {
			parent.$("#unitBatchDiv").hide();
			parent.$("#parent_unitInfoDiv").css("height", "0px");
		}
		$
				.each(
						unitSelectedArray,
						function(index, ele) {

							var eleArray = ele.split('|');
							var col_sm_3 = $('<div class="col-sm-6">'
									+ '<div class="checkbox checkbox-success checkbox-inline">'
									+ '<input type="checkbox" id="checkBox_'+eleArray[0]+'" name="checkbox_unit_parent"  value="'+eleArray[0]+"|"+eleArray[1]+'|'+eleArray[2]+'"'
								+'	checked="">'
									+ '<label for="checkBox_'+eleArray[0]+'">'
									+ eleArray[1] + '</label>' + '</div>');
							if ((index + 1) % 2 == 0) {
								col_sm_3.appendTo(row);
							} else {
								row = $('<div class="row"></div>');
								row.appendTo(parent.$("#parent_unitInfoDiv"));
								col_sm_3.appendTo(row);
							}

							indexCount++;

						});

		if (indexCount > 0) {
			var frameIndex = parent.layer.getFrameIndex(window.name); //获取窗口索引  
			parent.layer.close(frameIndex);
		} else {
			swal({
				title : "请选择单位",
				text : ""
			});
		}
	}

	function bindClick(obj) {
		if ($(obj).is(":checked")) {
			if (unitSelectedArray.indexOf($(obj).val()) < 0) {
				unitSelectedArray.push($(obj).val());
			}
		} else {
			if (unitSelectedArray.indexOf($(obj).val()) >= 0) {
				removeByValue(unitSelectedArray, $(obj).val());
			}
		}
	}

	function selectAll() {
		var checkboxs = document.getElementsByName("checkbox_unit");
		for (var i = 0; i < checkboxs.length; i++) {
			var e = checkboxs[i];
			e.checked = true;

			if (e.checked) {
				if (unitSelectedArray.indexOf(e.value) < 0) {
					unitSelectedArray.push(e.value);
				}
			} else {
				if (unitSelectedArray.indexOf(e.value) >= 0) {
					removeByValue(unitSelectedArray, e.value);
				}
			}
		}
	}

	function unselectAll() {
		var checkboxs = document.getElementsByName("checkbox_unit");
		for (var i = 0; i < checkboxs.length; i++) {
			var e = checkboxs[i];
			e.checked = false;

			if (e.checked) {
				if (unitSelectedArray.indexOf(e.value) < 0) {
					unitSelectedArray.push(e.value);
				}
			} else {
				if (unitSelectedArray.indexOf(e.value) >= 0) {
					removeByValue(unitSelectedArray, e.value);
				}
			}
		}
	}
</script>

</head>

<body class="gray-bg black-bg-gmtx">
	<div class="wrapper wrapper-content ">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="row text-left">
					<div class="row">
						<label class="col-sm-2 control-label text-right"> 单位名称： </label>
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm"
								id="unitInfoName" placeholder="单位名称或单位编号">
						</div>
					</div>
					<br />
					<div class="row">
						<label class="col-sm-2 control-label text-right"
							id="examLevelLabel"> 单位类别： </label>
						<div class="col-sm-3">
							<select class="form-control" id="unitTypeSel">
							</select>
						</div>

						<div class="col-sm-5">
							<button class="btn btn-gmtx-define1" type="button"
								onclick="javascript:loadUnitInfo();">搜索</button>
						</div>

					</div>
				</div>
			</div>



		</div>

		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="row text-left">
					<div class="col-sm-12">
						<button class="btn btn-gmtx-define1" type="button" id="addUnitBtn"
							onclick="javascript:addUnit();">添加单位</button>
						<button class="btn btn-gmtx-define1" type="button"
							onclick="javascript:selectAll();">全选</button>

						<button class="btn btn-gmtx-define1" type="button"
							onclick="javascript:unselectAll();">反选</button>
					</div>

				</div>
				<div class="hr-line-dashed"></div>
				<div id="unitInfoDiv"></div>


			</div>
		</div>
	</div>


</body>
</html>