<%@page import="org.w3c.dom.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--标题图标+收藏图标-->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/htmllogo.png" type="image/png"/>
<!-- 设置浏览器标签-名 -->
<title>恰了没？校园外送服务上恰了没。！</title>
<%--*框架*--%>	
	<%--BOOTSTRAP官网 --%>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<%--JQuery官网 --%>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<%---BOOTSTRAP需要的外部JS --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<%---BOOTSTRA自己的JS --%>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		
</head>
<!-- border-color: red;border-width: 2px;border-style: solid; -->
<body>
	<!-- 全局DIV -->
	<div style="position:absolute; width: 100%;height: 100%;left: 0px;top: 0px;background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);">
		<!-- 头部信息-透明 -->
		<div style="position:relative; background-color: transparent;top:33px; margin-left:10%; width: 80%;text-align: center;">
			<!-- 图标+文字 -->	
			<div style="float: left;">
				<div>
					<img alt="图片未找到" src=<%=request.getContextPath()+"/image/htmllogo.png"%> style="height:47px;width:47px; ">
				</div>
				<div style="margin-top: 0px;padding-top:0px; ">
					<p style="margin-top: 0px;padding-top:0px;font:10px YouYuan; float:left;margin-top: 0px;" class="text-muted">校园外送服务上</p>
					<p style="margin-top: 0px;padding-top:0px;font:bold 15px YouYuan;"class="text-muted">恰了没！</p>
				</div>
			</div>	
			<!-- 注册，登陆，商家管理。 -->	
			<div style="float: right;right: 0px;">
				<span><button id="btsignin" class="btn btn-link text-muted">${empty sessionScope.user?"注册":sessionScope.user.name}</button></span>
				<span class="text-muted">|</span>
				<span><button id="btlogin" class="btn btn-link text-muted">${empty sessionScope.user?"登录":"登出"}</button></span>
				<span><button id="btmerchant" type="button" class="btn btn-info btn-sm">商家</button></span>

			</div>
		</div>
		
		<!-- 中间搜索框 -->
		<div style="position:relative; top:50%; width: 50%;margin: 0 auto;text-align: center;">
				<span style="float: left;width:75%;">
					<input id="searchbar" type="text" class="form-control form-control-lg" placeholder="请输入你需要查询的物品">
				</span>
				<span>
					<button id="searchbutton" style="width:15%; " type="button" class="btn btn-info btn-lg">搜索</button>
				</span>
		</div>
		<!-- 底部DIV -->
		<div style="position:absolute;height:10%; width:70%;left:15%; top:90%;text-align:center;" >
			<p id="toenteradministratorpage" class="text-secondary" style="font-size:10px; text-align:center;margin:auto auto;">Copyright ©2019 大猫别跑, All Rights Reserved.</p>
		</div>
	</div>	
	
<!-- Modal- 模态框居中(注册) -->
<div class="modal fade" id="signinmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="margin: 0 auto;">
        <h5 class="modal-title" id="exampleModalLongTitle" >注册</h5>
        <!--  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        -->
      </div>
      <div class="modal-body" style="text-align: center;">
      		<!-- 注册界面主体 -->    		
      		<table style="margin: 0 auto;">
      			<tr style="text-align: center;height:45px;">
			      <td class="text-muted">昵称：&nbsp</td>
			      <td><input id="signinusername" type="text" class="form-control" placeholder="请输入你的昵称"/></td>
			      <td id="usernameisuse"></td>
			  	</tr>
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">手机：&nbsp</td>
			      <td><input id="signinuserphone" type="number" class="form-control" placeholder="请输入你的手机号码"/></td>
			      <td id="userphoneisuse" style="text-align: right;"></td>
			  	</tr>
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">密码：&nbsp</td>
			      <td><input id="signinuserpassword" type="password" class="form-control" placeholder="请输入你的密码"/></td>
			      <td id="userpasswordisok"></td>
			  	</tr>
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">重复密码：&nbsp</td>
			      <td><input id="signinuserpasswordagain" type="password" class="form-control" placeholder="请确认你的密码"/></td>
			      <td id="userpasswordisokagain"></td>
			  	</tr>
      		</table>
      </div>
      <div class="modal-footer" style="margin: 0 auto;">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button id="signinconfirm" type="button" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal- 模态框居中（登录） -->
<div class="modal fade" id="loginmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="margin: 0 auto;">
        <h5 class="modal-title" id="exampleModalLongTitle" >登录</h5>
        <!--  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        -->
      </div>
      <div class="modal-body" style="text-align: center;">
      		<!-- 登录界面主体 -->    		
      		<table style="margin: 0 auto;">
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">手机：&nbsp</td>
			      <td><input id="loginuserphone" type="number" class="form-control" placeholder="请输入手机号码"/></td>
			  	</tr>
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">密码：&nbsp</td>
			      <td><input id="loginuserpassword" type="password" class="form-control" placeholder="请输入密码"/></td>
			  	</tr>
      		</table>
      </div>
      <div class="modal-footer" style="margin: 0 auto;">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button id="loginconfirm" type="button" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>
</body>

<script type="text/javascript">
	
	$(function(){
		//注册+用户名(注册按钮点击事件)
		$("#btsignin").click(function(){
			var vv=$(this).text();
			if(vv=="注册"){
				$("#signinmodal").modal('show');
			}else{
				location.assign("${pageContext.request.contextPath}/touserhtml");
			}
		});
			//注册当中昵称校验-键盘keyup事件
			$("#signinusername").keyup(function(){
				$("#usernameisuse").load("${pageContext.request.contextPath}/signinusername",{name:$(this).val()});
			});
			//注册当中手机号码（phone）校验-键盘keyup事件
			$("#signinuserphone").keyup(function(){
				$("#userphoneisuse").load("${pageContext.request.contextPath}/signinuserphone",{phone:$(this).val()});
			});
			//注册当中密码校验-键盘keyup事件
			$("#signinuserpassword").keyup(function(){
				$("#userpasswordisok").load("${pageContext.request.contextPath}/signinuserpassword",{password:$(this).val()});
			});
			//注册当中密码第二次校验-键盘keyup事件
			$("#signinuserpasswordagain").keyup(function(){
				$("#userpasswordisokagain").load("${pageContext.request.contextPath}/signinuserpasswordagain",{password:$("#signinuserpassword").val(),passwordagain:$(this).val() });
			});
		//注册确认按钮事件
		$("#signinconfirm").click(function(){
			var namemessage=$("#usernameisuse").text();
			var phonemessage=$("#userphoneisuse").text();
			var passwordmessage=$("#userpasswordisok").text();
			var passwordagainmessage=$("#userpasswordisokagain").text();
			if(namemessage=="昵称可使用"&&phonemessage=="手机号可注册"&&passwordmessage=="√"&&passwordagainmessage=="√"){
				$.post("${pageContext.request.contextPath}/signinconfirm",
						{	name:$("#signinusername").val(),
							phone:$("#signinuserphone").val(),
							password:$("#signinuserpasswordagain").val()},
							function(responseTxt,statusTxt){
								if(responseTxt=="成功注册"){
									$("#signinusername").val("");
									$("#signinuserphone").val("");
									$("#signinuserpassword").val("");
									$("#signinuserpasswordagain").val("");
									alert("注册结果:"+responseTxt+'\n'+"请求的状态:"+statusTxt);
									location.replace("${pageContext.request.contextPath}");
								}else{
									alert("注册结果:"+responseTxt+'\n'+"请求的状态:"+statusTxt);
								}
							}
					);
			}else{
				alert("所输入内容中有不符合注册要求项！");
			}
		});
		//登录+登出按钮事件
		$("#btlogin").click(function(){
			if($(this).text()=="登录"){
				$("#loginmodal").modal('show');
			}else{
				location.replace("${pageContext.request.contextPath}/logout");
			}
		});
			//登录-确认按钮事件。
			$("#loginconfirm").click(function(){
				$.post(
						"${pageContext.request.contextPath}/loginconfirm",
						{
							phone:$("#loginuserphone").val(),
							password:$("#loginuserpassword").val()
						},
						function(responseTxt) {
							if(responseTxt=="登录成功"){
								$("#loginuserphone").val("");
								$("#loginuserpassword").val("");
								location.replace("${pageContext.request.contextPath}");
							}else{
								alert(responseTxt);
							}
						}
					);
			});
		//商家按钮
		$("#btmerchant").click(function(){
			location.href="${pageContext.request.contextPath}/tomerchant";
		});
		//中间搜索框
		$("#searchbar").focus(function(){
			if('${sessionScope.user}'==''){
				alert("请登录！");
				$(this).blur();
				return;
			}
		});
		//搜索按钮
		$("#searchbutton").click(function(){
			if('${sessionScope.user}'==''){
				alert("请登录！");
				$(this).blur();
				return;
			}
			if($.trim($("#searchbar").val())==''){
				location.assign("${pageContext.request.contextPath}/toallStorepage");
			}else{
				location.assign("${pageContext.request.contextPath}/searchproductinformation/"+$.trim($("#searchbar").val()));
			}
			
		});
		//进入admain界面
		var n= 0;
		$("#toenteradministratorpage").click(function(){
			n++;
			if(n==3){
				n=0;
				window.open("${pageContext.request.contextPath}/toenteradministratorpage",'管理员登录界面');
			}
		});
	});
	
</script>

</html>