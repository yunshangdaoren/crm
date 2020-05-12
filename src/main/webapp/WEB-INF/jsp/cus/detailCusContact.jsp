<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<style type="text/css">
		#listSC{
			width:1210px;
			border-top:3px solid #11C2EE;
			overflow: hidden;
			margin-top:15px;
			table-layout: fixed;
		}
		.shadeAddCon, .shadeEditCon{
			width:100%;
			height:100%;
			position:fixed;
			background:rgb(0,0,0,0.3);
			top:0px;
			left:0px;
			line-height:100%;
			display:none;
		}
		th{
			font-size:14px;
		}
		td{
			font-size:12px;
		}
		td a{
			color:blue;
			font-weight:500;
			cursor:pointer;
		}
		th,td{
			word-break:keep-all;/* 不换行 */
    		white-space:nowrap;/* 不换行 */
    		overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
    		text-overflow:ellipsis;
		}
		tr{
			width:100%;
			padding-top:10px;
		}
		.title{
			color:#FF0000;
		}
	</style>
</head>
<body>
	<%@ include file="../top.jsp" %>
	<div id="center">
		<%@ include file="../leftNav.jsp" %>
		<div id="right">
			<span class="title">客户联系人详情</span>
			<p style="background:#11C2EE;height:3px;margin-top:15px;"></p>
			<button id="btnBack" style="width:90px;margin-bottom:12px;" type="button" class="btn btn-danger">返回</button>
			<button id="btnAddCon" style="width:120px;margin-bottom:12px;" type="button" class="btn btn-danger">添加联系人</button>
			<p style="font-size:19px;color:red;background:black;">客户详情</p>
			<ul class="list-group" style="width:100%;height:auto;overflow:auto;">
    			<li class="list-group-item">
    				<label>客户ID：</label>
    				<span class="cusId">${customer.cusId }</span>
    			</li>
    			<li class="list-group-item">
    				<label>状态：</label>
    				<c:choose>
    					<c:when test="${status==3}"><span style="color:orange;">开发失败</span></c:when>
    					<c:when test="${status==4}"><span style="color:red;">开发成功</span></c:when>
    				</c:choose>
    			</li>
        		<li class="list-group-item">
        			<label>客户名称：</label>
        			<span class="cusName">${customer.cusName }</span>
        		</li>
        		<li class="list-group-item">
        			<label>客户地区：</label>
        			<span class="cusZone">${customer.cusZone }</span>
        		</li>
        		<li class="list-group-item">
        			<label>客户地址：</label>
        			<span class="cusAddress">${customer.cusAddress }</span>
        		</li>
        		<li class="list-group-item">
        			<label>客户网址：</label>
        			<span class="cusWebsite">${customer.cusWebsite }</span>
        		</li>
        		<li class="list-group-item">
        			<label>客户等级：</label>
        			<span class="cusLevel">${customer.cusLevel }</span>
        		</li>
        		<li class="list-group-item">
        			<label>客户信用等级：</label>
        			<span class="cusStar">${customer.cusStar }</span>
        		</li>
   			</ul>
			<p style="font-size:19px;color:red;background:black;">客户联系人列表</p>
			<c:forEach items="${contactList }" var="con">
				<ul class="list-group" style="width:100%;height:auto;overflow:auto;">
					<li class="list-group-item" style="display:none;">
						<span>${con.conId}</span>
					</li>
					<li class="list-group-item" style="line-height:auto;">
						<label>联系人姓名：</label>
						<span class="speCreatetime">${con.conName }</span>
						
						<button style="float:right;" type="button" class="btn btn-success btnEditCon">编辑</button>
					</li>
					<li class="list-group-item">
						<label>联系人电话：</label>
						<span class="speCreatetime">${con.conPhone }</span>
					</li>
					<li class="list-group-item">
						<label>联系人职位：</label>
						<span class="speCreatetime">${con.conJob }</span>
					</li>
					<li class="list-group-item">
						<label>联系人描述：</label>
						<span class="speCreatetime">${con.conDesc }</span>
					</li>
        			<li class="list-group-item">
        				<label>联系人创建时间：</label>
        				<span class="speExetime"><fmt:formatDate value="${con.conCreatetime }" type="date"/></span>
        			</li>
   				</ul>
			</c:forEach>
		</div>
		<!-- <div class="clear" style="clear:both;"></div> -->
	</div>
	<%@ include file="../bottom.jsp" %>
	<!-- 遮罩层，用于添加联系人信息 -->
	<div class="shadeAddCon">
		<div class="exeSP" style="width:800px;height:auto;max-height:510px;background:white;;margin:auto;margin-top:100px;">
			<div class="panel panel-primary" style="width:800px;">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">添加联系人</span>
    				<button id="btnHideShadeAddCon" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<div style="width:780px;">
    				<form style="width:100%;" id="formAddCon" class="form-horizontal" role="form">
    					<div class="form-group" style="margin-top:10px;">
    						<label for="firstname" class="col-sm-2 control-label">客户ID：</label>
    						<div class="col-sm-10">
      							<input type="text" id="cusId" value="${customer.cusId }" class="form-control" name="cusId" readonly="readonly">
    						</div>
  						</div>
    					<div class="form-group" style="margin-top:10px;">
    						<label for="firstname" class="col-sm-2 control-label">联系人姓名：</label>
    						<div class="col-sm-10">
      							<input type="text" id="conName" class="form-control" name="conName">
    						</div>
  						</div>
  						<div class="form-group" style="margin-top:10px;">
    						<label for="firstname" class="col-sm-2 control-label">联系人电话：</label>
    						<div class="col-sm-10">
      							<input type="text" id="conPhone" class="form-control" name="conPhone">
    						</div>
  						</div>
  						<div class="form-group" style="margin-top:10px;">
    						<label for="firstname" class="col-sm-2 control-label">联系人职位：</label>
    						<div class="col-sm-10">
      							<input type="text" id="conJob" class="form-control" name="conJob">
    						</div>
  						</div>
  						<div class="form-group" style="margin-top:10px;">
    						<label for="firstname" class="col-sm-2 control-label">联系人描述：</label>
    						<div class="col-sm-10">
      							<input type="text" id="conDesc" class="form-control" name="conDesc">
    						</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-2 col-sm-10">
      							<button id="btnSubmitAddCon" type="button" class="btn btn-primary">提交</button>
    						</div>
 	 					</div>
  					</form>
  				</div>
			</div>
		</div>
	</div>
	<!-- 遮罩层，用于编辑联系人信息 -->
	<div class="shadeEditCon">
		<div class="cusInfo" style="width: 820px;height: 550px;overflow: auto;margin:auto;margin-top:100px;">
			<div class="panel panel-primary">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">编辑联系人信息</span>
    				<button id="btnHideShadeEditCon" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<div style="width:800px;">
    				<form style="width:100%;padding-top:12px;" id="formEditCon" class="form-horizontal" role="form">
      					<input type="text" style="display:none;" class="form-control" name="conId" id="editConId" value="${con.conId }">
      					<input type="text" style="display:none;" class="form-control" name="cusId" value="${customer.cusId }">
      					<div class="form-group">
    						<label for="firstname" class="col-sm-2 control-label">联系人姓名</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="conName" id="editConName">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="firstname" class="col-sm-2 control-label">联系人电话</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="conPhone" id="editConPhone">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="firstname" class="col-sm-2 control-label">联系人职位</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="conJob" id="editConJob">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="firstname" class="col-sm-2 control-label">联系人描述</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="conDesc" id="editConDesc">
    						</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-2 col-sm-10">
      							<button id="btnSubmitEditCon" class="btn btn-primary">提交</button>
    						</div>
 	 					</div>
					</form>
    			</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//返回
		$("#btnBack").click(function(){
			window.history.back();
		});
		//添加联系人
		$("#btnAddCon").click(function(){
			$(".shadeAddCon").show();
		});
		//提交添加联系人
		$("#btnSubmitAddCon").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/contact/adjaxAddCon.do",
				data: $("#formAddCon").serialize(),
				dataType:"json",
				async:false,
				success:function(result){
					result = JSON.parse(result);
					alert(result.message);
					window.location.reload();
				}
			});
		});
		//编辑
		$(".btnEditCon").click(function(){
			var conId = $(this).parent().parent().children().first().children().first().text();
			$.ajax({
				url:"${pageContext.request.contextPath}/contact/adjaxContactById.do?conId="+conId,
				dataType:"json",
				success:function(result){
					$(".shadeEditCon").show();
					$("#editConId").val(conId);
					$("#editConName").val(result.conName);
					$("#editConPhone").val(result.conPhone);
					$("#editConJob").val(result.conJob);
					$("#editConDesc").val(result.conDesc);
				}
			});
		});
		//提交编辑
		$("#btnSubmitEditCon").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/contact/adjaxUpdateCon.do",
				data: $("#formEditCon").serialize(),
				dataType:"json",
				async:false,
				success:function(result){
					result = JSON.parse(result);
					alert(result.message);
					location.reload(); 
				}
			});
		});
		 
		//退出
		$("#btnHideShadeEditCon").click(function(){
			$(".shadeEditCon").hide();
		});
	</script>
</body>
</html>