<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>it's Momo | 首页</title>
<link href="<c:url value='/plugins/bootstrap3.4/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/plugins/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/momocss/pageheader.css'/>" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../common/pageHeader.jsp"%>
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="5000">
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="<c:url value='/images/lm1.jpg'/>" alt="bg-01">
				<div class="carousel-caption">
					<h1>丰盛</h1>
					<p>饭店三层的翠雅咖啡厅环境雅致讲究，凭窗而坐，感受来自屋顶花园的芳香和阳光的沐浴，可全天候为客人提供亚洲风味及西式佳肴。</p>
				</div>
			</div>
			<div class="item">
				<img src="<c:url value='/images/lm2.png'/>" alt="bg-02">
				<div class="carousel-caption">
					<h1>雅致</h1>
					<p>饭店三层的翠雅咖啡厅环境雅致讲究，凭窗而坐，感受来自屋顶花园的芳香和阳光的沐浴，可全天候为客人提供亚洲风味及西式佳肴。</p>
				</div>
			</div>
			<div class="item">
				<img src="<c:url value='/images/lm3.jpg'/>" alt="bg-03">
				<div class="carousel-caption">
					<h1>节日</h1>
					<p>饭店三层的翠雅咖啡厅环境雅致讲究，凭窗而坐，感受来自屋顶花园的芳香和阳光的沐浴，可全天候为客人提供亚洲风味及西式佳肴。</p>
				</div>
			</div>
		</div>

		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<div class="container" id="summary-container">
		<div class="row">
			<div class="col-md-4" id="vip">
				<div class="md-i">
					<i class="fa fa-diamond"></i>
				</div>
				<h2><small>尊贵</small>VIP</h2>
				<p>管理所有VIP会员信息,以及用餐账单记录，可增删改查相关内容。</p>
				<p>
					<a href="<c:url value='/vip/list'/>" class="btn btn-success" role="button">点我查看</a>
				</p>
			</div>
			<div class="col-md-4">
				<div class="md-i">
					<i class="fa fa-cutlery"></i>
				</div>
				<h2>我<small>们</small>的菜</h2>
				<p>翠雅咖啡厅拥有众多优秀员工，竭诚提供优质服务！</p>
				<p>
					<a class="btn btn-default" href="#" role="button">暂未开通</a>
				</p>
			</div>
			<div class="col-md-4">
				<div class="md-i">
					<i class="fa fa-weixin"></i>
				</div>
				<h2>联系<small>开发者</small></h2>
				<p>如有需要，可联系开发者：13683586898  或加 QQ：346495299</p>
				<p>
					<a class="btn btn-default" href="#" role="button">暂未开通</a>
				</p>
			</div>
		</div>
		<hr class="divider">
		<footer>
			<p class="pull-right">
				<a href="#top">返回顶部</a>
			</p>
			<p>
				<a href="#">&copy;2015 MOMO</a>
			</p>
		</footer>
	</div>
	<script src="<c:url value='/plugins/jquery/jquery-1.10.2.min.js'/>"
		type="text/javascript"></script>
	<script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('#vip').hover(function(){
				$('#vip i').addClass("fa-green-color");
			}
			,function(){
				$('#vip i').removeClass("fa-green-color");
			});
		});
	</script>
</body>
</html>