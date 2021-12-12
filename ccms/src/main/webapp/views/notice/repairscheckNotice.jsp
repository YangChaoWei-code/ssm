<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>消息</title>

		<meta name="keywords" content="消息">
		<meta name="description" content="消息">
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
		<!-- echarts -->
		<script type="text/javascript" src="/ccms/commons/echarts.js"></script>
		<script type="text/javascript" src="/ccms/commons/macarons.js"></script>
		
		<script type="text/javascript" src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
		<script type="text/javascript" src="/ccms/commons/jslib/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
		<script type="text/javascript" src="/ccms/commons/jslib/hplus/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/ccms/commons/jslib/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
	</head>
	
	<body class="gray-bg black-bg-gmtx">
		<div class="wrapper wrapper-content ">
			<div class="row" >
				<div id="noticeList" class="col-sm-12">
					
				</div>
			</div>
			<div  class="row" >
				<div id="echart" class="col-sm-12" style="height:400px;">
					
				</div>
			</div>
		</div>
		<script type="text/javascript">
		$(function(){
			var nid = GetQueryString('nid');
			$.ajax({
				url:'/ccms/notice/getNoticeById',
				type:'post',
				async:false,
				cache:false,
				data:{id:nid},
				dataType:'json',
				success: function(data){
						  $('#noticeList').html();
						  if(data.success){
						  	$.each(data.rows, function (key, val) {
			                  var content = '<div class="ibox">'
	                    		+'<div class="ibox-content">'
	                        	+'<a class="btn-link">'
	                            +'<h2>';
				              content+=val.title;
				              content+='</h2></a><div class="small m-b-xs"><strong>';
				              content+=val.noticebelong;
				              content+='</strong> <span class="text-muted"><i class="fa fa-clock-o"></i>'
				              +val.operatetime+'</span></div><p>';
				              content+=val.content;
				              content+='</p><div class="row"><div class="col-md-6"><h5>类型：</h5><button class="btn btn-white btn-xs" type="button">';
				              content+=val.typeName;
				              content+='</button></div>';
				              content+='<div class="col-md-6"><div class="small text-right"><h5></h5>';
				     
				              content+='</div></div></div>'
				              $('#noticeList').append(content);
				            });
	                            
			              }else{
			                  swal({
	             					 title: "系统提示",
						             text: "暂无消息",
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
			
	    //视图
        var myChart = echarts.init(document.getElementById('echart'),'macarons');
	    	$.ajax({
				url:'/ccms/notice/getNoticeDetailNum',
				type:'post',
				async:false,
				cache:false,
				data:{nid:nid},
				dataType:'json',
				success: function(data){
					if(data.success){
						  var read = eval('('+data.read+')');
						  var vote = eval('('+data.vote+')');
		                  option = {
						    tooltip: {
						        trigger: 'item',
						        formatter: "{a} <br/>{b}: {c} ({d}%)"
						    },
						    legend: {
						        orient: 'vertical',
						        x: 'left',
						        data:['赞成','反对','已查收','未查收']
						    },
						    series: [
						        {
						            name:'投票',
						            type:'pie',
						            selectedMode: 'single',
						            radius: [0, '30%'],
						
						            label: {
						                normal: {
						                    position: 'inner'
						                }
						            },
						            labelLine: {
						                normal: {
						                    show: false
						                }
						            },
						            data:vote
						        },
						        {
						            name:'查看',
						            type:'pie',
						            radius: ['40%', '55%'],
						
						            data:read
						        }
						    ]
						};

				        // 使用刚指定的配置项和数据显示图表。
				        myChart.setOption(option);
		            }else{
	                  	 swal({
            					 title: "系统提示",
				             text: "请求失败,请稍后再试",
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
			

        // 指定图表的配置项和数据
        
	    });
	    
	    
		</script>
	</body>
</html>