function studentFormEmptyCheck(){
	
	if($("#name").val()==''){
		$("#empty_name").show();
		$("#empty_name").text("学生姓名不能为空");
		$("#name").focus();
		return false;
	}else{
		$("#empty_name").hide();
	}
	
	if($("#age").val()==''){
		$("#empty_age").show();
		$("#empty_age").text("学生年龄不能为空");
		$("#age").focus();
		return false;
	}else{
		$("#empty_age").hide();
	}
	
	if($("#money").val()==''){
		$("#empty_money").show();
		$("#empty_money").text("学生工资不能为空");
		$("#money").focus();
		return false;
	}else{
		$("#empty_money").hide();
	}
	if($("#empty_cid").val()==''){
		$("#empty_cid").show();
		$("#empty_cid").text("请选择学生班级");
		$("#cid").focus();
		return false;
	}else{
		$("#empty_cid").hide();
	}
}
