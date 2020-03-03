<%@page import="org.w3c.dom.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>恰了没！商家登录</title>
<!--标题图标+收藏图标-->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/htmllogo.png" type="image/png"/>
<!-- 模板css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<%--JQuery官网 --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

<div class="materialContainer">
	<div class="box">
		<div class="title">登录</div>
		<div class="input">
			<label for="name">手机号</label>
			<input type="text" name="name" id="name">
			<span class="spin"></span>
		</div>
		<div class="input">
			<label for="pass">密码</label>
			<input type="password" name="pass" id="pass">
			<span class="spin"></span>
		</div>
		<div class="button login">
			<button id="btlogin">
				<span>登录</span>
				<i class="fa fa-check"></i>
			</button>
		</div>
		<!--  <a href="javascript:" class="pass-forgot">忘记密码？</a>-->
	</div>

	<div class="overbox">
		<div class="material-button alt-2">
			<span class="shape"></span>
		</div>
		<div class="title">入驻恰了没</div>
		<div class="input">
			<label for="regname">姓名</label>
			<input type="text" name="regname" id="regname">
			<span class="spin"></span>
		</div>
		<div class="input">
			<label for="regpass">手机号</label>
			<input type="number" name="regpass" id="regpass">
			<span class="spin"></span>
		</div>
		<div class="input">
			<label for="reregpass">地址</label>
			<input type="text" name="reregpass" id="reregpass">
			<span class="spin"></span>
		</div>
		<div class="button">
			<button id="submit">
				<span>提交</span>
			</button>
		</div>
	</div>

</div>
<!-- 模板js -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<!-- 自定义JS -->
<script type="text/javascript">
	//商家事件
	$(function(){
		//登录事件
		$("#btlogin").click(function(){
			$.post(
					"${pageContext.request.contextPath}/merchantusertolgoin",
					{
						phone:$("#name").val(),
						password:$("#pass").val()
					},
					function(responseTxt,statusTxt){
						if(responseTxt=="成功"){
							phone:$("#name").val("");
							password:$("#pass").val("");
							location.href="${pageContext.request.contextPath}/tomerchantHomepage";
						}else{
							alert(responseTxt+"\n"+"状态："+statusTxt);
						}
					}
				);
		});
		$("#submit").click(function(){
			var name=$("#regname").val();
			var phoneNumber=$("#regpass").val();
			var address=$("#reregpass").val();
			if(name==''|name.trim()==''|name.length>9){
				alert("请检查你的名字，不应为空！不应超过9个字符！");
				return;
			}
			if(phoneNumber==''|phoneNumber.trim()==''|phoneNumber.length!=11){
				alert("请检查你的手机号，应为11位的移动电话号码！");
				return;
			}
			if(address==''|address.trim()==''|address.length>30|address.length<9){
				alert("请检查你的地址，不应为空！不应少于9个字符或超过30个字符！");
				return;
			}
			$.post(
					"${pageContext.request.contextPath}/submitamerchantuserregistrationrequest",
					{
						name:name,
						phoneNumber:phoneNumber,
						address:address
					},
					function(responseTxt){
						if(responseTxt=="成功"){
							alert("你已经成功提交申请，工作人员将会在近期联系你，请保持电话畅通。！！！");
						}else{
							alert(responseTxt);
						}
					}
				);
			
		});
	});
</script>
</body>
</html>