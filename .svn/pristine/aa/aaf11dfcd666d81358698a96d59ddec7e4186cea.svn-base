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
  </body>
</html>