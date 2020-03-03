<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<!--标题图标+收藏图标-->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/htmllogo.png" type="image/png"/>
	<title>商家管理界面</title>
	<%--*框架*--%>	
		<%--BOOTSTRAP官网 --%>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<%--JQuery官网 --%>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<%---BOOTSTRAP需要的外部JS --%>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<%---BOOTSTRA自己的JS --%>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!-- 模板 需要的资源 -->
	<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/js/prefixfree.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css" media="all" />
	<!-- 很多该死的CSS -->
	<style type="text/css">
		body {
			background-color: rgb(220,220,220);
			padding: 0;
			margin: 0;
			font-size: 16px;
			font-family: sans-serif;
		}
		.clearfix:after {
			content: "";
			display: block;
			height: 0;
			width: 0;
			clear: both;
		}
		.admin-panel {
			width: 990px;
			margin: 50px auto;
		}
		/*slidebarä¾§è¾¹æ */
		.slidebar {
			width: 20%;
			min-height: 690px;
			float: left;
			border-right: 1px solid rgb(235,235,235);
			background-color: rgb(247,247,247);
		}
		.slidebar .logo {
			height: 145px;
			border-bottom: 1px solid rgb(235,235,235);
		}
		.slidebar ul {
			padding: 0;
			margin:0;
		}
		.slidebar li {
			list-style-type: none;
			margin: 0;
			position: relative;
		}
		.slidebar li:before {
			content: "";
			font-family: 'icomoon';
			speak: none;
			font-weight: normal;
			font-variant: normal;
			text-transform: none;
			position: absolute;
			display: block;
			line-height: 40px;
			color: rgb(102,102,102);
			right: 20px;
			-webkit-font-smoothing: antialiased;
		}
		/*插入icon图标*/
		/**对应左侧图标**/
		.slidebar li:nth-child(1):before {content: "\63";}
		.slidebar li:nth-child(2):before {content: "\65";}
		.slidebar li:nth-child(3):before {content: "\66";}
		.slidebar li:nth-child(4):before {content: "\6a";}

		.slidebar ul a {
			color: rgb(140,140,140);
			text-decoration: none;
			font:16px/40px helvetica,verdana,sans-serif;
			box-sizing:border-box;
			border-bottom: 1px solid rgb(235,235,235);
			display: block;
			box-shadow:inset 0 1px 0 rgb(255,255,255);
			text-indent: 20px;
			text-transform: capitalize;
		}
		.slidebar li:hover a {
			background-color: rgb(255,255,255);
			box-shadow: 1px 0 0 rgb(255,255,255),inset 5px 0 0 -1px rgb(234,83,63);
		}
		/*main*/
		.main {
			float: left;
			width: 79%;
			height: 690px;
			background-color: rgb(255,255,255);
			position: relative;
			font-family: helvetica,verdana,sans-serif;
		}
		.main .topbar {
			border-bottom: 1px solid rgb(235,235,235);
			margin: 0;
			padding: 0;
		}
		/*topbaré¡¶é¨æé®æ */
		.topbar li {
			float: right;
			list-style: none;
		}
		.topbar li:first-child {float: left;}
		.topbar a {
			font-family: 'icomoon';
			display: block;
			line-height: 50px;
			width: 50px;
			text-align: center;
			text-decoration: none;
			color: rgb(102,102,102);
			border-left: 1px solid rgb(235,235,235);
		}
		.topbar a:hover {
			background-color: rgb(247,247,247);
		}
		.topbar li:first-child a {
			border: none;
			border-right: 1px solid rgb(235,235,235);
		}
		/*mainContent*/
		.mainContent h4 {
			line-height: 1;
			font-size: 18px;
			margin: 1.3em 0 1em;
			margin-left: 17px;
		}
		
		.mainContent>div {
			position: absolute;
			opacity: 0;
			-webkit-transition:opacity 200ms linear;
			-moz-transition:opacity 200ms linear;
			-ms-transition:opacity 200ms linear;
			transition:opacity 200ms linear;
		}
		/*éè¿opacityæ¥åæ¢ä¸åçéé¡¹å¡*/
		.mainContent>div:target {
			opacity: 1;
		}
		.mainContent h2 {
			margin:1em 30px;
			color: rgb(234,83,63);
			font-size: 20px;
		}
		.mainContent h2:before {
			font-family: 'icomoon';
			content: attr(data-icon);
			font-weight: normal;
			font-variant: normal;
			text-transform: none;
			line-height: 1;
			margin-right: 10px;
			-webkit-font-smoothing: antialiased;
		}
		.mainContent div:nth-child(1) h2:before {content: "\63";}
		.mainContent div:nth-child(2) h2:before {content: "\64";}
		.mainContent div:nth-child(3) h2:before {content: "\62";}
		.mainContent div:nth-child(4) h2:before {content: "\65";}
		.mainContent div:nth-child(5) h2:before {content: "\74";}
		.mainContent div:nth-child(6) h2:before {content: "\66";}
		.mainContent div:nth-child(7) h2:before {content: "\67";}
		.mainContent div:nth-child(8) h2:before {content: "\68";}
		.mainContent div:nth-child(9) h2:before {content: "\69";}
		.mainContent div:nth-child(10) h2:before {content: "\6a";}
		.mainContent div:nth-child(11) h2:before {content: "\75";}

		#dashboard>div {
			border: 1px solid rgb(235,235,235);
			margin-left: 30px;
			float: left;
			border-radius: 5px;
			min-width: 345px;
			height: 262px;
			display: inline-block;
		}
		.monitor ul {
			float: left;
			padding: 0;
			margin: 0 31px 0 17px;
		}
		.monitor li {
			list-style:none;
			font: 600 14px/28px helvetica,verdana,sans-serif;
			color: rgb(102,102,102);
			text-transform: capitalize;
		}
		.monitor li a {
			color: rgb(102,102,102);
			text-transform: capitalize;
			text-decoration: none;
		}
		.monitor li:first-child {
			border-bottom: 1px dotted rgb(153,153,153);
		}
		.discussions .comments {color: rgb(27,106,173);}
		.discussions .approved {color: rgb(105,174,48);}
		.discussions .pending {color: rgb(246,129,15);}
		.discussions .spam {color: rgb(243,47,47);}
		.monitor .count {
			color: rgb(27,106,173);
			text-align: right;
			font-weight: 600;
			margin-right: 15px;
			min-width: 25px;
			display: inline-block;
		}
		.monitor p {
			color: rgb(128,128,128);
			margin: 28px 0 18px 17px;
			display: block;
			font-weight: 600;
			font-size: 12px;
		}
		.monitor p a {
			text-decoration: none;
			color:rgb(27,106,173);
		}
		.quick-press form {
			margin:0 20px 0 13px;
		}
		.quick-press input[type="text"] {
			display: block;
			width: 100%;
			-moz-box-sizing:border-box;
			box-sizing:border-box;
			height: 35px;
			line-height: 15px;
			padding: 10px 0;
			margin:0 0 7px 0;
			background-color: rgb(246,246,246);
			outline: none;
			border: none;
			text-indent: 10px;
		}
		/*ç»ä¸åæµè§å¨ä¸placeholderåçå­ä½æ ·å¼*/
		.quick-press input[type="text"]::-webkit-input-placeholder {font-size: 14px;}
		.quick-press input[type="text"]:-moz-input-placeholder {font-size: 14px;}
		.quick-press input[type="text"]::-moz-input-placeholder {font-size: 14px;}
		.quick-press input[type="text"]:-ms-input-placeholder {font-size: 14px;}

		.quick-press button {
			margin-top: 13px;
			border-radius: 5px;
			text-align: center;
			line-height: 30px;
			padding: 0;
		}
		.quick-press .save, .quick-press .delet {
			font-family: 'icomoon';
			width: 37px;
			background: -webkit-linear-gradient(top,rgb(246,246,240),rgb(232,232,232));
			background: -moz-linear-gradient(top,rgb(246,246,240),rgb(232,232,232));
			background: -ms-linear-gradient(top,rgb(246,246,240),rgb(232,232,232));
			background: linear-gradient(top,rgb(246,246,240),rgb(232,232,232));
			border: 1px solid rgb(229,229,229);	
			color: rgb(102,102,102);				
			float: left;
			margin-right: 5px;
		}
		.quick-press .save:hover, .quick-press .delet:hover {
			background: -webkit-linear-gradient(top,rgb(232,232,232),rgb(246,246,240));
			background: -moz-linear-gradient(top,rgb(232,232,232),rgb(246,246,240));
			background: -ms-linear-gradient(top,rgb(232,232,232),rgb(246,246,240));
			background: linear-gradient(top,rgb(232,232,232),rgb(246,246,240));
		}
		.quick-press .save:active, .quick-press .delet:active {
			background: -webkit-linear-gradient(top,rgb(228,228,228),rgb(210,210,210));
			background: -moz-linear-gradient(top,rgb(228,228,228),rgb(210,210,210));
			background: -ms-linear-gradient(top,rgb(228,228,228),rgb(210,210,210));
			background: linear-gradient(top,rgb(228,228,228),rgb(210,210,210));
		}
		.quick-press .submit {
			float: right;
			width: 70px;
			border: 1px solid rgb(238,85,64);
			color: #fff;
			font-size: 16px;
			background: -webkit-linear-gradient(top,rgb(245,101,82),rgb(234,83,63));
			background: -moz-linear-gradient(top,rgb(245,101,82),rgb(234,83,63));
			background: -ms-linear-gradient(top,rgb(245,101,82),rgb(234,83,63));
			background: linear-gradient(top,rgb(245,101,82),rgb(234,83,63));
		}
		.quick-press .submit:hover {
			background: -webkit-linear-gradient(top,rgb(220,85,70),rgb(210,65,53));
			background: -moz-linear-gradient(top,rgb(220,85,70),rgb(210,65,53));
			background: -ms-linear-gradient(top,rgb(220,85,70),rgb(210,65,53));
			background: linear-gradient(top,rgb(220,85,70),rgb(210,65,53));
		}
		/*logo*/
		.logo a {
			width: 88px;
			height: 88px;
			display: inline-block;
			position: relative;
			left: 50%;
			top: 50%;
			margin: -45px 0 0 -45px;
			border: 1px solid rgb(200,200,200);
			border-radius: 50%;
			background-color: rgb(214,214,214);
		}
		.logo a:before {
			content: "恰";
			width: 70px;
			height: 70px;
			font: 50px/70px helvetica,verdana,sans-serif;
			text-align: center;
			position: absolute;
			top: 8px;
			left: 8px;
			border-radius: 35px;
			border: 1px solid rgb(210,210,210);
			display: inline-block;
			background: -webkit-linear-gradient(top,rgb(255,255,255),rgb(245,245,245));
			background: -moz-linear-gradient(top,rgb(255,255,255),rgb(245,245,245));
			background: -ms-linear-gradient(top,rgb(255,255,255),rgb(245,245,245));
			background: linear-gradient(top,rgb(255,255,255),rgb(245,245,245));
		}
		/*statusbaråºé¨åè½æé®*/
		.statusbar {
			position: absolute;
			bottom: 0;
			border-top: 1px solid rgb(235,235,235);
			width: 100%;
			padding: 0;
			margin: 0;
		}
		.statusbar li {
			list-style: none;
		}
		.statusbar a {
			color: rgb(102,102,102);
			text-decoration: none;
			text-align: center;
			display: block;
		}
		.statusbar a:hover {
			background-color: rgb(247,247,247);
		}
		.statusbar .profiles-setting, .statusbar .logout {
			float: right;
		}
		.statusbar .profiles-setting a, .statusbar .logout a {
			font-family: 'icomoon';
			width: 49px;
			height: 49px;
			line-height: 50px;
			border-left: 1px solid rgb(235,235,235);
		}
		@font-face {
			font-family: 'icomoon';
			src:url('${pageContext.request.contextPath}/fonts/icomoon.eot');
			src:url('${pageContext.request.contextPath}/fonts/icomoon.eot?#iefix') format('embedded-opentype'),
				url('${pageContext.request.contextPath}/fonts/icomoon.woff') format('woff'),
				url('${pageContext.request.contextPath}/fonts/icomoon.ttf') format('truetype'),
				url('${pageContext.request.contextPath}/fonts/icomoon.svg#icomoon') format('svg');
			font-weight: normal;
			font-style: normal;
		}
	</style>
</head>
<body>
	<div class="page">
		<section class="demo">
			<div class="admin-panel clearfix">
				<!-- 左侧选择 -->
				<div class="slidebar">
					<div class="logo">
						<a href="${pageContext.request.contextPath}"></a>
					</div>
					<ul>
						<li><a href="#configuration" id="cconfiguration">配置商品</a></li>
						<li><a href="#order" id="oorder">订单</a></li>
						<li><a href="#message" id="mmessage">消息</a></li>
						<li><a href="#settings" id="ssettings">设置</a></li>
					</ul>
				</div>
				<!--右侧页面 -->
				<div class="main" >
					<div class="mainContent clearfix" >
						<!-- 配置商品信息 -->
						<div id="configuration" >
							<h2 class="header" >配置商品</h2>
							<!-- 添加商品图片 +++加号 -->
							<div id="addproduct" style="width: 43px;height: 43px;margin-left:35px;margin-top: 27px; ">
								<img style="width: 37px;height: 37px;" alt="未找到图片" title="添加商品"  src="${pageContext.request.contextPath}/images/plus.png">
							</div>
							<!-- 分割线 -->
							<div style='width:700px;margin-left:35px;'>
								<hr/>
							</div>
							<!-- 大的DIV用来装信息 -->
							<div id="informationcontainer" style=" overflow:auto;width:600px;height:450px; text-align: center;margin-left: 100px;">
							
							</div>
						</div>
						<!-- 订单 -->
						<div id="order" >
							<h2 class="header">订单</h2>
							<!-- 分割线 -->
							<div style='width:700px;margin-left:35px;'>
								<hr/>
							</div>
							<!-- 大的DIV用来装订单信息 -->
							<div id="orderdiv" style=" overflow:auto;width:700px;height:500px; text-align: center;margin-left: 40px;">
							   <div style='width: 700px;height: 20px;margin-left:0px;margin-top:0px;'>
									<!-- 订单号 -->
									<span class='badge badge-pill badge-dark' style='height: 20px;width:175px;margin-left:0px;margin-top:0px;margin-bottom:5px;float:left;'>订单号</span>
									<!-- 日期-->
									<span class='badge badge-pill badge-warning' style='height: 20px;width:210px;margin-left:0px;margin-top:0px;margin-bottom:5px;float:left;'>下单时间</span>
									<!-- 状态 -->
									<span class='badge badge-pill badge-danger' style='height:20px;width:245px;margin-left:0px;margin-top:0px;margin-bottom:5px;float:left;'>状态</span>
									<!-- 操作 -->
									<span class='badge badge-pill badge-pill badge-dark' style='height: 20px;width:70px;margin-left:0px;margin-top:0px;margin-bottom:5px;float:left;'>操作</span>
								</div>
							</div>
						</div>
						<!-- 消息 -->
						<div id="message" >
							<h2 class="header">消息</h2>
						</div>
						<!-- 设置店铺信息 -->
						<div id="settings" >
							<h2 class="header">设置</h2>
							
							<!-- 分割线 -->
							<div style="width: 130%;margin-left: 10%;">
								<hr/>
							</div>
							<!-- 设置主体 -->
							<div style="margin-left:150px;margin-top: 50px;">
									<table style="text-align: center;">
										<tr>
											<td class="text-muted">手机号（默认）：</td>
											<td> <input type="text" class="form-control" value="${sessionScope.merchantuser.phone}" disabled="disabled"/> </td>
										</tr>
										<tr>
											<td class="text-muted">店铺名称：</td>
											<td> <input id="name" type="text" class="form-control"  placeholder="请输入店铺名称（不可为空）" value="${empty sessionScope.storeinformation.name?'':sessionScope.storeinformation.name }"/> </td>
										</tr>
										<tr>
											<td class="text-muted">外送费：</td>
											<td> <input id="deliveryfee" type="number" class="form-control"  value="${empty sessionScope.storeinformation.deliveryfee?'0':sessionScope.storeinformation.deliveryfee}"/> </td>
										</tr>

										<tr>
											<td class="text-muted">手机号：</td>
											<td> <input id="phone2" type="number" class="form-control" placeholder="再设置一个联系号码" value="${empty sessionScope.storeinformation.phone2?'':sessionScope.storeinformation.phone2}"/> </td>
										</tr>
										<tr>
											<td class="text-muted">店铺类型：</td>
											<td > 
												<select id="storetype" class="form-control">
													 <option selected="selected">请选择</option>
													 <option >快餐便当</option>
													 <option >特色菜系</option>
													 <option >全球美食</option>
													 <option >甜品饮品</option>
													 <option >商店超市</option>
													 <option >小吃夜宵</option>
													 <option >鲜花绿植</option>
													 <option >医药健康 </option>
												</select>
											</td>
										</tr>
										<tr>
											<td class="text-muted">产品类型：</td>
											<td id="productcategories" style="float:left;width:202px; "><button id="addproductcategory" type="button" class="btn btn-secondary">+</button></td>
										</tr>
										<tr style="height:80px; padding: 20px auto;">
											<td  colspan="2"><button id="submitset" type="button" class="btn btn-primary btn-lg">提交</button></td>
										</tr>
									</table>
							</div>
						</div>
					</div>
					<ul class="statusbar">
						<li><a href=""></a></li>
						<li><a href=""></a></li>
						<li class="profiles-setting"><a href="${pageContext.request.contextPath}/outmerchantHomepage">s</a></li>
					</ul>
				</div>
				<!-- 右侧页面结束********* -->
			</div>
		</section>

	</div>
<div style="text-align:center;clear:both">

</div>	
<!-- Modal- 模态框居中（添加商品） -->
<div class="modal fade" id="addproductmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="margin: 0 auto;">
        <h5 class="modal-title" id="exampleModalLongTitle" >添加商品</h5>
        <!--  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        -->
      </div>
      <div class="modal-body" style="text-align: center;">
      		<!--添加商品界面主体 -->    		
      		<table style="margin: 0 auto;">
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">商品名称：</td>
			      <td><input id="productname" type="text" class="form-control" placeholder="请输入商品名称"/></td>
			  	</tr>
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">商品类型：</td>
			      <td>
			      		<select id="producttypes" class="form-control" >
							<option  selected="selected">请选择商品类型</option>
						</select>
				  </td>
			  	</tr>
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">商品价格：</td>
			      <td><input id="productprice" type="number" class="form-control"  value="0"/></td>
			  	</tr>
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">商品数量：</td>
			      <td><input id="numberofproducts" type="number" class="form-control" value="0"/></td>
			  	</tr>
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">商品描述：</td>
			      <td><input id="productdescription" type="text" class="form-control" placeholder="请输入商品描述（可无）"/></td>
			  	</tr>
			  	<tr style="text-align: center;height:45px;">
			      <td class="text-muted">商品图片：</td>
			      <td><input id="productpicture" type="file" multiple="multiple" accept="image/*" class="form-control" placeholder="上传商品图片"/></td>
			  	</tr>
      		</table>
      </div>
      <div class="modal-footer" style="margin: 0 auto;">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button id="submitproductinformation" type="button" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>

</body>
<script type="text/javascript">
		//商品类型数组
		var  x = new String("${sessionScope.storeinformation.productcategory}");
		var  oldproducts=x.split(",");
		var  products=new Array();
		if(oldproducts[0]!=""){
			products=oldproducts;
		}
		//产品信息数组
		<c:forEach var="pi" items="${sessionScope.productInformation}">
			//如果没类型div,就把类型加入大div
			if($("#tt${pi.producttypes}").length==0){
				var typediv="<div id='tt${pi.producttypes}' muid='${pi.muid}' style='text-align:center;width:500x;height:60px;margin-top:30px;margin-left:50px;'><div class='text-secondary' style='font-size:20px;'>${pi.producttypes}</div> <hr style='width:100px;'/></div>"
				$("#informationcontainer").append(typediv);
				
				var productdiv="<div id='tt${pi.producttypes}_${pi.productname}' onclick='updateprocutclick(this)' style='margin-top:0px;margin-bottom:15px;width:100px;height:25px;margin-left:50px;float:left; background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);'>${pi.productname}</div>";
				$("#tt${pi.producttypes}").append(productdiv);
				$("#tt${pi.producttypes}").css("height","100px");
			}//如果有类型div,就把信息加入类型div
			else{
				var productdiv="<div id='tt${pi.producttypes}_${pi.productname}' onclick='updateprocutclick(this)' style='margin-top:0px;margin-bottom:15px;width:100px;height:25px;margin-left:50px;float:left; background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);'>${pi.productname}</div>";
				$("#tt${pi.producttypes}").append(productdiv);
				
				var childrendiv=$("#tt${pi.producttypes}").children().length-2;
				if(childrendiv%3==0){
					var height=childrendiv/3*40+60+'px';
					$("#tt${pi.producttypes}").css("height",height);
				}else{
					var height=Math.ceil(childrendiv/3)*40+60+'px';
					$("#tt${pi.producttypes}").css("height",height);
				}
			}
		</c:forEach>
		//点击商品进入相关页面修改
		function updateprocutclick(button){
			var muid=button.parentNode.getAttribute("muid");
			var producttypes=button.parentNode.firstChild.innerHTML;
			var productname=button.innerHTML;
			location.pathname="${pageContext.request.contextPath}/updateprocutinformation/"+muid+"/"+producttypes+"/"+productname;
		}
		
		//商品类型单击确认删除
		function removeclick(button){
			var todo=confirm("是否要删除?");
			if(todo==true){
				var id= button.getAttribute("id");
				var father= document.getElementById("productcategories");
				var son=document.getElementById(id);
				father.removeChild(son);
				for(i in products){ 
					if(products[i]==id){
						products.splice(i,1);
						break;
					}	
				}
			}
		}
		/******************************************************************************/
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
			//兼容性，未做考虑
			let xmlhttp=new XMLHttpRequest();
				xmlhttp.open("POST","${pageContext.request.contextPath}/handleorderstatus",true);
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("wantstatus="+wantstatus+"&ordernumber="+ordernumber);
				xmlhttp.onreadystatechange=function()
				{
				    if (xmlhttp.readyState==4 && xmlhttp.status==200)
				    {
				    	let responseTxt = xmlhttp.responseText;
				    	if(responseTxt=="成功"){
				    		location.replace("${pageContext.request.contextPath}/tomerchantHomepage");
				    	}else{
				    		alert(responseTxt);
				    	}
				    }
				}
		}
		//去往订单界面点击事件
		function toorder(button){
			let ordernumber=button.innerHTML.trim();
			window.open("${pageContext.request.contextPath}/toorder/"+ordernumber+"/1","订单详情");
		}
		
		
		let noi=oiordernumber.length;
		for(let i=0;i<noi;i++){
			//下单时间
			let tempdate=new Date(parseInt(oidate[i])).toLocaleString('zh-CN');
			//状态
			let statusstring=new String();
			//操作
			let handlestring=new String();
			switch (oistatus[i]) {
			case "0":
				statusstring="用户提交订单，待商家确认";
				handlestring="<button id='-2' type='button' onclick='handleclick(this)' class='btn btn-outline-success btn-sm' style='height: 25px;width:35px;margin-left:0px;margin-top:0px;margin-bottom:5px;float:left;'>⚔</button><button id='1' type='button' onclick='handleclick(this)' class='btn btn-outline-success btn-sm'style='height: 25px;width:35px;margin-left:0px;margin-top:0px;margin-bottom:5px;float:left;'>✔</button></div>";
				break;
			case "1":
				statusstring="商家确认订单，用户等待收货";
				handlestring="</div>";
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
			//
			var productdiv="<div id='tt${pi.producttypes}_${pi.productname}' onclick='updateprocutclick(this)' style='margin-top:0px;margin-bottom:15px;width:100px;height:25px;margin-left:50px;float:left; background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);'>${pi.productname}</div>";
			//style='margin-top:0px;margin-bottom:15px;width:100px;height:25px;margin-left:50px;float:left;
			let tempdiv="<div style='margin-top:0px;margin-bottom:5px;width:700px;height:25px;margin-left:0px;float:left;'><button onclick='toorder(this)' type='button' class='btn btn-outline-success btn-sm'style='margin-top:0px;margin-bottom:5px;width:175px;height:25px;margin-left:0px;float:left;'>"+oiordernumber[i]+"</button><button type='button' class='btn btn-outline-success btn-sm'style='margin-top:0px;margin-bottom:5px;width:210px;height:25px;margin-left:0px;float:left;'>"+tempdate+"</button><button type='button' class='btn btn-outline-success btn-sm'style='margin-top:0px;margin-bottom:5px;width:245px;height:25px;margin-left:0px;float:left;'>"+statusstring+"</button>"+handlestring;
			$("#orderdiv").append(tempdiv);
		}
		/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/
		
		
	$(function(){
		/************************焦点切换******************************/
			$("#configuration").css('z-index','3');
			$("#order").css('z-index','-1');
			$("#message").css('z-index','-1');
			$("#settings").css('z-index','-1');
		$("#cconfiguration").click(function(){
			
			$("#configuration").css('z-index','3');
			$("#order").css('z-index','-1');
			$("#message").css('z-index','-1');
			$("#settings").css('z-index','-1');
		});
		$("#oorder").click(function(){
			
			$("#configuration").css('z-index','-1');
			$("#order").css('z-index','3');
			$("#message").css('z-index','-1');
			$("#settings").css('z-index','-1');
		});
		$("#mmessage").click(function(){
			
			$("#configuration").css('z-index','-1');
			$("#order").css('z-index','-1');
			$("#message").css('z-index','3');
			$("#settings").css('z-index','-1');
		});
		$("#ssettings").click(function(){
			
			$("#configuration").css('z-index','-1');
			$("#order").css('z-index','-1');
			$("#message").css('z-index','-1');
			$("#settings").css('z-index','3');
		});
		/************************配置商品******************************/
		//根据oldproducts初始化可选择商品类型
		if(oldproducts[0]!=""){
			for(i in oldproducts){ 
				var producttype="<option>"+oldproducts[i]+"</option>"
				$("#producttypes").append(producttype);
			}
		}
		//添加商品图片点击事件
		$("#addproduct").click(function(){
			$("#addproductmodal").modal('show');
		});
		//商品价格限制
		$("#productprice").change(function(){
			if($(this).val()<0){
				$(this).val(0);
			}else if($(this).val()>9999){
				$(this).val(9999);
			}else{
				var x=new Number($(this).val());
				$(this).val(x.toFixed(2));
			}
		});
		//商品数量限制
				$("#numberofproducts").change(function(){
			if($(this).val()<0){
				$(this).val(0);
			}else if($(this).val()>9999){
				$(this).val(9999);
			}else{
				var x=new Number($(this).val());
				//	$(this).val(Math.trunc(x));
					$(this).val(parseInt(x));
			}
		});
		//上传图片文件的限制
			//-检验函数
		function fileValid (thisfiles,whantfilesize,whantfiletype) {
			if(thisfiles.files[3]!=null){
				alert("最多上三张图片");
				$("#productpicture").val('');
				 return false;
			}else{
				for(var i=0;i<3;i++){
					if(thisfiles.files[i]==null){
						break;
					}
					var file = thisfiles.files[i];
					var filesize = (file.size / 1024).toFixed(0);
					var fileType =  thisfiles.files[i].name.substring(thisfiles.files[i].name.lastIndexOf("."));
				   
					if (filesize > whantfilesize) {
				        alert('第'+i+'个文件过大')
				        $("#productpicture").val('');
				        break;
				        return false;
				    }
		            if (!fileType.match(/.jpg|.jpeg|.gif|.png|.bmp/i)) {
		            	
		                alert('第'+i+'张图片格式不符合')
		                $("#productpicture").val('');
		                break;
		                return false;
		            }
				}
			}
		}
			//上传文件-改变事件
		$("#productpicture").change(function(){
	        fileValid(this,20971520, 'image')
		});
		//确认提交商品信息
		$("#submitproductinformation").click(function(){
			var productname=$("#productname").val();
			var producttypes=$("#producttypes").val();
			var productprice=$("#productprice").val();
			var numberofproducts=$("#numberofproducts").val();
			var productdescription=$("#productdescription").val();
			//图片
			var productpicture=$("#productpicture")[0];
			//检验工作+合格提交
			if(productname.trim()==""||producttypes=="请选择商品类型"){
				alert("有必要的信息未填写，请检查");
			}else{
				var formData = new FormData();
				formData.append("productname",productname);
				formData.append("producttypes",producttypes);
				formData.append("productprice",productprice);
				formData.append("numberofproducts",numberofproducts);
				formData.append("productdescription",productdescription);
				formData.append("isnew","true");
				for(var i=0;i<3;i++){
					if(productpicture.files[i]!=null){
						formData.append("productpicture",productpicture.files[i]);
					}else{
						break;
					}
						
				}
				$.ajax({
					url:"${pageContext.request.contextPath}/submitproductinformation",
					type: 'POST',
					cache: false,
					data: formData,
					processData: false,
					contentType: false,
					success:function(data){
						if(data=="成功"){
							alert("成功");
							location.replace("${pageContext.request.contextPath}/updatesessionproductinformation");
						}else{
							alert(data);
						}
					}
				});
			}
			
		});	
			
		/************************设置选项******************************/
		//页面加载成功自动添加数据库中已经有的商品类型
		if(oldproducts[0]!=""){
			for(i in oldproducts){ 
				var product="<button id='"+oldproducts[i]+"' type='button' class='btn btn-info' onclick='removeclick(this)'>"+oldproducts[i]+"</button>";
				$("#productcategories").append(product);
			}
		}
		//名字限制
		$("#name").change(function(){
			var name=$(this).val();
			
			if(name.length>11){
				alert("名字最多为11个字");
				$(this).val("");
			}else if(name.trim()==''){
				$(this).val("");
				alert("店铺名字不可为空");
			}
		});
		//配送费限制
		$("#deliveryfee").change(function(){
			if($(this).val()<0){
				$(this).val(0);
			}else{
				var x=new Number($(this).val());
				$(this).val(x.toFixed(2));
			}
		});
		//手机号限制
		$("#phone2").change(function(){
			var phone2=$(this).val();
			if(phone2.length!=11){
				$(this).val("");
				alert("手机号应为11位");
			}
		});
		//设置-添加产品类型
		$("#addproductcategory").click(function(){
			var productcategory= prompt("请输入添加的产品类型:").trim();
			if(productcategory!=""){
				var product="<button id='"+productcategory+"' type='button' class='btn btn-info' onclick='removeclick(this)'>"+productcategory+"</button>";
				$("#productcategories").append(product);
				products.push(productcategory);
			}else{
				alert("不可以输入空的类型哦。！");
			}
		});
		//提交设置
		$("#submitset").click(function(){
			var name=$("#name").val();
			var deliveryfee=$("#deliveryfee").val();
			var phone2=$("#phone2").val();
			var storetype=$("#storetype").val();
			var productcategory=products.join(",");
			if(storetype=="请选择"){
				alert("你没有选择店铺类型！！！");
			}else if(productcategory==""){
				alert("请设置商品类型以后再提交");
			}else if(name.trim()==''){
				alert("店铺名字不可为空");
			}else{
				var issubmit= confirm("*********请确认*********\n店铺名字："+name+"\n外送费："+deliveryfee+"\n备用联系号码："+phone2+"\n店铺类型："+storetype+"\n商品类型："+productcategory);
				if(issubmit==true){
					$.post(
							"${pageContext.request.contextPath}/submitstoreinformation",
							{
								name:name,
								deliveryfee:deliveryfee,
								phone2:phone2,
								storetype:storetype,
								productcategory:productcategory
							},
							function(responseTxt,statusTxt){
								if(responseTxt=="成功"){
									alert('修改'+responseTxt+',请重新登录\n连接状态：'+statusTxt);
									location.replace("${pageContext.request.contextPath}/tomerchant");
								}else{
									alert('修改结果：'+responseTxt+'连接状态：'+statusTxt);
								}
							}
						);
				}
			}
			
			
		});
	});
</script>
</html>