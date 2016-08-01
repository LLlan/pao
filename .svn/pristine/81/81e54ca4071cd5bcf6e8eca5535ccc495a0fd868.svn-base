<!DOCTYPE html>
<html>
	<head>
	<title>${title}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/> 
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
    <style type="text/css">
		body {
			margin: 1em;
		}
		
		.head {
			width:100%;
			height:30%;
			border-bottom: solid 1px #dddddd;  
			padding: 0em 0em 0.8em 0em;
			margin: 0.8em 0em 0em 0em;
			font-family: 黑体; color: rgb(153, 153, 153);
		}
		
		.head-logo {
			display: inline-block;
			height: 100%;
			vertical-align:middle;
			text-align: right;
		}
		.head-logo img{
			vertical-align:middle;
			height: 3em;
			width: 3em;
		}
		
		.head-body {
			display: inline-block;
			height: 100%;
			width:auto;
			vertical-align:middle;
			margin-left: 0.8em;
			font-size:0.7em;
		}
		
		.head-body p {
			margin: 0px;
		}
		
		.body-tag {
			margin-top: 0.5em;
		}
		
		.icon-tag {
			vertical-align: middle;
			display: inline;
			height: 1.0em;
			width: 1.0em;
		}
		
		.text-tag {
		 	margin-left: 0.4em;
			vertical-align: middle;
			display: inline;
		}
		
		.container {
			width:100%;
			height:auto;
		}
		
		.container img {
			max-width:100%;
			height:auto;
		}
		
		.fixed {
			width: 100%;
			height: 4em;
			background: #000;
			opacity: 0.5;
			filter: alpha(opacity=50);
			position: fixed;
			left: 0px;
			bottom: 0px;
		}
		
		.footer {
			left: 2%;
			width: 96%;
			height: 4em;
			position: fixed;
			bottom: 0px;
		}
		
		.foot_logo {
			width: auto;
			height: 100%;
			float: left;
			display: block;
		}
		
		.foot_logo img{
			height:auto;
			width:3em;
			margin: 0.7em 0.5em 0em 0em;
		}
		.foot_span {
			height: 100%;
			display: block;
			float: left;
		}
		.foot_span h2 {
			width: 100%;
			height: 1em;
			line-height: 1em;
			font-size: 1em;
			color: #FFF;
			font-weight: normal;
		}
		.foot_span p {
			width: 100%;
			height: 1em;
			line-height: 1em;
			color: #fff;
			font-size: 0.75em;
		}
		.foot_but {
			width: 4.0625em;
			height: 2em;
			background: #04be02;
			border-radius: 3px;
			float: right;
			margin-top: 1em;
			cursor: pointer;
			color: #FFF;
			text-align: center;
			line-height: 2em;
		}
		
		.er {
			height: 9.375em;
			margin: 1em auto;
			padding: 1%;
			margin: 0 auto;
			display: block;
			margin-bottom: 5em;
			text-align: center;
		}
		.er img {
			max-width:100%;
			height:auto;
			width: 100%;
		}
	</style>
	
	<script type="text/javascript">
	/*
	window.onload = function() {
		var d = document.getElementsByTagName("img");
		if(d.length > 2) {
			for(var i=0; i< d.length; i++) {
				var img = d[i];
				if(img.getAttribute("class") != "logo" && img.getAttribute("class") != "icon-tag"){
					var w = parseInt(img.width)/10 + "em";
					var h = parseInt(img.height)/10 + "em";
					img.setAttribute("style", "width:" + w + ";heigth:" + h)
				}
			}
		}
	}
	*/
	
	    //滚动条在Y轴上的滚动距离

		function getScrollTop(){
		　　var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;
		　　if(document.body){
		　　　　bodyScrollTop = document.body.scrollTop;
		　　}
		　　if(document.documentElement){
		　　　　documentScrollTop = document.documentElement.scrollTop;
		　　}
		　　scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop;
		　　return scrollTop;
		}
		
		//文档的总高度
		
		function getScrollHeight(){
		　　var scrollHeight = 0, bodyScrollHeight = 0, documentScrollHeight = 0;
		　　if(document.body){
		　　　　bodyScrollHeight = document.body.scrollHeight;
		　　}
		　　if(document.documentElement){
		　　　　documentScrollHeight = document.documentElement.scrollHeight;
		　　}
		　　scrollHeight = (bodyScrollHeight - documentScrollHeight > 0) ? bodyScrollHeight : documentScrollHeight;
		　　return scrollHeight;
		}
		
		//浏览器视口的高度
		
		function getWindowHeight(){
		　　var windowHeight = 0;
		　　if(document.compatMode == "CSS1Compat"){
		　　　　windowHeight = document.documentElement.clientHeight;
		　　}else{
		　　　　windowHeight = document.body.clientHeight;
		　　}
		　　return windowHeight;
		}
		
		window.onscroll = function(){
		    console.log("top:"+ getScrollTop() + ",windowHeight:"+getWindowHeight() + ",height:"+getScrollHeight());
		　　if(getScrollTop() + getWindowHeight() == getScrollHeight()){
		       console.log(true);
		　　　　document.getElementById("f1").style.display="none";
		　　　　document.getElementById("f2").style.display="none";
		　　}else {
		　　　　document.getElementById("f1").style.display="";
		　　　　document.getElementById("f2").style.display="";
		    }
		};
	</script>
  </head>
  
  <body>
  	<div class="head">
  		<div class="head-logo">
	  		<img class="logo" src="${picUrl}${category.iconPath}" />
  		</div>
  		<div class="head-body">
  			<p>来源：${source}</p>
  			<div class="body-tag">
	  			<img class="icon-tag" src="${picUrl}freemarker_icon_tag"/>
	  			<p class="text-tag">${category.name}</p>
  			</div>
  		</div>
  	</div>
  	
  	<div class="container">
  		${content}
  	</div>
  	
  	<div class="er">
  		<img class="logo" src="${picUrl}freemarker_icon_er"/>
  	</div>
  	<div id="f1" class="fixed"></div>
  	<div id="f2" class="footer">
  	 <a href="#" target="_blank" class="foot_logo">
          <img class="logo" src="${picUrl}freemarker_icon_footerlogo" alt="logo">
     </a>
     <span class="foot_span">
         <h2>寻药通客户端</h2>
         <p>永久医生免费咨询</p>
     </span>
     	<a class="foot_but" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.jsyuci.xunyaotong" style="text-decoration : none">打开</a> 
  	</div>
  </body>
</html>