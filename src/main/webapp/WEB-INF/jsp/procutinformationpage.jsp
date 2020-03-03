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
<title>商品详情</title>
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
<body>
	<!-- 全局DIV -->
	<div style="position:absolute; width: 100%;height: 150%;left: 0px;top: 0px;background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);">
		<!-- 头部信息-透明 -->
		<div style="position:absolute; background-color:transparent;top:0%;left:10%; width: 80%;height: 5%;">
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
		<!-- 轮播图 -->
		<div id="slideshow" style="position: absolute;height:35%;width: 50%;left: 25%;top:5%; ">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner" id="mainslideshow">
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">前一页</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">后一页</span>
			  </a>
			</div>
		</div>
		<!-- 商品信息 -->
		<div style="position: absolute;height:50%;width: 40%;top:45%;left:30%;">
			<!-- 标题 -->
			<div style="position:absolute;height:10%;width:100%;top:0%;"> 
				<p class='text-secondary' style="font-size:20px; text-align: center;"> 商品信息</p>
			</div>
			<!-- 下划线 -->
			<div style="position:absolute;height:5%; width:30%;left:35%;top:5%;">
				<hr/>
			</div>
			<!-- 商品名称 -->
			<div style="position:absolute;height:10%; width:90%;left:5%;top:10%; ">
				<p class='text-body' style="margin-top:3%;width:35%; font-size:17px; text-align: center; float: left;">商品名称：</p>
				<p class='text-body' style="margin-top:3%;width:65%; font-size:17px; text-align: center;">${productinformation.productname}</p>
			</div>
			<!-- 商品类型： -->
			<div style="position:absolute;height:10%; width:90%;left:5%;top:20%;">
				<p class='text-body' style="margin-top:3%;width:35%; font-size:17px; text-align: center; float: left;">商品类型：</p>
				<p class='text-body' style="margin-top:3%;width:65%; font-size:17px; text-align: center;">${productinformation.producttypes}</p>
			</div>
			<!-- 商品价格 -->
			<div style="position:absolute;height:10%; width:90%;left:5%;top:30%;">
				<p class='text-body' style="margin-top:3%;width:35%; font-size:17px; text-align: center; float: left;">商品价格：</p>
				<p class='text-body' style="margin-top:3%;width:65%; font-size:17px; text-align: center;">${productinformation.productprice}</p>
			</div>
			<!-- 商品数量 -->
			<div style="position:absolute;height:10%; width:90%;left:5%;top:40%;">
				<p class='text-body' style="margin-top:3%;width:35%; font-size:17px; text-align: center; float: left;">商品数量：</p>
				<p class='text-body' style="margin-top:3%;width:65%; font-size:17px; text-align: center;">${productinformation.numberofproducts}</p>
			</div>
			<!--商品描述 -->
			<div style="position:absolute;height:10%; width:90%;left:5%;top:50%;">
				<p class='text-body' style="margin-top:3%;width:35%; font-size:17px; text-align: center; float: left;">商品描述：</p>
				<p class='text-body' style="margin-top:3%;width:65%; font-size:17px; text-align: center;">${productinformation.productdescription}</p>
			</div>
			<!-- 下划线 -->
			<div style="position:absolute;height:5%; width:70%;left:15%;top:65%;">
				<hr/>
			</div>
			<!-- 按钮组 -->
			<div style="position:absolute;height:15%; width:70%;left:15%;top:75%;">
				<button id="backtohellopage" style="float: left;width: 30%;margin-left: 5%;" type="button" class="btn btn-secondary">返回首页</button>
				<button id="backtostorepage" style="float: left;width: 30%;" type="button" class="btn btn-danger">返回店铺</button>
				<button id="addtoshoppingcart" style="float: left;width: 30%;" type="button" class="btn btn-success">加购物车</button>
			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript">
	
	$(function(){
		//获得轮播div宽高+初始化轮播图
		var height = Math.floor($("#slideshow").height());
		var width = Math.floor($("#slideshow").width());
		var n=0;
		<c:forEach var="pname" items="${pictureName}">
			if('${pname}'!=''){
				n++;
				if(n==1){
					var pitcture="<div class='carousel-item active'><img src='/productpicture/${pname}' style='height:"+height+"px;width:"+width+"px;' class='d-block w-100' alt='未找到图片'></div>";
					$("#mainslideshow").append(pitcture);
				}else{
					var pitcture="<div class='carousel-item'><img src='/productpicture/${pname}' style='height:"+height+"px;width:"+width+"px;' class='d-block w-100' alt='未找到图片'></div>";
					$("#mainslideshow").append(pitcture);
				}
			}
		</c:forEach>
		if(n==0){
			var pitcture="<div class='carousel-item active'><img src='/productpicture/404.png' style='height:"+height+"px;width:"+width+"px;' class='d-block w-100' alt='未找到图片'></div>";
			$("#mainslideshow").append(pitcture);
		}
		/************************配置商品******************************/
		
		//返回首页按钮
		$("#backtohellopage").click(function(){
			location.href="${pageContext.request.contextPath}/";
		});
		//换回店铺按钮
		$("#backtostorepage").click(function(){
			location.href="${pageContext.request.contextPath}/tostorepage/"+${productinformation.muid};
		});
		//加入购物车按钮
		$("#addtoshoppingcart").click(function(){
			$.post("${pageContext.request.contextPath}/addtoshoppingcart",
					{	muid:"${productinformation.muid}",
						producttypes:"${productinformation.producttypes}",
						productname:"${productinformation.productname}",
						productprice:"${productinformation.productprice}"
					},
						function(responseTxt){
							if(responseTxt=="成功"){
							}else{
								alert(responseTxt);
							}
						}
				);
	
		});
		
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