<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>协议信息-提醒列表</title>

		<meta name="keywords" content="医疗管理平台-协议签订">
		<meta name="description" content="医疗管理平台-协议签订">

		<link href="/${appName}/commons/jslib/hplus/css/style.min.css?v=4.0.0"
			rel="stylesheet">
		<link
			href="/${appName}/commons/jslib/hplus/css/bootstrap.min.css?v=3.3.5"
			rel="stylesheet">
		<link
			href="/${appName}/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
			rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/animate.min.css"
			rel="stylesheet">
		<link href="/${appName}/commons/css/layer.css" rel="stylesheet">
		<link
			href="/${appName}/commons/jslib/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css"
			rel="stylesheet">

		<!-- Sweet Alert -->
		<link
			href="/${appName}/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css"
			rel="stylesheet">
		<!-- Sweet Alert -->
		<link href="/${appName}/commons/css/qy-style.css" rel="stylesheet">
		
		<link href="/${appName}/commons/jslib/hplus/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
		
		
		<!-- ztree css -->
		<link rel="stylesheet"
			href="/${appName}/commons/jslib/ztreeV3.5.15/css/zTreeStyle/zTreeStyle.css"
			type="text/css">
		<!-- ztree css -->


	</head>
	<body class="gray-bg black-bg-gmtx">

		<div class="wrapper wrapper-content">

			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<button class="btn btn-gmtx-define1" type="button" onclick="javascript:search();">
									刷新
								</button>
					<button class="btn btn-gmtx-define1" type="button" id="setSeeBtn" onclick="javascript:setSeeFlag();">
						设置查收
					</button>
				</div>
				<div class="ibox-content collapse in">
					<div class="row">
						<table id="myTable" data-mobile-responsive="true"></table>
					</div>

				</div>
			</div>


			<!-- End Panel Other -->
		</div>

		<script src="/${appName}/commons/jslib/hplus/js/jquery.min.js?v=2.1.4"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/bootstrap.min.js?v=3.3.5"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/layer/layer.min.js"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/content.min.js?v=1.0.0"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
		<script src="/${appName}/commons/jslib/CommonValue.js"></script>

		<!-- Sweet Alert -->
		<script type="text/javascript"
			src="/${appName}/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
		<!-- Sweet Alert -->
		
		
		<script src="/${appName}/commons/jslib/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>
		
		<!-- ztree js -->
		<script type="text/javascript"
			src="/${appName}/commons/jslib/ztreeV3.5.15/jquery.ztree.core-3.5.min.js"></script>
		<script type="text/javascript"
			src="/${appName}/commons/jslib/ztreeV3.5.15/jquery.ztree.excheck-3.5.min.js"></script>
		<script type="text/javascript"
			src="/${appName}/commons/jslib/js-gmxt-define/protocolType_checkbox.js"></script>
		<!-- ztree js -->

		<script type="text/javascript">
	
	
	$(function() { 
		var forwardMode = GetQueryString("forwardMode");
		var expDate = GetQueryString("expDate");
	 	$("#forwardMode").val(forwardMode.split('?')[0]);
	 	if($("#forwardMode").val()=='exp')
	 	{
	 		$("#expDate").val(expDate.split('?')[0]);
	 		$("#setSeeBtn").hide();
	 	}else
	 	{
	 		$("#setSeeBtn").show();
	 	}
		initTable();
		
		
	})  
	
	function initTable() {
		
		$('#myTable').bootstrapTable('destroy');
		$('#myTable').bootstrapTable(
		{
			url : '/${appName}/manager/ProRemindController/getRemindProtocolLst',
			method: 'post',
			//search : !0,
			//showRefresh : !0,
			toolbar : "#toolbar",
			iconSize : "outline",
			queryParams : "queryParams",
			pagination : true,
			contentType: "application/x-www-form-urlencoded",
			cardView: false,//设置为True时显示名片（card）布局  
			pageSize : 50,
			pageNumber : 1,
			dataType : 'json',
			sidePagination : "server",
			clickToSelect:true,
			singleSelect:false,
			icons : {
				paginationSwitchDown : 'glyphicon-collapse-down icon-chevron-down',
				paginationSwitchUp : 'glyphicon-collapse-up icon-chevron-up',
				refresh : 'glyphicon-refresh icon-refresh',
				toggle : 'glyphicon-list-alt icon-list-alt',
				columns : 'glyphicon-th icon-th',
				detailOpen : 'glyphicon-plus icon-plus',
				detailClose : 'glyphicon-minus icon-minus'
			},
			columns : [
				{ 
			        checkbox: true
			    },
				{
					field : 'protocolCode',
					title : '协议编号'
				},
				{
					field : 'protocolTypeName',
					title : '协议类型'
				},
				{
					field : 'effectiveEndDate',
					title : '终止日期'
				},
				{
					field : 'unitHandleFlag',
					title : '机构处理',
					formatter : function(value, row,index) {
						if(value=='01')
						{
							return '已处理';
						}else if(value=='02')
						{
							return '<span style="color: #FF0000">未处理</span>';
						}else if(value=='03')
						{
							return '<span style="color: #FF0000">逾期未确认</span>';
						}
					}
				},
				{
					field : 'effectFlag',
					title : '生效状态',
					formatter : function(value, row,index) {
						if(value=='01')
						{
							if(row.stopState=='02')
							{
								return '<span style="color: #FF0000">未生效</span>';
							}else
							{
								return '已生效';
							}
						}else if(value=='02')
						{
							return '<span style="color: #FF0000">未生效</span>';
						}
					}
				},
				{
					field : 'operater',
					title : '操作',
					formatter : function(value, row,index) {
						return '<button class="btn btn-gmtx-define1" type="button" onclick="javascript:forwardDetail(\''+row.protocolId+'\');">查看</button>';
					}
				}
				
			],
			responseHandler : function(res) {  
	            return {  
	                total : res.total,  
	                rows : res.rows  
	            };  
	        }
		});

	}

	/**查询条件与分页数据 */  
	function queryParams() {   
	    var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	    		pageNumber : this.pageNumber,
	    		pageSize : this.pageSize,
	    		forwardMode:$("#forwardMode").val(),
	    		expDate:$("#expDate").val()
	    };
	    return temp;  
	} 
	
	
	function search() {
		$('#myTable').bootstrapTable('refresh',
				{query: 
					{
						pageNumber : 1,
			    		pageSize : 50,
			    		forwardMode:$("#forwardMode").val(),
	    				expDate:$("#expDate").val()
					}
		});
	}
	
	
	//跳转至详细页面
	function forwardDetail(id)
	{
		var forwardMode = $("#forwardMode").val();
		var expDate = $("#expDate").val();
		window.location.href="/${appName}/webviews/u_protocolinfo/uprotocolDetail.jsp?id="+id+"&forwardMode="+forwardMode+"&expDate="+expDate; 
	}
	//设置查收
	function setSeeFlag(){
		
	  	var ids = '';
        var selects =$('#myTable').bootstrapTable('getSelections');
        if(selects.length<=0){
			swal('系统提示','请选择要查收的协议！','warning');
			return ;
		}
		ids = "'"+selects[0].id+"'";
        for(var i = 1;i<selects.length;i++){
    		ids+=",'"+selects[i].id+"'";
        }
		$.ajax({
			url:'/${appName}/manager/ProRemindController/setProtocolViewed',
			type:'post',
			async:'true',
			cache:false,
			data:{ids:ids},
			dataType:'json',
			success: function(data){
					  if(data.success){
					  	 swal({
             					 title: "系统提示",
					             text: "查收成功!",
					             type: "warning"
					         },function(){
					         	$('#myTable').bootstrapTable("refresh");
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
	
	
	
	<div id="menuContent" class="menuContent"
			style="display: none; position: absolute;">
			<ul id="treeDemo" class="ztree"
				style="margin-top: 0; width: 180px; height: 300px;"></ul>
		</div>

<input type="hidden" id="forwardMode">
<input type="hidden" id="expDate">
	</body>
</html>