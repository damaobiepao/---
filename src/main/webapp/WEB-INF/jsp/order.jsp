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
<title>订单详情</title>
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
	<div style="position:absolute; width: 100%;height: 100%;left: 0px;top: 0px;background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);">
			<!-- 头部信息-透明 -->
			<div style="position:absolute; background-color:transparent;top:3%;left:10%; width: 80%;height: 5%;">
				<!-- 首页，欢迎，退出 -->	
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
				<p style="font-size: 25px;" class="text-secondary">订单信息</p>
				<hr class="text-muted" style="width: 60%;"/>
				<div style="position: absolute;top: 50%;left: 35%;width: 15%;height: 50%;" class="text-secondary">店铺名字：${storeInformation.name}</div>
				<div style="position: absolute;top: 50%;left: 50%;width: 15%;height: 50%;" class="text-secondary">配送费：${orderInformation.deliveryfee}元</div>
				<div style="position: absolute;top: 70%;left: 35%;width: 15%;height: 50%;" class="text-secondary">联系方式：${storeInformation.phone}</div>
				<div style="position: absolute;top: 70%;left: 50%;width: 15%;height: 50%;" class="text-secondary">${empty storeInformation.phone2?'':storeInformation.phone2}</div>
			</div>
			<!--收货人信息 -->
			<div style="text-align:center; position: absolute;top:20%;left: 80%;width: 19%;height: 70%;border-color:black; border-width: 1px;border-style: solid;">
				<p style="text-align:center; position: absolute;top: 0%;left: 0%;width: 100%;height: 7%;font-size: 17px;border-bottom-color:black;border-bottom-width:1px;border-bottom-style: solid;">收货人信息</p>
				
				<p style="text-align:center; position: absolute;top: 10%;left: 10%;width: 7%;height: 27%;font-size: 10px;border-color:black; border-width: 1px;border-style: solid;">收货人姓名 ：</p>
				<p style="text-align:center; position: absolute;top: 10%;left: 47%;width: 7%;height: 27%;font-size: 10px;border-color:black; border-width: 1px;border-style: solid;">收货人地址 ：</p>
				<p style="text-align:center; position: absolute;top: 10%;left: 84%;width: 7%;height: 27%;font-size: 10px;border-color:black; border-width: 1px;border-style: solid;">收货人电话 ：</p>
				<input id="consigneename" type="text" style="text-align:left; position: absolute;top:40%;left: 5%;width: 90%;height: 10%;font-size: 10px;border-color:black; border-width: 1px;border-style: solid;" class="form-control" readonly="true" placeholder="${orderInformation.consigneename}">
				<input id="consigneesaddress" type="text" style="text-align:left; position: absolute;top:55%;left: 5%;width: 90%;height: 10%;font-size: 10px;border-color:black; border-width: 1px;border-style: solid;" class="form-control" readonly="true" placeholder="${orderInformation.consigneesaddress}">
				<input id="consigneephonenumber" type="number" style="text-align:left; position: absolute;top:70%;left: 5%;width: 90%;height: 10%;font-size: 10px;border-color:black; border-width: 1px;border-style: solid;" class="form-control" readonly="true" placeholder="${orderInformation.consigneephonenumber}">
			</div>
			<!-- 商品清单 -->
			<p style="text-align:center; position: absolute;top: 30%;left: 25%;width: 50%;height: 5%;font-size: 20px;">商品清单</p>
			<div style="text-align:center; position: absolute;top: 35%;left: 25%;width: 50%;height: 5%;">
			
				<p style="text-align:center; position: absolute;top: 0%;left: 0%;width: 30%;height:100%;font-size: 17px;">名字</p>
				<p style="text-align:center; position: absolute;top: 0%;left: 30%;width: 20%;height:100%;font-size: 17px;">类型</p>
				<p style="text-align:center; position: absolute;top: 0%;left: 50%;width: 15%;height:100%;font-size: 17px;">单价</p>
				<p style="text-align:center; position: absolute;top: 0%;left: 65%;width: 15%;height:100%;font-size: 17px;">数量</p>
				<p style="text-align:center; position: absolute;top: 0%;left: 80%;width: 20%;height:100%;font-size: 17px;">金额</p>
			</div>
			<hr style="text-align:center; position: absolute;top: 37%;left: 25%;width: 50%;background-color:black;">
			<!-- 购买的商品列表 -->
			<div id="pdiv" style="overflow:auto; position:absolute;text-align:center; left:25%; width:50%;height:50%;top:40%;">
			</div>
			<!-- 返回按钮 -->
			<div id="pdiv" style="position:absolute;text-align:center; left:25%; width:50%;height:10%;top:90%;">
				<button id="backtouserhtml" type="button" class="btn btn-secondary btn-sm" style="position:absolute;left:25%; width:50%;height:50%;top:25%;">返回</button>
			</div>
			<p style="position: absolute;top:94%;left: 75%;width: 25%;height:3%;font-size: 10px;" class="text-secondary">*订单涉及的所有价格，以订单成功提交时为准。！</p>
	</div>
</body>
<script type="text/javascript">
	let muid= "${orderInformation.muid}";
	let name = new Array();
	let type = new Array();
	let price = new Array();
	let enumber = new Array();
	//初始化名字数组
	name="${orderInformation.productname}".split("@");
	//初始化类型数组
	type="${orderInformation.producttypes}".split("@");
	//初始化价格数组
	price="${orderInformation.productprice}".split("@");
	//初始化数量数组
	enumber="${orderInformation.expectnumberofproducts}".split("@");
	
	//有多少种产品
	let n=name.length;
	//一个多少件产品
	let totalAmount=new Number(0);
	//产品一共多少钱
	let totalPrice=new Number(0);
	//配送费
	let deliveryfee=new Number('${orderInformation.deliveryfee}');
	//加入产品
	for(let i=0;i<n;i++){
		let tempprice=new Number(price[i]);
		let tempenumber=new Number(enumber[i]);
		totalAmount=totalAmount+tempenumber;
		totalPrice=(totalPrice+tempprice*tempenumber).toFixed(2);
		let tempdiv="<div style='text-align:center; position: absolute;top:"+(i*10)+"%;left: 0%;width: 100%;height: 7%;'><p style='text-align:center; position: absolute;top: 0%;left: 0%;width: 30%;height:100%;font-size: 15px;'>"+name[i]+"</p><p style='text-align:center; position: absolute;top: 0%;left: 30%;width: 20%;height:100%;font-size: 15px;'>"+type[i]+"</p><p style='text-align:center; position: absolute;top: 0%;left: 50%;width: 15%;height:100%;font-size: 15px;'>"+price[i]+"元</p><p style='text-align:center; position: absolute;top: 0%;left: 65%;width: 15%;height:100%;font-size: 15px;'>"+enumber[i]+"</p><p style='text-align:center; position: absolute;top: 0%;left: 80%;width: 20%;height:100%;font-size: 15px;'>"+(tempprice*tempenumber).toFixed(2)+"元</p></div>"
		$("#pdiv").append(tempdiv);
	}
	//合计信息
	if(n!=0){
		let temphr="<hr style='position: absolute;top:"+(n*10+15)+"%;left:60%;width:40%;border-style:dashed;border-color: black;'>";
		$("#pdiv").append(temphr);
		let tempdiv="<div style='text-align:right; position: absolute;top:"+(n*10+20)+"%;left: 60%;width: 40%;height: 40%;'><p style='text-align:right; position: absolute;top: 0%;left: 5%;width: 35%;height:20%;font-size: 13px;color: black;'>合计：</p><p style='text-align:right; position: absolute;top: 0%;left: 50%;width: 35%;height:20%;font-size: 13px;color: black;'>"+totalAmount+" 件</p><p style='text-align:right; position: absolute;top: 25%;left: 5%;width: 35%;height:20%;font-size: 13px;color: black;'>商品：</p><p style='text-align:right; position: absolute;top: 25%;left: 50%;width: 35%;height:20%;font-size: 13px;color: black;'>"+totalPrice+" 元</p><p style='text-align:right; position: absolute;top: 50%;left: 5%;width: 35%;height:20%;font-size: 13px;color: black;'>配送费：</p><p style='text-align:right; position: absolute;top: 50%;left: 50%;width: 35%;height:20%;font-size: 13px;color: black;'>${storeInformation.deliveryfee} 元</p><p style='text-align:right; position: absolute;top: 75%;left: 7%;width: 35%;height:25%;font-size: 17px;color: black;'>总价：</p><p style='text-align:right; position: absolute;top: 75%;left: 52%;width: 35%;height:25%;font-size: 17px;color: black;'>"+(totalPrice+deliveryfee)+" 元</p></div>"
		$("#pdiv").append(tempdiv);
	}
	
$(function(){
	//返回首页点击事件
	$("#bttohello").click(function(){
		location.assign("${pageContext.request.contextPath}");
	});
	//进入个人中心
	$("#bttouser").click(function(){
		window.open("${pageContext.request.contextPath}/touserhtml","个人中心");
	});
	//返回个人中心
	$("#backtouserhtml").click(function(){
		history.back();
	});
	//登出按钮事件
	$("#btlogout").click(function(){
		location.replace("${pageContext.request.contextPath}/logout");
	});
});
</script>
</html>