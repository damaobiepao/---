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
<title>个人中心</title>
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
				<!-- 首页，欢迎，退出 -->	
				<div style="float: left;">
					<span><button id="bttohello" class="btn btn-link text-muted">返回首页</button></span>
				</div>
				<div style="float: right;">
					<span><button id="bttouser" class="btn btn-link text-muted">欢迎：${sessionScope.user.name}</button></span>
					<span class="text-muted">|</span>
					<span><button id="btlogout" class="btn btn-link text-muted">登出</button></span>
				</div>
			</div>
			<!-- 中间 标题 -->
			<div style="text-align:center; position: absolute;top: 10%;left: 0%;width: 100%;height: 10%;">
				<p style="font-size: 25px;" class="text-secondary">个人中心</p>
				<hr class="text-muted" style="width: 80%;"/>
			</div>
			<!-- 底部@左侧@的购物车和订单 ***可拓展***-->
			<div style="text-align:center; position: absolute;top: 25%;left: 15%;width: 10%;height: 70%;border-color: #C0C0C0;border-width: 1px;border-style:dashed;">
				<button id="shoppingcart" type="button" class="btn btn-success btn-block">购物车</button>
				<button id="myorder" style="margin-top: 15%;" type="button" class="btn btn-info btn-block">我的订单</button>
			</div>
			<!-- 底部@右侧@的购物车-->
			<div id="storediv" style="position: absolute;top: 20%;left: 27%;width: 58%;height: 75%;border-color:#BDFCC9; border-width: 1px;border-style:solid;">
				<p class="text-success" style="position: absolute;text-align:center; top: 0%;left: 0%;width: 100%;height: 7%; font-size:17px;border-bottom-color: #BDFCC9;border-bottom-width:1px; border-bottom-style: solid;">我的购物车</p>
				<!-- 这个DIV用来装每家店铺的被加购物品 -->
				<div id="spdiv" style="overflow:auto; position:absolute;text-align:center; left:0%; width:100%;height:85%;top:9%;">
				</div>
				
				<div style="position:absolute;text-align:center; left:0%; width:100%;height:5%;top:95%;">
					<span id="shoppingcartpreviouspage" class="badge badge-pill badge-light">上一店</span>
					<span id="shoppingcartpages"></span>
					<span id="shoppingcartnextpage" class="badge badge-pill badge-light">下一店</span>
				</div>
				<!-- 购买按钮 -->
				<button id="buy" style="position:absolute;text-align:center; left:80%; width:10%;height:5%;top:95%;" type="button" class="btn btn-success btn-sm">购买</button>
			</div>
			
			<!-- 底部@右侧@的订单-->
			<div id="orderdiv" style="display:none; position: absolute;top: 20%;left: 27%;width: 58%;height: 75%;border-color:#BDFCC9; border-width: 1px;border-style:solid;">
				<p class="text-info" style="position: absolute;text-align:center; top: 0%;left: 0%;width: 100%;height: 7%; font-size:17px;border-bottom-color: #BDFCC9;border-bottom-width:1px; border-bottom-style: solid;">我的订单</p>
				<!-- 这个DIV用来装用户的所有订单信息 -->
				<div id="miniorderdiv" style="overflow:auto; position:absolute;text-align:center; left:0%; width:100%;height:85%;top:9%;">
					<div style='position:absolute;width: 100%;height: 5%;left: 0%;top: 0%;'>
						<!-- 订单号 -->
						<span class='badge badge-pill badge-dark' style='position:absolute;height:100%;width:30%;left:0%;top:0%;'>订单号</span>
						<!-- 日期-->
						<span class='badge badge-pill badge-warning' style='position:absolute;height:100%;width:35%;left:30%;top:0%;'>下单时间</span>
						<!-- 状态 -->
						<span class='badge badge-pill badge-danger' style='position:absolute;height:100%;width:25%;left:65%;top:0%;'>状态</span>
						<!-- 操作 -->
						<span class='badge badge-pill badge-pill badge-dark' style='position:absolute;height:100%;width:10%;left:90%;top:0%;'>操作</span>
					</div>
				</div>
			</div>
		</div>

</body>
<script type="text/javascript">
	var storeMap = new Map();
	let tempSet;
	let tempkey;
	let tempvalue;
	<c:forEach var="store" items="${shoppingcartMap}">
		tempSet=new Set();
		tempkey='${store.key}';
		<c:forEach var="nandp" items="${store.value}">
			tempvalue='${nandp}';
			tempSet.add(tempvalue);
		</c:forEach>
		storeMap.set(tempkey,tempSet);
	</c:forEach>
	//总共多少家店
	let ns=storeMap.size;
	if(ns==0)
		ns=1;
	//当前在第几家-初始化为1
	let n=new Number('${n}');
	//初始化店页数
	$("#shoppingcartpages").text(n+"/"+ns);
	//点击该页-店铺名字进入店铺
	function tostoreclick(button){
		let phone=button.getAttribute("id");
		window.open("${pageContext.request.contextPath}/tostorepage/"+phone,"店铺信息");
	}
	//点击增加商品数量
	function increaseclick(button){
		let muid = button.parentNode.parentNode.children[0].getAttribute("id");
		let producttypes = button.parentNode.children[1].innerHTML;
		let productname = button.parentNode.children[0].innerHTML;
		let productprice = button.parentNode.children[2].innerHTML;
			//兼容性，未做考虑
		let xmlhttp=new XMLHttpRequest();
			xmlhttp.open("POST","${pageContext.request.contextPath}/addtoshoppingcart",true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("muid="+muid+"&producttypes="+producttypes+"&productname="+productname+"&productprice="+productprice);
			xmlhttp.onreadystatechange=function()
			{
			    if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			        let responseTxt = xmlhttp.responseText;
			        if(responseTxt=="成功"){
			        	let x=new Number(button.previousElementSibling.innerHTML);
			        	button.previousElementSibling.innerHTML=x+1;
			        	if(x+1==3){
			        		button.innerHTML="🚫";
			        	}
			        	button.previousElementSibling.previousElementSibling.innerHTML="➖";
			        }else{
			        	alert(responseTxt);
			        }
			    }
			}
	}
	//点击减少商品数量
	function decreaseclick(button){
		let muid = button.parentNode.parentNode.children[0].getAttribute("id");
		let producttypes = button.parentNode.children[1].innerHTML;
		let productname = button.parentNode.children[0].innerHTML;
		let productprice = button.parentNode.children[2].innerHTML
			//当前第几
		let x=new Number(button.nextElementSibling.innerHTML);
		if(x==1){
			let choice = confirm("是否要删除");
			if(choice==false)
				return;
		}
			//兼容性，未做考虑
		let xmlhttp=new XMLHttpRequest();
			xmlhttp.open("POST","${pageContext.request.contextPath}/removefromshoppingcart",true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("muid="+muid+"&producttypes="+producttypes+"&productname="+productname+"&productprice="+productprice);
			xmlhttp.onreadystatechange=function()
			{
			    if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			    	let responseTxt=new Array();
			    	responseTxt = xmlhttp.responseText.split(",");
			    	if(responseTxt[1]=="即将清空该店铺购物车"){
			    		alert(xmlhttp.responseText);
			        	location.replace("${pageContext.request.contextPath}/touserhtml");
			        	return;
			        }
			        if(responseTxt[0]=="成功\n"){
			        	if(x-1==0){
			        		location.replace("${pageContext.request.contextPath}/touserhtml/"+n);
			        		return;
			        	}
			        	button.nextElementSibling.innerHTML = x-1;
			        	if(x-1==1){
			        		button.innerHTML="🗑";
			        	}
			        	button.nextElementSibling.nextElementSibling.innerHTML="➕";
			        }else{
			        	alert(responseTxt[0]);
			        	location.replace("${pageContext.request.contextPath}/touserhtml");
			        }
			    }
			}
	}
	//初始化spdiv显示
	let i=new Number();
	i=0;
	storeMap.forEach(function(value, key, map){
		i++;
		if(i!=n){
			return;
		}
		let tempn=1;
		value.forEach(function(value1, value2, set){
			let tempdiv;
			if(tempn==1){
				tempdiv="<div id='"+key+"' onclick='tostoreclick(this)' class='text-body' style=' position:absolute;width: 80%;height: 10%;left: 10%;top: 0%;font-size: 19px;'>"+value1+"</div><hr style='position:absolute;width: 50%;height: 1%;left: 25%;top: 5%;'/>";
				tempdiv=tempdiv+"<div style='position:absolute;width: 100%;height: 5%;left: 0%;top: 10%; '><span class='badge badge-pill badge-dark' style='position:absolute;height:100%;width:30%;left:0%;top:0%;'>名字</span><span class='badge badge-pill badge-warning' style='position:absolute;height:100%;width:20%;left:30%;top:0%;'>类型</span><span class='badge badge-pill badge-danger' style='position:absolute;height:100%;width:20%;left:50%;top:0%;'>价格</span><span class='badge badge-pill badge-light' style='position:absolute;height:100%;width:20%;left:70%;top:0%;'>数量</span><span class='badge badge-pill badge-dark' style='position:absolute;height:100%;width:10%;left:90%;top:0%;'>状态</span></div>";
				tempn++;
			}else{
				let tempArray = new Array();
				tempArray = value1.split("_");
				//加减（+-）号符号美化
				let jian;
				let jia;
				if(tempArray[3]==1){
					jian = "🗑";
					jia = "➕";
				}else if(tempArray[3]==2){
					jian = "➖"
					jia = "➕";
				}else{
					jian = "➖"
					jia = "🚫";
				}		
				//加入的div
				tempdiv = "<div style='position:absolute;width: 100%;height: 7%;left: 0%;top: "+((tempn-2)*8+17)+"%;'><button type='button' class='btn btn-outline-info btn-sm' style='position:absolute;height:100%;width:30%;left:0%;top:0%;'>"+tempArray[0]+"</button><button type='button' class='btn btn-outline-info btn-sm'style='position:absolute;height:100%;width:20%;left:30%;top:0%;'>"+tempArray[1]+"</button><button type='button' class='btn btn-outline-info btn-sm' style='position:absolute;height:100%;width:20%;left:50%;top:0%;'>"+tempArray[2]+"</button><button onclick='decreaseclick(this)'  type='button' class='btn btn-outline-success btn-sm'style='position:absolute;height:100%;width:5%;left:70%;top:0%;'>"+jian+"</button><p class='text-black-50' style='position:absolute;height:100%;width:10%;left:75%;top:0%;'>"+tempArray[3]+"</p><button onclick='increaseclick(this)' type='button' class='btn btn-outline-success btn-sm'style='position:absolute;height:100%;width:5%;left:85%;top:0%;'>"+jia+"</button><input style='position:absolute;height:100%;width:10%;left:90%;top:0%;' type='checkbox'></div>"
				tempn++;
			}
			$("#spdiv").append(tempdiv);
		});
	});
	/********************************************************************************************************************/
	//订单页面初始化
	let oiordernumber=new Array();
	let oidate=new Array();
	let oistatus=new Array();
	<c:forEach var="oi" items="${orderInformation}">
		oiordernumber.push("${oi.ordernumber}");
		oidate.push("${oi.date}");
		oistatus.push("${oi.status}");
	</c:forEach>
	//操作事件
	function handleclick(button){
		let issure=confirm("是否确认你的操作？");
		if(issure=="false")
			return;
		
		let wantstatus=button.id.trim();
		let ordernumber=button.parentNode.firstChild.innerHTML.trim();
		alert(button.id);
		alert(ordernumber);
		//兼容性，未做考虑
		let xmlhttp=new XMLHttpRequest();
			xmlhttp.open("POST","${pageContext.request.contextPath}/handleorderstatus",true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("wantstatus="+wantstatus+"$ordernumber="+ordernumber);
			xmlhttp.onreadystatechange=function()
			{
			    if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			    	responseTxt = xmlhttp.responseText;
			    	alert(responseTxt);
			    	if(responseTxt=="成功"){
			    		location.reload();
			    		return;
			    	}else{
			    		alert(responseTxt);
			    	}
			    }
			}
	}
	let noi=oiordernumber.length;
	for(let i=0;i<noi;i++){
		//下单时间
		let tempdate=new Date(oidate[i]).toLocaleString('zh-CN');
		//状态
		let statusstring=new String();
		//操作
		let handlestring=new String();
		alert(oistatus[i]);
		switch (oistatus[i]) {
		case "0":
			statusstring="用户提交订单，待商家确认";
			handlestring="<button id='-1' type='button' onclick='handleclick(this)' class='btn btn-outline-success btn-sm'style='position:absolute;width: 10%;height: 100%;left: 90%;top: 0%;'>取消</button></div>";
			break;
		case "1":
			statusstring="商家确认订单，用户等待收货";
			handlestring="<button id='2' type='button' onclick='handleclick(this)' class='btn btn-outline-success btn-sm'style='position:absolute;width: 10%;height: 100%;left: 90%;top: 0%;'>确认收货</button></div>";
			break;
		case "2":
			statusstring="用户确认收货，订单完成";
			handlestring="</div>";
			break;
		case "-1":
			statusstring="用户已取消该订单";
			handlestring="</div>";
			break;
		case "-2":
			statusstring="商家已取消该订单";
			handlestring="</div>";
			break;
		default:
			break;
		}

		let tempdiv="<div style='position:absolute;width: 100%;height: 7%;left: 0%;top: "+(9+i*9)+"%;'><button type='button' class='btn btn-outline-success btn-sm'style='position:absolute;width: 30%;height: 100%;left: 0%;top: 0%;'>"+oiordernumber[i]+"</button><button type='button' class='btn btn-outline-success btn-sm'style='position:absolute;width: 35%;height: 100%;left: 30%;top: 0%;'>"+tempdate+"</button><button type='button' class='btn btn-outline-success btn-sm'style='position:absolute;width: 25%;height: 100%;left: 65%;top: 0%;'>"+statusstring+"</button>"+handlestring;
		$("#miniorderdiv").append(tempdiv);
	}
	
	
	
	
	
	
	
	
	
	
$(function(){
	//返回首页点击事件
	$("#bttohello").click(function(){
		location.assign("${pageContext.request.contextPath}");
	});
	//进入个人中心
	$("#bttouser").click(function(){
		location.replace("${pageContext.request.contextPath}/touserhtml");
	});
	//登出按钮事件
	$("#btlogout").click(function(){
		location.replace("${pageContext.request.contextPath}/logout");
	});
	//上一店点击事件
	$("#shoppingcartpreviouspage").click(function(){
		if(n==1)
			return;
		n--;
		location.replace("${pageContext.request.contextPath}/touserhtml/"+n);
	});
	//下一店点击事件
	$("#shoppingcartnextpage").click(function(){
		if(n==ns)
			return;
		n++;
		location.replace("${pageContext.request.contextPath}/touserhtml/"+n);
	});
	//购买事件
	$("#buy").click(function(){
		let muid=new String($("#storediv div:first").children().eq(0).attr("id"));
		//没有店铺信息
		if(muid.trim()=="undefined"){
			alert("请加入商品以后再购买。！！！");
			return;
		}
		let pdiv=$("#spdiv").children().has('input:checked');
		//未勾选商品
		if(pdiv.length==0){
			alert("请勾选商品");
			return;
		}
		//name+type+number
		let nameArray=new Array();
		let typeArray=new Array();
		let numberArray=new Array();
		let priceArray=new Array();
		for(let i=0;i<pdiv.length;i++){
			let pdivchildren= pdiv.eq(i).children();
			nameArray.push(pdivchildren.eq(0).text());
			typeArray.push(pdivchildren.eq(1).text());
			numberArray.push(pdivchildren.eq(4).text());
			priceArray.push(pdivchildren.eq(2).text());
		}
		$.post("${pageContext.request.contextPath}/analysisofpurchaseevents",
					{
						muid:muid,
						productname:nameArray.join('@'),
						producttypes:typeArray.join('@'),
						expectnumberofproducts:numberArray.join('@'),
						productprice:priceArray.join('@')
					},
					function(responseTxt){
						if(responseTxt=="成功"){
							location.replace("${pageContext.request.contextPath}/topurchaseinterface");
						}else{
							alert(responseTxt);
							location.reload();
						}
					}
				);
	});
	//购物车界面
	$("#shoppingcart").click(function(){
		$("#storediv").show(500);
		$("#orderdiv").hide(500);
	});
	//我的订单界面
	$("#myorder").click(function(){
		$("#storediv").hide(500);
		$("#orderdiv").show(500);
	});
});
</script>
</html>