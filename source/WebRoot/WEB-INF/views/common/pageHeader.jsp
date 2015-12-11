<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    String context = request.getContextPath();
    request.setAttribute("context",context);
%>
	 <!--导航栏 start-->
    <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only>Toggle navigation</span>
					<span class="icon-bar"> </span>
					<span class="icon-bar"> </span>
					<span class="icon-bar"> </span>
				</button>
				<a href="<c:url value='/'/>" class="navbar-brand">
					<img src="<c:url value="/images/logo.jpg"/>"></img>
				</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value='/'/>">首页</a></li>
					<li><a href="<c:url value='/vip/list'/>">VIP展示列表</a></li>
					<li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">小墨墨的照片墙</h4>
                </div>
                <div class="modal-body modal-mo">
                   	<div class="row">
                   		<div class="col-md-6">
                   			<img src="<c:url value='/images/m1.jpg'/>" alt="小墨墨照片1">
                   		</div>
                   		<div class="col-md-6">
                   			<img src="<c:url value='/images/m2.jpg'/>" alt="小墨墨照片2">
                   		</div>
                   		<div class="col-md-6">
                   			<img src="<c:url value='/images/m3.jpg'/>" alt="小墨墨照片3">
                   		</div>
                   		<div class="col-md-6">
                   			<img src="<c:url value='/images/m4.jpg'/>" alt="小墨墨照片4">
                   		</div>
                   	</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
                </div>
            </div>
        </div>
    </div>