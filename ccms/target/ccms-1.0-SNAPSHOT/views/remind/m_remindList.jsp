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
					<button class="btn btn-gmtx-define1" type="button" id="expInfoBtn" onclick="javascript:expInfoList_daoqi();">
						导出
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
	var loading_index2;
	
	$(function() { 
		initTable();

	})  
	
	function initTable() {
		
		$('#myTable').bootstrapTable('destroy');
		$('#myTable').bootstrapTable(
		{
			url : '/${appName}/manager/MProtocolInfoController/getExpProtocolLst_shebao',
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
					field : 'operater',
					title : '操作',
					formatter : function(value, row,index) {
						var afterDealBtn='<button class="btn btn-gmtx-define1 btn-xs" type="button" onclick="javascript:afterDeal(\'single\',\''+row.id+'\',\''+row.effectiveStartDate+'\',\''+row.effectiveEndDate+'\');">再下发</button>';
						var detailBtn='<button class="btn btn-gmtx-define1 btn-xs" type="button" onclick="javascript:forwardDetail(\''+row.id+'\');">查看</button>';
						var operatorBtn='';
						if(row.unitHandleFlag=='03'&&row.afterDealFlg=='')
						{
							operatorBtn=detailBtn+'&nbsp;'+afterDealBtn;
						}else
						{
							operatorBtn=detailBtn;
						}
						return operatorBtn;
					}
				},
				{
					field : 'code',
					title : '协议编号'
				},
				{
					field : 'unitName',
					title : '机构名称'
				},
				{
					field : 'unit_outside_code',
					title : '机构编号'
				},
				{
					field : 'unitTypeName',
					title : '机构类别'
				},
				{
					field : 'protocolTypeName',
					title : '协议类型'
				},
				{
					field : 'effectiveStartDate',
					title : '有效期开始日期'
				},
				{
					field : 'effectiveEndDate',
					title : '有效期终止日期'
				},
				{
					field : 'receiveFlg',
					title : '接收状态',
					formatter : function(value, row,index) {
						if(value==0)
						{
							return '<span style="color: #FF0000">否</span>';
						}else if(value==1)
						{
							return '是';
						}
					}
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
							if(row.afterDealFlg=='1')
							{
								return '【逾期再处理】<span style="color: #FF0000"><br/>等待乙方处理</span>';
							}else if(row.afterDealFlg=='3')
							{
								return '【逾期再处理】<span style="color: #FF0000"><br/>乙方未做任何处理</span>';
							}else
							{
								return '<span style="color: #FF0000">逾期未确认</span>';
							}
							
						}
					}
				},
				/*{
					field : 'afterDealFlg',
					title : '逾期再处理',
					formatter : function(value, row,index) {
						if(value=='1')
						{
							return '<span style="color: #FF0000">等待处理</span>';
						}else if(value=='2')
						{
							return '处理结束';
						}else if(value=='3')
						{
							return '<span style="color: #FF0000">未做任何处理</span>';
						}else
						{
							return '';
						}
						
					}
				},*/
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
					field : 'seeFlag',
					title : '协议可见状态',
					formatter : function(value, row,index) {
						if(value=='01')
						{
							return '是';
						}else if(value=='02')
						{
							return '<span style="color: #FF0000">否</span>';
						}
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
	    		pageSize : this.pageSize
	    };
	    return temp;  
	} 
	
	
	function search() {
		$('#myTable').bootstrapTable('refresh',
				{query: 
					{
						pageNumber : 1,
			    		pageSize : 50
					}
		});
	}
	
	
	//跳转至详细页面
	function forwardDetail(id)
	{
		window.location.href="/${appName}/webviews/m_protocolinfo/mprotocolDetail.jsp?id="+id+"&forwardMode=remindList"; 
	}
	
	
	//导出即将到期协议
	function expInfoList_daoqi() {
	
	//loading层
				loading_index2 = layer.load(2, {
				  	shade: [0.3,'#fff'] //0.1透明度的白色背景
				});
		
			$.ajax({
					       				url:'/${appName}/manager/MProtocolInfoController/expInfoList_daoqi',	
					       				dataType:'json',
					       				data:{
					       				},
					       				type:'post',
					       				success:function(data){
						       				if(data.rtnCode==0)
						       				{
						       					swal({
													title:"导出成功，点击【确定】下载文件！",
													//timer: 2000,
													showConfirmButton: true,
													confirmButtonText:"确定",  
													text:""
												},
												function()
												{
													window.location.href ="/${appName}"+data.webPath;
												});
						       					
						       				}else if(data.rtnCode==404)
						       				{
						       					swal({title:"查询数据为空。",text:""});
						       				}else if(data.rtnCode==500)
						       				{
						       					swal({title:"文件导出失败~~",text:""});
						       				}
					       					
					       					
					       					layer.close(loading_index2);
											
					       				},
					       				error:function(){
					       					layer.close(loading_index2);
					       				}
			});
	}
	
	</script>
	
	
	
	<div id="menuContent" class="menuContent"
			style="display: none; position: absolute;">
			<ul id="treeDemo" class="ztree"
				style="margin-top: 0; width: 180px; height: 300px;"></ul>
		</div>
	</body>
</html>