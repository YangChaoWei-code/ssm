<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>协议信息-协议列表</title>

		<meta name="keywords" content="医疗管理平台-协议签订">
		<meta name="description" content="医疗管理平台-协议签订">

		<link href="/${appName}/commons/jslib/hplus/css/style.min.css"
			rel="stylesheet">
		<link
			href="/${appName}/commons/jslib/hplus/css/bootstrap.min.css"
			rel="stylesheet">
		<link
			href="/${appName}/commons/jslib/hplus/css/font-awesome.min.css"
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


	</head>
	<body class="gray-bg black-bg-gmtx">

		<div class="wrapper wrapper-content">

			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>
						<b>搜索条件</b>
					</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i> </a>
					</div>
				</div>
				<div class="ibox-content">
					<div class="row text-right">
						<div class="row">
							<label class="col-sm-2 control-label">
								终止日期：
							</label>
							<div class="col-sm-2 ">
								 <div class="input-group">

				                                 <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				                                <input type="text" class="form-control" value="" id="effectiveEndDate">
				                         </div>
							</div>
							<label class="col-sm-2 control-label" id="examLevelLabel">接收状态：</label>
							<div class="col-sm-2 ">
								<select class="form-control" id="receiveFlg">
									<option value="">全部</option>
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
							
							<div class="col-sm-2">
								<button class="btn btn-gmtx-define1" type="button" onclick="javascript:search();">
									查询
								</button>
								<button class="btn btn-gmtx-define1" type="button" onclick="javascript:resetSearch();">
									重置
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<button class="btn btn-gmtx-define1" type="button" id="receiveBtn" onclick="javascript:receiveProtocol('batch','');">
						批量接收
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

		<script src="/${appName}/commons/jslib/hplus/js/jquery.min.js"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/bootstrap.min.js"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/layer/layer.min.js"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/content.min.js"></script>
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

		<script type="text/javascript">
	
	var expOpenMode="0";
	$(function() { 
		 
		initTable();
		
		$("#effectiveEndDate").datepicker({
			        todayBtn: "linked",
			        keyboardNavigation: !1,
			        forceParse: !1,
			        calendarWeeks: !0,
			        autoclose: !0
			});
			
		$("#effectiveEndDate").datepicker("disable").attr("readonly","readonly"); 
		
	})  
	
	function initTable() {
		var receiveFlg=GetQueryString("receiveFlg");
		var expDate=GetQueryString("expDate");
		
		expOpenMode=GetQueryString("expOpenMode");
		
		if(receiveFlg!="null")
		{
			$("#receiveFlg option[value='"+receiveFlg+"']").attr("selected", true);
		}
		
		if(expDate!="null")
		{
			$('#effectiveEndDate').val(expDate);
		}
		
		//当expOpenMode=0时，标识是从菜单页面打开的列表页面
		if(expOpenMode=="null")
		{
			expOpenMode="0";
		}
	
		$('#myTable').bootstrapTable('destroy');
		$('#myTable').bootstrapTable(
		{
			url : '/${appName}/manager/UProtocolInfoController/queryUList',
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
					field : 'code',
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
						return '<button class="btn btn-gmtx-define1" type="button" onclick="javascript:forwardDetail(\''+row.id+'\');">查看</button>';
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
       			effectiveEndDate:$('#effectiveEndDate').val(),
       			receiveFlg:$("#receiveFlg  option:selected").val(),
       			expOpenMode:expOpenMode
	    };
	    return temp;  
	} 
	
	
	function search() {
		$('#myTable').bootstrapTable('refresh',
				{query: 
					{
						pageNumber : 1,
			    		pageSize : 50,
       					effectiveEndDate:$('#effectiveEndDate').val(),
       					receiveFlg:$("#receiveFlg  option:selected").val(),
       					expOpenMode:expOpenMode
					}
		});
	}
	
	
	//跳转至详细页面
	function forwardDetail(id)
	{
		window.location.href="/${appName}/webviews/u_protocolinfo/uprotocolDetail.jsp?id="+id+"&forwardMode=lst"; 
		
		receiveProtocol('single',id);
	}
	
	//接收协议
	function receiveProtocol(mode,id)
	{
		var protocolIds="";
		//单条模式
		if(mode=="single")
		{
			protocolIds=id;
			
		}else if(mode=="batch")
		{
			var selectedRows=$('#myTable').bootstrapTable('getSelections');
			
			if(selectedRows.length<=0)
			{
				swal({title:"请选择需要接收的协议",text:""});
				return false;
			}
			var protocolIdsArray=new Array();
			$.each(selectedRows,function(index,ele){
				protocolIdsArray.push(ele.id);
			});
			
			protocolIds=protocolIdsArray.join("|");
			
		}
		
		
		$.ajax({
	       				url:'/${appName}/manager/UProtocolInfoController/receiveProtocol',	
	       				dataType:'json',
	       				data:{
	       					protocolIds:protocolIds
	       				},
	       				type:'post',
	       				success:function(data){
	       					
	       					if(mode=="batch")
	       					{
	       						search();
	       					}
							
	       				},
	       				error:function(){
	       					
	       				}
	       	});
		
		
	}
	
	
	function resetSearch()
	{	
		$("#effectiveEndDate").val('');
		$("#receiveFlg option:first").prop("selected", 'selected');
	}
	
	</script>

	</body>
</html>