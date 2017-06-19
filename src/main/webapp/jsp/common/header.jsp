<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<!--兼容至IE9-->
		<!--[if lte IE 8]>
			window.location = "/jap/static/upgradeBrowser.jsp" ;
		<![endif]-->
		<link rel="stylesheet" href="/css/common/common.css" />
		<script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
	</head>

	<body>
		<!--header start-->
		<div class="header">
			<div class="container">
				<!--logo-->
				<div class="logo"></div>
				<!--头部菜单项-->
				<ul class="nav">
					<li>会计科目</li>
					<li>核算币种</li>
				</ul>
				<!--登录退出-->
				<ul class="login">
					<li>用户名</li>
					<li>丨</li>
					<li>退出</li>
				</ul>
			</div>
			<!--头部菜单对应的下拉选项-->
			<div class="nav-slideDown">
				<!--会计科目-->
				<ul class="nav-slideDown-item">
					<li class="nav-slideDown-item-first">新增会计科目<span></span>
						<ul class="nav-slideDown-item-second">
							<li>
								<a href="javascript:;">新增会计科目录入</a>
							</li>
							<li>
								<a href="javascript:;">新增会计科目修改</a>
							</li>
							<li>
								<a href="javascript:;">新增会计科目删除</a>
							</li>
							<li>
								<a href="javascript:;">新增会计科目复核</a>
							</li>
						</ul>
					</li>
					<li class="nav-slideDown-item-first">变更会计科目<span></span>
						<ul class="nav-slideDown-item-second">
							<li>
								<a href="javascript:;">变更会计科目录入</a>
							</li>
							<li>
								<a href="javascript:;">变更会计科目修改</a>
							</li>
							<li>
								<a href="javascript:;">变更会计科目删除</a>
							</li>
							<li>
								<a href="javascript:;">变更会计科目复核</a>
							</li>
						</ul>
					</li>
					<li class="nav-slideDown-item-first">注销会计科目<span></span>
						<ul class="nav-slideDown-item-second">
							<li>
								<a href="javascript:;">注销会计科目录入</a>
							</li>
							<li>
								<a href="javascript:;">注销会计科目删除</a>
							</li>
							<li>
								<a href="javascript:;">注销会计科目复核</a>
							</li>
						</ul>
					</li>
				</ul>
				<!--核算币种-->
				<ul class="nav-slideDown-item">
					<li class="nav-slideDown-item-first">核算币种新增<span></span>
						<ul class="nav-slideDown-item-second">
							<li>
								<a href="javascript:;">核算币种新增录入</a>
							</li>
							<li>
								<a href="javascript:;">核算币种新增修改</a>
							</li>
							<li>
								<a href="javascript:;">核算币种新增删除</a>
							</li>
							<li>
								<a href="javascript:;">核算币种新增复核</a>
							</li>
						</ul>
					</li>
					<li class="nav-slideDown-item-first">核算币种变更<span></span>
						<ul class="nav-slideDown-item-second">
							<li>
								<a href="javascript:;">核算币种变更录入</a>
							</li>
							<li>
								<a href="javascript:;">核算币种变更修改</a>
							</li>
							<li>
								<a href="javascript:;">核算币种变更删除</a>
							</li>
							<li>
								<a href="javascript:;">核算币种变更复核</a>
							</li>
						</ul>
					</li>
					<li class="nav-slideDown-item-first">核算币种注销<span></span>
						<ul class="nav-slideDown-item-second">
							<li>
								<a href="javascript:;">核算币种注销复核</a>
							</li>
							<li>
								<a href="javascript:;">核算币种查询</a>
							</li>
							<li>
								<a href="javascript:;">核算币种痕迹表查询</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!--header end-->
		<script type="text/javascript" src="/js/common/common.js"></script>
	</body>

</html>