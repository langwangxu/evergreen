<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ include file="../common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改账单</title>
<link href="<c:url value='/plugins/bootstrap3.4/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/plugins/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/plugins/bootstrap-datetimepicker-2.0/css/bootstrap-datetimepicker.css'/>" rel="stylesheet" media="all">
<link href="<c:url value='/css/momocss/pageheader.css'/>" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/pageHeader.jsp"%>
	<div class="container">
		<div class="panel panel-primary panel-mo">
			<div class="panel-heading">
				账单修改页面
			</div>
			<div class="panel-body">
				<form action="${context}/bill/${account.id}/update" onsubmit="return billSubmit()" class="form-horizontal" method="POST"> 
					<div class="form-group">
					    <label for="consumeTime" class="col-sm-3 control-label">用餐日期</label>
						<div class="col-sm-7 input-group date form_date form_date_d" data-date="" data-date-format="yyyy-mm-dd" data-link-field="consumeTime" data-link-format="yyyy-mm-dd">
							<input id="consumeTime_bak" class="form-control" type="text" value="" readonly placeholder="yyyy-mm-dd">
							<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" name="consumeTime" id="consumeTime" value="${account.consumeTime}" /><br/>
				  	</div>
					<div class="form-group">
					    <label for="consumerNum" class="col-sm-3 control-label">用餐人数</label>
					    <div class="col-sm-7 input-group">
					      <input type="text" id="consumerNum" name="consumerNum" class="form-control" value="${account.consumerNum}"/>
					    </div>
				  	</div>
					<div class="form-group">
					    <label for="dinnerType" class="col-sm-3 control-label">用餐类型</label>
					    <div class="col-sm-7 input-group">
						    <select id="dinnerType" class="form-control" name="dinnerType" id="dinnerType">
							  <option value="2">午餐</option>
							  <option value="3">晚餐</option>
							</select>
					    </div>
				  	</div>
					<div class="form-group">
					    <label for="memo" class="col-sm-3 control-label">备注</label>
					    <div class="col-sm-7 input-group">
					      <textarea id="memo" class="form-control" rows="3" name="memo">${account.memo}</textarea>
					    </div>
				  	</div>
					<div class="form-group">
					    <div class="col-sm-offset-3 col-sm-9 input-group">
					    	<input type="submit" class="btn btn-primary" value="修改"/>
						   	<input type="reset" class="btn btn-warning" value="重置"/>
						   	<input type="hidden" name="vipId" value="${account.vip.id}"/>
						   		<input type="hidden" name="createTime" value="${account.createTime}"/>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="<c:url value='/plugins/jquery/jquery-1.10.2.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/plugins/bootstrap3.4/js/bootstrap.min.js'/>" type="text/javascript" ></script>
	<script src="<c:url value='/plugins/bootstrap-datetimepicker-2.0/js/bootstrap-datetimepicker.js'/>" charset="UTF-8"></script>
	<script src="<c:url value='/plugins/bootstrap-datetimepicker-2.0/js/locales/bootstrap-datetimepicker.zh-CN.js'/>" charset="UTF-8"></script>
	<script type="text/javascript">
		var dtpicker_op_d={
			language:  'zh-CN',
			weekStart: 1,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			maxView: 4,
			forceParse: 0,
			pickerPosition: "bottom-left",
			initialDate:'${account.consumeTime}',
			format:'yyyy-mm-dd'
		};
		function timeStamp2String(time,type){  
			var datetime = new Date();  
			datetime.setTime(time);  
			var year = datetime.getFullYear();  
			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;  
			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();  
			var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();  
			var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();  
			var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();  
			var res = year;  
			switch(type){
				case 's':
					res = year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second; 
					break;
				case 'mi':
					res = year + "-" + month + "-" + date+" "+hour+":"+minute
					break;
				case 'h':
					res = year + "-" + month + "-" + date+" "+hour; 
					break;
				case 'd':
					res = year + "-" + month + "-" + date; 
					break;
				case 'm':
					res = year + "-" + month; 
					break;
			}
			return res;
		}
		function billSubmit(){
	         var $csNum = $("#consumerNum");
	         var $csNumV = $csNum.val();
	         var reg = new RegExp("^[0-9]{1,4}$");
	         if($csNumV == null || $csNumV.length ==0){
	            alert("用餐人数不能为空，请填上.");
	            $csNum.focus();
	            return false;
	         }else if(!reg.test($csNumV)){
	            alert("输入适当的数字，请调整.");
	            $csNum.focus();
	            return false;
	         }
	         return true;
	   }
		$(function(){
			$('.form_date_d').datetimepicker(dtpicker_op_d);
			$('div.form_date_d input#consumeTime_bak').val('${account.consumeTime}');
		});
	</script>
</body>
</html>
