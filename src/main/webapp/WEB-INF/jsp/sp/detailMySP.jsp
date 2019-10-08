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
		.shadeExeSP{
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
			<span class="title">销售计划详情</span>
			<p style="background:#11C2EE;height:3px;margin-top:15px;"></p>
			<button id="btnBack" style="width:90px;margin-bottom:12px;" type="button" class="btn btn-danger">返回</button>
			<c:if test="${loginUser.uRoleid ==3 }">
				<c:if test="${salePlan.spStatus==0}">
					<button id="btnExeSPE" style="width:120px;margin-bottom:12px;" type="button" class="btn btn-danger">执行销售计划</button>
				</c:if>
			</c:if>
			<p style="font-size:19px;color:red;background:black;">销售计划详情</p>
			<ul class="list-group" style="width:100%;height:auto;overflow:auto;">
    			<li class="list-group-item">
    				<label>销售计划ID：</label>
    				<span class="spId">${salePlan.spId }</span>
    			</li>
    			<li class="list-group-item">
    				<label>状态：</label>
    				<c:choose>
    					<c:when test="${salePlan.spStatus==1}"><span style="color:orange;">开发中</span></c:when>
    					<c:when test="${salePlan.spStatus==2}"><span style="color:red;">开发失败</span></c:when>
    					<c:otherwise><span style="color:green;">开发成功</span></c:otherwise>
    				</c:choose>
    			</li>
        		<li class="list-group-item">
        			<label>创建日期：</label>
        			<span class="spCreatetime"><fmt:formatDate value="${salePlan.spCreatetime }" type="date"/></span>
        		</li>
        		<li class="list-group-item">
        			<label>执行日期：</label>
        			<span class="spBegintime"><fmt:formatDate value="${salePlan.spBegintime }" type="date"/></span>
        		</li>
        		<li class="list-group-item">
        			<label>计划内容：</label>
        			<span class="spContent">${salePlan.spContent }</span>
        		</li>
   			</ul>
			<p style="font-size:19px;color:red;background:black;">销售计划执行记录</p>
			<c:forEach items="${salePlanExeList }" var="spe">
				<ul class="list-group" style="width:100%;height:auto;overflow:auto;">
					<li class="list-group-item">
						<label>创建日期：</label>
						<span class="speCreatetime"><fmt:formatDate value="${spe.speCreatetime }" type="date"/></span>
					</li>
        			<li class="list-group-item">
        				<label>执行日期：</label>
        				<span class="speExetime"><fmt:formatDate value="${spe.speExetime }" type="date"/></span>
        			</li>
        			<li class="list-group-item">
        				<label>执行情况：</label>
        				<span class="speExecase">${spe.speExecase }</span>
        			</li>
   				</ul>
			</c:forEach>
		</div>
		<!-- <div class="clear" style="clear:both;"></div> -->
	</div>
	<%@ include file="../bottom.jsp" %>
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
      							<button id="btnSubmitExeSP" type="button" class="btn btn-primary">提交</button>
    						</div>
 	 					</div>
  					</form>
  				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#btnBack").click(function(){
			window.history.back();
		});
		$("#btnExeSPE").click(function(){
			$(".shadeExeSP").show();
			$("#spePid").val($(".spId").text());
		});
		$("#btnSubmitExeSP").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/salePlanExe/ajaxAddSPExe.do",
				data: $("#formEditSPE").serialize(),
				dataType:"json",
				async:false,
				success:function(result){
					result = JSON.parse(result);
					alert(result.message);
					window.location.reload();
				}
			});
		});
		$("#btnHideShadeExeSP").click(function(){
			$(".shadeExeSP").hide();
		});
	</script>
</body>
</html>