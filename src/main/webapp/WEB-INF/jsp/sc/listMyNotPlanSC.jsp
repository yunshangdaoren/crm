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
		.shadeSCInfo, .shadeSPInfo{
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
			<span class="title">我的销售机会列表</span>
			<ul class="nav nav-tabs">
  				<li id="noPlanSC" class="active">
  					<a href="${pageContext.request.contextPath}/saleChance/listMyNotPlanSC.do">未开发列表</a>
  				</li>
  				<li id="planSC">
  					<a href="${pageContext.request.contextPath}/saleChance/listMyPlanSC.do">正在开发列表</a>
  				</li>
  				<li id="failSC">
  					<a href="${pageContext.request.contextPath}/saleChance/listMyFailSC.do">开发失败列表</a>
  				</li>
  				<li id="successSC">
  					<a href="${pageContext.request.contextPath}/saleChance/listMySuccessSC.do">开发成功列表</a>
  				</li>
			</ul>
			<table id="listSC" class="table table-hover text-nowrap">
				<thead>
					<tr>
						<th>ID</th>
						<th>客户名称</th>
						<th>机会来源</th>
						<th>联系人</th>
						<th>联系电话</th>
						<th>成功概率</th>
						<th>机会描述</th>
						<th>创建人</th>
						<th>创建时间</th>
						<th>指派给</th>
						<th>指派时间</th>
						<th>状态</th>
						<th>详情</th>
						<th style="width:130px;">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listMyDisSC }" var="sc">
						<tr >
							<td>${sc.scId}</td>
					    	<td>${sc.scCusname}</td>
					    	<td>${sc.scComming}</td>
					    	<td>${sc.scConname}</td>
					    	<td>${sc.scConphone}</td>
					    	<td>${sc.scSuccess}</td>
					    	<td>${sc.scDesc}</td>
					    	<td>${sc.scCreateuname}</td>
					    	<td><fmt:formatDate value="${sc.scCreatetime}" type="date"/></td>
					    	<td>${sc.scGiveuname}</td>
					    	<td><fmt:formatDate value="${sc.scGivetime}" type="date"/></td>
					    	<td style="color:#CF11FF;">未开发</td>
					    	<td>
					    		<a class="showSCInfo">
					    			<span class="label label-primary">机会详情</span>
					    		</a>
							</td>
					    	<td>
								<a class="showMakeSP" style="text-decoration:none;">
									<span class="label label-danger">制定计划</span>
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
    				<span style="font-size:17px;line-height:41px;">未开发销售机会详细信息</span>
    				<button id="btnHideShadeSCInfo" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<ul class="list-group" style="width:800px;height:460px;overflow:auto;">
    				<li class="list-group-item"><label>销售计划ID：</label><span class="scId"></span></li>
        			<li class="list-group-item"><label>客户名称：</label><span class="scCusName"></span></li>
        			<li class="list-group-item"><label>机会来源：</label><span class="scComming"></span></li>
        			<li class="list-group-item"><label>联系人：</label><span class="scConname"></span></li>
        			<li class="list-group-item"><label>联系电话：</label><span class="scConphone"></span></li>
       				<li class="list-group-item"><label>成功概率：</label><span class="scSuccess"></span></li>
       				<li class="list-group-item"><label>描述：</label><span class="scDesc"></span></li>
       				<li class="list-group-item"><label>创建人：</label><span class="scCreateUName"></span></li>
       				<li class="list-group-item"><label>创建时间：</label><span class="scCreateTime"></span></li>
       				<li class="list-group-item"><label>分配给：</label><span class="scGiveuname"></span></li>
       				<li class="list-group-item"><label>分配时间：</label><span class="scGivetime"></span></li>
       				<li class="list-group-item"><label>状态：</label><span style="color:#CF11FF;">未开发</span></li>
   				</ul>
			</div>
		</div>
	</div>
	<!-- 遮罩层，用于编辑销售计划 -->
	<div class="shadeSPInfo">
		<div class="spInfo" style="width: 820px;height: 550px;overflow: auto;margin:auto;margin-top:100px;">
			<div class="panel panel-primary">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">制定销售计划</span>
    				<button id="btnHideShadeSPInfo" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<div style="width:800px;">
    				<form style="width:100%;" id="formSP" class="form-horizontal" role="form">
    					<div class="form-group">
    						<label for="firstname" class="col-sm-2 control-label">销售机会ID：</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="spScid" id="spScid" readonly="readonly">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="firstname" class="col-sm-2 control-label">执行日期</label>
    						<div class="col-sm-10">
      							<input type="date" class="form-control" name="spBegintime" id="spBegintime">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="lastname" class="col-sm-2 control-label">计划内容</label>
    						<div class="col-sm-10">
      							<textarea class="form-control" name="spContent" id="spContent" rows="9"></textarea>
    						</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-2 col-sm-10">
      							<button id="btnSubmitSP" class="btn btn-primary">提交</button>
    						</div>
 	 					</div>
					</form>
    			</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var scObj;
		/* 查看指定销售机会详细信息 发送ajax请求 */
		$(".showSCInfo").click(function(){
			$(".shadeSCInfo").show();
			var scId = $(this).parent().parent().children().first().text();
			$.ajax({
				url:"${pageContext.request.contextPath}/saleChance/ajaxSC.do?scId="+scId,
				success:function(result){
					result = JSON.parse(result);
					if(result==null){
						alert("查询错误，请稍后重试！")
					}else{
						$(".scId").text(result.scId);
						$(".scCusName").text(result.scCusname);
						$(".scComming").text(result.scComming);
						$(".scConname").text(result.scConname);
						$(".scConphone").text(result.scConphone);
						$(".scSuccess").text(result.scSuccess);
						$(".scDesc").text(result.scDesc);
						$(".scCreateUName").text(result.scCreateuname);
						$(".scCreateTime").text(result.scCreatetime);
						$(".scGiveuname").text(result.scGiveuname);
						$(".scGivetime").text(result.scGivetime);
					}
				}
			});
		});
		/* 退出按钮点击事件 */
		$("#btnHideShadeSCInfo").click(function(){
			$(".shadeSCInfo").hide();
		});
		/* 显示制定销售计划遮罩层 */
		$(".showMakeSP").click(function(){
			scObj = $(this);
			var scId = $(this).parent().parent().children().first().text();
			$("#spScid").val(scId);
			$(".shadeSPInfo").show();
		});
		/* 提交制定的销售计划 */
		$("#btnSubmitSP").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/salePlan/addSP.do",
				data:$("#formSP").serialize(),
				dataType:"json",
				method:"get",
				async: false,
				success:function(result){
					result = JSON.parse(result);
					if(result.status==0){
						alert(result.message);
					}else{
						alert(result.message);
						scObj.parent.parent.remove();
					}
				 	$(".shadeSPInfo").hide(); 
					location.reload(); 
				}
			});
		});
		/* 退出按钮点击事件 */
		$("#btnHideShadeSPInfo").click(function(){
			$(".shadeSPInfo").hide();
		});
	</script>
</body>
</html>