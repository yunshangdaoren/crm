<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/base.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/leftNav.css" />
</head>
<body>
<div id="leftNav">
	<div class="modu">
		<div class="modu-head">
			<p>销售机会管理</p>
		</div>
		<div class="modu-content">
			<div class="content-body">
				<a href="${pageContext.request.contextPath}/saleChance/listNotDisSC.do" >未分配销售机会列表</a>
				<c:if test="${loginUser.uRoleid!=3 }">
					<a href="${pageContext.request.contextPath}/saleChance/listDisNotPlanSC.do" >已分配销售机会列表</a>
				</c:if>
				<a href="${pageContext.request.contextPath}/saleChance/toAddSC.do" >添加销售机会</a>
			</div>
		</div>
	</div>
	<div class="modu">
		<div class="modu-head">
			<p>销售计划管理</p>
		</div>
		<div class="modu-content">
			<div class="content-body">
				<c:choose>
					<c:when test="${loginUser.uRoleid==3 }">
						<a href="${pageContext.request.contextPath}/saleChance/listMyNotPlanSC.do" >我的销售机会</a>
						<a href="${pageContext.request.contextPath}/salePlan/listMyDevelopSP.do" >我的销售计划</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/salePlan/listAllDevelopSP.do" >历史销售计划</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="modu">
		<div class="modu-head">
			<p>客户管理</p>
		</div>
		<div class="modu-content">
			<div class="content-body">
				<c:if test="${loginUser.uRoleid==2 }">
					<a href="${pageContext.request.contextPath}/customer/listAllSuccessCus.do">所有客户列表</a>
				</c:if>
				<c:if test="${loginUser.uRoleid==3 }">
					<a href="${pageContext.request.contextPath}/customer/listMySuccessCus.do" >我的客户列表</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="modu">
		<div class="modu-head">
			<p>服务管理</p>
		</div>
		<div class="modu-content">
			<div class="content-body">
				<c:if test="${loginUser.uRoleid==2 }">
					<a href="#" >服务列表</a>
				</c:if>
				<c:if test="${loginUser.uRoleid==3 }">
					<a href="#" >我的服务</a>
					<a href="#" >创建服务</a>
				</c:if>
				<a href="#" >归档服务</a>
			</div>
		</div>
	</div>
	<div class="modu">
		<div class="modu-head">
			<p>系统管理</p>
		</div>
		<div class="modu-content">
			<div class="content-body">
				<a href="#" >系统用户列表</a>
				<a href="#" >创建系统用户</a>
				<a href="#" >系统权限管理</a>
			</div>
		</div>
	</div>		
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/leftNav.js"></script>
</body>
</html>