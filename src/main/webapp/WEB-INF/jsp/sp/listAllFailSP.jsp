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
		.shadeSCInfo{
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
			<span class="title">历史销售计划列表</span>
			<ul class="nav nav-tabs">
  				<li id="planSP"><a href="${pageContext.request.contextPath}/salePlan/listAllDevelopSP.do">正在开发列表</a></li>
  				<li id="failSP" class="active"><a href="${pageContext.request.contextPath}/salePlan/listAllFailSP.do">开发失败列表</a></li>
  				<li id="successSP"><a href="${pageContext.request.contextPath}/salePlan/listAllSuccessSP.do">开发成功列表</a></li>
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
						<th>对应的销售机会</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listAllFailSP }" var="sp">
						<tr >
							<td>${sp.spId}</td>
					    	<td><fmt:formatDate value="${sp.spCreatetime}" type="date"/></td>
					    	<td><fmt:formatDate value="${sp.spBegintime}" type="date"/></td>
					    	<td>${sp.spContent}</td>
					    	<td style="color:red;">开发失败</td>
					    	<td>
					    		<a href="${pageContext.request.contextPath}/salePlan/getSPBySPId.do?spId=${sp.spId}" style="text-decoration:none;">
					    			<span class="label label-primary">查看销售计划</span>
					    		</a>
					    	</td>
					    	<td>
					    		<a style="text-decoration:none;" class="showSCInfo">
					    			<span class="label label-primary">查看销售机会</span>
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
    				<span style="font-size:17px;line-height:41px;">开发失败的销售机会详细信息</span>
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
       				<li class="list-group-item"><label>状态：</label><span style="color:red;">开发失败</span></li>
   				</ul>
			</div>
		</div>
	</div>
	<!-- 遮罩层，用于显示指定销售机会对应的销售计划详细信息 -->
	<div class="shadePlanInfo">
		<div class="planInfo" style="width:800px;height:510px;background:white;;margin:auto;margin-top:100px;">
			<div class="panel panel-primary" style="width:800px;">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">销售计划详细信息</span>
    				<button id="btnHideShadePlanInfo" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<ul class="list-group" style="width:800px;height:460px;overflow:auto;">
    				<li class="list-group-item"><label>销售计划ID：</label><span class="pId"></span></li>
        			<li class="list-group-item"><label>创建日期：</label><span class="pCreatetime"></span></li>
        			<li class="list-group-item"><label>执行日期：</label><span class="pBegintime"></span></li>
        			<li class="list-group-item"><label>计划内容：</label><span class="pContent"></span></li>
   				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
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
		$(".showPlanInfo").click(function(){
			var scId = $(this).parent().parent().children().first().text();
			$.ajax({
				url:"${pageContext.request.contextPath}/saleChancePlan/ajaxGetPlanBySCId.do?scId="+scId,
				success:function(result){
					$(".shadePlanInfo").show();
					result = JSON.parse(result);
					$(".pId").text(result.pId);
					$(".pCreatetime").text(result.pCreatetime);
					$(".pBegintime").text(result.pBegintime);
					$(".pContent").text(result.pContent);
				}
			});
		});
		$("#btnHideShadeSCInfo").click(function(){
			$(".shadeSCInfo").hide();
		});
		$("#btnHideShadePlanInfo").click(function(){
			$(".shadePlanInfo").hide();
		});
	</script>
</body>
</html>