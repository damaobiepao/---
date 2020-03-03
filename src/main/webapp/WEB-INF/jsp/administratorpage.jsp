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
<title>管理-商家的请求</title>
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
	<div style="position:absolute; width: 100%;height: 100%;left: 0px;top: 0px;background-image: linear-gradient(60deg, #29323c 0%, #485563 100%);">
		<!-- 标题 -->
		<div style="position:absolute;height:10%;width:60%;left:20%;top:5%;">
			<p style="text-align:center;font-size:20px;color:white; ">商家用户-提交注册的申请信息</p>
			<hr style="color: white;"/>
		</div>
		<!-- 中间商家信息 -->
		<div style="position:absolute;height:70%;width:80%;left:10%;top:15%;">
			<!-- 名字+电话+地址@@@标题 -->
			<div style="position:absolute;height:10%;width:100%;left:0%;top:0%;"> 
				<!-- 名字 -->
				<div style="position:absolute;height:100%;width:15%;left:0%;top:0%;">
					<button type="button" class="btn btn-success" style="width: 100%;">名字</button>
				</div>
				<!-- 电话 -->
				<div style="position:absolute;height:100%;width:25%;left:15%;top:0%;">
					<button type="button" class="btn btn-info" style="width: 100%;">电话</button>
				</div>
				<!-- 地址 -->
				<div style="position:absolute;height:100%;width:50%;left:40%;top:0%;">
					<button type="button" class="btn btn-secondary" style="width: 100%;">地址</button>
				</div>
				<!-- 确认 -->
				<div style="position:absolute;height:100%;width:10%;left:90%;top:0%;">
					<button type="button" class="btn btn-danger" style="width: 100%;">已处理？</button>
				</div>
			</div>
			<!-- 请求的信息 -->
			<div id="requestinformation" style="position:absolute;height:90%;width:100%;left:0%;top:10%;">

			</div>
		</div>
		<!-- 页数信息 -->
		<div style="text-align:center; position:absolute;height:10%;width:50%;left:25%;top:85%;">
			<button id="previouspage" type="button" class="btn btn-light" style="position:absolute;height:70%;width:20%;left:20%;top:15%; ">上一页</button>
			<p id="pages" style="text-align:center; color:white;font-size:20px; position:absolute;height:70%;width:20%;left:40%;top:20%; "></p>
			<button id="nextpage" type="button" class="btn btn-light" style="position:absolute;height:70%;width:20%;left:60%;top:15%; ">下一页</button>
		</div>
		<!-- 退出按钮 -->
		<div style="text-align:center; position:absolute;height:10%;width:7%;left:1%;top:90%;">
			<button id="exit" type="button" class="btn btn-secondary">退出</button>
		</div>
	</div>

</body>
<script type="text/javascript">

	//名字+电话+地址的@@@数组
	var nameArray=new Array();
	var phoneNumberArray=new Array();
	var addressArray=new Array();
	<c:forEach var="information" items="${merchantUserRegistrationRequest}">
	nameArray.push('${information.name}');
	phoneNumberArray.push('${information.phoneNumber}');
	addressArray.push('${information.address}');
	</c:forEach>
	//总记录条数
	var n=nameArray.length;
	//总页数
	var numberOFpages;
	if(n%9==0){
		numberOFpages=n/9;
	}else{
		numberOFpages=Math.ceil(n/9);
	}
	//现在所在页数
	var nowNumberOFpages=${administratorStartPage};
	//“已处理按钮事件”
	function processed(oobj){
		if(confirm("是确认已经处理该申请信息？")==false)
			return;
		var phone=oobj.parentNode.children[1].innerHTML;
		location.replace("${pageContext.request.contextPath}/deleteMerchantUserRegistrationRequest/"+phone+"/"+nowNumberOFpages);
	}
	//初始化信息显示
	if(nowNumberOFpages>numberOFpages)
		nowNumberOFpages=numberOFpages;
	for(var i=(nowNumberOFpages-1)*9;i<(nowNumberOFpages-1)*9+9;i++){
		if(i+1>n)
			break;
		var informationdiv="<div style='width: 100%;'><button type='button' class='btn btn-outline-warning' style='width: 15%;'>"+nameArray[i]+"</button><button type='button' class='btn btn-outline-warning' style='width: 25%;'>"+phoneNumberArray[i]+"</button><button type='button' class='btn btn-outline-warning' style='width: 50%;'>"+addressArray[i]+"</button><button onclick='processed(this)' type='button' class='btn btn-outline-warning' style='width: 10%;'>√</button></div>";
		$("#requestinformation").append(informationdiv);	
	}
	//初始化页数显示
	$("#pages").text(nowNumberOFpages+'/'+numberOFpages);

	//
	$(function(){
		//退出点击事件
		$("#exit").click(function(){
			location.replace("${pageContext.request.contextPath}/exitadministratorpage");
		});
		//上一页点击事件
		$("#previouspage").click(function(){
			if(nowNumberOFpages==1)
				return;
			nowNumberOFpages--;
			$("#pages").text(nowNumberOFpages+'/'+numberOFpages);
			$("#requestinformation").empty();
			
			for(var i=(nowNumberOFpages-1)*9;i<(nowNumberOFpages-1)*9+9;i++){
				if(i+1>n)
					break;
				var informationdiv="<div style='width: 100%;'><button type='button' class='btn btn-outline-warning' style='width: 15%;'>"+nameArray[i]+"</button><button type='button' class='btn btn-outline-warning' style='width: 25%;'>"+phoneNumberArray[i]+"</button><button type='button' class='btn btn-outline-warning' style='width: 50%;'>"+addressArray[i]+"</button><button onclick='processed(this)' type='button' class='btn btn-outline-warning' style='width: 10%;'>√</button></div>";
				$("#requestinformation").append(informationdiv);	
			}
		});
		//下一页点击事件
		$("#nextpage").click(function(){
			if(nowNumberOFpages==numberOFpages)
				return;
			nowNumberOFpages++;
			$("#pages").text(nowNumberOFpages+'/'+numberOFpages);
			$("#requestinformation").empty();
			
			for(var i=(nowNumberOFpages-1)*9;i<(nowNumberOFpages-1)*9+9;i++){
				if(i+1>n)
					break;
				var informationdiv="<div style='width: 100%;'><button type='button' class='btn btn-outline-warning' style='width: 15%;'>"+nameArray[i]+"</button><button type='button' class='btn btn-outline-warning' style='width: 25%;'>"+phoneNumberArray[i]+"</button><button type='button' class='btn btn-outline-warning' style='width: 50%;'>"+addressArray[i]+"</button><button onclick='processed(this)' type='button' class='btn btn-outline-warning' style='width: 10%;'>√</button></div>";
				$("#requestinformation").append(informationdiv);	
			}
		});
		
	});
</script>
</html>