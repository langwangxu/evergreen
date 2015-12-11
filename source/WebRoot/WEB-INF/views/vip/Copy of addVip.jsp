<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ include file="../common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加VIP会员</title>
<link href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/plugins/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/momocss/pageheader.css'/>" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.panel-mo{
			margin-bottom:2px;
			margin-top:2px;
		}
	</style>
</head>
<body>
	<%@ include file="../common/pageHeader.jsp"%>
	<div class="container">
		<div class="panel panel-primary panel-mo">
			<div class="panel-heading">
				VIP会员添加页面
			</div>
			<div class="panel-body">
				<form action="${context}/vip/save" onSubmit="return vipValid()" class="form-horizontal" method="POST"> 
					<div class="form-group">
					    <label for="name" class="col-sm-2 control-label">会员姓名</label>
					    <div class="col-sm-8">
					      <input type="text" id="name" name="name" class="form-control" placeholder="【必填项】"/>
					    </div>
				  	</div>
					<div class="form-group">
					    <label for="card" class="col-sm-2 control-label">卡号</label>
					    <div class="col-sm-8">
					      <input type="text" id="card" name="card" class="form-control" placeholder="【必填项】目前已使用的最大卡号为：${maxcard}"/>
					    </div>
				  	</div>
					<div class="form-group">
					    <label for="phone" class="col-sm-2 control-label">手机号</label>
					    <div class="col-sm-8">
					      <input type="text" id="phone" class="form-control" name="phone" placeholder="【必填项】"/>
					    </div>
				  	</div>
					<div class="form-group">
					    <label for="birth" class="col-sm-2 control-label">生日</label>
					    <div class="col-sm-8">
					      <input type="text" id="birth" class="form-control" name="birth" placeholder="【选填项】格式：yyyy-MM-dd"/>
					    </div>
				  	</div>
					<div class="form-group">
					    <label for="email" class="col-sm-2 control-label">E-mail</label>
					    <div class="col-sm-8">
					      <input type="email" id="email" class="form-control" name="email" placeholder="【选填项】"/>
					    </div>
				  	</div>
					<div class="form-group">
					    <label for="memo" class="col-sm-2 control-label">备注</label>
					    <div class="col-sm-8">
					      <textarea  id="memo" class="form-control" rows="3" name="memo"></textarea>
					    </div>
				  	</div>
					<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					    	<input type="submit" class="btn btn-primary" value="保存"/>
						   	<input type="reset" class="btn btn-warning" value="重置"/>
						   	<input type="hidden" name="_method" value="PUT"/>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="<c:url value='/plugins/jquery/jquery-1.10.2.min.js'/>" type="text/javascript"></script>
	<script>
	   function vipValid(){
	   		//name
	         var vipName = $("#name");
	         if(vipName.val() == null || vipName.val().length == 0){
	            alert("vip会员姓名不能为空，请填上.");
	            vipName.focus();
	            return false;
	         }else if(vipName.val().length > 50){
	            alert("景区名称最大长度不能超过50个字符，请调整.");
	            vipName.focus();
	            return false;
	         }
	        //card
	         var vipCard = $("#card");
	         if(vipCard.val() == null || vipCard.val().length == 0){
	            alert("卡号不能为空，请填上.");
	            vipCard.focus();
	            return false;
	         }else if(vipCard.val().length > 4){
	            alert("卡号最大长度不能超过4个字符，请调整.");
	            vipCard.focus();
	            return false;
	         }
	         //电话 
	         var vipPhone = $("#phone");
	         if(vipPhone.val() == null || vipPhone.val().length == 0){
	            alert("手机号不能为空，请填上.");
	            vipPhone.focus();
	            return false;
	         }else if(vipPhone.val().length > 11){
	            alert("手机号最大长度不能超过11个字符，请调整.");
	            vipPhone.focus();
	            return false;
	         }    
	         return true;
	   }
		$(function(){
			$()
		});
	</script>
</body>
</html>
