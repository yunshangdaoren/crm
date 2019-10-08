<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	$("#noPlanSC").click(function(){
		$(this).addClass("active");
		changeTab($(this));
	})
	$("#planSC").click(function(){
		$(this).addClass("active");
		changeTab($(this));
		
	})
	$("#successSC").click(function(){
		$(this).addClass("active");
		changeTab($(this));
	})
	$("#failSC").click(function(){
		$(this).addClass("active");
		changeTab($(this));
	})
	function changeTab(obj){
		var list = $(obj).siblings();
		list.each(function(){
			$(this).removeClass("active");
		})
	}
</script>