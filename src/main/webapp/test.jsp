<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
</head>
<body>
<div style='position:absolute;width: 80%;height: 10%;left: 10%;top: 0%;font-size: 19px;'></div>
<hr style='position:absolute;width: 50%;height: 1%;left: 25%;top: 10%;color: black;'/>

<div style='position:absolute;width: 100%;height: 10%;left: 0%;top: 10%; border-color: red;border-width: 2px;border-style: solid;'>
				<!-- 名字 -->
				<span class='badge badge-dark' style='position:absolute;height:100%;width:30%;left:0%;top:0%;'>名字</span>
				<!-- 类型 -->
				<span class='badge badge-warning' style='position:absolute;height:100%;width:20%;left:30%;top:0%;'>类型</span>
				<!-- 价格 -->
				<span class='badge badge-danger' style='position:absolute;height:100%;width:20%;left:50%;top:0%;'>价格</span>
				<!-- 数量 -->
				<span class='badge badge-pill badge-light' style='position:absolute;height:100%;width:20%;left:50%;top:0%;'>数量</span>
				<!-- 状态 -->
				<span class='badge badge-pill badge-dark' style='position:absolute;height:100%;width:10%;left:90%;top:0%;'>状态</span>

</div>





<div style='position:absolute;width: 100%;height: 5%;left: 0%;top: 15%;'>
	<button type='button' class='btn btn-outline-info btn-sm' style='position:absolute;height:100%;width:30%;left:0%;top:0%;'>'+tempArray[0]+'</button>
	<button type='button' class='btn btn-outline-info btn-sm'style='position:absolute;height:100%;width:20%;left:30%;top:0%;'>'+tempArray[1]+'</button>
	<button type='button' class='btn btn-outline-info btn-sm' style='position:absolute;height:100%;width:20%;left:50%;top:0%;'>'+tempArray[2]+'</button>
	
	<button type='button' class='btn btn-outline-info btn-sm'style='position:absolute;height:100%;width:5%;left:50%;top:0%;'></button>
	<p style='position:absolute;height:100%;width:10%;left:55%;top:0%;'>'+tempArray[3]+'</p>
	<button type='button' class='btn btn-outline-info btn-sm'style='position:absolute;height:100%;width:5%;left:85%;top:0%;'>+</button>
	<button type='button' class='btn btn-outline-info btn-sm' style='position:absolute;height:100%;width:10%;left:90%;top:0%;'>状态</button>
</div>




			<div style='text-align:center; position: absolute;top: %;left: 0%;width: 100%;height: 10%;'>
				<p style='text-align:center; position: absolute;top: 0%;left: 0%;width: 30%;height:100%;font-size: 15px;'>名字</p>
				<p style='text-align:center; position: absolute;top: 0%;left: 30%;width: 20%;height:100%;font-size: 15px;'>类型</p>
				<p style='text-align:center; position: absolute;top: 0%;left: 50%;width: 15%;height:100%;font-size: 15px;'>单价</p>
				<p style='text-align:center; position: absolute;top: 0%;left: 65%;width: 15%;height:100%;font-size: 15px;'>数量</p>
				<p style='text-align:center; position: absolute;top: 0%;left: 80%;width: 20%;height:100%;font-size: 15px;'>金额</p>
			</div>





<hr style='position: absolute;top:"+(n*10+20)+"%;left:60%;width:40%;border-style:dashed;border-color: black;'>
			
<div style='text-align:right; position: absolute;top:"+(n*10+27)+"%;left: 60%;width: 40%;height: 40%;border-color: red;border-width: 2px;border-style: solid;'>
	<p style='text-align:right; position: absolute;top: 0%;left: 5%;width: 35%;height:20%;font-size: 13px;color: black;border-color: red;border-width: 2px;border-style: solid;'>合计：</p>
	<p style='text-align:right; position: absolute;top: 0%;left: 50%;width: 35%;height:20%;font-size: 13px;color: black;border-color: red;border-width: 2px;border-style: solid;'>"+totalAmount+" 件</p>
	
	<p style='text-align:right; position: absolute;top: 25%;left: 5%;width: 35%;height:20%;font-size: 13px;color: black;border-color: red;border-width: 2px;border-style: solid;'>商品：</p>
	<p style='text-align:right; position: absolute;top: 25%;left: 50%;width: 35%;height:20%;font-size: 13px;color: black;border-color: red;border-width: 2px;border-style: solid;'>"+totalPrice+" 元</p>
	
	<p style='text-align:right; position: absolute;top: 50%;left: 5%;width: 35%;height:20%;font-size: 13px;color: black;border-color: red;border-width: 2px;border-style: solid;'>配送费：</p>
	<p style='text-align:right; position: absolute;top: 50%;left: 50%;width: 35%;height:20%;font-size: 13px;color: black;border-color: red;border-width: 2px;border-style: solid;'>${storeInformation.deliveryfee} 元</p>
	
	<p style='text-align:right; position: absolute;top: 75%;left: 7%;width: 35%;height:25%;font-size: 17px;color: black;border-color: red;border-width: 2px;border-style: solid;'>总价：</p>
	<p style='text-align:right; position: absolute;top: 75%;left: 52%;width: 35%;height:25%;font-size: 17px;color: black;border-color: red;border-width: 2px;border-style: solid;'>"+(totalPrice+deliveryfee)+" 元</p>
</div>
<input ar>












<div style='position:absolute;width: 100%;height: 5%;left: 0%;top: "+(7+i*7)+"%;'>
	<button type='button' class='btn btn-outline-success'style='position:absolute;width: 30%;height: 100%;left: 0%;top: 0%;'>"+oiordernumber[i]+"</button>
	<button type='button' class='btn btn-outline-success'style='position:absolute;width: 35%;height: 100%;left: 30%;top: 0%;'>"+tempdate+"</button>
	<button type='button' class='btn btn-outline-success'style='position:absolute;width: 25%;height: 100%;left: 65%;top: 0%;'>"+statusstring+"</button>
</div>



<a></a>







</body>
<script type='text/javascript'>
</script>
</html>