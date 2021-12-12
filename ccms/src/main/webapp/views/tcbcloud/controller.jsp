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
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<meta content="" name="description" />
		<meta content="" name="author" />

		<link
			href="/${appName}/commons/jslib/hplus/css/bootstrap.min.css?v=3.3.5"
			rel="stylesheet">
		<link
			href="/${appName}/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0"
			rel="stylesheet">
		<link
			href="/${appName}/commons/jslib/hplus/css/plugins/datapicker/datepicker3.css"
			rel="stylesheet">
		<link href="/${appName}/commons/css/qy-style.css" rel="stylesheet">
		<script type="text/javascript"
			src="/${appName}/commons/jquery-3.1.1.min.js"></script>

		<link rel="stylesheet" href="/${appName}/commons/css/components.css"
			type="text/css"></link>
		<script type="text/javascript" src="/${appName}/commons/echarts.js"></script>
		<script type="text/javascript" src="/${appName}/commons/MyEcharts.js"></script>
		<script type="text/javascript" src="/${appName}/commons/echartheme/vintage.js"></script>
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

		<script type="text/javascript"><!--
		$(function() {
		
		var AERATYPE="<%=session.getAttribute("AERATYPE")%>"; 
		var myChart1 = echarts.init(document.getElementById('chart1'),'vintage');
		var myChart2 = echarts.init(document.getElementById('chart2'),'vintage'); 
		var myChart3 = echarts.init(document.getElementById('chart3'),'vintage'); 
		var myChart4 = echarts.init(document.getElementById('chart4'),'vintage');
	    var myChart5 = echarts.init(document.getElementById('chart5'),'vintage');
		var myChart6 = echarts.init(document.getElementById('chart6'),'vintage');  
		if(AERATYPE=="1")
		{	
			$("#div1").show();
		    $("#div2").hide();
		   
				$.post('/${appName}/manager/TcbcloudController/get_shen_protocolinfo_count').done(function (data) {
				    var obj=eval('('+data+')');				   
				    var option1 = {
					    tooltip : {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c}份({d}%)"
					    },
					    legend: {
					        orient: 'vertical',
					        left: 'left',
					        data: obj.names
					    },
					    series : [
					        {
					            name: '全省总数',
					            type: 'pie',
					            radius : ['50%', '70%'],
					            label: {
						                normal: {
						                    show: true,
						                    position:'outside',		                    
						                }
						        },
					            data:obj.lists,
					            itemStyle: {
						           
					                emphasis: {
					                    shadowBlur: 10,
					                    shadowOffsetX: 0,
					                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					                }
					            }
					        }
					    ]
					};					
					myChart1.setOption(option1);
				});
				
				
				$.get('/${appName}/manager/TcbcloudController/get_shen_protocolinfo_shi_count').done(function (data) {
				    var obj=eval('('+data+')');	
				   		   
				    var option2 = {
						    tooltip : {
						        trigger: 'item',
						        formatter: "{a} <br/>{b} : {c}份({d}%)"
						    },	   
						    legend: {
						        orient: 'vertical',
						        left: 'left',
						        data: obj.names
					        },
						    series : [
						        {
						            name: '各市占比数',
						            type: 'pie',
						            radius : '75%',						           
						            data:obj.lists,
						            label: {
						                normal: {
						                    show: false,						                                 
						                }
						            },
						            labelLine:{
						                normal: {
						                    show: false,						                                 
						                }
						            },
						            itemStyle: {
							            
						                emphasis: {
						                    shadowBlur: 10,
						                    shadowOffsetX: 0,
						                    shadowColor: 'rgba(0, 0, 0, 0.5)'
						                }
						            }
						        }
						    ]
						};				
					myChart2.setOption(option2);
				});
				
				
				$.get('/${appName}/manager/TcbcloudController/get_shen_protocolinfo_shi_yes_count').done(function (data) {
				    var obj=eval('('+data+')');	
				   	var option3 = {
					    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        },        
					        formatter: '{b0} : {c0}份'
					    },	    	   
					    xAxis : [
					        {
					            name:'城市',
					            type : 'category',
					            nameGap:6 ,
					            data:obj.names
					            
					        }
					    ],
					    yAxis : [
					        {
					            name:'已生效数',
					            type : 'value'
					        }
					    ],
					    series : [
					        {
					            name:'江苏省',
					            type:'bar',
					            data:obj.lists
					        },
					        {
					            name:'江苏省',
					            type:'line',
					            data:obj.lists
					        }
							
					    ]
					};			    		
					myChart3.setOption(option3);
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
			        autoclose: !0,
			        startDate:getCurrentMonthFirst(),
			        endDate:getCurrentMonthLast()
		           
			});
		    $("#effectiveEndDate1").datepicker("disable").attr("readonly","readonly"); 
		    $("#effectiveEndDate2").datepicker({
			        todayBtn: "linked",
			        keyboardNavigation: !1,
			        forceParse: !1,
			        calendarWeeks: !0,
			        autoclose: !0,
			        startDate:getCurrentMonthFirst(),
			        endDate:getCurrentMonthLast()
			});
		    $("#effectiveEndDate2").datepicker("disable").attr("readonly","readonly"); 
		    
				$.get('/${appName}/manager/TcbcloudController/get_shi_protocolinfo_count').done(function (data) {
				         var obj=eval('('+data+')');					       
				   		 var option4 = {
						    tooltip : {
						        trigger: 'item',
						        formatter: "{a} <br/>{b} : {c}份({d}%)"
						    },
						    legend: {
						        orient: 'vertical',
						        left: 'left',
						        data: obj.names
						    },
						    series : [
						        {
						            name: '市签订数',
						            type: 'pie',
						            radius : ['50%', '70%'],
						            label: {
							                normal: {
							                    show: true,
							                    position:'outside',
							                    
							                }
							        },
						            data:obj.lists,
						            itemStyle: {
							           
						                emphasis: {
						                    shadowBlur: 10,
						                    shadowOffsetX: 0,
						                    shadowColor: 'rgba(0, 0, 0, 0.5)'
						                }
						            }
						        }
						    ]
						};
	    		
					myChart4.setOption(option4);
				});
				
				
				$.get('/${appName}/manager/TcbcloudController/get_shi_protocolinfo_detail_count').done(function (data) {
				    var obj=eval('('+data+')');    
				   		var option5 = {
						    tooltip: {
					        trigger: 'item',
					        formatter: "{b}: {c}份"
						    },
						    legend: {
							        orient: 'vertical',
							        left: 'left',
							        data: obj.names
							    },
						    series: [
						        {
						            name:'生效数',
						            type:'pie',
						            selectedMode: 'single',
						            radius: [0, '30%'],
						            label: {
						                normal: {
						                    show: false
						                }
						            },
						            labelLine: {
						                normal: {
						                    show: false
						                }
						            },
						            data:[{value: obj.lists.sx, name: '生效数'}]
						        },
						        {
						            name:'已处理数',
						            type:'pie',
						            radius: ['40%', '55%'],
						            label: {
						                normal: {
						                    show: false
						                }
						            },
						            labelLine: {
						                normal: {
						                    show: false
						                }
						            },
						            data:[{value: obj.lists.yq, name: '已处理数'}]
						        },
						        {
						            name:'协议下发数',
						            type:'pie',
						            radius: ['65%', '85%'],
						            label: {
						                normal: {
						                    show: false
						                }
						            },
						            labelLine: {
						                normal: {
						                    show: false
						                }
						            },
						            data:[{value: obj.lists.zs, name: '协议下发数'}]
						        }
						    ]
						};
					myChart5.setOption(option5);
				});
				
				
				$.get('/${appName}/manager/TcbcloudController/get_shi_protocolinfo_yq_count').done(function (data) {
				    var obj=eval('('+data+')');    
				    var option6 = {
						        tooltip : {
							        trigger: 'axis',
							        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
							            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
							        },        
							        formatter: obj.date+'{b0} : {c0}份'
							    },	    	   
							    xAxis : [
							        {
							            name:'日期',
							            type : 'category',
							            nameGap:6 ,
							            data: obj.xdata
							            
							        }
							    ],
							    yAxis : [
							        {
							            name:'生效数',
							            type : 'value'
							        }
							    ],
							    series : [
							        {
							            name:'市',
							            type:'bar',
							            data:  obj.ydata
							            
							        },
							        {
							            name:'市',
							            type:'line',
							            data:  obj.ydata
							            
							        }
							    ]
						};
					myChart6.setOption(option6);
				});
		}
		else
		{
		     $("#div1").hide();
		     $("#div2").hide();
		}
           
		$("#btnSelect").click(function(){
				     var d1=$("#effectiveEndDate1").val();
                     var d2=$("#effectiveEndDate2").val();
				     if(d1=="" && d2=="")
				     {
				          swal({title:"请至少选择一个日期",text:""});
				          return;
				     }
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
				     
					 $.ajax({
			   			url: '/${appName}/manager/TcbcloudController/get_shi_protocolinfo_yq_countByDate',
			   			data:{StartDate:d1,EndDate:d2},
						type: 'post',
			   			dataType: 'text',
			   			success: function(data){
				            var obj=eval('('+data+')');  
				           
						    var option6 = {
								        tooltip : {
									        trigger: 'axis',
									        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
									            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
									        },        
									        formatter: obj.date+'{b0} : {c0}份'
									    },	    	   
									    xAxis : [
									        {
									            name:'日期',
									            type : 'category',
									            nameGap:6 ,
									            data: obj.xdata
									            
									        }
									    ],
									    yAxis : [
									        {
									            name:'生效数',
									            type : 'value'
									        }
									    ],
									    series : [
									        {
									            name:'市',
									            type:'bar',
									            data:  obj.ydata			           
									        },
									        {
									            name:'市',
									            type:'line',
									            data:  obj.ydata
									            
									        }
									    ]
								};
							myChart6.setOption(option6);
			   			}
			   		}); 
		    })
			$("#btnResert").click(function(){
			    $("#effectiveEndDate1").val("");
			    $("#effectiveEndDate2").val("");
			})
				
        });
 
    </script>
		<script>
/**
 * 获取当前月的第一天
 */
function getCurrentMonthFirst(){
 var date=new Date();
 date.setDate(1);
 return date;
}
/**
 * 获取当前月的最后一天
 */
function getCurrentMonthLast(){
 var date=new Date();
 var currentMonth=date.getMonth();
 var nextMonth=++currentMonth;
 var nextMonthFirstDay=new Date(date.getFullYear(),nextMonth,1);
 var oneDay=1000*60*60*24;
 return new Date(nextMonthFirstDay-oneDay);
}
</script>
	</head>

	<body style="background-color: #F3F3F4" class="black-bg-gmtx">
		<div class="container" id="div1">
			<!--start-->
			<div class="row margin-top-20">
				<!--各市占比数-->
				<div class="col-md-6">
					<div class="portlet light bordered">
						<div class="portlet-title">
							<i class="ssjk-icon1"></i><span
								class="caption-subject font-green bold uppercase">各市占比数</span>
						</div>
						<div class="portlet-body">
							<div id="chart2" style="width: 100%; height: 250px;"></div>
						</div>
					</div>
				</div>
				<!--end-->
				<!--全省总数-->
				<div class="col-md-6">
					<div class="portlet light bordered">
						<div class="portlet-title">
							<i class="ssjk-icon2"></i><span
								class="caption-subject font-green bold uppercase">全省总数</span>
						</div>
						<div class="portlet-body">
							<div id="chart1" style="width: 100%; height: 250px;"></div>
						</div>
					</div>
				</div>
				<!--end-->
			</div>
			<div class="row">
				<!--各市已签订数-->
				<div class="col-md-12">
					<div class="portlet light bordered">
						<div class="portlet-title">
							<i class="ssjk-icon3"></i><span
								class="caption-subject font-green bold uppercase">各市已生效数</span>
						</div>
						<div class="portlet-body">
							<div id="chart3" style="width: 100%; height: 40%;"></div>
						</div>
					</div>
				</div>
				<!--end-->
			</div>
		</div>
		<div class="container" id="div2">
			<!--start-->
			<div class="row margin-top-20">
				<!--签订比例数-->
				<div class="col-md-6">
					<div class="portlet light bordered">
						<div class="portlet-title">
							<i class="ssjk-icon4"></i><span
								class="caption-subject font-green bold uppercase">签订比例数</span>
						</div>
						<div class="portlet-body">
							<div id="chart5" style="width: 100%; height: 250px;"></div>
						</div>
					</div>
				</div>
				<!--end-->
				<!--市签订数-->
				<div class="col-md-6">
					<div class="portlet light bordered">
						<div class="portlet-title">
							<i class="ssjk-icon5"></i><span
								class="caption-subject font-green bold uppercase">市签订数</span>
						</div>
						<div class="portlet-body">
							<div id="chart4" style="width: 100%; height: 250px;"></div>
						</div>
					</div>
				</div>
				<!--end-->
			</div>
			<div class="row">
				<!--签订数-->
				<div class="col-md-12">
					<div class="portlet light bordered">
						<div class="portlet-title">
							<i class="ssjk-icon6"></i><span
								class="caption-subject font-green bold uppercase">日生效数</span>
							<span style="float: right"> 开始签字日期 <i
								class="fa fa-calendar" style="color: black;"></i> <input
									type="text" value="" id="effectiveEndDate1"> 结束签字日期 <i
								class="fa fa-calendar" style="color: black;"></i> <input
									type="text" value="" id="effectiveEndDate2">
								<button type="button" id="btnSelect">
									查询
								</button>
								<button type="button" id="btnResert">
									重置
								</button> </span>
						</div>
						<div class="portlet-body">

							<div id="chart6" style="width: 100%; height: 250px;"></div>
						</div>
					</div>
				</div>
				<!--end-->
			</div>
		</div>
	</body>

</html>