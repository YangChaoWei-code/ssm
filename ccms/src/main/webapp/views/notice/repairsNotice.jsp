<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/ccms/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/animate.min.css"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/style.min.css?v=4.0.0"
	rel="stylesheet">
<script src="/ccms/commons/jslib/hplus/js/jquery.min.js?v=2.1.4"></script>
<script src="/ccms/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>

<script
	src="/ccms/commons/jslib/hplus/js/bootstrap.min.js?v=3.3.5"></script>
<script src="/ccms/commons/jslib/hplus/js/content.min.js?v=1.0.0"></script>


<!-- KindEditor JSP -->
<link rel="stylesheet"
	href="/ccms/commons/kindeditor/themes/default/default.css" />
<link rel="stylesheet"
	href="/ccms/commons/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8"
	src="/ccms/commons/kindeditor/kindeditor.js"></script>
<script charset="utf-8"
	src="/ccms/commons/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8"
	src="/ccms/commons/kindeditor/plugins/code/prettify.js"></script>
<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/ccms/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/animate.min.css"
	rel="stylesheet">
<link href="/ccms/commons/jslib/hplus/css/style.min.css?v=4.0.0"
	rel="stylesheet">

<!-- ztree css -->
<link rel="stylesheet"
	href="/ccms/commons/jslib/ztreeV3.5.15/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<!-- ztree css -->

<!-- Sweet Alert -->
<link
	href="/ccms/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<!-- Sweet Alert -->
<link href="/ccms/commons/css/qy-style.css" rel="stylesheet">

<link
	href="/ccms/commons/jslib/hplus/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">

<link
	href="/ccms/commons/jslib/hplus/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">

<script src="/ccms/commons/jslib/hplus/js/jquery.min.js?v=2.1.4"></script>
<script src="/ccms/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>

<script
	src="/ccms/commons/jslib/hplus/js/bootstrap.min.js?v=3.3.5"></script>
<script src="/ccms/commons/jslib/hplus/js/content.min.js?v=1.0.0"></script>


<!-- jquery validate -->
<script
	src="/ccms/commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>

<script
	src="/ccms/commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>
<!-- jquery validate -->

<!-- ztree js -->
<script type="text/javascript"
	src="/ccms/commons/jslib/ztreeV3.5.15/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript"
	src="/ccms/commons/jslib/ztreeV3.5.15/jquery.ztree.excheck-3.5.min.js"></script>
<script type="text/javascript"
	src="/ccms/commons/jslib/js-gmxt-define/protocolType_radio.js"></script>
<!-- ztree js -->

<script type="text/javascript"
	src="/ccms/commons/jslib/jquery-form.js"></script>
<!-- Sweet Alert -->
<script type="text/javascript"
	src="/ccms/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
<!-- Sweet Alert -->

<!-- laydate -->
<script
	src="/ccms/commons/jslib/hplus/js/plugins/layer/laydate/laydate.js"></script>
<!-- laydate -->


<script
	src="/ccms/commons/jslib/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>


<script src="/ccms/commons/jslib/layer-master/src/layer.js"></script>


<script
	src="/ccms/commons/jslib/hplus/js/plugins/iCheck/icheck.min.js"></script>

<script type="text/javascript">
	$(function() {
		var editor;
		KindEditor.ready(function(K) {
					editor = K.create("#mainBody",
									   {cssPath : '/ccms/commons/kindeditor/plugins/code/prettify.css',
										uploadJson : '/ccms/commons/kindeditor/jsp/upload_json.jsp',
										fileManagerJson : '/ccms/commons/kindeditor/jsp/file_manager_json.jsp',
										allowFileManager : true,
										items : [
										//"source",
										"cut", "copy", "paste", "quickformat",
												"undo", "redo", "|", "image",
												"multiimage", "|",
												'justifyleft', 'justifycenter',
												'justifyright', 'justifyfull',
												'insertorderedlist',
												'insertunorderedlist',
												'indent', 'outdent',
												'quickformat', 'selectall',
												"|", "formatblock", "fontname",
												"fontsize", "forecolor",
												"hilitecolor", "bold",
												"italic", "underline",
												"strikethrough", "lineheight",
												"removeformat", "|",

												"fullscreen" ]

									});
				});
				$("#subBtn").click(function(){
					addNotice(editor);
				});
	});
	function selectSecond() {
		layer.open({
			type : 2,
			title : "批量添加单位",
			shade : 0.8,
			fix : false,
			shadeClose : true,
			area : [ '800px', '90%' ],
			content : '/ccms/views/notice/secondBatch.jsp',
			end : function() {

			}
		});
	}
	//跳转至列表页面
	function forwardListPage() {
		window.location.href = "/ccms/views/notice/SendNoticeList.jsp";
	}
	//添加
	function addNotice(editor){
		var type = $("#type").val();
		var title = $("#title").val();
		var mainBody = encodeURIComponent(editor.html());
		if(mainBody==null||mainBody==undefined||mainBody==''){
				swal({title:"请输入内容",text:""});
 	      			return false;
		}
		var selectedCount=0;
 	      		var secondIdsAry=new Array();
 	      		var secondIds="";
 	      		$('input[name="checkbox_unit_parent"]:checked').each(function(){

				var secondEle=$(this).val().split("|");
				secondIdsAry.push(secondEle[0]);
				selectedCount++;	

			}); 
 	      	if(selectedCount<=0)
			{
				swal({title:"请选择单位",text:""});
 	      			return false;
			}
			secondIds=secondIdsAry.join(",");
		$.ajax({
			url:'/ccms/notice/addNotice',
			type:'post',
			async:'true',
			cache:false,
			data:{type:type,secondIds:secondIds,content:mainBody,title:title},
			dataType:'json',
			success: function(data){
					  if(data.success){
		                  swal({
             					 title: "系统提示",
					             text: "添加成功",
					             type: "success"
					         },function(){
					         	forwardListPage();
					         });
		              }else{
		                  swal({
             					 title: "系统提示",
					             text: "添加失败",
					             type: "warning"
					         },function(){
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
</script>
</head>
<body>
	<div class="wrapper wrapper-content ">
		<div class="row">
			<div class="col-sm-10 col-md-offset-1">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>发送消息</h5>
					</div>
					<div class="ibox-content">
						<form method="post" class="form-horizontal" id="addForm"
							enctype="multipart/form-data">
							<div class="form-group">

								<label class="col-sm-2 control-label"> <span
									style="color: #FF0000">*</span>类型
								</label>
								<div class="col-sm-9">
									<select data-placeholder="请选择"  class="form-control" name="type" style="width:100px" id="type" tabindex="1">
										<option value='3'>报修</option>
									</select>
								</div>
							</div>
							<div class="form-group">

								<label class="col-sm-2 control-label"> <span
									style="color: #FF0000">*</span>标题
								</label>
								<div class="col-sm-9">
									<input type="text" value="" class="form-control" style="width:300px"  name="title" id="title" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label"> <span
									style="color: #FF0000">*</span>发送对象
								</label>
								
								<div class="col-sm-9">
									<button class="btn btn-gmtx-define1" type="button"
										onclick="javascript:selectSecond();">批量添加</button>
									<div id="parent_unitInfoDiv">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<textarea id="mainBody" cols="100" rows="10"
										style="width:100%;height:500px;visibility:hidden;"></textarea>

								</div>
							</div>
							<div class="form-group" id="processDiv" style="display: none;">
								<div class="col-sm-12">
									<div class="progress">
										<div class="progress-bar progress-bar-striped active"
											role="progressbar" aria-valuenow="4" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%;" id="progressContent">
											协议下发中,请耐心等待...</div>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="col-sm-1 col-sm-offset-4">
									<button class="btn btn-gmtx-define1" type="button" id="subBtn">
										完成</button>
								</div>
								<div class="col-sm-1 col-sm-offset-1">
									<button class="btn btn-gmtx-define1" type="button"
										onclick="javascript:forwardListPage();">返回</button>
								</div>
							</div>

							<input type="hidden" id="protocolTempletId" /> <input
								type="hidden" id="templetParamNumber" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>