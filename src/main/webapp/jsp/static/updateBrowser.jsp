<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>提示信息-浏览器升级</title>
		<style>
			/*CSS Reset*/
			body,
			div,
			p,
			h1,
			h2,
			h3,
			span,
			a,
			img,
			i,
			ul,
			li,
			ol,
			dl,
			dt,
			dd,
			input,
			button,
			select,
			textarea {
				margin: 0;
				padding: 0;
				box-sizing: content-box;
			}
			
			img {
				display: block;
				line-height: 0;
			}
			
			a {
				text-decoration: none;
			}
			
			a:hover {
				color: #c00;
			}
			
			li {
				list-style: none;
			}
			
			input {
				display: block;
				outline: medium;
			}
			
			header,
			nav,
			footer {
				display: block;
			}
			
			html {
				font-family: simsun, "宋体";
				background: #fffcf4;
				color: #333;
			}
			
			.layout {
				width: 1000px;
				margin: 0 auto;
				position: relative;
			}
			/*header*/
			
			.header {
				height: 30px;
				background: #ccc;
				font: 16px/30px "微软雅黑";
				color: #000;
			}
			
			.logo {
				height: 80px;
				border-bottom: 1px solid #EDEDED;
			}
			
			.tip {
				padding: 20px 0;
			}
			
			.tip h1 {
				color: #333;
				line-height: 50px;
			}
			
			.tip p {
				font: 16px/36px "微软雅黑";
				color: #333;
			}
			
			.href {
				border-top: 1px solid #EDEDED;
			}
			
			.href p {
				font: 16px/36px "微软雅黑";
				color: #333;
			}
			
			.href p a {
				color: blue;
				text-decoration: underline;
			}
		</style>
	</head>

	<body>
		<!--header-->
		<div class="header">
			<p class="layout">欢迎来到~</p>
		</div>
		<!--logo-->
		<div class="logo">
			<div class="layout"></div>
		</div>
		<!--tip-->
		<div class="tip layout">
			<h1>浏览器版本太低</h1>
			<p>提示：您正在使用低版本IE浏览器！</p>
		</div>
		<!--href-->
		<div class="href">
			<p class="layout">为保障信息的安全与展现，需要升级为IE9或以上版本，建议安装
				<a href="http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html">Chrome</a>、
				<a href="http://www.firefox.com.cn/">Firefox</a>、
				<a href="http://download.oupeng.com">Opera</a>
				等浏览器，以便为您提供更好的服务。</p>
		</div>
	</body>
</html>







