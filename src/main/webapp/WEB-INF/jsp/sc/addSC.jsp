<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<style type="text/css">
		.title{
			color:#FF0000;
		}
		form{
			width:500px;
		}
		.line{
			border:2px solid #11C2EE;
			margin-bottom:20px;
		}
	</style>
</head>
<body>
	<%@ include file="../top.jsp" %>
	<div id="center">
		<%@ include file="../leftNav.jsp" %>
		<div id="right">
			<h3 class="title">添加销售机会</h3>
			<div class="line"></div>
			<form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/saleChance/addSC.do">
  				<div class="form-group">
    				<label for="firstname" class="col-sm-2 control-label">客户名称</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" name="scCusname" id="scCusname" placeholder="请输入客户名称">
    				</div>
  				</div>
  				<div class="form-group">
    				<label for="lastname" class="col-sm-2 control-label">机会来源</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" name="scComming" id="lastname" placeholder="请输入机会来源">
    				</div>
  				</div>
  				<div class="form-group">
    				<label for="lastname" class="col-sm-2 control-label">联系人</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" name="scConname" id="lastname" placeholder="请输入联系人">
    				</div>
  				</div>
  				<div class="form-group">
    				<label for="lastname" class="col-sm-2 control-label">联系电话</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" name="scConphone" id="lastname" placeholder="请输入联系电话">
    				</div>
  				</div>
  				<div class="form-group">
    				<label for="lastname" class="col-sm-2 control-label">成功概率</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" name="scSuccess" id="lastname" placeholder="请输入成功概率">
    				</div>
  				</div>
  				<div class="form-group">
    				<label for="lastname" class="col-sm-2 control-label">机会描述</label>
    				<div class="col-sm-10">
      					<textarea class="form-control" name="scDesc" rows="3"></textarea>
    				</div>
  				</div>
  				<div class="form-group">
    				<div class="col-sm-offset-2 col-sm-10">
      					<input type="submit" class="btn btn-default" value="添加"/>
      					<span style="color:red;font-size:19px;margin-left:50px;padding:0px;">${msg_insertFail }</span>
    				</div>
 	 			</div>
			</form>
		</div>
	</div>
	<%@ include file="../bottom.jsp" %>
</body>
</html>