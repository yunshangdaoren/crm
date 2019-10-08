<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/base.css" />
	<style type="text/css">
			#leftNav{
	width:170px;
	height:100%;
	background:black;
	float:left;
}
.modu-head{
	width: 170px;
	height: 60px;
	text-align: center;
	background: #444;
	cursor: pointer;
	border-bottom:1px solid black;
}
.modu-head:hover{
	background: #666;
}
.modu-head h4{
	color: white;
	font-size: 20px;
	line-height:60px;
	cursor: pointer;
}
.modu-content{
	width: 100%;
	display: none;
}

		</style>
</head>
<body style="margin:0px;padding:0px;">
	<div id="leftNav">
	<div class="modu">
		<div class="modu-head">
			<p>营销管理</p>
		</div>
		<div class="modu-content">
			<div class="content-body">
				<a href="${pageContext.request.contextPath}/saleChance/listNotDistributeSC.do" >未分配销售机会列表</a>
				<a href="${pageContext.request.contextPath}/saleChance/listDistributeSC.do" >已分配销售机会列表</a>
				<a href="#" >我的销售计划</a>
				<a href="${pageContext.request.contextPath}/saleChance/toAddSC.do" >添加销售计划</a>
			</div>
		</div>
	</div>
	<div class="modu">
		<div class="modu-head">
			<p>客户管理</p>
		</div>
		<div class="modu-content">
			<div class="content-body">
				<a href="#" >客户列表</a>
				<a href="#" >客户添加</a>
			</div>
		</div>
	</div>	
</div>
<script type="text/javascript">
		$(".modu-head").click(function(){
			$(this).next().toggle(420);
		});
		</script>
</body>
</html>