<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消息</title>

<meta name="keywords" content="消息">
<meta name="description" content="消息">
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

<body class="gray-bg black-bg-gmtx">
	<div class="wrapper wrapper-content ">
		<div class="row" id="noticeList"></div>
	</div>
	<script type="text/javascript">
		$(function() {
			$.ajax({
				url : '/ccms/answer/getNotice',
				type : 'post',
				async : false,
				cache : false,
				data : {},
				dataType : 'json',
				success : function(data) {
					$('#noticeList').html();
					if (data.success) {
						$.each(
							data.rows,
							function(key, val) {
								var content = '<div class="ibox">'
										+ '<div class="ibox-content">'
										+ '<a class="btn-link">'
										+ '<h2>';
								content += val.title;
								content += '</h2></a><div class="small m-b-xs"><strong>';
								content += val.noticebelong;
								content += '</strong> <span class="text-muted"><i class="fa fa-clock-o"></i>'
										+ val.operatetime
										+ '</span></div><p>';
								content += val.content;
								content += '</p><div class="row"><div class="col-md-6"><h5>类型：</h5><button class="btn btn-white btn-xs" type="button">';
								content += val.typeName;
								content += '</button></div>';
								content += '<div class="col-md-6"><div class="small text-right"><h5>操作：</h5>';
								if (val.flag == '1') {
									content += '<button class="btn btn-primary btn-xs" type="button">';
									content += '已处理</button>';
								} else {
									if (val.type == '2') {
										content += '<button class="btn btn-primary btn-xs flag" type="button" id="vote_true" onclick="changerFlag(\'1\',\''
												+ val.id
												+ '\')">';
										content += '赞同</button>';
										content += '&nbsp;&nbsp;<button class="btn btn-primary btn-xs flag" type="button" id="vote_true" onclick="javascript:changerFlag(\'2\',\''
												+ val.id
												+ '\')">';
										content += '反对</button>';
									} else {
										content += '<button class="btn btn-primary btn-xs flag" type="button" id="check" onclick="javascript:changerFlag(\'0\',\''
												+ val.id
												+ '\')">';
										content += '点击查收</button>';
									}
								}
								content += '</div></div></div>'
								$('#noticeList').append(
										content);
							});

					} else {
						swal({
							title : "系统提示",
							text : "暂无消息",
							type : "warning"
						}, function() {
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
		});

		//修改状态位
		function changerFlag(vote, nid) {
			$.ajax({
				url : '/ccms/answer/changerFlag',
				type : 'post',
				async : false,
				cache : false,
				data : {
					vote : vote,
					nid : nid
				},
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						swal({
							title : "系统提示",
							text : "投票成功",
							type : "success"
						}, function() {
							location.reload();
						});
					} else {
						swal({
							title : "系统提示",
							text : "投票失败,请稍后再试",
							type : "warning"
						}, function() {
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
	</script>
</body>
</html>