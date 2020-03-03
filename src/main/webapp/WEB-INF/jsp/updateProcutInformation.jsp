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
<title>修改商品信息</title>
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
				<input id="productprice" style="width:65%;margin-top:2%;" type="number" class="form-control" value="${productinformation.productprice}"/>
			</div>
			<!-- 商品数量 -->
			<div style="position:absolute;height:10%; width:90%;left:5%;top:40%;">
				<p class='text-body' style="margin-top:3%;width:35%; font-size:17px; text-align: center; float: left;">商品数量：</p>
				<input id="numberofproducts" style="width:65%;margin-top:2%;" type="number" class="form-control" value="${productinformation.numberofproducts}"/>
			</div>
			<!--商品描述 -->
			<div style="position:absolute;height:10%; width:90%;left:5%;top:50%;">
				<p class='text-body' style="margin-top:3%;width:35%; font-size:17px; text-align: center; float: left;">商品描述：</p>
				<input id="productdescription" style="width:65%;margin-top:2%;" type="text" class="form-control" placeholder="请输入商品描述" value="${productinformation.productdescription}"/>
			</div>
			<!--商品图片 -->
			<div style="position:absolute;height:10%; width:90%;left:5%;top:60%;">
				<p class='text-body' style="margin-top:3%;width:35%; font-size:17px; text-align: center; float: left;">商品图片：</p>
				<input id="productpicture" style="width:65%;margin-top:2%;" type="file" multiple="multiple" accept="image/*" class="form-control"/>
			</div>
			<!-- 下划线 -->
			<div style="position:absolute;height:5%; width:70%;left:15%;top:75%;">
				<hr/>
			</div>
			<!-- 按钮组 -->
			<div style="position:absolute;height:15%; width:70%;left:15%;top:85%;">
				<button id="return" style="float: left;width: 30%;margin-left: 5%;" type="button" class="btn btn-secondary">返回</button>
				<button id="delete" style="float: left;width: 30%;" type="button" class="btn btn-danger">删除</button>
				<button id="submit" style="float: left;width: 30%;" type="button" class="btn btn-success">提交</button>
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
				 return;
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
		//返回按钮
		$("#return").click(function(){
			location.href="${pageContext.request.contextPath}/tomerchantHomepage";
		});
		//删除按钮
		$("#delete").click(function(){
			if(confirm("是否确认删除？"))
				location.href="${pageContext.request.contextPath}/deleteproductinformation/${productinformation.muid}/${productinformation.producttypes}/${productinformation.productname}";
		});
		//提交按钮
		$("#submit").click(function(){
			if(confirm("确认提交新的商品信息？")){
				var productname='${productinformation.productname}';
				var producttypes='${productinformation.producttypes}';
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
					formData.append("isnew","false");
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
			}

		});
	});

</script>
</html>