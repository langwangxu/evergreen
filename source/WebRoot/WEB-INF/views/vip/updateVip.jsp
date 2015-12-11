<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ include file="../common/taglib.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改VIP会员</title>
		<link href="<c:url value='/plugins/bootstrap3.4/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/plugins/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/css/momocss/pageheader.css'/>" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<%@ include file="../common/pageHeader.jsp"%>
		<div class="container">
		<div class="panel panel-primary panel-mo">
			<div class="panel-heading">
				VIP会员编辑页面
			</div>
			<div class="panel-body">
				<form action="${context}/vip/${vip.id}/update" class="form-horizontal" method="POST"> 
					<div class="form-group">
					    <label for="name" class="col-sm-2 control-label">会员姓名</label>
					    <div class="col-sm-6">
					      <input type="text" id="name" name="name" value="${vip.name}" class="form-control"/>
					      <span class=""></span>
					    </div>
					    <label for="name" id="name_message" class="col-sm-4 message-label"></label>
				  	</div>
					<div class="form-group">
					    <label for="card" class="col-sm-2 control-label">卡号</label>
					    <div class="col-sm-6">
					      <input type="text" id="card" name="card" class="form-control" value="${vip.card}" readonly/>
					    </div>
					    <label for="name" id="name_message" class="col-sm-4 message-label"></label>
				  	</div>
					<div class="form-group">
					    <label for="phone" class="col-sm-2 control-label">手机号</label>
					    <div class="col-sm-6">
					      <input type="text" id="phone" class="form-control" name="phone" value="${vip.phone}"/>
					    </div>
					    <label for="name" id="name_message" class="col-sm-4 message-label"></label>
				  	</div>
					<div class="form-group">
					    <label for="birth" class="col-sm-2 control-label">生日</label>
					    <div class="col-sm-6">
					      <input type="text" id="birth" class="form-control" name="birth" value="${vip.birth}"/>
					    </div>
					    <label for="name" id="name_message" class="col-sm-4 message-label"></label>
				  	</div>
					<div class="form-group">
					    <label for="email" class="col-sm-2 control-label">E-mail</label>
					    <div class="col-sm-6">
					      <input type="email" id="email" class="form-control" name="email" value="${vip.email}"/>
					    </div>
					    <label for="name" id="name_message" class="col-sm-4 message-label"></label>
				  	</div>
					<div class="form-group">
					    <label for="memo" class="col-sm-2 control-label">备注</label>
					    <div class="col-sm-6">
					      <textarea rows="3"  id="memo" class="form-control" name="memo">${vip.memo}</textarea>
					    </div>
					    <label for="name" id="name_message" class="col-sm-4 message-label"></label>
				  	</div>
					<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					    	<input type="submit" class="btn btn-primary" id="btn_save" value="修改"/>
						   	<input type="reset" class="btn btn-warning" value="重置"/>
						   	<input type="hidden" name="_method" value="PUT"/>
						   	<input type="hidden" name="createTime" value="${vip.createTime}"/>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="<c:url value='/plugins/jquery/jquery-1.10.2.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/vip_form_valid.js'/>" type="text/javascript"></script>
	</body>
</html>
