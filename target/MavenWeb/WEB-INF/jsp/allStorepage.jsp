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
<title>所有店铺信息</title>
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
			<div style="text-align:center; position: absolute;top: 10%;left: 0%;width: 100%;height: 10%;">
				<p style="font-size: 25px;" class="text-secondary">所有店铺信息</p>
				<hr class="text-muted" style="width: 80%;"/>
			</div>
			<!-- 中间类别按钮 -->
			<div style="position: absolute;top: 22%;left: 0%;width: 100%;height: 5%;">
				<p class="text-muted" style="position: absolute;left: 15%;top:0%;">全部类别：</p>
				
				<span id="alltype" class="badge badge-secondary" style="position: absolute;left: 23%;top:5%;">全部类别</span>
				
				<span id="type1" class="badge badge-pill badge-primary"style="position: absolute;left: 30%;top:5%;">快餐便当</span>
				<span id="type2" class="badge badge-pill badge-success"style="position: absolute;left: 37%;top:5%;">特色菜系</span>
				<span id="type3" class="badge badge-pill badge-danger"style="position: absolute;left: 44%;top:5%;">全球美食</span>
				<span id="type4" class="badge badge-pill badge-warning"style="position: absolute;left: 51%;top:5%;">甜品饮品</span>
				<span id="type5" class="badge badge-pill badge-info"style="position: absolute;left: 58%;top:5%;">商店超市</span>
				<span id="type6" class="badge badge-pill badge-light"style="position: absolute;left: 65%;top:5%;">小吃夜宵</span>
				<span id="type7" class="badge badge-pill badge-secondary"style="position: absolute;left: 72%;top:5%;">鲜花绿植</span>
				<span id="type8" class="badge badge-pill badge-dark"style="position: absolute;left: 79%;top:5%;">医药健康 </span>
			</div>
			<!-- 底部搜索得到的店铺信息 -->
			<!-- alltype -->
			<div id="alltypediv" style="text-align:center; position: absolute;top: 29%;left: 0%;width: 100%;height: 70%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">所有店铺信息</div>
				  	<div class="card-body">
				  		<div id="alltypebody">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="alltypepreviouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="alltypepages"></span>
							<span id="alltypenextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
			<!-- type1 -->
			<div id="type1div" style="display:none; text-align:center; position: absolute;top: 29%;left: 0%;width: 100%;height: 70%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">快餐便当-类</div>
				  	<div class="card-body">
				  		<div id="type1body">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="type1previouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="type1pages"></span>
							<span id="type1nextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
			<!-- type2 -->
			<div id="type2div" style="display:none; text-align:center; position: absolute;top: 29%;left: 0%;width: 100%;height: 70%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">特色菜系-类</div>
				  	<div class="card-body">
				  		<div id="type2body">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="type2previouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="type2pages"></span>
							<span id="type2nextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
			<!-- type3 -->
			<div id="type3div" style="display:none; text-align:center; position: absolute;top: 29%;left: 0%;width: 100%;height: 70%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">全球美食-类</div>
				  	<div class="card-body">
				  		<div id="type3body">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="type3previouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="type3pages"></span>
							<span id="type3nextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
			<!-- type4 -->
			<div id="type4div" style="display:none; text-align:center; position: absolute;top: 29%;left: 0%;width: 100%;height: 70%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">甜品饮品-类</div>
				  	<div class="card-body">
				  		<div id="type4body">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="type4previouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="type4pages"></span>
							<span id="type4nextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
			<!-- type5 -->
			<div id="type5div" style="display:none; text-align:center; position: absolute;top: 29%;left: 0%;width: 100%;height: 70%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">商店超市-类</div>
				  	<div class="card-body">
				  		<div id="type5body">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="type5previouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="type5pages"></span>
							<span id="type5nextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
			<!-- type6 -->
			<div id="type6div" style="display:none; text-align:center; position: absolute;top: 29%;left: 0%;width: 100%;height: 70%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">小吃夜宵-类</div>
				  	<div class="card-body">
				  		<div id="type6body">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="type6previouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="type6pages"></span>
							<span id="type6nextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
			<!-- type7 -->
			<div id="type7div" style="display:none; text-align:center; position: absolute;top: 29%;left: 0%;width: 100%;height: 70%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">鲜花绿植-类</div>
				  	<div class="card-body">
				  		<div id="type7body">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="type7previouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="type7pages"></span>
							<span id="type7nextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
			<!-- type8 -->
			<div id="type8div" style="display:none; text-align:center; position: absolute;top: 29%;left: 0%;width: 100%;height: 70%;">
				<div  class="card text-white bg-secondary mb-3" style="position: absolute;width: 80%;height:97%; top:0%;left: 10%;">
				  <div class="card-header">医药健康-类</div>
				  	<div class="card-body">
				  		<div id="type8body">
				  		</div>
				  		<!-- 页数信息 -->
				  		<div style="position:absolute;left:0%; width:100%;height:10%;top:90%;">
							<span id="type8previouspage" class="badge badge-pill badge-light">上一页</span>
							<span id="type8pages"></span>
							<span id="type8nextpage" class="badge badge-pill badge-light">下一页</span>
						</div>
					</div>
				</div>
			</div>
	</div>
</body>
<script type="text/javascript">
	/****************************************************************************/
	//type0店铺信息初始化
	var type0storePhoneNumberArray=new Array();
	var type0stornameArray=new Array();
	var type0storetypeArray=new Array();
	var type0deliveryfeeArray=new Array();
	<c:forEach var="storeinformation" items="${alltype}">
		type0storePhoneNumberArray.push('${storeinformation.phone}');
		type0stornameArray.push('${storeinformation.name}');
		type0storetypeArray.push('${storeinformation.storetype}');
		type0deliveryfeeArray.push('${storeinformation.deliveryfee}');
	</c:forEach>
		//总记录条数
	var nstype0=type0storePhoneNumberArray.length;
		//总页数
	var numberOFtype0Storepages;
	if(nstype0%10==0){
		numberOFtype0Storepages=nstype0/10;
	}else{
		numberOFtype0Storepages=Math.ceil(nstype0/10);
	}
	if(numberOFtype0Storepages==0)
		numberOFtype0Storepages=1;
		//现在所在页数
	var nownumberOFtype0Storepages=1;
		//页数显示信息
	$("#alltypepages").text(nownumberOFtype0Storepages+'/'+numberOFtype0Storepages);
		//type0进入店铺点击事件
	function instoretype0(obj){
		var phone=obj.id;
		location.assign("${pageContext.request.contextPath}/tostorepage/"+phone);
	}
		//初始化店铺信息显示
	for(var i=(nownumberOFtype0Storepages-1)*10;i<(nownumberOFtype0Storepages-1)*10+10;i++){
		if(i+1>nstype0)
			break;
		var storeinformationdiv;
		var x=i%10;
		if(x<5){
			storeinformationdiv="<div id='"+type0storePhoneNumberArray[i]+"' onclick='instoretype0(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type0stornameArray[i]+"</h5><p class='card-text'>"+type0storetypeArray[i]+"<br>配送费："+type0deliveryfeeArray[i]+"元</p></div></div>"
			$("#alltypebody").prepend(storeinformationdiv);
			continue;
		}
		storeinformationdiv="<div id='"+type0storePhoneNumberArray[i]+"' onclick='instoretype0(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type0stornameArray[i]+"</h5><p class='card-text'>"+type0storetypeArray[i]+"<br>配送费："+type0deliveryfeeArray[i]+"元</p></div></div>";
		$("#alltypebody").prepend(storeinformationdiv);
	}
	
	$(function(){
		//店铺-上一页点击事件
		$("#alltypepreviouspage").click(function(){
			if(nownumberOFtype0Storepages==1)
				return;
			nownumberOFtype0Storepages--;
			$("#alltypepages").text(nownumberOFtype0Storepages+'/'+numberOFtype0Storepages);
			$("#alltypebody").empty();
			
			for(var i=(nownumberOFtype0Storepages-1)*10;i<(nownumberOFtype0Storepages-1)*10+10;i++){
				if(i+1>nstype0)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type0storePhoneNumberArray[i]+"' onclick='instoretype0(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type0stornameArray[i]+"</h5><p class='card-text'>"+type0storetypeArray[i]+"<br>配送费："+type0deliveryfeeArray[i]+"元</p></div></div>"
					$("#alltypebody").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type0storePhoneNumberArray[i]+"' onclick='instoretype0(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type0stornameArray[i]+"</h5><p class='card-text'>"+type0storetypeArray[i]+"<br>配送费："+type0deliveryfeeArray[i]+"元</p></div></div>";
				$("#alltypebody").prepend(storeinformationdiv);
			}
		});
		//店铺-下一页点击事件
		$("#alltypenextpage").click(function(){
			if(nownumberOFtype0Storepages==numberOFtype0Storepages)
				return;
			nownumberOFtype0Storepages++;
			$("#alltypepages").text(nownumberOFtype0Storepages+'/'+numberOFtype0Storepages);
			$("#alltypebody").empty();
			
			for(var i=(nownumberOFtype0Storepages-1)*10;i<(nownumberOFtype0Storepages-1)*10+10;i++){
				if(i+1>nstype0)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type0storePhoneNumberArray[i]+"' onclick='instoretype0(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type0stornameArray[i]+"</h5><p class='card-text'>"+type0storetypeArray[i]+"<br>配送费："+type0deliveryfeeArray[i]+"元</p></div></div>"
					$("#alltypebody").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type0storePhoneNumberArray[i]+"' onclick='instoretype0(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type0stornameArray[i]+"</h5><p class='card-text'>"+type0storetypeArray[i]+"<br>配送费："+type0deliveryfeeArray[i]+"元</p></div></div>";
				$("#alltypebody").prepend(storeinformationdiv);
			}
		});
	});
	/****************************************************************************/

	//type1店铺信息初始化
	var type1storePhoneNumberArray=new Array();
	var type1stornameArray=new Array();
	var type1storetypeArray=new Array();
	var type1deliveryfeeArray=new Array();
	<c:forEach var="storeinformation" items="${type1}">
		type1storePhoneNumberArray.push('${storeinformation.phone}');
		type1stornameArray.push('${storeinformation.name}');
		type1storetypeArray.push('${storeinformation.storetype}');
		type1deliveryfeeArray.push('${storeinformation.deliveryfee}');
	</c:forEach>
		//总记录条数
	var nstype1=type1storePhoneNumberArray.length;
		//总页数
	var numberOFtype1Storepages;
	if(nstype1%10==0){
		numberOFtype1Storepages=nstype1/10;
	}else{
		numberOFtype1Storepages=Math.ceil(nstype1/10);
	}
	if(numberOFtype1Storepages==0)
		numberOFtype1Storepages=1;
		//现在所在页数
	var nownumberOFtype1Storepages=1;
		//页数显示信息
	$("#type1pages").text(nownumberOFtype1Storepages+'/'+numberOFtype1Storepages);
		//type0进入店铺点击事件
	function instoretype1(obj){
		var phone=obj.id;
		location.assign("${pageContext.request.contextPath}/tostorepage/"+phone);
	}
		//初始化店铺信息显示
	for(var i=(nownumberOFtype1Storepages-1)*10;i<(nownumberOFtype1Storepages-1)*10+10;i++){
		if(i+1>nstype1)
			break;
		var storeinformationdiv;
		var x=i%10;
		if(x<5){
			storeinformationdiv="<div id='"+type1storePhoneNumberArray[i]+"' onclick='instoretype1(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type1stornameArray[i]+"</h5><p class='card-text'>"+type1storetypeArray[i]+"<br>配送费："+type1deliveryfeeArray[i]+"元</p></div></div>"
			$("#type1body").prepend(storeinformationdiv);
			continue;
		}
		storeinformationdiv="<div id='"+type1storePhoneNumberArray[i]+"' onclick='instoretype1(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type1stornameArray[i]+"</h5><p class='card-text'>"+type1storetypeArray[i]+"<br>配送费："+type1deliveryfeeArray[i]+"元</p></div></div>";
		$("#type1body").prepend(storeinformationdiv);
	}
	
	$(function(){
		//店铺-上一页点击事件
		$("#type1previouspage").click(function(){
			if(nownumberOFtype1Storepages==1)
				return;
			nownumberOFtype1Storepages--;
			$("#type1pages").text(nownumberOFtype1Storepages+'/'+numberOFtype1Storepages);
			$("#type1body").empty();
			
			for(var i=(nownumberOFtype1Storepages-1)*10;i<(nownumberOFtype1Storepages-1)*10+10;i++){
				if(i+1>nstype1)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type1storePhoneNumberArray[i]+"' onclick='instoretype1(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type1stornameArray[i]+"</h5><p class='card-text'>"+type1storetypeArray[i]+"<br>配送费："+type1deliveryfeeArray[i]+"元</p></div></div>"
					$("#type1body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type1storePhoneNumberArray[i]+"' onclick='instoretype1(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type1stornameArray[i]+"</h5><p class='card-text'>"+type1storetypeArray[i]+"<br>配送费："+type1deliveryfeeArray[i]+"元</p></div></div>";
				$("#type1body").prepend(storeinformationdiv);
			}
		});
		//店铺-下一页点击事件
		$("#type1nextpage").click(function(){
			if(nownumberOFtype1Storepages==numberOFtype1Storepages)
				return;
			nownumberOFtype1Storepages++;
			$("#type1pages").text(nownumberOFtype1Storepages+'/'+numberOFtype1Storepages);
			$("#type1body").empty();
			
			for(var i=(nownumberOFtype1Storepages-1)*10;i<(nownumberOFtype1Storepages-1)*10+10;i++){
				if(i+1>nstype1)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type1storePhoneNumberArray[i]+"' onclick='instoretype1(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type1stornameArray[i]+"</h5><p class='card-text'>"+type1storetypeArray[i]+"<br>配送费："+type1deliveryfeeArray[i]+"元</p></div></div>"
					$("#type1body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type1storePhoneNumberArray[i]+"' onclick='instoretype1(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type1stornameArray[i]+"</h5><p class='card-text'>"+type1storetypeArray[i]+"<br>配送费："+type1deliveryfeeArray[i]+"元</p></div></div>";
				$("#type1body").prepend(storeinformationdiv);
			}
		});
	});
	/****************************************************************************/
	//type2店铺信息初始化
	var type2storePhoneNumberArray=new Array();
	var type2stornameArray=new Array();
	var type2storetypeArray=new Array();
	var type2deliveryfeeArray=new Array();
	<c:forEach var="storeinformation" items="${type2}">
		type2storePhoneNumberArray.push('${storeinformation.phone}');
		type2stornameArray.push('${storeinformation.name}');
		type2storetypeArray.push('${storeinformation.storetype}');
		type2deliveryfeeArray.push('${storeinformation.deliveryfee}');
	</c:forEach>
		//总记录条数
	var nstype2=type2storePhoneNumberArray.length;
		//总页数
	var numberOFtype2Storepages;
	if(nstype2%10==0){
		numberOFtype2Storepages=nstype2/10;
	}else{
		numberOFtype2Storepages=Math.ceil(nstype2/10);
	}
	if(numberOFtype2Storepages==0)
		numberOFtype2Storepages=1;
		//现在所在页数
	var nownumberOFtype2Storepages=1;
		//页数显示信息
	$("#type2pages").text(nownumberOFtype2Storepages+'/'+numberOFtype2Storepages);
		//type0进入店铺点击事件
	function instoretype2(obj){
		var phone=obj.id;
		location.assign("${pageContext.request.contextPath}/tostorepage/"+phone);
	}
		//初始化店铺信息显示
	for(var i=(nownumberOFtype2Storepages-1)*10;i<(nownumberOFtype2Storepages-1)*10+10;i++){
		if(i+1>nstype2)
			break;
		var storeinformationdiv;
		var x=i%10;
		if(x<5){
			storeinformationdiv="<div id='"+type2storePhoneNumberArray[i]+"' onclick='instoretype2(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type2stornameArray[i]+"</h5><p class='card-text'>"+type2storetypeArray[i]+"<br>配送费："+type2deliveryfeeArray[i]+"元</p></div></div>"
			$("#type2body").prepend(storeinformationdiv);
			continue;
		}
		storeinformationdiv="<div id='"+type2storePhoneNumberArray[i]+"' onclick='instoretype2(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type2stornameArray[i]+"</h5><p class='card-text'>"+type2storetypeArray[i]+"<br>配送费："+type2deliveryfeeArray[i]+"元</p></div></div>";
		$("#type2body").prepend(storeinformationdiv);
	}
	
	$(function(){
		//店铺-上一页点击事件
		$("#type2previouspage").click(function(){
			if(nownumberOFtype2Storepages==1)
				return;
			nownumberOFtype2Storepages--;
			$("#type2pages").text(nownumberOFtype2Storepages+'/'+numberOFtype2Storepages);
			$("#type2body").empty();
			
			for(var i=(nownumberOFtype2Storepages-1)*10;i<(nownumberOFtype2Storepages-1)*10+10;i++){
				if(i+1>nstype2)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type2storePhoneNumberArray[i]+"' onclick='instoretype2(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type2stornameArray[i]+"</h5><p class='card-text'>"+type2storetypeArray[i]+"<br>配送费："+type2deliveryfeeArray[i]+"元</p></div></div>"
					$("#type2body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type2storePhoneNumberArray[i]+"' onclick='instoretype2(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type2stornameArray[i]+"</h5><p class='card-text'>"+type2storetypeArray[i]+"<br>配送费："+type2deliveryfeeArray[i]+"元</p></div></div>";
				$("#type2body").prepend(storeinformationdiv);
			}
		});
		//店铺-下一页点击事件
		$("#type2nextpage").click(function(){
			if(nownumberOFtype2Storepages==numberOFtype2Storepages)
				return;
			nownumberOFtype2Storepages++;
			$("#type2pages").text(nownumberOFtype2Storepages+'/'+numberOFtype2Storepages);
			$("#type2body").empty();
			
			for(var i=(nownumberOFtype2Storepages-1)*10;i<(nownumberOFtype2Storepages-1)*10+10;i++){
				if(i+1>nstype2)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type2storePhoneNumberArray[i]+"' onclick='instoretype2(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type2stornameArray[i]+"</h5><p class='card-text'>"+type2storetypeArray[i]+"<br>配送费："+type2deliveryfeeArray[i]+"元</p></div></div>"
					$("#type2body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type2storePhoneNumberArray[i]+"' onclick='instoretype2(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type2stornameArray[i]+"</h5><p class='card-text'>"+type2storetypeArray[i]+"<br>配送费："+type2deliveryfeeArray[i]+"元</p></div></div>";
				$("#type2body").prepend(storeinformationdiv);
			}
		});
	});
	/****************************************************************************/

	//type3店铺信息初始化
	var type3storePhoneNumberArray=new Array();
	var type3stornameArray=new Array();
	var type3storetypeArray=new Array();
	var type3deliveryfeeArray=new Array();
	<c:forEach var="storeinformation" items="${type3}">
		type3storePhoneNumberArray.push('${storeinformation.phone}');
		type3stornameArray.push('${storeinformation.name}');
		type3storetypeArray.push('${storeinformation.storetype}');
		type3deliveryfeeArray.push('${storeinformation.deliveryfee}');
	</c:forEach>
		//总记录条数
	var nstype3=type3storePhoneNumberArray.length;
		//总页数
	var numberOFtype3Storepages;
	if(nstype3%10==0){
		numberOFtype3Storepages=nstype3/10;
	}else{
		numberOFtype3Storepages=Math.ceil(nstype3/10);
	}
	if(numberOFtype3Storepages==0)
		numberOFtype3Storepages=1;
		//现在所在页数
	var nownumberOFtype3Storepages=1;
		//页数显示信息
	$("#type3pages").text(nownumberOFtype3Storepages+'/'+numberOFtype3Storepages);
		//type3进入店铺点击事件
	function instoretype3(obj){
		var phone=obj.id;
		location.assign("${pageContext.request.contextPath}/tostorepage/"+phone);
	}
		//初始化店铺信息显示
	for(var i=(nownumberOFtype3Storepages-1)*10;i<(nownumberOFtype3Storepages-1)*10+10;i++){
		if(i+1>nstype3)
			break;
		var storeinformationdiv;
		var x=i%10;
		if(x<5){
			storeinformationdiv="<div id='"+type3storePhoneNumberArray[i]+"' onclick='instoretype3(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type3stornameArray[i]+"</h5><p class='card-text'>"+type3storetypeArray[i]+"<br>配送费："+type3deliveryfeeArray[i]+"元</p></div></div>"
			$("#type3body").prepend(storeinformationdiv);
			continue;
		}
		storeinformationdiv="<div id='"+type3storePhoneNumberArray[i]+"' onclick='instoretype3(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type3stornameArray[i]+"</h5><p class='card-text'>"+type3storetypeArray[i]+"<br>配送费："+type3deliveryfeeArray[i]+"元</p></div></div>";
		$("#type3body").prepend(storeinformationdiv);
	}
	
	$(function(){
		//店铺-上一页点击事件
		$("#type3previouspage").click(function(){
			if(nownumberOFtype3Storepages==1)
				return;
			nownumberOFtype3Storepages--;
			$("#type3pages").text(nownumberOFtype3Storepages+'/'+numberOFtype3Storepages);
			$("#type3body").empty();
			
			for(var i=(nownumberOFtype3Storepages-1)*10;i<(nownumberOFtype3Storepages-1)*10+10;i++){
				if(i+1>nstype3)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type3storePhoneNumberArray[i]+"' onclick='instoretype3(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type3stornameArray[i]+"</h5><p class='card-text'>"+type3storetypeArray[i]+"<br>配送费："+type3deliveryfeeArray[i]+"元</p></div></div>"
					$("#type3body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type3storePhoneNumberArray[i]+"' onclick='instoretype3(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type3stornameArray[i]+"</h5><p class='card-text'>"+type3storetypeArray[i]+"<br>配送费："+type3deliveryfeeArray[i]+"元</p></div></div>";
				$("#type3body").prepend(storeinformationdiv);
			}
		});
		//店铺-下一页点击事件
		$("#type3nextpage").click(function(){
			if(nownumberOFtype3Storepages==numberOFtype3Storepages)
				return;
			nownumberOFtype3Storepages++;
			$("#type3pages").text(nownumberOFtype3Storepages+'/'+numberOFtype3Storepages);
			$("#type3body").empty();
			
			for(var i=(nownumberOFtype3Storepages-1)*10;i<(nownumberOFtype3Storepages-1)*10+10;i++){
				if(i+1>nstype3)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type3storePhoneNumberArray[i]+"' onclick='instoretype3(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type3stornameArray[i]+"</h5><p class='card-text'>"+type3storetypeArray[i]+"<br>配送费："+type3deliveryfeeArray[i]+"元</p></div></div>"
					$("#type3body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type3storePhoneNumberArray[i]+"' onclick='instoretype3(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type3stornameArray[i]+"</h5><p class='card-text'>"+type3storetypeArray[i]+"<br>配送费："+type3deliveryfeeArray[i]+"元</p></div></div>";
				$("#type3body").prepend(storeinformationdiv);
			}
		});
	});
	/****************************************************************************/
	//type4店铺信息初始化
	var type4storePhoneNumberArray=new Array();
	var type4stornameArray=new Array();
	var type4storetypeArray=new Array();
	var type4deliveryfeeArray=new Array();
	<c:forEach var="storeinformation" items="${type4}">
		type4storePhoneNumberArray.push('${storeinformation.phone}');
		type4stornameArray.push('${storeinformation.name}');
		type4storetypeArray.push('${storeinformation.storetype}');
		type4deliveryfeeArray.push('${storeinformation.deliveryfee}');
	</c:forEach>
		//总记录条数
	var nstype4=type4storePhoneNumberArray.length;
		//总页数
	var numberOFtype4Storepages;
	if(nstype4%10==0){
		numberOFtype4Storepages=nstype4/10;
	}else{
		numberOFtype4Storepages=Math.ceil(nstype4/10);
	}
	if(numberOFtype4Storepages==0)
		numberOFtype4Storepages=1;
		//现在所在页数
	var nownumberOFtype4Storepages=1;
		//页数显示信息
	$("#type4pages").text(nownumberOFtype4Storepages+'/'+numberOFtype4Storepages);
		//type0进入店铺点击事件
	function instoretype4(obj){
		var phone=obj.id;
		location.assign("${pageContext.request.contextPath}/tostorepage/"+phone);
	}
		//初始化店铺信息显示
	for(var i=(nownumberOFtype4Storepages-1)*10;i<(nownumberOFtype4Storepages-1)*10+10;i++){
		if(i+1>nstype4)
			break;
		var storeinformationdiv;
		var x=i%10;
		if(x<5){
			storeinformationdiv="<div id='"+type4storePhoneNumberArray[i]+"' onclick='instoretype4(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type4stornameArray[i]+"</h5><p class='card-text'>"+type4storetypeArray[i]+"<br>配送费："+type4deliveryfeeArray[i]+"元</p></div></div>"
			$("#type4body").prepend(storeinformationdiv);
			continue;
		}
		storeinformationdiv="<div id='"+type4storePhoneNumberArray[i]+"' onclick='instoretype4(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type4stornameArray[i]+"</h5><p class='card-text'>"+type4storetypeArray[i]+"<br>配送费："+type4deliveryfeeArray[i]+"元</p></div></div>";
		$("#type4body").prepend(storeinformationdiv);
	}
	
	$(function(){
		//店铺-上一页点击事件
		$("#type4previouspage").click(function(){
			if(nownumberOFtype4Storepages==1)
				return;
			nownumberOFtype4Storepages--;
			$("#type4pages").text(nownumberOFtype4Storepages+'/'+numberOFtype4Storepages);
			$("#type4body").empty();
			
			for(var i=(nownumberOFtype4Storepages-1)*10;i<(nownumberOFtype4Storepages-1)*10+10;i++){
				if(i+1>nstype4)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type4storePhoneNumberArray[i]+"' onclick='instoretype4(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type4stornameArray[i]+"</h5><p class='card-text'>"+type4storetypeArray[i]+"<br>配送费："+type4deliveryfeeArray[i]+"元</p></div></div>"
					$("#type4body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type4storePhoneNumberArray[i]+"' onclick='instoretype4(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type4stornameArray[i]+"</h5><p class='card-text'>"+type4storetypeArray[i]+"<br>配送费："+type4deliveryfeeArray[i]+"元</p></div></div>";
				$("#type4body").prepend(storeinformationdiv);
			}
		});
		//店铺-下一页点击事件
		$("#type4nextpage").click(function(){
			if(nownumberOFtype4Storepages==numberOFtype4Storepages)
				return;
			nownumberOFtype4Storepages++;
			$("#type4pages").text(nownumberOFtype4Storepages+'/'+numberOFtype4Storepages);
			$("#type4body").empty();
			
			for(var i=(nownumberOFtype4Storepages-1)*10;i<(nownumberOFtype4Storepages-1)*10+10;i++){
				if(i+1>nstype4)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type4storePhoneNumberArray[i]+"' onclick='instoretype4(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type4stornameArray[i]+"</h5><p class='card-text'>"+type4storetypeArray[i]+"<br>配送费："+type4deliveryfeeArray[i]+"元</p></div></div>"
					$("#type4body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type4storePhoneNumberArray[i]+"' onclick='instoretype4(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type4stornameArray[i]+"</h5><p class='card-text'>"+type4storetypeArray[i]+"<br>配送费："+type4deliveryfeeArray[i]+"元</p></div></div>";
				$("#type4body").prepend(storeinformationdiv);
			}
		});
	});
	/****************************************************************************/

	//type5店铺信息初始化
	var type5storePhoneNumberArray=new Array();
	var type5stornameArray=new Array();
	var type5storetypeArray=new Array();
	var type5deliveryfeeArray=new Array();
	<c:forEach var="storeinformation" items="${type5}">
		type5storePhoneNumberArray.push('${storeinformation.phone}');
		type5stornameArray.push('${storeinformation.name}');
		type5storetypeArray.push('${storeinformation.storetype}');
		type5deliveryfeeArray.push('${storeinformation.deliveryfee}');
	</c:forEach>
		//总记录条数
	var nstype5=type5storePhoneNumberArray.length;
		//总页数
	var numberOFtype5Storepages;
	if(nstype5%10==0){
		numberOFtype5Storepages=nstype5/10;
	}else{
		numberOFtype5Storepages=Math.ceil(nstype5/10);
	}
	if(numberOFtype5Storepages==0)
		numberOFtype5Storepages=1;
		//现在所在页数
	var nownumberOFtype5Storepages=1;
		//页数显示信息
	$("#type5pages").text(nownumberOFtype5Storepages+'/'+numberOFtype5Storepages);
		//type0进入店铺点击事件
	function instoretype5(obj){
		var phone=obj.id;
		location.assign("${pageContext.request.contextPath}/tostorepage/"+phone);
	}
		//初始化店铺信息显示
	for(var i=(nownumberOFtype5Storepages-1)*10;i<(nownumberOFtype5Storepages-1)*10+10;i++){
		if(i+1>nstype5)
			break;
		var storeinformationdiv;
		var x=i%10;
		if(x<5){
			storeinformationdiv="<div id='"+type5storePhoneNumberArray[i]+"' onclick='instoretype5(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type5stornameArray[i]+"</h5><p class='card-text'>"+type5storetypeArray[i]+"<br>配送费："+type5deliveryfeeArray[i]+"元</p></div></div>"
			$("#type5body").prepend(storeinformationdiv);
			continue;
		}
		storeinformationdiv="<div id='"+type5storePhoneNumberArray[i]+"' onclick='instoretype5(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type5stornameArray[i]+"</h5><p class='card-text'>"+type5storetypeArray[i]+"<br>配送费："+type5deliveryfeeArray[i]+"元</p></div></div>";
		$("#type5body").prepend(storeinformationdiv);
	}
	
	$(function(){
		//店铺-上一页点击事件
		$("#type5previouspage").click(function(){
			if(nownumberOFtype5Storepages==1)
				return;
			nownumberOFtype5Storepages--;
			$("#type5pages").text(nownumberOFtype5Storepages+'/'+numberOFtype5Storepages);
			$("#type5body").empty();
			
			for(var i=(nownumberOFtype5Storepages-1)*10;i<(nownumberOFtype5Storepages-1)*10+10;i++){
				if(i+1>nstype5)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type5storePhoneNumberArray[i]+"' onclick='instoretype5(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type5stornameArray[i]+"</h5><p class='card-text'>"+type5storetypeArray[i]+"<br>配送费："+type5deliveryfeeArray[i]+"元</p></div></div>"
					$("#type5body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type5storePhoneNumberArray[i]+"' onclick='instoretype5(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type5stornameArray[i]+"</h5><p class='card-text'>"+type5storetypeArray[i]+"<br>配送费："+type5deliveryfeeArray[i]+"元</p></div></div>";
				$("#type5body").prepend(storeinformationdiv);
			}
		});
		//店铺-下一页点击事件
		$("#type5nextpage").click(function(){
			if(nownumberOFtype5Storepages==numberOFtype5Storepages)
				return;
			nownumberOFtype5Storepages++;
			$("#type5pages").text(nownumberOFtype5Storepages+'/'+numberOFtype5Storepages);
			$("#type5body").empty();
			
			for(var i=(nownumberOFtype5Storepages-1)*10;i<(nownumberOFtype5Storepages-1)*10+10;i++){
				if(i+1>nstype5)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type5storePhoneNumberArray[i]+"' onclick='instoretype5(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type5stornameArray[i]+"</h5><p class='card-text'>"+type5storetypeArray[i]+"<br>配送费："+type5deliveryfeeArray[i]+"元</p></div></div>"
					$("#type5body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type5storePhoneNumberArray[i]+"' onclick='instoretype5(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type5stornameArray[i]+"</h5><p class='card-text'>"+type5storetypeArray[i]+"<br>配送费："+type5deliveryfeeArray[i]+"元</p></div></div>";
				$("#type5body").prepend(storeinformationdiv);
			}
		});
	});
	/****************************************************************************/
	//type6店铺信息初始化
	var type6storePhoneNumberArray=new Array();
	var type6stornameArray=new Array();
	var type6storetypeArray=new Array();
	var type6deliveryfeeArray=new Array();
	<c:forEach var="storeinformation" items="${type6}">
		type6storePhoneNumberArray.push('${storeinformation.phone}');
		type6stornameArray.push('${storeinformation.name}');
		type6storetypeArray.push('${storeinformation.storetype}');
		type6deliveryfeeArray.push('${storeinformation.deliveryfee}');
	</c:forEach>
		//总记录条数
	var nstype6=type6storePhoneNumberArray.length;
		//总页数
	var numberOFtype6Storepages;
	if(nstype6%10==0){
		numberOFtype6Storepages=nstype6/10;
	}else{
		numberOFtype6Storepages=Math.ceil(nstype6/10);
	}
	if(numberOFtype6Storepages==0)
		numberOFtype6Storepages=1;
		//现在所在页数
	var nownumberOFtype6Storepages=1;
		//页数显示信息
	$("#type6pages").text(nownumberOFtype6Storepages+'/'+numberOFtype6Storepages);
		//type6进入店铺点击事件
	function instoretype6(obj){
		var phone=obj.id;
		location.assign("${pageContext.request.contextPath}/tostorepage/"+phone);
	}
		//初始化店铺信息显示
	for(var i=(nownumberOFtype6Storepages-1)*10;i<(nownumberOFtype6Storepages-1)*10+10;i++){
		if(i+1>nstype6)
			break;
		var storeinformationdiv;
		var x=i%10;
		if(x<5){
			storeinformationdiv="<div id='"+type6storePhoneNumberArray[i]+"' onclick='instoretype6(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type6stornameArray[i]+"</h5><p class='card-text'>"+type6storetypeArray[i]+"<br>配送费："+type6deliveryfeeArray[i]+"元</p></div></div>"
			$("#type6body").prepend(storeinformationdiv);
			continue;
		}
		storeinformationdiv="<div id='"+type6storePhoneNumberArray[i]+"' onclick='instoretype6(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type6stornameArray[i]+"</h5><p class='card-text'>"+type6storetypeArray[i]+"<br>配送费："+type6deliveryfeeArray[i]+"元</p></div></div>";
		$("#type6body").prepend(storeinformationdiv);
	}
	
	$(function(){
		//店铺-上一页点击事件
		$("#type6previouspage").click(function(){
			if(nownumberOFtype6Storepages==1)
				return;
			nownumberOFtype6Storepages--;
			$("#type6pages").text(nownumberOFtype6Storepages+'/'+numberOFtype6Storepages);
			$("#type6body").empty();
			
			for(var i=(nownumberOFtype6Storepages-1)*10;i<(nownumberOFtype6Storepages-1)*10+10;i++){
				if(i+1>nstype6)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type6storePhoneNumberArray[i]+"' onclick='instoretype6(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type6stornameArray[i]+"</h5><p class='card-text'>"+type6storetypeArray[i]+"<br>配送费："+type6deliveryfeeArray[i]+"元</p></div></div>"
					$("#type6body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type6storePhoneNumberArray[i]+"' onclick='instoretype6(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type6stornameArray[i]+"</h5><p class='card-text'>"+type6storetypeArray[i]+"<br>配送费："+type6deliveryfeeArray[i]+"元</p></div></div>";
				$("#type6body").prepend(storeinformationdiv);
			}
		});
		//店铺-下一页点击事件
		$("#type6nextpage").click(function(){
			if(nownumberOFtype6Storepages==numberOFtype6Storepages)
				return;
			nownumberOFtype6Storepages++;
			$("#type6pages").text(nownumberOFtype6Storepages+'/'+numberOFtype6Storepages);
			$("#type6body").empty();
			
			for(var i=(nownumberOFtype6Storepages-1)*10;i<(nownumberOFtype6Storepages-1)*10+10;i++){
				if(i+1>nstype6)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type6storePhoneNumberArray[i]+"' onclick='instoretype6(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type6stornameArray[i]+"</h5><p class='card-text'>"+type6storetypeArray[i]+"<br>配送费："+type6deliveryfeeArray[i]+"元</p></div></div>"
					$("#type6body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type6storePhoneNumberArray[i]+"' onclick='instoretype6(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type6stornameArray[i]+"</h5><p class='card-text'>"+type6storetypeArray[i]+"<br>配送费："+type6deliveryfeeArray[i]+"元</p></div></div>";
				$("#type6body").prepend(storeinformationdiv);
			}
		});
	});
	/****************************************************************************/
	//type7店铺信息初始化
	var type7storePhoneNumberArray=new Array();
	var type7stornameArray=new Array();
	var type7storetypeArray=new Array();
	var type7deliveryfeeArray=new Array();
	<c:forEach var="storeinformation" items="${type7}">
		type7storePhoneNumberArray.push('${storeinformation.phone}');
		type7stornameArray.push('${storeinformation.name}');
		type7storetypeArray.push('${storeinformation.storetype}');
		type7deliveryfeeArray.push('${storeinformation.deliveryfee}');
	</c:forEach>
		//总记录条数
	var nstype7=type7storePhoneNumberArray.length;
		//总页数
	var numberOFtype7Storepages;
	if(nstype7%10==0){
		numberOFtype7Storepages=nstype7/10;
	}else{
		numberOFtype7Storepages=Math.ceil(nstype7/10);
	}
	if(numberOFtype7Storepages==0)
		numberOFtype7Storepages=1;
		//现在所在页数
	var nownumberOFtype7Storepages=1;
		//页数显示信息
	$("#type7pages").text(nownumberOFtype7Storepages+'/'+numberOFtype7Storepages);
		//type0进入店铺点击事件
	function instoretype7(obj){
		var phone=obj.id;
		location.assign("${pageContext.request.contextPath}/tostorepage/"+phone);
	}
		//初始化店铺信息显示
	for(var i=(nownumberOFtype7Storepages-1)*10;i<(nownumberOFtype7Storepages-1)*10+10;i++){
		if(i+1>nstype7)
			break;
		var storeinformationdiv;
		var x=i%10;
		if(x<5){
			storeinformationdiv="<div id='"+type7storePhoneNumberArray[i]+"' onclick='instoretype7(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type7stornameArray[i]+"</h5><p class='card-text'>"+type7storetypeArray[i]+"<br>配送费："+type7deliveryfeeArray[i]+"元</p></div></div>"
			$("#type7body").prepend(storeinformationdiv);
			continue;
		}
		storeinformationdiv="<div id='"+type7storePhoneNumberArray[i]+"' onclick='instoretype7(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type7stornameArray[i]+"</h5><p class='card-text'>"+type7storetypeArray[i]+"<br>配送费："+type7deliveryfeeArray[i]+"元</p></div></div>";
		$("#type7body").prepend(storeinformationdiv);
	}
	
	$(function(){
		//店铺-上一页点击事件
		$("#type7previouspage").click(function(){
			if(nownumberOFtype7Storepages==1)
				return;
			nownumberOFtype7Storepages--;
			$("#type7pages").text(nownumberOFtype7Storepages+'/'+numberOFtype7Storepages);
			$("#type7body").empty();
			
			for(var i=(nownumberOFtype7Storepages-1)*10;i<(nownumberOFtype7Storepages-1)*10+10;i++){
				if(i+1>nstype7)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type7storePhoneNumberArray[i]+"' onclick='instoretype7(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type7stornameArray[i]+"</h5><p class='card-text'>"+type7storetypeArray[i]+"<br>配送费："+type7deliveryfeeArray[i]+"元</p></div></div>"
					$("#type7body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type7storePhoneNumberArray[i]+"' onclick='instoretype7(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type7stornameArray[i]+"</h5><p class='card-text'>"+type7storetypeArray[i]+"<br>配送费："+type7deliveryfeeArray[i]+"元</p></div></div>";
				$("#type7body").prepend(storeinformationdiv);
			}
		});
		//店铺-下一页点击事件
		$("#type7nextpage").click(function(){
			if(nownumberOFtype7Storepages==numberOFtype7Storepages)
				return;
			nownumberOFtype7Storepages++;
			$("#type7pages").text(nownumberOFtype7Storepages+'/'+numberOFtype7Storepages);
			$("#type7body").empty();
			
			for(var i=(nownumberOFtype7Storepages-1)*10;i<(nownumberOFtype7Storepages-1)*10+10;i++){
				if(i+1>nstype7)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type7storePhoneNumberArray[i]+"' onclick='instoretype7(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type7stornameArray[i]+"</h5><p class='card-text'>"+type7storetypeArray[i]+"<br>配送费："+type7deliveryfeeArray[i]+"元</p></div></div>"
					$("#type7body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type7storePhoneNumberArray[i]+"' onclick='instoretype7(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type7stornameArray[i]+"</h5><p class='card-text'>"+type7storetypeArray[i]+"<br>配送费："+type7deliveryfeeArray[i]+"元</p></div></div>";
				$("#type7body").prepend(storeinformationdiv);
			}
		});
	});
	/****************************************************************************/
	//type8店铺信息初始化
	var type8storePhoneNumberArray=new Array();
	var type8stornameArray=new Array();
	var type8storetypeArray=new Array();
	var type8deliveryfeeArray=new Array();
	<c:forEach var="storeinformation" items="${type8}">
		type8storePhoneNumberArray.push('${storeinformation.phone}');
		type8stornameArray.push('${storeinformation.name}');
		type8storetypeArray.push('${storeinformation.storetype}');
		type8deliveryfeeArray.push('${storeinformation.deliveryfee}');
	</c:forEach>
		//总记录条数
	var nstype8=type8storePhoneNumberArray.length;
		//总页数
	var numberOFtype8Storepages;
	if(nstype8%10==0){
		numberOFtype8Storepages=nstype8/10;
	}else{
		numberOFtype8Storepages=Math.ceil(nstype8/10);
	}
	if(numberOFtype8Storepages==0)
		numberOFtype8Storepages=1;
		//现在所在页数
	var nownumberOFtype8Storepages=1;
		//页数显示信息
	$("#type8pages").text(nownumberOFtype8Storepages+'/'+numberOFtype8Storepages);
		//type0进入店铺点击事件
	function instoretype8(obj){
		var phone=obj.id;
		location.assign("${pageContext.request.contextPath}/tostorepage/"+phone);
	}
		//初始化店铺信息显示
	for(var i=(nownumberOFtype8Storepages-1)*10;i<(nownumberOFtype8Storepages-1)*10+10;i++){
		if(i+1>nstype8)
			break;
		var storeinformationdiv;
		var x=i%10;
		if(x<5){
			storeinformationdiv="<div id='"+type8storePhoneNumberArray[i]+"' onclick='instoretype8(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type8stornameArray[i]+"</h5><p class='card-text'>"+type8storetypeArray[i]+"<br>配送费："+type8deliveryfeeArray[i]+"元</p></div></div>"
			$("#type8body").prepend(storeinformationdiv);
			continue;
		}
		storeinformationdiv="<div id='"+type8storePhoneNumberArray[i]+"' onclick='instoretype8(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type8stornameArray[i]+"</h5><p class='card-text'>"+type8storetypeArray[i]+"<br>配送费："+type8deliveryfeeArray[i]+"元</p></div></div>";
		$("#type8body").prepend(storeinformationdiv);
	}
	
	$(function(){
		//店铺-上一页点击事件
		$("#type8previouspage").click(function(){
			if(nownumberOFtype8Storepages==1)
				return;
			nownumberOFtype8Storepages--;
			$("#type8pages").text(nownumberOFtype8Storepages+'/'+numberOFtype8Storepages);
			$("#type8body").empty();
			
			for(var i=(nownumberOFtype8Storepages-1)*10;i<(nownumberOFtype8Storepages-1)*10+10;i++){
				if(i+1>nstype8)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type8storePhoneNumberArray[i]+"' onclick='instoretype8(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type8stornameArray[i]+"</h5><p class='card-text'>"+type8storetypeArray[i]+"<br>配送费："+type8deliveryfeeArray[i]+"元</p></div></div>"
					$("#type8body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type8storePhoneNumberArray[i]+"' onclick='instoretype8(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type8stornameArray[i]+"</h5><p class='card-text'>"+type8storetypeArray[i]+"<br>配送费："+type8deliveryfeeArray[i]+"元</p></div></div>";
				$("#type8body").prepend(storeinformationdiv);
			}
		});
		//店铺-下一页点击事件
		$("#type8nextpage").click(function(){
			if(nownumberOFtype8Storepages==numberOFtype8Storepages)
				return;
			nownumberOFtype8Storepages++;
			$("#type8pages").text(nownumberOFtype8Storepages+'/'+numberOFtype8Storepages);
			$("#type8body").empty();
			
			for(var i=(nownumberOFtype8Storepages-1)*10;i<(nownumberOFtype8Storepages-1)*10+10;i++){
				if(i+1>nstype8)
					break;
				var storeinformationdiv;
				var x=i%10;
				if(x<5){
					storeinformationdiv="<div id='"+type8storePhoneNumberArray[i]+"' onclick='instoretype8(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x+1)-15)+"%; width:15%;height:30%;top:15%;'><div class='card-body'><h5 class='card-title'>"+type8stornameArray[i]+"</h5><p class='card-text'>"+type8storetypeArray[i]+"<br>配送费："+type8deliveryfeeArray[i]+"元</p></div></div>"
					$("#type8body").prepend(storeinformationdiv);
					continue;
				}
				storeinformationdiv="<div id='"+type8storePhoneNumberArray[i]+"' onclick='instoretype8(this)' class='card text-white bg-dark mb-3' style='position:absolute;left:"+(19*(x-4)-15)+"%; width:15%;height:30%;top:50%;'><div class='card-body'><h5 class='card-title'>"+type8stornameArray[i]+"</h5><p class='card-text'>"+type8storetypeArray[i]+"<br>配送费："+type8deliveryfeeArray[i]+"元</p></div></div>";
				$("#type8body").prepend(storeinformationdiv);
			}
		});
	});
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
		//alltype按钮点击事件
		$("#alltype").click(function(){
			$("#alltypediv").show(500);
			$("#type1div").hide(500);
			$("#type2div").hide(500);
			$("#type3div").hide(500);
			$("#type4div").hide(500);
			$("#type5div").hide(500);
			$("#type6div").hide(500);
			$("#type7div").hide(500);
			$("#type8div").hide(500);
		});
		//type1按钮点击事件
		$("#type1").click(function(){
			$("#alltypediv").hide(500);
			$("#type1div").show(500);
			$("#type2div").hide(500);
			$("#type3div").hide(500);
			$("#type4div").hide(500);
			$("#type5div").hide(500);
			$("#type6div").hide(500);
			$("#type7div").hide(500);
			$("#type8div").hide(500);
		});
		//type2按钮点击事件
		$("#type2").click(function(){
			$("#alltypediv").hide(500);
			$("#type1div").hide(500);
			$("#type2div").show(500);
			$("#type3div").hide(500);
			$("#type4div").hide(500);
			$("#type5div").hide(500);
			$("#type6div").hide(500);
			$("#type7div").hide(500);
			$("#type8div").hide(500);
		});
		//type3按钮点击事件
		$("#type3").click(function(){
			$("#alltypediv").hide(500);
			$("#type1div").hide(500);
			$("#type2div").hide(500);
			$("#type3div").show(500);
			$("#type4div").hide(500);
			$("#type5div").hide(500);
			$("#type6div").hide(500);
			$("#type7div").hide(500);
			$("#type8div").hide(500);
		});
		//type4按钮点击事件
		$("#type4").click(function(){
			$("#alltypediv").hide(500);
			$("#type1div").hide(500);
			$("#type2div").hide(500);
			$("#type3div").hide(500);
			$("#type4div").show(500);
			$("#type5div").hide(500);
			$("#type6div").hide(500);
			$("#type7div").hide(500);
			$("#type8div").hide(500);
		});
		//type5按钮点击事件
		$("#type5").click(function(){
			$("#alltypediv").hide(500);
			$("#type1div").hide(500);
			$("#type2div").hide(500);
			$("#type3div").hide(500);
			$("#type4div").hide(500);
			$("#type5div").show(500);
			$("#type6div").hide(500);
			$("#type7div").hide(500);
			$("#type8div").hide(500);
		});
		//type6按钮点击事件
		$("#type6").click(function(){
			$("#alltypediv").hide(500);
			$("#type1div").hide(500);
			$("#type2div").hide(500);
			$("#type3div").hide(500);
			$("#type4div").hide(500);
			$("#type5div").hide(500);
			$("#type6div").show(500);
			$("#type7div").hide(500);
			$("#type8div").hide(500);
		});
		//type7按钮点击事件
		$("#type7").click(function(){
			$("#alltypediv").hide(500);
			$("#type1div").hide(500);
			$("#type2div").hide(500);
			$("#type3div").hide(500);
			$("#type4div").hide(500);
			$("#type5div").hide(500);
			$("#type6div").hide(500);
			$("#type7div").show(500);
			$("#type8div").hide(500);
		});
		//type8按钮点击事件
		$("#type8").click(function(){
			$("#alltypediv").hide(500);
			$("#type1div").hide(500);
			$("#type2div").hide(500);
			$("#type3div").hide(500);
			$("#type4div").hide(500);
			$("#type5div").hide(500);
			$("#type6div").hide(500);
			$("#type7div").hide(500);
			$("#type8div").show(500);
		});
	});
</script>
</html>