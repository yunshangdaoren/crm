<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">	
		table{
			border-top:3px solid #11C2EE;
			overflow: hidden;
			margin-top:6px;
			table-layout: fixed;
		}
		.table th{
			font-size:15px;
		}
		.table tbody tr td{
			font-size:12px;
			word-break:keep-all;/* 不换行 */
    		white-space:nowrap;/* 不换行 */
    		overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
    		text-overflow:ellipsis;
    		vertical-align: middle;
		}
		td a{
			color:blue;
			font-weight: bold;
			margin-top:-7px;
			cursor:pointer;
			text-decoration:none;
		}
		.title{
			color:#FF0000;
		}
		.shadeDisSC, .shadeSCInfo, .shadeEditSC{
			width:100%;
			height:100%;
			position: absolute;
			background:rgb(0,0,0,0.3);
			top:0px;
			left:0px;
			line-height:100%;
			display:none;
		}
		.shadeDisSC .disSCBox{
			width:350px;
			height:250px;
			margin:auto;
			background:white;
			margin-top:130px;
			position:relative;
			padding-top:20px;
		}
		.shadeDisSC .disSCBox .form-group{
			width:70%;
			margin-left:20px;
			line-height:30px;
		}
		.shadeDisSC .disSCBox .form-group .title{
			color:black;
			line-height:30px;
		}
	    .shadeDisSC .disSCBox .form-group .title .left{
			width:50%;
			float:left;
		}
	    .shadeDisSC .disSCBox .form-group .title .right{
			width:50%;
			right;
			background:white;
		}
	   .shadeDisSC .disSCBox .button{
			text-align:center;
			position:absolute;
			bottom:20px;
			left:100px;
		}
		.shadeDisSC .disSCBox .button #sure,#cancel{
			width:70px;
		}
		.shadeDisSC .disSCBox .button #sure{
			margin-left:10px;
		}
		.shadeSCInfo label{
			color:#EE1196;
			font-weight:bold;
		}
	</style>
</head>
<body>
	<%@ include file="../top.jsp" %>
	<div id="center">
		<%@ include file="../leftNav.jsp" %>
		<div id="right">
			<span class="title">未分配销售机会列表</span>
			<a href="${pageContext.request.contextPath}/saleChance/toAddSC.do">
				<button id="btnAddSc" style="float:right;" type="button" class="btn btn-danger">新增销售机会</button>
			</a>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>客户名称</th>
						<th>机会来源</th>
						<th>联系人</th>
						<th>联系电话</th>
						<th>成功概率</th>
						<th>描述</th>
						<th>创建人</th>
						<th>创建时间</th>
						<th>状态</th>
						<th>详情</th>
						<th style="width:150px;">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${notDisSCList }" var="sc">
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
					    	<td style="color:red;">未分配</td>
					    	<td>	
					    		<a class="infoSC">
					    			<span class="label label-primary">查看详情</span>
					    		</a>
					    	</td>
					    	<td >
								<a class="editSC" style="text-decoration:none;">
									<span class="label label-warning">编辑</span>
								</a>
								<a class="delSC" style="text-decoration:none;">
									<span class="label label-warning">删除</span>
								</a>
								<c:if test="${loginUser.uRoleid==2 }">
									<a class="disSC" style="text-decoration:none;">
										<span class="label label-danger">分配</span>
									</a>
								</c:if>
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
					<input type="text" class="form-control" style="z-index:0;">
        			<span class="input-group-addon">跳转至</span>
 				</div>
			</div>
		</div>
	</div>
	<%@ include file="../bottom.jsp" %>
	
	<!-- 遮罩层，用于分配制定销售机会给指定用户 -->
	<div class="shadeDisSC">
		<div class="scInfo" style="width: 800px;height: 550px;margin:auto;margin-top:100px;">
			<div class="panel panel-primary">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">编辑销售机会</span>
    				<button id="btnHideShadeDisSC" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<div class="panel-body">
        			<label>ID：</label><span class="scId"></span>
    			</div>
    			<ul class="list-group" style="width:800px;height:180px;overflow:auto;">
        			<li class="list-group-item"><label>状态：</label><span style="color:red;">未分配</span></li>
        			<li class="list-group-item">
        				<label>请选择要分配给哪个销售经理？：</label>
        				<select id="selectDisSC"></select>
        			</li>
        			<li class="list-group-item">
        				<button type="button" id="btnSubmitDisSC" class="btn btn-success">分配</button>
        			</li>
    			</ul>
			</div>
		</div>
	</div>
	<!-- 遮罩层，用于编辑指定销售机会 -->
	<div class="shadeEditSC">
		<div class="scInfo" style="width: 820px;height: 550px;overflow: auto;margin:auto;margin-top:100px;">
			<div class="panel panel-primary">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">编辑销售机会</span>
    				<button id="btnHideShadeEditSC" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<div style="width:800px;">
    				<form style="width:100%;" id="formEditSC" class="form-horizontal" role="form">
  						<div class="form-group" style="margin-top:10px;">
    						<label for="firstname" class="col-sm-2 control-label">ID：</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="scId" id="scId" readonly="readonly">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="firstname" class="col-sm-2 control-label">客户名称</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="scCusname" id="scCusname" placeholder="请输入客户名称">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="lastname" class="col-sm-2 control-label">机会来源</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="scComming" id="scComming" placeholder="请输入机会来源">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="lastname" class="col-sm-2 control-label">联系人</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="scConname" id="scConname" placeholder="请输入联系人">
    						</div>
  						</div>
  						<div class="form-group">	
    						<label for="lastname" class="col-sm-2 control-label">联系电话</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="scConphone" id="scConphone" placeholder="请输入联系电话">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="lastname" class="col-sm-2 control-label">成功概率</label>
    						<div class="col-sm-10">
      							<input type="text" class="form-control" name="scSuccess" id="scSuccess" placeholder="请输入成功概率">
    						</div>
  						</div>
  						<div class="form-group">
    						<label for="lastname" class="col-sm-2 control-label">机会描述</label>
    						<div class="col-sm-10">
      							<textarea class="form-control" name="scDesc" id="scDesc" rows="5"></textarea>
    						</div>
  						</div>
  						<div class="form-group">
    						<div class="col-sm-offset-2 col-sm-10">
      							<button id="btnSubmitEditSC" class="btn btn-primary">提交</button>
    						</div>
 	 					</div>
					</form>
    			</div>
			</div>
		</div>
	</div>
	<!-- 遮罩层，用于显示指定销售机会详细信息 -->
	<div class="shadeSCInfo">
		<div class="scInfo" style="width: 800px;height: 510px;margin:auto;margin-top:100px;">
			<div class="panel panel-primary">
    			<div class="panel-heading" style="height:46px;padding:5px;">
    				<span style="font-size:17px;line-height:41px;">销售机会详细信息</span>
    				<button id="btnHideShadeSCInfo" style="float:right;top:8px;" type="button" class="btn btn-success">退出</button>
    			</div>
    			<div class="panel-body">
        			<label>ID：</label><span class="scId_info"></span>
    			</div>
    			<ul class="list-group" style="width:800px;height:460px;overflow:auto;">
        			<li class="list-group-item"><label>客户名称：</label><span class="scCusName"></span></li>
        			<li class="list-group-item"><label>机会来源：</label><span class="scComming"></span></li>
        			<li class="list-group-item"><label>联系人：</label><span class="scConname"></span></li>
        			<li class="list-group-item"><label>联系电话：</label><span class="scConphone"></span></li>
       				<li class="list-group-item"><label>成功概率：</label><span class="scSuccess"></span></li>
       				<li class="list-group-item"><label>描述：</label><span class="scDesc"></span></li>
       				<li class="list-group-item"><label>创建人：</label><span class="scCreateUName"></span></li>
       				<li class="list-group-item"><label>创建时间：</label><span class="scCreateTime"></span></li>
       				<li class="list-group-item"><label>状态：</label><span>未分配</span></li>
   				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//保存操作分配对象
		var scObj;
		//进入分配销售机会弹出页面
		$(".disSC").click(function(){
			scObj = $(this);
			$(".shadeDisSC").show();
			//销售机会id
			var scId = $(".disSC").parent().parent().children().first().text();
			//设置该销售机会id
			$(".scId").text(scId);
			//设置要分配的人员信息
			$.ajax({
				url:"${pageContext.request.contextPath}/user/ajaxAllUserByRoleId.do?rId=3",
				success:function(data){
					//data是返回的数据，是字符串类型,将字符串转换为JSON对象
					data = JSON.parse(data);
					var strHtml="";
					for(var i = 0; i < data.length; i++){
						var uName = data[i].uName;
						var uId = data[i].uId;
						var uAccount = data[i].uAccount;
						//拼接，设置用户id和用户名称
						strHtml+="<option value='"+uId+"'>账户"+uAccount+"："+uName+"</option>";
					}
					$("#selectDisSC").html(strHtml);
				}
			});
		});
		/* 取消 */
		$("#btnCancel").click(function(){
			$(this).hide();
		});
		/* 分配销售机会 */
		$("#btnSubmitDisSC").click(function(){
			var scId = $(".scId").text();
			var uId = $("#selectDisSC").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/saleChance/ajaxDisSC.do?scId="+scId+"&uId="+uId,
				dataType:"json",
				success:function(result){
					result = JSON.parse(result);
					alert(result.message);
					if(result.status!=0){
						scObj.parent().parent().remove();
					}
					$(".shadeDisSC").hide();
					location.reload(); 
				}
			});
		});
		//删除指定销售机会
		$(".delSC").click(function(){
			var value = confirm("删除该销售机会？");
			//如果确认删除
			if(value == true){
				var scId = $(this).parent().parent().children().first().text();
				$.ajax({
					url:"${pageContext.request.contextPath}/saleChance/delSc.do?scId="+scId,
					dataType:"json",
					success:function(result){
						var data = JSON.parse(result);
						if(data.status==0){
							alert(data.message);
						}else{
							alert(data.message);
							//删除该行记录
							$(this).parent().parent().remove();
							location.reload(); 
						}  
					}	
				});
			}
		});
		/* 查看指定销售机会详细信息 发送ajax请求 */
		$(".infoSC").click(function(){
			$(".shadeSCInfo").show();
			var scId = $(this).parent().parent().children().first().text();
			$.ajax({
				url:"${pageContext.request.contextPath}/saleChance/ajaxSC.do?scId="+scId,
				success:function(result){
					result = JSON.parse(result);
					if(result==null){
						alert("查询错误，请稍后重试！")
					}else{
						$(".scId_info").text(result.scId);
						$(".scCusName").text(result.scCusname);
						$(".scComming").text(result.scComming);
						$(".scConname").text(result.scConname);
						$(".scConphone").text(result.scConphone);
						$(".scSuccess").text(result.scSuccess);
						$(".scDesc").text(result.scDesc);
						$(".scCreateUName").text(result.scCreateuname);
						$(".scCreateTime").text(result.scCreatetime);
					}
				}
			});
		});
		//显示编辑指定销售机会页面
		$(".editSC").click(function(){
			var scId = $(this).parent().parent().children().first().text();
			$.ajax({
				url:"${pageContext.request.contextPath}/saleChance/ajaxToShowEditSC.do?scId="+scId,
				success:function(result){
					result = JSON.parse(result);
					result = JSON.parse(result);
					if(result.status==0){
						alert(result.message);
					}else{
						$(".shadeEditSC").show();
						$("#scId").val(result.sc.scId);
						$("#scCusname").val(result.sc.scCusname);
						$("#scComming").val(result.sc.scComming);
						$("#scConname").val(result.sc.scConname);
						$("#scConphone").val(result.sc.scConphone);
						$("#scSuccess").val(result.sc.scSuccess);
						$("#scDesc").text(result.sc.scDesc);
					}
				}
			});
		});
		/* 提交修改销售机会的按钮点击事件 */
		$("#btnSubmitEditSC").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/saleChance/ajaxUpdateSC.do",
				data: $("#formEditSC").serialize(),
				dataType:"json",
				method:"get",
				success:function(result){
					result = JSON.parse(result);
					alert(result.message);
					window.location.href="${pageContext.request.contextPath}/saleChance/listNotDisSC.do";
				}
			});
		}) 
		/* 退出编辑销售机会弹出框页面 */
		$("#btnHideShadeEditSC").click(function(){
			$(".shadeEditSC").hide();
		});
		/* 退出分配销售机会弹出框页面 */
		$("#btnHideShadeDisSC").click(function(){
			$(".shadeDisSC").hide();
		});
		/* 退出查看销售机会信息弹出框页面 */
		$("#btnHideShadeSCInfo").click(function(){
			$(".shadeSCInfo").hide();
		});
	</script>
</body>
</html>