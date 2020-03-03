<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<!--标题图标+收藏图标-->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/htmllogo.png" type="image/png"/>
<!-- 设置浏览器标签-名 -->
<title>店铺信息</title>
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
			<div style="position:absolute; background-color:transparent;top:3%;left:10%; width: 80%;height: 5%;">
				<!-- 首页，个人中心，退出 -->	
				<div style="float: left;">
					<span><button id="bttohello" class="btn btn-link text-muted">返回首页</button></span>
				</div>
				<div style="float: right;">
					<span><button id="bttouser" class="btn btn-link text-muted">${sessionScope.user.name}</button></span>
					<span class="text-muted">|</span>
					<span><button id="btlogout" class="btn btn-link text-muted">登出</button></span>
				</div>
			</div>
			<!-- 中间 标题 -->
			<div style="text-align:center; position: absolute;top: 10%;left: 0%;width: 100%;height: 20%;">
				<p style="font-size: 25px;" class="text-secondary">${storeInformation.name}</p>
				<hr class="text-muted" style="width: 60%;"/>
				<div style="position: absolute;top: 50%;left: 35%;width: 15%;height: 50%;" class="text-secondary">店铺类型：${storeInformation.storetype}</div>
				<div style="position: absolute;top: 50%;left: 50%;width: 15%;height: 50%;" class="text-secondary">配送费：${storeInformation.deliveryfee}元</div>
				<div style="position: absolute;top: 70%;left: 35%;width: 15%;height: 50%;" class="text-secondary">联系方式：${storeInformation.phone}</div>
				<div style="position: absolute;top: 70%;left: 50%;width: 15%;height: 50%;" class="text-secondary">${empty storeInformation.phone2?'':storeInformation.phone2}</div>
			</div>
			<!-- 大的DIV用来装店铺拥有的产品信息数组 -->
			<div id="informationcontainer" style="position:absolute; overflow:auto;width:100%;height:70%;left:0%;top:30%; text-align: center;">
							
			</div>
	</div>
</body>
<script type="text/javascript">
	//产品点击事件
	function procutclick(button){
			var muid=button.parentNode.getAttribute("muid");
			var producttypes=button.parentNode.firstChild.innerHTML;
			var productname=button.innerHTML;
			location.pathname="${pageContext.request.contextPath}/toprocutinformationpage/"+muid+"/"+producttypes+"/"+productname;
	} 
	//产品店铺拥有的产品信息数组
	<c:forEach var="pi" items="${productInformation}">
		//如果没类型div,就把类型加入大div
		if($("#${pi.producttypes}").length==0){
			var typediv="<div id='${pi.producttypes}' muid='${pi.muid}' style='text-align:center;width:80%;height:60px;margin-top:30px;margin-left:10%;'><div class='text-secondary' style='font-size:20px;'>${pi.producttypes}</div> <hr style='width:200px;'/>  </div>"
			$("#informationcontainer").append(typediv);
			
			var productdiv="<div id='${pi.producttypes}_${pi.productname}' onclick='procutclick(this)' style='margin-top:0px;margin-bottom:15px;width:150px;height:25px;margin-left:50px;float:left; background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);'>${pi.productname}</div>";
			$("#${pi.producttypes}").append(productdiv);
			$("#${pi.producttypes}").css("height","100px");
		}//如果有类型div,就把信息加入类型div
		else{
			var productdiv="<div id='${pi.producttypes}_${pi.productname}' onclick='procutclick(this)' style='margin-top:0px;margin-bottom:15px;width:150px;height:25px;margin-left:50px;float:left; background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);'>${pi.productname}</div>";
			$("#${pi.producttypes}").append(productdiv);
			
			var childrendiv=$("#${pi.producttypes}").children().length-2;
			if(childrendiv%5==0){
				var height=childrendiv/5*40+60+'px';
				$("#${pi.producttypes}").css("height",height);
			}else{
				var height=Math.ceil(childrendiv/5)*40+60+'px';
				$("#tt${pi.producttypes}").css("height",height);
			}
		}
	</c:forEach>
$(function(){
	//返回首页点击事件
	$("#bttohello").click(function(){
		location.assign("${pageContext.request.contextPath}");
	});
	//进入个人中心
	$("#bttouser").click(function(){
		location.assign("${pageContext.request.contextPath}/touserhtml");
	});
	//登出按钮事件
	$("#btlogout").click(function(){
		location.replace("${pageContext.request.contextPath}/logout");
	});
});
</script>
</html>