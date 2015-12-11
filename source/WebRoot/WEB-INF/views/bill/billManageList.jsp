<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ include file="../common/taglib.jsp"%>
<html>
	<head>
	    <meta charset="utf-8">
		<title>VIP账单管理页面</title>
		<link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/plugins/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/css/momocss/pageheader.css'/>" rel="stylesheet" type="text/css" />
		<style type="text/css">
			.btn-mo{
				padding:1px;
			}
			.form-group{
				margin-bottom:0px;
			}
			.non_show_td{
				text-align:center;
				font-size:14px;
				font-weight:bold;
			}
			.fresh_msg{
				display:none;
			}
			.tr-mo{
				color:#000;
				background-color:#fcf8e3;
				border-color:#337ab7;
			}
			.pagination-mo{
				margin:0;
			}
			#vip-table{
				margin-bottom:0;
			}
			.op .btn{
				display:inline;
				padding:0px;
			}
		</style>
	</head>
	<body>
		<%@ include file="../common/pageHeader.jsp"%>
		<div class="container">
			<div class="non_show_td fresh_msg warning">
				<i class="fa fa-3x fa-blue fa-spinner fa-pulse"></i>
			</div>
			<div class="panel panel-primary panel-mo">
				<div class="panel-heading">
					当前会员信息
				</div>
				<div class="panel-body">
					<!-- 被查看账单的vip会员注册信息  开始-->
					<table class="table table-mo table-bordered table-hover" id="vip-table">
						<thead>
							<tr class="tr-mo">
								<th>姓名</th>
								<th>卡号</th>
								<th>电话</th>
								<th>生日</th>
								<th>E-mail</th>
								<th>会员卡创建时间</th>
								<th>会员卡更新时间</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody>
							<tr class="non_show_tr warning"><td colspan="8" class="non_show_td">正在查询</td></tr>
						</tbody>
					</table>
					<!-- 被查看账单的vip会员注册信息  结束-->	
				</div>
			</div>
			<div class="panel panel-primary panel-mo">
				<div class="panel-heading">
					当前会员账户信息管理列表&nbsp;&nbsp;&nbsp;&nbsp;
					<a type="btn" class="btn btn-success btn-sm btn-mo" href="<c:url value='/bill/${vipid}/add'/>">添加一条账单</a>
				</div>
				<div class="panel-body">
					<!-- 被查看账单的vip会员的账单信息  开始-->	
					<table class="table table-mo table-bordered table-hover" id="acc-table">
						<thead>
							<tr class="tr-mo">
								<th>编号</th>
								<th>用餐日期</th>
								<th>用餐人数</th>
								<th>用餐类型</th>
								<th>会员卡创建时间</th>
								<th>会员卡更新时间</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr class="non_show_tr warning"><td colspan="8" class="non_show_td">正在查询</td></tr>
						</tbody>
					</table>
					<!-- 被查看账单的vip会员的账单信息  结束-->	
					<!--分页区域 start-->
					<div class="pager-mo"></div>
					<!--end 分页区域-->
				</div>
			</div>

		</div>
		<script src="<c:url value='/plugins/jquery/jquery-1.10.2.min.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/plugins/bootstrap3.4/js/bootstrap.min.js'/>" type="text/javascript" ></script>
		<script src="<c:url value='/js/json2.js'/>" type="text/javascript"></script>
		<script type="text/javascript">
			var url_all = '<%=request.getContextPath()%>/bill/list';
			var params = {};
			function initParams(){
				params.pageNo = 1;
				params.pageSize = 25;
				params.vipId = ${vipid};
			}
			function toAjax(){
				$ajax();
			}
			function freshMsg(){
				$('div.panel').hide();
				$('div.fresh_msg').show();
			}
			function freshData(){
				$('div.fresh_msg').hide();
				$('div.panel').show();
			}
			function $ajax(){
				$.ajax({
					type:'post',
					contentType:'application/json',
					url:url_all,
					processData:false,
					dataType:'json',
					data:JSON.stringify(params),
					beforeSend:function(){
						freshMsg();
					},
					success:function(sdata){
						appendTbodyVipConts(sdata.vip);
						appendTbodyContents(sdata.acc);
						consPaper(sdata.acc);
						freshData();
					},
					error:function(){
						alert('网络错误……');
					}
				});
			}
			/*
			 * 将vip记录刷新到页面
			 */
			function appendTbodyVipConts(d){
				var tr_c = '';
				//var ditems = d.items;
				var flag_arr = ['name','card','phone','birth','email','createTime','updateTime','memo'];
				if(d && d.id){
					//$.each(ditems,function(i,di){
						var td_c='';
						$.each(flag_arr,function(f,item){
							td_c += '<td>'+d[item]+'</td>';
						});
						tr_c += '<tr>'+td_c+'</tr>';
					//});
				}else{
					tr_c += '<tr class="non_show_tr warning"><td colspan="8" class="non_show_td">无查询记录</td></tr>';
				}
				$('#vip-table tbody').remove();
				$('#vip-table').append('<tbody>'+tr_c+'</tbody>');
			}
			/*
			 * 将账单记录列表刷新到页面
			 */
			function appendTbodyContents(acc){
				var tr_c = '';
				var ditems = acc.items;
				var flag_arr = ['consumeTime','consumerNum','dinnerType','createTime','updateTime','memo'];
				if(ditems && ditems.length>0){
					$.each(ditems,function(i,di){
						var td_c='<td>'+(i+1)+'</td>';
						$.each(flag_arr,function(f,item){
							if(item=='dinnerType'){
								switch(di[item]){
									case 1:
										di[item] = '早餐';
										break;
									case 2:
										di[item] = '午餐';
										break;	
									case 3:
										di[item] = '晚餐';
										break;
								}
							}
							td_c += '<td>'+di[item]+'</td>';
						});
						var di_id = di['id'];
						var modhref = '<c:url value="/bill/'+di_id+'/edit"/>';
						var delhref = '<c:url value="/bill/'+di_id+'/delete"/>';
						tr_c += '<tr>'+td_c+'<td class="op">'
						+'<a type="button" class="btn btn-link bill-mod" href="'+modhref+'">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;'
						+'<a type="button" class="btn btn-link bill-del" href="'+delhref+'"  onclick="return confirm(\'亲，确实要删除这条记录吗？\')">删除</a>'
						+'</td>'
						+'</tr>';
					});
				}else{
					tr_c += '<tr class="non_show_tr warning"><td colspan="8" class="non_show_td">无查询记录</td></tr>';
				}
				$('#acc-table tbody').remove();
				$('#acc-table').append('<tbody>'+tr_c+'</tbody>');
			}
			function consPaper(data){
				//默认的一些属性定义
				var def_pagecount = 10;
				//获取具体的分页信息
				var pagesize = data.pageSize;//每页显示记录数
				var itemcount = data.itemCount;//全部分页总共记录数
				var haspre = data.hasPre;//是否有前一页
				var hasnext = data.hasNext;//是否有下一页
				var pagecount = data.pageCount;//全部记录实际总的页数
				var pageindex = data.pageIndex;//当前页码
				var paperRowHtml = $('.pager-mo .row-mo');
				$('a.a-mo').unbind("click");
				paperRowHtml.remove();
				var newPaperContents = '<div class="row row-mo">';
				newPaperContents +=	'<div class="col-md-5 col-sm-12"><div class="pager-info-mo text-primary">每页显示 '+pagesize+' 条，共 '+itemcount+' 条记录</div></div><div class="col-md-7 col-sm-12"><div class="dataTables_paginate paging_bootstrap"><ul class="pagination pagination-mo pull-right">';
				if(haspre){
					params.pageNo = pageindex - 1;
					newPaperContents += '<li class="prev"><a href="#" class="a-mo">上一页</a></li>';
				}else{
					newPaperContents += '<li class="prev disabled"><span>上一页</span></li>';
				}
				if(pagecount <= def_pagecount){
					for(var i=1;i<=pagecount;i++){
						if(i==pageindex){
							newPaperContents += '<li class="active"><a href="#">'+i+'</a></li>';
						}else{
							params.pageNo = i;
							newPaperContents += '<li><a href="#" class="a-mo">'+i+'</a></li>';
						}
					}
				}else{
					for(var i=1;i<=def_pagecount;i++){
						if(pageindex <= def_pagecount/2){
							if(i == pageindex){
								newPaperContents += '<li class="active"><a href="#">'+i+'</a></li>';
							}else if(def_pagecount-i>2){
								params.pageNo = i;
								newPaperContents += '<li><a href="#" class="a-mo">'+i+'</a></li>';
							}else if(i==pageCount-2){
								newPaperContents += '<span>...</span>';
							}else{
								var pageNo_1 = pagecount-(def_pagecount-i);
								params.pageNo = pageNo_1;
								newPaperContents += '<li><a href="#" class="a-mo">'+pageNo_1+'</a></li>';
							}
						}else if(pagecount-pageindex<def_pagecount/2){
							if(i<3){
								params.pageNo = i;
								newPaperContents += '<li><a href="#" class="a-mo">'+i+'</a></li>';
							}else if(i==3){
								newPaperContents += '<span>...</span>';
							}else{
	        					var pageNo_2 = pagecount-(def_pagecount-i);
	        					if(pageNo_2 == pageindex){
	        						newPaperContents += '<li class="active"><a href="#">'+pageNo_2+'</a></li>';
	        					}else{
	        						params.pageNo = pageNo_2;
	        						newPaperContents += '<li><a href="#" class="a-mo">'+pageNo_2+'</a></li>';
	        					}
	        				}
						}else{
							if(i<3){
								params.pageNo = i;
								newPaperContents += '<li><a href="#" class="a-mo">'+i+'</a></li>';
							}else if(i==3 || i == def_pagecount-2){
								newPaperContents += '<span>...</span>';
							}else if(i>def_pagecount - 2){
								var pageNo_3 = pagecount-(def_pagecount-i);
								params.pageNo = pageNo_3;
								newPaperContents += '<li><a href="#" class="a-mo">'+pageNo_3+'</a></li>';
							}else{
								if(def_pagecount%2==0){
									if(i == def_pagecount/2){
										newPaperContents += '<li class="active"><a href="#">'+pageindex+'</a></li>';
									}else if(i < def_pagecount/2){
										var pageNo_4 = pageindex-(def_pagecount/2-i);
										params.pageNo = pageNo_4;
										newPaperContents += '<li><a href="#" class="a-mo">'+pageNo_4+'</a></li>';
									}else{
										var pageNo_5=pageindex+(i-def_pagecount/2);
										params.pageNo = pageNo_5;
										newPaperContents += '<li><a href="#" class="a-mo">'+pageNo_5+'</a></li>';
									}
								}else{
									if(i==(def_pagecount+1)/2){
										newPaperContents += '<li class="active"><a href="#">'+pageindex+'</a></li>';
									}else if(i<(def_pagecount+1)/2){
										var pageNo_6=pageindex-((def_pagecount+1)/2-i);
										params.pageNo = pageNo_6;
										newPaperContents += '<li><a href="#" class="a-mo">'+pageNo_6+'</a></li>';
									}else{
										var pageNo_7=pageindex+(i-(def_pagecount+1)/2);
										params.pageNo = pageNo_7;
										newPaperContents += '<li><a href="#" class="a-mo">'+pageNo_7+'</a></li>';
									}
								}
							}
						}
					}
				}
				if (hasnext) {
					params.pageNo = pageindex + 1;
					newPaperContents += '<li class="next"><a href="#" class="a-mo">下一页</a></li>';
				}else{
					newPaperContents += '<li class="next disabled"><span>下一页</span></li>';
				}
				newPaperContents += '</ul></div></div></div>';
				$('.pager-mo').append(newPaperContents);
				$('a.a-mo').on("click",function(e){
					e.preventDefault();
					toAjax();
				}); 
			}
			//主城
			$(function(){
				initParams();
				toAjax();
			});
		</script>
	</body>	
</html>
