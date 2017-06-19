<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" type="text/css" href="css/login/login.css" />
	</head>
	<body>
		<div class="container" >
			<div class="login">
				<h1 class="title">管理员登录</h1>
				<form>
					<ul>
						<li>
							<img src="img/user.png"/>
							<input type="text"   name="" value="" placeholder="请输入持有人账号" />
						</li>
						<li>
							<img src="/img/login/user.png"/>
							<input type="text"   name="" value="" placeholder="请输入账号" />
						</li>
						<li>
							<img src="/img/login/password.png"/>
							<input type="password" name="" value="" placeholder="请输入密码" />
						</li>
					</ul>
					<button type="submit" class="submit">登录</button>
				</form>
			</div>
			<!--footer start-->
			<div class="footer">
				<p>技术支持：<a href="http://www.x-fintech.com/" target="_blank">上海莘锋科技有限公司</a></p>
			</div>
			<!--footer end-->
		</div>
	</body>
</html>
