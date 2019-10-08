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
		.shadeSCInfo, .shadeExeSP{
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
		a{
			color:blue;
			font-weight:500;
			cursor:pointer;
			text-decoration:none;
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
			<span class="title">我的销售计划列表</span>
			<ul class="nav nav-tabs">
  				<li id="planSC" class="active"><a href="${pageContext.request.contextPath}/salePlan/listMyDevelopSP.do">正在开发列表</a></li>
  				<li id="failSC"><a href="${pageContext.request.contextPath}/salePlan/listMyFailSP.do">开发失败列表</a></li>
  				<li id="successSC"><a href="${pageContext.request.contextPath}/salePlan/listMySuccessSP.do">开发成功列表</a></li>
			</ul>
			<table id="listSC" class="table table-hover text-nowrap">
				<thead>
					<tr>
						<th>销售计划ID</th>
						<th>创建日期</th>
						<th>执行日期</th>
						<th>计划内容</th>
						<th>状态</th>
						<th>销售计划</th>
						<th style="width:130px;">操作</th>
						<th>对应的销售机会</th>
						<th>开发成功</th>
						<th>开发失败</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listMyDevelopSP }" var="sp">
						<tr >
							<td>${sp.spId}</td>
					    	<td><fmt:formatDate value="${sp.spCreatetime}" type="date"/></td>
					    	<td><fmt:formatDate value="${sp.spBegintime}" type="date"/></td>
					    	<td>${sp.spContent}</td>
					    	<td style="color:orange;">开发中</td>
					    	<td>
					    		<a href="${pageContext.request.contextPath}/salePlan/getSPBySPId.do?spId=${sp.spId}" style="text-decoration:none;">
					    			<span class="label label-primary">销售计划详情</span>
					    		</a>
					    	</td>
					    	<td>
					    		<a style="text-decoration:none;" class="showExeSP" >
					    			<span class="label label-warning">执行计划</span>
					    		</a>
					    	</td>
					    	<td>
					    		<a style="text-decoration:none;" class="showSCInfo">
					    			<span class="label label-primary">销售机会详情</span>
					    		</a>
					    	</td>
							<td>
								<a style="text-decoration:none;" class="makeSPFail">
									<span class="label label-danger">置为开发失败</span>
								</a>
							</td>
							<td>
								<a id="" style="text-decoration:none;" class="makeSPSuccess">
									<span class="label label-success">置为开发成功</span>
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
	<!-- 遮罩层，用于显示指定销售机会详细信息 -->
	<div class="shadeSCInfo">
		<div class="scInfo" style="width:800px;height:510px;background:white;;margin:auto;margin-top:100px;">
			<div class="panel panel-primary" style="width:800px;">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">销售机会详细信息</span>
    				<button id="btnHideShadeSCInfo" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<ul class="list-group" style="width:800px;height:460px;overflow:auto;">
    				<li class="list-group-item"><label>销售机会ID：</label><span class="scId"></span></li>
        			<li class="list-group-item"><label>客户名称：</label><span class="scCusname"></span></li>
        			<li class="list-group-item"><label>机会来源：</label><span class="scComming"></span></li>
        			<li class="list-group-item"><label>联系人：</label><span class="scConname"></span></li>
        			<li class="list-group-item"><label>联系电话：</label><span class="scConphone"></span></li>
       				<li class="list-group-item"><label>成功概率：</label><span class="scSuccess"></span></li>
       				<li class="list-group-item"><label>描述：</label><span class="scDesc"></span></li>
       				<li class="list-group-item"><label>创建人：</label><span class="scCreateuname"></span></li>
       				<li class="list-group-item"><label>创建时间：</label><span class="scCreatetime"></span></li>
       				<li class="list-group-item"><label>分配给：</label><span class="scGiveuname"></span></li>
       				<li class="list-group-item"><label>分配时间：</label><span class="scGivetime"></span></li>
       				<li class="list-group-item"><label>状态：</label><span style="color:orange;">开发中</span></li>
   				</ul>
			</div>
		</div>
	</div>
	<!-- 遮罩层，用于显示执行销售计划信息 -->
	<div class="shadeExeSP">
		<div class="exeSP" style="width:800px;height:auto;max-height:510px;background:white;;margin:auto;margin-top:100px;">
			<div class="panel panel-primary" style="width:800px;">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">执行销售计划</span>
    				<button id="btnHideShadeExeSP" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<div style="width:780px;">
    				<form style="width:100%;" id="formEditSPE" class="form-horizontal" role="form">
    					<div class="form-group" style="margin-top:10px;">
    						<label for="firstname" class="col-sm-2 control-label">销售计划ID：</label>
    						<div class="col-sm-10">
      							<input type="text" id="spePid" class="form-control" name="spePid" readonly="readonly">
    						</div>
  						</div>
  						<div class="form-group" style="margin-top:10px;">
    						<label for="firstname" class="col-sm-2 control-label">执行日期：</label>
    						<div class="col-sm-10">
      							<input type="date" class="form-control" name="speExetime">
    						</div>
  						</div>
  						<div class="form-group" style="margin-top:10px;">
    						<label for="firstname" class="col-sm-2 control-label">执行情况：</label>
    						<div class="col-sm-10">
      							<textarea class="form-control" name="speExecase" rows="13"></textarea>
    						</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-2 col-sm-10">
      							<button id="btnSubmitExeSP" class="btn btn-primary">提交</button>
    						</div>
 	 					</div>
  					</form>
  				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/* 显示销售计划对应的销售机会信息 */
		$(".showSCInfo").click(function(){
			var scId = $(this).parent().parent().children().first().text();
			$.ajax({
				url:"${pageContext.request.contextPath}/saleChance/ajaxSC.do?scId="+scId,
				success:function(result){
					$(".shadeSCInfo").show();
					result = JSON.parse(result);
					$(".scId").text(scId);
					$(".scCusname").text(result.scCusname);
					$(".scComming").text(result.scComming);
					$(".scConname").text(result.scConname);
					$(".scConphone").text(result.scConphone);
					$(".scSuccess").text(result.scSuccess);
					$(".scDesc").text(result.scDesc);
					$(".scCreateuname").text(result.scCreateuname);
					$(".scCreatetime").text(result.scCreatetime);
					$(".scGiveuname").text(result.scGiveuname);
					$(".scGivetime").text(result.scGivetime);
				}
			});
		});
		/* 显示添加计划执行的页面 */
		$(".showExeSP").click(function(){
			$(".shadeExeSP").show();
			var spePid = $(this).parent().parent().children().first().text();
			$("#spePid").val(spePid);
		});
		/* 提交执行的开发计划 */
		$("#btnSubmitExeSP").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/salePlanExe/ajaxAddSPExe.do",
				data: $("#formEditSPE").serialize(),
				dataType:"json",
				async:false,
				success:function(result){
					result = JSON.parse(result);
					alert(result.message);
					location.reload(); 
				}
			});
		});
		$("#btnHideShadeSCInfo").click(function(){
			$(".shadeSCInfo").hide();
		});
		$("#btnHideShadeExeSP").click(function(){
			$(".shadeExeSP").hide();
		});
		/* 将销售计划置为开发失败 */
		$(".makeSPFail").click(function(){
			var spId = $(this).parent().parent().children().first().text();
			$.ajax({
				url:"${pageContext.request.contextPath}/salePlan/adjaxFailSP.do?spId="+spId,
				async:false,
				dataType:"json",
				success:function(result){
					result = JSON.parse(result);
					alert(result.message);
					location.reload(); 
				}
			}); 
		});
		/* 将销售计划置为开发成功 */
		$(".makeSPSuccess").click(function(){
			var spId = $(this).parent().parent().children().first().text();
			$.ajax({
				url:"${pageContext.request.contextPath}/salePlan/ajaxSuccessSP.do?spId="+spId,
				async:false,
				dataType:"json",
				success:function(result){
					result = JSON.parse(result);
					alert(result.message);
					location.reload(); 
				}
			}); 
		});
	</script>
</body>
</html>