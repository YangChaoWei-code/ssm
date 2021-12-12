<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>报修</title>

		<meta name="keywords" content="报修">
		<meta name="description" content="报修">
		<link href="/ccms/commons/jslib/hplus/css/bootstrap.min.css" rel="stylesheet">
		<link href="/ccms/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
		<link href="/ccms/commons/jslib/hplus/css/animate.min.css" rel="stylesheet">
		<link href="/ccms/commons/jslib/hplus/css/style.min.css" rel="stylesheet">
		<link href="/ccms/commons/jslib/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/ccms/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css" type="text/css"></link>
		<link rel="stylesheet" href="/ccms/commons/jslib/ztreeV3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css"></link>
		<link href="/ccms/commons/css/qy-style.css" rel="stylesheet">
		<!-- jQuery -->
		<script src="/ccms/commons/jslib/hplus/js/jquery.min.js"></script>
		<script src="/ccms/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>
		<script src="/ccms/commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>
		<script src="/ccms/commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>
		<script src="/ccms/commons/jslib/CommonValue.js"></script>
		<script type="text/javascript" src="/ccms/commons/jslib/ztreeV3.5.15/jquery.ztree.all-3.5.js"></script>
		
		<script type="text/javascript" src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
		<script type="text/javascript" src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
		<script type="text/javascript" src="/ccms/commons/jslib/hplus/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/ccms/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
	</head>
	<script type="text/javascript">
	/**share---*/
	function vform(dom,func){
		$("#"+dom).validate({
				rules : {
					roleName : {
						required : true,
						maxlength: 50
					}
				},
				messages : {
					roleName : {
						required : "请输入用户名",
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
		var $table = $('#table');
	    $table.bootstrapTable({
	    url: "/ccms/notice/getAllNotice",
	    method: 'post',
		contentType: "application/x-www-form-urlencoded",
	    dataType: "json",
	    pagination: true, //分页
	    pageSize: 50,
	    pageNumber:1,
	    //toolbar:"#tb",
	    singleSelect: false,
	    queryParamsType : "undefined",
	    queryParams: function queryParams(params) {   //设置查询参数
          var param = {
        		  page: params.pageNumber,
        		  rows: params.pageSize,
          };
          return param;
        },
	    cache: false,
	    //data-locale: "zh-CN", //表格汉化
	    //search: true, //显示搜索框
	    sidePagination: "server", //服务端处理分页
        columns: [
                {
                    title: '标题',
                    field: 'title',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '时间',
                    field: 'operatetime',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '类型',
                    field: 'type',
                    align: 'center',
                    valign: 'middle',
                    formatter:function(value,row,index){
                    	if(value=='1'){
                    		return "消息";
                    	}else if(value=='2'){
                    		return "投票";
                    	}else if(value=='3'){
                    		return "报修";
                    	}
                    }
                },
                {
                    title: '操作',
                    field: 'id',
                    //align: 'center',
                    formatter:function(value,row,index){
                    	var e ='<a href="#" class="btn btn-gmtx-define1" onclick="check(\''+ row.id +'\')">查看</a>';
                    	var d ='&nbsp;<a href="#" class="btn btn-gmtx-define1" onclick="del(\''+ row.id +'\')">删除</a>';
	                    return e+d;
                    }
                }
            ]
	      });
      });
      function addRole(){
			window.location.href="/ccms/views/notice/repairsNotice.jsp";
	  }
      function check(nid){
			window.location.href="/ccms/views/notice/repairscheckNotice.jsp?nid="+nid;
	  }
	  /**----删除----*/
	  function del(nid){
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
					url:'/ccms/manager/NoticeController/delNotice',
					type:'post',
					async:'true',
					cache:false,
					data:{ids:nid},
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
	</script>
	<body class="gray-bg black-bg-gmtx">
		<div class="wrapper wrapper-content ">
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox">
						<div class="ibox-title">
							<div id="tb">
								<button class="btn btn-gmtx-define1" onclick="javascript:addRole()" id="btn_add">
									新增
								</button>
							</div>
						</div>
						<div class="ibox-content">
							<table id="table">
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>