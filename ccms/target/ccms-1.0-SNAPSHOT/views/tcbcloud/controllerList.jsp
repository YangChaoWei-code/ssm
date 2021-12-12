<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">
	<head>

		<title></title>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<link rel="shortcut icon" href="favicon.ico">
		<link href="/${appName}/commons/jslib/hplus/css/bootstrap.min.css"
			rel="stylesheet">
		<link href="/${appName}/commons/jslib/hplus/css/style.min.css?v=4.0.0"
			rel="stylesheet">
		<link href="/${appName}/commons/css/qy-style.css" rel="stylesheet">
		<link
			href="/${appName}/commons/jslib/hplus/css/plugins/datapicker/datepicker3.css"
			rel="stylesheet">
		<link
			href="/${appName}/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
			rel="stylesheet">
		<script src="/${appName}/commons/jslib/hplus/js/jquery.min.js?v=2.1.4"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/bootstrap.min.js?v=3.3.5"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"
			type="text/javascript"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"
			type="text/javascript"></script>
		<script
			src="/${appName}/commons/jslib/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>
		<!-- Sweet Alert -->
		<link
			href="/${appName}/commons/jslib/hplus/css/plugins/sweetalert/sweetalert.css"
			rel="stylesheet">
		<!-- Sweet Alert -->
		<!-- Sweet Alert -->
		<script type="text/javascript"
			src="/${appName}/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
		<!-- Sweet Alert -->

		<script type="text/javascript"
			src="/${appName}/commons/jslib/layer/layer.js"></script>
		<script type="text/javascript">
		$(function() {
		
		var AERATYPE="<%=session.getAttribute("AERATYPE")%>"; 
		if(AERATYPE=="1")
		{	
			$("#div1").show();
		    $("#div2").hide();
            var $table = $('#table');
			    $table.bootstrapTable({
			    url: "/${appName}/manager/TcbcloudController/get_shen_protocolinfo_detailList_count",
			    dataType: "json",
			    method: 'post',
				contentType: "application/x-www-form-urlencoded",
			    pagination: true,
			    pageSize: 20,
			    pageNumber:1,
			    singleSelect: false,
        		checkboxHeader: true,
        		clickToSelect: true,
			    queryParamsType : "undefined",
			    queryParams: function queryParams(params) {  //设置查询参数
		          var param = {
		            pageNo: params.pageNumber,
		            pageSize: params.pageSize
		          };
		          return param;
		        },
			    cache: false,
			    sidePagination: "server", //服务端处理分页
		        columns: [
		                {
		                    title: '所属市',
		                    field: 'name',
		                    valign: 'middle'
		                },
		                {
		                    title: '已处理数',
		                    field: 'ycl',
		                    valign: 'middle'
		                },
		                {
		                    title: '未处理数',
		                    field: 'wcl',
		                    valign: 'middle'
		                },
		                {
		                    title: '逾期未确认数',
		                    field: 'yqwqr',
		                    valign: 'middle'
		                },
		                {
		                    title: '逾期再处理数',
		                    field: 'yqzcl',
		                    valign: 'middle'
		                },		                
		                {
		                    title: '协议可见数',
		                    field: 'xykjs',
		                    valign: 'middle'
		                },
		                {
		                    title: '协议不可见数',
		                    field: 'xybkjs',
		                    valign: 'middle'
		                },
		                {
		                    title: '已接收数',
		                    field: 'yjs',
		                    valign: 'middle'
		                },
		                {
		                    title: '未接收数',
		                    field: 'wjs',
		                    valign: 'middle'
		                },
		                {
		                    title: '已生效数',
		                    field: 'ysx',
		                    valign: 'middle'
		                },
		                {
		                    title: '未生效数',
		                    field: 'wsx',
		                    valign: 'middle'
		                }
		            ]
			      });
		}
		else if(AERATYPE=="2")
		{
		    $("#div1").hide();
		    $("#div2").show();
		    $("#effectiveEndDate1").datepicker({
			        todayBtn: "linked",
			        keyboardNavigation: !1,
			        forceParse: !1,
			        calendarWeeks: !0,
			        autoclose: !0
		           
			});
		    $("#effectiveEndDate1").datepicker("disable").attr("readonly","readonly"); 
		    $("#effectiveEndDate2").datepicker({
			        todayBtn: "linked",
			        keyboardNavigation: !1,
			        forceParse: !1,
			        calendarWeeks: !0,
			        autoclose: !0
			});
		    $("#effectiveEndDate2").datepicker("disable").attr("readonly","readonly"); 
		    $("#rad3").prop("checked",true); 
		    var $table = $('#table1');
			    $table.bootstrapTable({
			    url: "/${appName}/manager/TcbcloudController/get_shi_protocolinfo_detailList_countByday",
			    dataType: "json",
			    method: 'post',
				contentType: "application/x-www-form-urlencoded",
			    pagination: true,
			    pageSize: 20,
			    pageNumber:1,
			    singleSelect: false,
        		checkboxHeader: true,
        		clickToSelect: true,
			    queryParamsType : "undefined",
			    queryParams: function queryParams(params) {  //设置查询参数
		          var param = {
		            pageNo: params.pageNumber,
		            pageSize: params.pageSize,
		            type:'3',
		            StartDate:'',
					EndDate:''	
		          };
		          return param;
		        },
			    cache: false,
			    sidePagination: "server", //服务端处理分页
		        columns: [
		                {
		                    title: '协议下发日期',
		                    field: 'createTime',
		                    valign: 'middle'
		                },		               
		                {
		                    title: '已处理数',
		                    field: 'ycl',
		                    valign: 'middle'
		                },
		                {
		                    title: '未处理数',
		                    field: 'wcl',
		                    valign: 'middle'
		                },
		                {
		                    title: '逾期未确认数',
		                    field: 'yqwqr',
		                    valign: 'middle'
		                },
		                {
		                    title: '逾期再处理数',
		                    field: 'yqzcl',
		                    valign: 'middle'
		                },		                
		                {
		                    title: '协议可见数',
		                    field: 'xykjs',
		                    valign: 'middle'
		                },
		                {
		                    title: '协议不可见数',
		                    field: 'xybkjs',
		                    valign: 'middle'
		                },
		                {
		                    title: '已接收数',
		                    field: 'yjs',
		                    valign: 'middle'
		                },
		                {
		                    title: '未接收数',
		                    field: 'wjs',
		                    valign: 'middle'
		                },
		                {
		                    title: '已生效数',
		                    field: 'ysx',
		                    valign: 'middle'
		                },
		                {
		                    title: '未生效数',
		                    field: 'wsx',
		                    valign: 'middle'
		                }
		            ]
			      });
		    
		    
		}
		else
		{
		     $("#div1").hide();
		     $("#div2").hide();
		}
        
        $("#btnSelect").click(function(){
			         var val=$('input:radio[name="rad"]:checked').val();		        
			         var d1=$("#effectiveEndDate1").val();
                     var d2=$("#effectiveEndDate2").val();
				     if(d1!="" && d2!="")
				     {
				           var dd1=d1.split("-");
		                   var ddd1=new Date();
		                   ddd1.setFullYear(dd1[0],parseInt(dd1[1])-1,dd1[2]);
		                   var dd2=d2.split("-");
		                   var ddd2=new Date();
		                   ddd2.setFullYear(dd2[0],parseInt(dd2[1])-1,dd2[2]);
		                   if(dd1>dd2)
		                   {
		                        swal({title:"开始日期不能大于结束日期",text:""});
				                return;
		                   }
				     }				     
			        $('#table1').bootstrapTable('refresh',
						{query: 
							{
								pageNumber : 1,
					    		pageSize : 20,
					    		type:val,
					    		StartDate:d1,
					    		EndDate:d2		       					
							}
				   });			    
        })
        
        
         $("#btnShenExcel").click(function(){
	  	          $.ajax({
		       					url:'/${appName}/manager/TcbcloudController/ToShenExcel',
		       					dataType:'json',
		       					data:{},
		       					type:'post',
		       					success:function(data){		    
		       					   if(data.message=="2")
		       					   {
										swal(
										       {
													title:"导出成功,点OK下载！",
													showConfirmButton: true,
													text:""
												},
												function()
												{
													window.location.href ="/${appName}/download/ShenExcel.xls";					       						
							       					var frameIndex = parent.layer.getFrameIndex(window.name); //获取窗口索引  
		            								parent.layer.close(frameIndex); 
												}
											);																				
		       					   }		       					  
		       					   else if(data.message=="1")
		       					   {
		       					       swal({title:"导出数据为空",text:""});
		       					   }       					    
		       					}, 		       				
			       				error:function(a,b,c){
			       				    swal({title:b,text:""});
	       			            }
	       		   });
	  	   });
		   $("#btnShiExcel").click(function(){
	  	          $.ajax({
		       					url:'/${appName}/manager/TcbcloudController/ToShiExcel',
		       					dataType:'json',
		       					data:{
		       					    StartDate:$("#effectiveEndDate1").val(),
		       					    EndDate:$("#effectiveEndDate2").val(),
		       					    type:$('input:radio[name="rad"]:checked').val()
		       					},
		       					type:'post',
		       					success:function(data){			       					 				    		       					  
		       					   if(data.message=="1")
		       					   {
		       					       swal({title:"导出数据为空",text:""});
		       					   }  
		       					   else
		       					   {
		       					      swal(
										       {
													title:"导出成功,点OK下载！",
													showConfirmButton: true,
													text:""
												},
												function()
												{
													window.location.href ="/${appName}/download/"+data.message+"ShiExcel.xls";					       						
							       					var frameIndex = parent.layer.getFrameIndex(window.name); //获取窗口索引  
		            								parent.layer.close(frameIndex); 
												}
											);			
		       					   }     					    
		       					}, 		       					
			       				error:function(a,b,c){
			       				    swal({title:b,text:""});
	       			            }
	       		   });
	  	   });
	  	   $("#btnRerset").click(function(){
	  	          $("#effectiveEndDate1").val("");
	  	          $("#effectiveEndDate2").val("");
	  	          $("#rad3").prop("checked",true); 
	  	          
	  	          
	  	   });
		  
				
});
 
    </script>

	</head>

	<body class="gray-bg black-bg-gmtx">
		<div class="wrapper wrapper-content " id="div1">
			<div class="ibox float-e-margins">
				<div class="ibox-content">
					<button class="btn btn-gmtx-define1" type="button"
						id="btnShenExcel">
						导出
					</button>
					<table id="table" data-click-to-select="true"
						class="table table-striped table-bordered table-hover"
						style="font-size: 13px">
					</table>
				</div>
			</div>
		</div>
		<div class="wrapper wrapper-content " id="div2">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div class="row text-left">
						<div class="row">
							<label class="col-sm-2 control-label text-right">
								协议下发日期
							</label>
							<div class="col-sm-2 text-right">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-calendar"></i> </span>
									<input type="text" class="form-control" value=""
										id="effectiveEndDate1">
								</div>
							</div>
							<label class="col-sm-1 control-label text-right">
								至
							</label>
							<div class="col-sm-2 text-right">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="fa fa-calendar"></i> </span>
									<input type="text" class="form-control" value=""
										id="effectiveEndDate2">
								</div>
							</div>
							<div class="col-sm-2 text-right">
								<button class="btn btn-gmtx-define1" type="button"
									id="btnSelect">
									查询
								</button>
								<button class="btn btn-gmtx-define1" type="button"
									id="btnRerset">
									重置
								</button>
								<button class="btn btn-gmtx-define1" type="button"
									id="btnShiExcel">
									导出
								</button>
							</div>

						</div>
						<div class="row">
							<label class="col-sm-2 control-label text-right">
								按年查询
								<input name="rad" type="radio" value="1" id="rad1" />
							</label>
							<label class="col-sm-2 control-label text-right">
								按月查询
								<input name="rad" type="radio" value="2" id="rad2" />
							</label>
							<label class="col-sm-2 control-label text-right">
								按日查询
								<input name="rad" type="radio" value="3" id="rad3" />
							</label>

						</div>
					</div>

				</div>
				<div class="ibox-content">
					<table id="table1" data-click-to-select="true"
						class="table table-striped table-bordered table-hover"
						style="font-size: 13px">
					</table>
				</div>
			</div>
		</div>





	</body>

</html>