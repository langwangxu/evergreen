<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ include file="../common/taglib.jsp"%>
<html>
	<head>
		<title>VIP会员信息管理页面</title>
		<link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/plugins/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/css/momocss/pageheader.css'/>" rel="stylesheet" type="text/css" />
		<style type="text/css">
			.btn-mo{
				padding:1px;
			}
			.panel-mo{
				margin-bottom:10px;
				margin-top:10px;
			}
			.form-group{
				margin-bottom:0px;
			}
			.op .btn{
				display:inline;
				padding:0px;
			}
			.non_show_td{
				text-align:center;
				font-size:14px;
				font-weight:bold;
			}
			.pagination-mo{
				margin:0;
			}
		</style>
	</head>
	<body>
		<%@ include file="../common/pageHeader.jsp"%>
		<div class="container">
			<div class="panel panel-default panel-mo">
				<div class="panel-body">
				<form class="form-horizontal"> 
					<div class="form-body">
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="control-label col-md-3">姓名</label>
									<div class="col-md-9">
										<input id="name" class="form-control placeholder-no-fix" autocomplete="off" placeholder="会员姓名"/>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									 <label class="control-label col-md-3">卡号</label>
									 <div class="col-md-9">
									 	<input id="card" class="form-control placeholder-no-fix" autocomplete="off" placeholder="会员卡号"/>
									 </div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									 <label class="control-label col-md-3">手机</label>
									 <div class="col-md-9">
									 	<input id="phone" class="form-control placeholder-no-fix" autocomplete="off" placeholder="手机号"/>
									 </div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<div class="col-md-6">
										<a type="button" class="btn btn-primary pull-right btn-click"><i class="fa fa-search fa-fw"></i>点我查询</a>                      
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				</div>
			</div>
			<div class="panel panel-primary panel-mo">
				<div class="panel-heading">
					VIP会员信息管理列表&nbsp;&nbsp;&nbsp;&nbsp;
					<a type="btn" class="btn btn-success btn-sm btn-mo" href="<c:url value='/vip/add'/>">添加一位新的VIP会员</a>
				</div>
				<div class="panel-body">
					<table class="table table-mo table-bordered table-hover">
						<thead>
							<tr>
								<th>编号</th>
								<th>姓名</th>
								<th>卡号</th>
								<th>电话</th>
								<th>生日</th>
								<th>E-mail</th>
								<th>会员卡创建时间</th>
								<th>会员卡更新时间</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr class="non_show_tr warning"><td colspan="10" class="non_show_td">无查询记录</td></tr>
						</tbody>
					</table>
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
			var nob = 0;
			var queryflag = 0;
			var params = {};
			var url_all = '<%=request.getContextPath()%>/vip/search';
			function dealPostData(){
				params.name = $('input#name').val();
				params.card = $('input#card').val();
				//params.name = '';
				//params.card = '1';
			}
			function initParams(){
				params.pageNo = 1;
				params.pageSize = 25;
			}
			function toAjax(){
				if(queryflag != 0){
					$ajax();
				}else{
					var postdata = dealPostData();
					if(postdata==''){
						return false;
					}else{
						$ajax();
					}
				}
			}
			function freshMsg(){
				$('table.table-mo tbody').remove();
				var msg_show = '<tr class="non_show_tr warning"><td colspan="10" class="non_show_td"><i class="fa fa-3x fa-blue fa-spinner fa-pulse"></i></td></tr>';
				$('table.table-mo').append('<tbody>'+msg_show+'</tbody>');
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
						queryflag = 1 ;
						consPaper(sdata);
						appendTbodyContents(sdata);
					},
					error:function(){
						alert('网络错误……');
					}
				});
			}
			function appendTbodyContents(d){
				var tr_c = '';
				var ditems = d.items;
				var flag_arr = ['name','card','phone','birth','email','createTime','updateTime','memo'];
				if(ditems && ditems.length>0){
					$.each(ditems,function(i,di){
						var td_c='<td>'+(nob+i+1)+'</td>';
						$.each(flag_arr,function(f,item){
							td_c += '<td>'+di[item]+'</td>';
						});
						var di_id = di['id'];
						var modhref = '<c:url value="/vip/'+di_id+'/edit"/>';
						var delhref = '<c:url value="/vip/'+di_id+'/delete"/>';
						tr_c += '<tr>'+td_c+'<td class="op">'
						+'<a type="button" class="btn btn-link vip-mod" href="'+modhref+'">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;'
						+'<a type="button" class="btn btn-link vip-del" href="'+delhref+'" onclick="return confirm(\'亲，确实要删除这条记录吗？\')">删除</a>'
						+'</td>'
						+'</tr>';
					});

				}else{
					tr_c += '<tr class="non_show_tr warning"><td colspan="10" class="non_show_td">无查询记录</td></tr>';
				}
				$('table.table-mo tbody').remove();
				$('table.table-mo').append('<tbody>'+tr_c+'</tbody>');
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
				nob = (pageindex-1) * pagesize;
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
				$('.btn-click').click(function(e){
					queryflag = 0;
					initParams();
					toAjax();
				});
				$('.btn-click').click();
			});
		</script>
	</body>
</html>
