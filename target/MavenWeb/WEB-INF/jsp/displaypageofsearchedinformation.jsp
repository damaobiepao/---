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
<title>搜索结果</title>
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
			<div style="text-align:center; position: absolute;top: 10%;left: 0%;width: 100%;height: 15%;">
				<p style="font-size: 25px;" class="text-secondary">搜索结果</p>
				<hr class="text-muted" style="width: 80%;"/>
				<span id="allstore" class="badge badge-secondary" style="position: absolute;left: 15%;top:75%;float: left;">全部</span>
				<span id="store" class="badge badge-success">店铺</span>
				<span class="text-muted">/</span>
				<span id="product" class="badge badge-warning">产品</span>
			</div>
			<!-- 底部搜索得到的店铺信息 -->
			<div id="storeindiv" style="display:none; text-align:center; position: absolute;top: 25%;left: 0%;width: 100%;height: 75%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">搜索到的店铺</div>
				  	<div class="card-body">
				  		<div id="storebody">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="storepreviouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="storepages"></span>
							<span id="storenextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
			<!-- 底部搜索得到的产品 -->
			<div id="productdiv" style="text-align:center; position: absolute;top: 25%;left: 0%;width: 100%;height: 75%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">搜索到的产品</div>
				  	<div class="card-body">
				  		<div id="productbody">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="productpreviouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="productpages"></span>
							<span id="productnextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
			<!-- @@@ 中间显示概述 -->
				<div id="descriptiondiv" class="card text-white bg-success mb-3" style="display:none; text-align:center; position: absolute;top: 5%;left: 40%;width: 20%;height: 30%;">
				  	<div class="card-header">概述信息</div>
				  	<div class="card-body">
				  		<div id="descriptionbody">
				  		
				  		</div>
					</div>
				</div>	
	</div>
</body>
<script type="text/javascript">
	/****************************************************************************/
	//店铺信息初始化
	var storePhoneNumberArray=new Array();
	var stornameArray=new Array();
	var storetypeArray=new Array();
	var deliveryfeeArray=new Array();
	<c:forEach var="storeinformation" items="${thestoreinformationfound}">
		storePhoneNumberArray.push('${storeinformation.phone}');
		stornameArray.push('${storeinformation.name}');
		storetypeArray.push('${storeinformation.storetype}');
		deliveryfeeArray.push('${storeinformation.deliveryfee}');
	</c:forEach>
		//总记录条数
	var ns=storePhoneNumberArray.length;
		//总页数
	var numberOFStorepages;
	if(ns%10==0){
		numberOFStorepages=ns/10;
	}else{
		numberOFStorepages=Math.ceil(ns/10);
	}
	if(numberOFStorepages==0)
		numberOFStorepages=1;
		//现在所在页数
	var nownumberOFStorepages=1;
		//页数显示信息
	$("#storepages").text(nownumberOFStorepages+'/'+numberOFStorepages);
		//进入店铺点击事件
	function instore(obj){
		var phone=obj.id;
		location.assign("${pageContext.request.contextPath}/tostorepage/"+phone);
	}
		//初始化店铺信息显示
	for(var i=(nownumberOFStorepages-1)*10;i<(nownumberOFStorepages-1)*10+10;i++){
		if(i+1>ns)
			break;
		var storeinformationdiv;
		var x=i%10;
		if(x<5){
			storeinformationdiv="<div id='"+storePhoneNumberArray[i]+"' onclick='instore(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+stornameArray[i]+"</h5><p class='card-text'>"+storetypeArray[i]+"<br>配送费："+deliveryfeeArray[i]+"元</p></div></div>"
			$("#storebody").prepend(storeinformationdiv);
			continue;
		}
		storeinformationdiv="<div id='"+storePhoneNumberArray[i]+"' onclick='instore(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+stornameArray[i]+"</h5><p class='card-text'>"+storetypeArray[i]+"<br>配送费："+deliveryfeeArray[i]+"元</p></div></div>";
		$("#storebody").prepend(storeinformationdiv);

			
	}
	/****************************************************************************/
	//@产品@信息初始化
	var muidArray=new Array();
	var productnameArray=new Array();
	var producttypesArray=new Array();
	var productpriceArray=new Array();
	var productdescriptionArray=new Array();
	<c:forEach var="pi" items="${theproductinformationfound}">
		muidArray.push('${pi.muid}');
		productnameArray.push('${pi.productname}');
		producttypesArray.push('${pi.producttypes}');
		productpriceArray.push('${pi.productprice}');
		productdescriptionArray.push('${pi.productdescription}');
	</c:forEach>
		//总记录条数
	var np=productnameArray.length;
		//总页数
	var numberOFProductpages;
	if(np%10==0){
		numberOFProductpages=np/10;
	}else{
		numberOFProductpages=Math.ceil(np/10);
	}
	if(numberOFProductpages==0)
		numberOFProductpages=1;
		//现在所在页数
	var nownumberOFProductpages=1;
		//页数显示信息
	$("#productpages").text(nownumberOFProductpages+'/'+numberOFProductpages);
		//进入产品点击事件
	function inproduct(button){
		var muid=button.getAttribute("id");
		var productname=button.children[0].children[0].innerHTML;
		
		var temp=button.children[0].children[1].innerHTML.trim().indexOf('<')
		
		var producttypes=button.children[0].children[1].innerHTML.substring(0,temp);
		location.pathname="${pageContext.request.contextPath}/toprocutinformationpage/"+muid+"/"+producttypes+"/"+productname;
	}
		//鼠标进入产品，显示产品详情事件
		function onmousemovetoproduct(button){
			var temp = button.getAttribute("productdescription");
			var descriptionbody = document.getElementById("descriptionbody").innerHTML=temp;
			var descriptiondiv = document.getElementById("descriptiondiv").style.display="inline";
		}
		//鼠标退出
		function onmouseoutproduct(){
			var descriptiondiv = document.getElementById("descriptiondiv").style.display="none";
		}
		//初始化产品信息显示
	for(var i=(nownumberOFProductpages-1)*10;i<(nownumberOFProductpages-1)*10+10;i++){
		if(i+1>np)
			break;
		var productinformationdiv;
		var x=i%10;
		if(x<5){
			productinformationdiv="<div id='"+muidArray[i]+"' productdescription='"+productdescriptionArray[i]+"' onclick='inproduct(this)' onmousemove='onmousemovetoproduct(this)' onmouseout='onmouseoutproduct()' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+productnameArray[i]+"</h5><p class='card-text'>"+producttypesArray[i]+"<br/>价格："+productpriceArray[i]+"元</p></div></div>"
			$("#productbody").prepend(productinformationdiv);
			continue;
		}
		productinformationdiv="<div id='"+muidArray[i]+"' productdescription='"+productdescriptionArray[i]+"' onclick='inproduct(this)' onmousemove='onmousemovetoproduct(this)' onmouseout='onmouseoutproduct()' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+productnameArray[i]+"</h5><p class='card-text'>"+producttypesArray[i]+"<br/>价格："+productpriceArray[i]+"元</p></div></div>";
		$("#productbody").prepend(productinformationdiv);

	}
	
	/****************************************************************************/
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
	//查看全部店铺信息
	$("#allstore").click(function(){
		location.assign("${pageContext.request.contextPath}/toallStorepage");
	});
	//查看/店铺/信息按钮点击事件
	$("#store").click(function(){
		$("#productdiv").hide(500);
		$("#storeindiv").show(500);
	});
	//查看/产品/信息按钮点击事件
	$("#product").click(function(){
		$("#productdiv").show(500);
		$("#storeindiv").hide(500);
	});
	//产品-上一页点击事件
	$("#productpreviouspage").click(function(){
		if(nownumberOFProductpages==1)
			return;
		nownumberOFProductpages--;
		$("#productpages").text(nownumberOFProductpages+'/'+numberOFProductpages);
		$("#productbody").empty();
		
		for(var i=(nownumberOFProductpages-1)*10;i<(nownumberOFProductpages-1)*10+10;i++){
			if(i+1>np)
				break;
			var productinformationdiv;
			var x=i%10;
			if(x<5){
				productinformationdiv="<div id='"+muidArray[i]+"' productdescription='"+productdescriptionArray[i]+"' onclick='inproduct(this)' onmousemove='onmousemovetoproduct(this)' onmouseout='onmouseoutproduct()' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+productnameArray[i]+"</h5><p class='card-text'>"+producttypesArray[i]+"<br/>价格："+productpriceArray[i]+"元</p></div></div>"
				$("#productbody").prepend(productinformationdiv);
				continue;
			}
			productinformationdiv="<div id='"+muidArray[i]+"' productdescription='"+productdescriptionArray[i]+"' onclick='inproduct(this)' onmousemove='onmousemovetoproduct(this)' onmouseout='onmouseoutproduct()' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+productnameArray[i]+"</h5><p class='card-text'>"+producttypesArray[i]+"<br/>价格："+productpriceArray[i]+"元</p></div></div>";
			$("#productbody").prepend(productinformationdiv);

		}
	});
	//产品-下一页点击事件
	$("#productnextpage").click(function(){
		if(nownumberOFProductpages==numberOFProductpages)
			return;
		nownumberOFProductpages++;
		$("#productpages").text(nownumberOFProductpages+'/'+numberOFProductpages);
		$("#productbody").empty();
		
		for(var i=(nownumberOFProductpages-1)*10;i<(nownumberOFProductpages-1)*10+10;i++){
			if(i+1>np)
				break;
			var productinformationdiv;
			var x=i%10;
			if(x<5){
				productinformationdiv="<div id='"+muidArray[i]+"' productdescription='"+productdescriptionArray[i]+"' onclick='inproduct(this)' onmousemove='onmousemovetoproduct(this)' onmouseout='onmouseoutproduct()' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+productnameArray[i]+"</h5><p class='card-text'>"+producttypesArray[i]+"<br/>价格："+productpriceArray[i]+"元</p></div></div>"
				$("#productbody").prepend(productinformationdiv);
				continue;
			}
			productinformationdiv="<div id='"+muidArray[i]+"' productdescription='"+productdescriptionArray[i]+"' onclick='inproduct(this)' onmousemove='onmousemovetoproduct(this)' onmouseout='onmouseoutproduct()' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+productnameArray[i]+"</h5><p class='card-text'>"+producttypesArray[i]+"<br/>价格："+productpriceArray[i]+"元</p></div></div>";
			$("#productbody").prepend(productinformationdiv);

		}
	});
	//店铺-上一页点击事件
	$("#storepreviouspage").click(function(){
		if(nownumberOFStorepages==1)
			return;
		nownumberOFStorepages--;
		$("#storepages").text(nownumberOFStorepages+'/'+numberOFStorepages);
		$("#storebody").empty();
		
		for(var i=(nownumberOFStorepages-1)*10;i<(nownumberOFStorepages-1)*10+10;i++){
			if(i+1>ns)
				break;
			var storeinformationdiv;
			var x=i%10;
			if(x<5){
				storeinformationdiv="<div id='"+storePhoneNumberArray[i]+"' onclick='instore(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+stornameArray[i]+"</h5><p class='card-text'>"+storetypeArray[i]+"<br>配送费："+deliveryfeeArray[i]+"元</p></div></div>"
				$("#storebody").prepend(storeinformationdiv);
				continue;
			}
			storeinformationdiv="<div id='"+storePhoneNumberArray[i]+"' onclick='instore(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+stornameArray[i]+"</h5><p class='card-text'>"+storetypeArray[i]+"<br>配送费："+deliveryfeeArray[i]+"元</p></div></div>";
			$("#storebody").prepend(storeinformationdiv);
		}
	});
	//店铺-下一页点击事件
	$("#storenextpage").click(function(){
		if(nownumberOFStorepages==numberOFStorepages)
			return;
		nownumberOFStorepages++;
		$("#storepages").text(nownumberOFStorepages+'/'+numberOFStorepages);
		$("#storebody").empty();
		
		for(var i=(nownumberOFStorepages-1)*10;i<(nownumberOFStorepages-1)*10+10;i++){
			if(i+1>ns)
				break;
			var storeinformationdiv;
			var x=i%10;
			if(x<5){
				storeinformationdiv="<div id='"+storePhoneNumberArray[i]+"' onclick='instore(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+stornameArray[i]+"</h5><p class='card-text'>"+storetypeArray[i]+"<br>配送费："+deliveryfeeArray[i]+"元</p></div></div>"
				$("#storebody").prepend(storeinformationdiv);
				continue;
			}
			storeinformationdiv="<div id='"+storePhoneNumberArray[i]+"' onclick='instore(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+stornameArray[i]+"</h5><p class='card-text'>"+storetypeArray[i]+"<br>配送费："+deliveryfeeArray[i]+"元</p></div></div>";
			$("#storebody").prepend(storeinformationdiv);
		}
	});

});
</script>
</html>