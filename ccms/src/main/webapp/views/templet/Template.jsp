<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>模板</title>
		<link href="/${appName}/commons/css/qy-style.css" rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/bootstrap.min.css" rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/animate.min.css" rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/style.min.css" rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/${appName}/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css" type="text/css"></link>
		<!-- ztree css -->
		<link rel="stylesheet"
			href="/${appName}/commons/jslib/ztreeV3.5.15/css/zTreeStyle/zTreeStyle.css"
			type="text/css">
		<!-- jQuery -->
		<script src="/${appName}/commons/jslib/hplus/js/jquery.min.js"></script>
		<script src="/${appName}/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>
		<script src="/${appName}/commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>
		<script src="/${appName}/commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>
		<script src="/${appName}/commons/jslib/CommonValue.js"></script>
		<script type="text/javascript" src="/${appName}/commons/jslib/js-gmxt-define/protocolType_checkbox.js"></script>
		<script type="text/javascript" src="/${appName}/commons/jslib/ztreeV3.5.15/jquery.ztree.all-3.5.js"></script>
		<script src="/${appName}/commons/jslib/hplus/js/plugins/iCheck/icheck.min.js"></script>
		<script type="text/javascript"
			src="/${appName}/commons/jslib/js-gmxt-define/protocolType_checkbox.js"></script>

		<script type="text/javascript" src="/${appName}/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
		<script type="text/javascript" src="/${appName}/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
		<script type="text/javascript" src="/${appName}/commons/jslib/hplus/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/${appName}/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
		<script src="/${appName}/commons/jslib/layer/layer.js"></script>
		<script type="text/javascript">
		$(function(){
        	loadProtocolTypeCheckBox("/${appName}/manager/ProParamInfoController/getProtocolTree");
			initTable();
		});
		function initTable() {
		$('#myTable').bootstrapTable('destroy');
		$('#myTable').bootstrapTable(
		{
			url : '/${appName}/manager/ProTempletController/queryAliveTempletList',
			method: 'post',
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
					field : 'tempCode',
					title : '模版编号'
				},
				{
					field : 'name',
					title : '模版名称'
				},
				{
					field : 'protocolTypeName',
					title : '协议类型'
				},
                {
                    title: '操作',
                    field: 'id',
                    //align: 'center',
                    formatter:function(value,row,index){
                    
					var dot=row.rtfTmpFilePath.lastIndexOf(".");
					var len=row.rtfTmpFilePath.length;
					var fileSuffix = row.rtfTmpFilePath.substring(dot,len);
					
                     var path = '';
                     var array = row.htmlTmpFilePath.split('\\');
                     for(var i=1;i<array.length;i++){
                     	path += '\\\\'+array[i];
                     }
                     
					 var operatorStr='';
	                 var e = '<a href="#" class="btn btn-gmtx-define1" onclick="detail(\''+ row.id +'\',\''+path+'\')">查看详情</a> ';
					 var f = '<a class="btn btn-gmtx-define1" href="/${appName}'+row.rtfTmpFilePath+'" download="'+row.tempCode+fileSuffix+'">模板下载</a> ';
					 var paramFile='<a class="btn btn-gmtx-define1" href="#" onclick="javascript:selectSecond(\''+row.id+'\');">参数文件下载</a>';
					 
					 if(row.templetParamCount<=0)
					 {
					 	operatorStr=e+f;
					 }else
					 {
					 	operatorStr=e+f+paramFile;
					 }
                     return operatorStr;
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
	
	function detail(id,hpath){
		window.location.href="/${appName}/webviews/templet/TemplateDetail.jsp?id="+id;
	}
	/**查询条件与分页数据 */  
	function queryParams() {
	    var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	    		pageNumber : this.pageNumber,
	    		pageSize : this.pageSize,
	    		tempName:'',
	    		protocolTypeId:''
	    };
	    return temp;  
	} 
	
	
	function search() {
		var checkNodes=getChecked("treeDemo",true);
		var typeIdArry=new Array();
		if(checkNodes!=null)
		{
			$.each(checkNodes,function(index,ele){
				typeIdArry.push(ele.id);
			});
		}
		$('#myTable').bootstrapTable('refresh',
				{query: 
					{
						pageNumber : 1,
			    		pageSize : 50,
			    		tempName:$("#tempName").val(),
			    		protocolTypeId:typeIdArry.join("|")
					}
		});
	}
	//添加链接
	function showAdd(){
		window.location.href="/${appName}/webviews/templet/addTemplet.jsp";
	}
      /**-删除---*/
	  function delTemplate(){
  	    var ids = '';
        var selects =$('#myTable').bootstrapTable('getSelections');
        if(selects.length<=0){
			swal('系统提示','请选择要删除的模板！','warning');
		}
		ids = "'"+selects[0].id+"'";
        for(var i = 1;i<selects.length;i++){
    		ids+=",'"+selects[i].id+"'";
        }
	  	swal({
            title: "您确定要删除这条信息吗",
            text: "",
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
					url:'/${appName}/manager/ProTempletController/delProTemplate',
					type:'post',
					async:'true',
					cache:false,
					contentType: "application/x-www-form-urlencoded; charset=utf-8", 
					data:{ids:ids},
					dataType:'json',
					success: function(data){
							  if(data.inuse){
							        swal("删除失败！", data.inusename+"模板正在使用中", "warning");
							  }else if(data.success){
							        swal("删除成功！", "您已经删除了这条信息。", "success");
					         		$('#myTable').bootstrapTable("refresh");
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
	  function reset(){
	  	  //$.fn.zTree.getZTreeObj("treeDemo").cancelSelectedNode();
	  	  loadProtocolTypeCheckBox("/${appName}/manager/ProParamInfoController/getProtocolTree");
	  	  $('#protocolTypeSel').attr('value','');
	  	  $('#tempName').val('');
	  }
	  
	  
   //批量选择两定单位
  function selectSecond(templetId)
  {	
  		layer.open({
  				type: 2,
			    title: "批量选择两定单位",
			    shade: 0.8,
			    fix: false,
	            shadeClose: true,
			    area: ['800px', '90%'],
			    content: '/${appName}/webviews/templet/checkBatch.jsp?templetId='+templetId ,
			    end:function(){
			   
			    	
			    }
		}); 
  }
		</script>
	</head>
	<body class="gray-bg black-bg-gmtx">
		<div class="wrapper wrapper-content">
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox">
						<div class="ibox-title">
							<div class="row">
								<div class="col-sm-1">
									<button class="btn btn-gmtx-define1" onclick="showAdd()"  id="btn_add">
										新增
									</button>
								</div>
								<div class="col-sm-1">
									<button class="btn btn-gmtx-define1" onclick="javascript:delTemplate()" id="btn_del">
										删除
									</button>
								</div>
								<div class="col-sm-1">
									<button class="btn btn-gmtx-define1" onclick="javascript:reset()" id="btn_reset">
										重置
									</button>
								</div>
								<div class="col-sm-3 col-md-offset-2">
								
								<div class="form-group">
									<div class="col-sm-8">
										<div class="zTreeDemoBackground left">
											<input id="protocolTypeSel" name="protocolTypeSel" type="text"
												readonly value="" style="width: 120px;" onclick="showMenu();" placeholder='请选择协议类型'/>&nbsp;&nbsp;
												<!-- <a href="#" >选择</a> -->
											&nbsp;
											
										</div>
									</div>
								</div>
								</div>
								
								<div class="col-sm-4">
									<div class="input-group">
										<!-- <div class="zTreeDemoBackground left">
										<input id="protocolTypeSel" name="protocolTypeSel" type="text" readonly value="" placeholder="请选择协议类型" style="width: 120px;" onclick="showMenu();" />
										&nbsp;
										</div> -->
										<input type="text" class="form-control" id="tempName" placeholder="请输入协议模板编号或模版名称">
										<span class="input-group-btn">
										<button class="btn btn-gmtx-define1" type="button" onclick="javascript:search();">
										搜索
										</button> </span>
									</div>
								</div>
							</div>
						</div>
						<div class="ibox-content">
							<table id="myTable"  data-mobile-responsive="true">	<!-- data-click-to-select="true" class="table table-striped table-bordered table-hover"-->
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="menuContent" class="menuContent"
			style="display: none; position: absolute;">
			<ul id="treeDemo" class="ztree"
				style="margin-top: 0; width: 180px; height: 300px;"></ul>
		</div>
	</body>
</html>