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
		.shadeCusInfo, .shadeEditCus{
			width:100%;
			height:100%;
			position:fixed;
			background:rgb(0,0,0,0.3);
			top:0px;
			left:0px;
			line-height:100%;
			display:none;
		}
		.shadeSCInfo label{
			color:#EE1196;
			font-weight:bold;
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
			<span class="title">所有客户列表</span>
			<ul class="nav nav-tabs">
				<li id="successSC">
  					<a href="${pageContext.request.contextPath}/customer/listAllSuccessCus.do">开发成功客户列表</a>
  				</li>
  				<li id="failSC" class="active">
  					<a href="${pageContext.request.contextPath}/customer/listAllFailCus.do">开发失败客户列表</a>
  				</li>
			</ul>
			<table id="listSC" class="table table-hover text-nowrap">
				<thead>
					<tr>
						<th>ID</th>
						<th>客户名称</th>
						<th>客户地区</th>
						<th>客户地址</th>
						<th>客户网址</th>
						<th>客户等级</th>
						<th>客户信用级别</th>
						<th>状态</th>
						<th>详情</th>
						<th>联系人</th>
						<th style="width:130px;">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listAllFailCus }" var="cus">
						<tr >
							<td>${cus.cusId}</td>
					    	<td>${cus.cusName}</td>
					    	<td>${cus.cusZone}</td>
					    	<td>${cus.cusAddress}</td>
					    	<td>${cus.cusWebsite}</td>
					    	<td>${cus.cusLevel}</td>
					    	<td>${cus.cusStar}</td>
					    	<td style="color:red;">开发失败</td>
					    	<td>
					    		<a class="showSCInfo">
					    			<span class="label label-primary">客户详情</span>
					    		</a>
							</td>
							<td>
					    		<a href="${pageContext.request.contextPath}/contact/detailCusContact.do?cusId=${cus.cusId}">
					    			<span class="label label-primary">查看联系人</span>
					    		</a>
							</td>
					    	<td>
								<a style="text-decoration:none;">
					    			<span class="label label-primary">编辑</span>
					    		</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 分页代码 -->
			<div class="pageNav">
				<ul class="pagination">
					<li><a href="#" style="pointer-events:none;">首页</a></li>
    				<li><a href="#">上一页</a></li>
    				<li><a href="#">1</a></li>
    				<li><a href="#">2</a></li>
    				<li><a href="#">3</a></li>
    				<li><a href="#">4</a></li>
    				<li><a href="#">...</a></li>
    				<li><a href="#">下一页</a></li>
    				<li><a href="#">尾页</a></li>
    				<li><span style="line-height:1.42857143;">共26页</span></li>
				</ul>
				<div class="input-group" style="width:130px;float:right;">
					<input type="text" class="form-control" style="z-index:0">
        			<span class="input-group-addon">跳转至</span>
 				</div>
 			</div>
		</div>
	</div>
	<%@ include file="../bottom.jsp" %>
	<!-- 遮罩层，用于显示指定客户详细信息 -->
	<div class="shadeCusInfo">
		<div class="cusInfo" style="width:800px;min-height:auto;max-height:510px;background:white;;margin:auto;margin-top:100px;">
			<div class="panel panel-primary" style="width:800px;">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">客户详细信息</span>
    				<button id="btnHideShadeCusInfo" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<ul class="list-group" style="width:800px;min-height:auto;max-height:463px;overflow:auto;">
    				<li class="list-group-item"><label>客户ID：</label><span class="cusId"></span></li>
        			<li class="list-group-item"><label>客户名称：</label><span class="cusName"></span></li>
        			<li class="list-group-item"><label>客户地区：</label><span class="cusZone"></span></li>
        			<li class="list-group-item"><label>客户地址：</label><span class="cusAddress"></span></li>
        			<li class="list-group-item"><label>客户网址：</label><span class="cusWebsite"></span></li>
       				<li class="list-group-item"><label>客户等级：</label><span class="cusLevel"></span></li>
       				<li class="list-group-item"><label>客户信用级别：</label><span class="cusStar"></span></li>
       				<li class="list-group-item"><label>状态：</label><span style="color:red;">开发失败</span></li>
   				</ul>
			</div>
		</div>
	</div>
	<!-- 遮罩层，用于编辑客户信息 -->
	<div class="shadeEditCus">
		<div class="cusInfo" style="width: 820px;height: 550px;overflow: auto;margin:auto;margin-top:100px;">
			<div class="panel panel-primary">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">编辑客户信息</span>
    				<button id="btnHideShadeEditCus" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<div style="width:800px;">
    				<form style="width:100%;" id="formEditCus" class="form-horizontal" role="form">
  						<div class="form-group" style="margin-top:10px;">
    						<label for="firstname" class="col-sm-2 control-label">客户ID：</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="cusId" id="editCusId" readonly="readonly">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="firstname" class="col-sm-2 control-label">客户名称</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="cusName" id="editCusName">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="lastname" class="col-sm-2 control-label">客户所属地区</label>
    						<div class="col-sm-10">
    							<select name="cusZone" id="editCusZone">
    								<option value="华北">华北</option>
    								<option value="华东">华东</option>
    								<option value="华南">华南</option>
    								<option value="华西">华西</option>
    								<option value="华中">华中</option>
    							</select>
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="lastname" class="col-sm-2 control-label">客户地址</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="cusAddress" id="editCusAddress">
    						</div>
  						</div>
  						<div class="form-group">	
    						<label for="lastname" class="col-sm-2 control-label">客户网址</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="cusWebsite" id="editCusWebsite">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="lastname" class="col-sm-2 control-label">客户级别</label>
    						<div class="col-sm-10">
    							<select name="cusLevel" id="editCusLevel">
    								<option value="普通客户">普通客户</option>
    								<option value="大客户">大客户</option>
    								<option value="重点开发客户">重点开发客户</option>
    								<option value="VIP客户">VIP客户</option>
    								<option value="合作伙伴">合作伙伴</option>
    								<option value="战略合作伙伴">战略合作伙伴</option>
    							</select>
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="lastname" class="col-sm-2 control-label">客户信誉等级</label>
    						<div class="col-sm-10">
    							<select name="cusStar" id="editCusStar">
    								<option value="1星">1星</option>
    								<option value="2星">2星</option>
    								<option value="3星">3星</option>
    								<option value="4星">4星</option>
    								<option value="5星">5星</option>
    							</select>
    						</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-2 col-sm-10">
      							<button id="btnSubmitEditCus" class="btn btn-primary">提交</button>
    						</div>
 	 					</div>
					</form>
    			</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(".aCusInfo").click(function(){
			var cusId = $(this).parent().parent().children().first().text();
			$.ajax({
				url:"${pageContext.request.contextPath}/customer/adjaxCusById.do?cusId="+cusId,
				dataType:"json",
				success:function(result){
					$(".shadeCusInfo").show();
					$(".cusId").text(cusId);
					$(".cusName").text(result.cusName);
					$(".cusZone").text(result.cusZone);
					$(".cusAddress").text(result.cusAddress);
					$(".cusWebsite").text(result.cusWebsite);
					$(".cusLevel").text(result.cusLevel);
					$(".cusStar").text(result.cusStar);
				}
			});
		});
		//编辑
		$(".aEditCus").click(function(){
			var cusId = $(this).parent().parent().children().first().text();
			$.ajax({
				url:"${pageContext.request.contextPath}/customer/adjaxCusById.do?cusId="+cusId,
				dataType:"json",
				success:function(result){
					$(".shadeEditCus").show();
					$("#editCusId").val(cusId);
					$("#editCusName").val(result.cusName);
					$("#editCusZone").val(result.cusZone);
					$("#editCusAddress").val(result.cusAddress);
					$("#editCusWebsite").val(result.cusWebsite);
					$("#editCusLevel").val(result.cusLevel);
					$("#editCusStar").val(result.cusStar);
				}
			});
		});
		//提交
		$("#btnSubmitEditCus").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/customer/adjaxUpdateCus.do",
				data: $("#formEditCus").serialize(),
				dataType:"json",
				async:false,
				success:function(result){
					alert(result);
					location.reload(); 
				}
			});
		});
		//退出
		$("#btnHideShadeCusInfo").click(function(){
			$(".shadeCusInfo").hide();
		});
		//退出
		$("#btnHideShadeEditCus").click(function(){
			$(".shadeEditCus").hide();
		});
		
	</script>
</body>
</html>