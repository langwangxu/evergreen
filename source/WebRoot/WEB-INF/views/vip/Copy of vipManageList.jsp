<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ include file="../common/taglib.jsp"%>
<html>
  <head>
    <title>VIP信息编辑页面</title>
	<link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/plugins/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
	<link href="<c:url value='/css/momocss/pageheader.css'/>" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.btn-mo{
			padding:1px;
		}
		.panel-mo{
			margin-bottom:2px;
			margin-top:2px;
		}
		.form-group{
			margin-bottom:0px;
		}
	</style>
  </head>
  <body>
		<%@ include file="../common/pageHeader.jsp"%>
		<div class="container">
			<div class="panel panel-default panel-mo">
				<div class="panel-body">
				<form:form class="form-horizontal"> 
					<div class="form-body">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="control-label col-md-3">会员姓名</label>
									<div class="col-md-9">
										<form:input path="name" class="form-control placeholder-no-fix" autocomplete="off" placeholder="会员姓名"/>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									 <label class="control-label col-md-3">卡号</label>
									 <div class="col-md-9">
									 	<form:input path="card" class="form-control placeholder-no-fix" autocomplete="off" placeholder="会员卡号"/>
									 </div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="col-md-6">
									<button type="submit" class="btn btn-primary">搜索（支持模糊查询）</button>                            
								</div>
								<div class="col-md-6">
									                           
								</div>
							</div>
						</div>
					</div>
				</form:form>
				</div>
			</div>
			<div class="panel panel-primary panel-mo">
				<div class="panel-heading">
					VIP会员信息编辑列表&nbsp;&nbsp;&nbsp;&nbsp;
					<a type="btn" class="btn btn-danger btn-sm btn-mo" href="<c:url value='/vip/add'/>">添加VIP记录</a>
				</div>
				<div class="panel-body">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>姓名</th>
								<th>卡号</th>
								<th>电话</th>
								<th>生日</th>
								<th>E-mail</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vip" items="${contentModel.items}">
								<tr>
									<td>
										<a href="<c:url value='/vip/${vip.id}'/>">
										   ${vip.name}
										</a>
									</td>
									<td>${vip.card}</td>
									<td>${vip.phone}</td>
									<td>${vip.birth}</td>
									<td>${vip.email}</td>
									<td>${vip.memo}</td>
									<td>
									   <a href="<c:url value='/vip/${vip.id}/edit'/>">修改</a>
									   <input type="hidden" name="_method" value="DELETE" />
									   <a href="javascript:document.getElementById('form${status.count}').submit();">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<c:import url = "../common/paging.jsp">
				<c:param name="pageModelName" value="contentModel"/>
				<c:param name="urlAddress" value="/vip/manage/list"/>
			</c:import>
		</div>
	</body>
</html>
