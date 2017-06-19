<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>内部账户</title>
<link rel="stylesheet" href="/css/common/common.css" />
<link rel="stylesheet" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link rel="stylesheet" href="/css/common/time.css" />
<script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>
<script type="text/javascript" src="/js/common/time.js"></script>
	
</head>

<body>
	<!--header start-->
		<div class="header">
			<div class="logo"></div>
			<ul class="nav">
				<!-- <li>菜单栏目-1</li>
				<li>菜单栏目-2</li>
				<li>菜单栏目-3</li> -->
			</ul>
			<ul class="message">
				<li>
					<!-- <img src="../img/admin.png" /> -->
					<span>用户名</span>
				</li>
				<li>
					<!-- <img src="../img/logout.png" /> -->
					<span>退出</span>
				</li>
			</ul>
		</div>
		<div class="menu">
			<div class="layout">
				
			</div>
		</div>
	<!--header end-->
	<div class="main">
		<div class="title">
			<h3>
				当前位置：<span>菜单 > 菜单</span>	<span>总共${response.pageInfo.totalItems }条</span>
			</h3>
			<button class="btn addNew inputNew">新增</button>
			<button class="btn update inputUpdate">变更</button>
			<button class="btn delete inputDrop">注销</button>
			<button class="btn see">查看</button>
			<button class="btn search query">搜索</button>
		</div>
		<form id="listByPageForm" name="listByPageForm" action="/control/menu/menu" method="post">
		<!--table start-->
		<div class="table-container">
			<!--table list-->
			<div class="table">
				<table>
					<tr>
						<th>操作</th>
						<th>菜单号</th>
						<th>菜单名称</th>
						<th>菜单路径</th>
						<th>菜单类型</th>
						<th>父菜单号</th>
						<th>备注</th>
						<th>录入人代码</th>
						<th>录入人姓名</th>
						<th>录入时间</th>
						<th>核准人代码</th>
						<th>核准人姓名</th>
						<th>核准时间</th>
						<th>生效状态</th>
						<th>生效时间</th>
						<th>最近更新序号</th>
						<th>最近更新时间</th>
					</tr>
					<c:forEach items="${response.menuVoList }" var="menuVo">
						<tr>
							<td><input type="radio" name="radio" /></td>
							<td>${menuVo.menuId }</td>
							<td>${menuVo.menuName }</td>
							<td>${menuVo.menuUrl }</td>
							<td data-type="D10031">${menuVo.menuType }</td>
							<td>${menuVo.faMenu }</td>
							<td>${menuVo.remark }</td>
							<td>${menuVo.inputOperatorCode }</td>
							<td>${menuVo.inputOperatorName }</td>
							<td><fmt:formatDate value="${menuVo.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${menuVo.auditOperatorCode }</td>
							<td>${menuVo.auditOperatorName }</td>
							<td><fmt:formatDate value="${menuVo.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td data-type="D10013">${menuVo.effectStatus }</td>
							<td><fmt:formatDate value="${menuVo.effectDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${menuVo.updateSequenceNo }</td>
							<td><fmt:formatDate value="${menuVo.updateDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</table>
				<div class="pagination">
					<button id="prev" class="btn prev">上一页</button>
					<button id="next" class="btn next">下一页</button>
					<span class="pageNumber">
						第<span id="currentPage">${response.pageInfo.currentPage}</span>页
						／
						共<span id="totalPage">${response.pageInfo.totalPage }</span>页
					</span>
					<span>到</span>
					<input type="text" id="toCurrentPage" name="currentPage" value="${response.pageInfo.currentPage}" />
					<span>页</span>
					<button type="submit" class="btn" id="paegSubmit">确定</button>
				</div>
			</div>
		</div>
		<!--table end-->
	</form>
	</div>

	<!--preview-->
		<div class="preview">
			<div class="panel">
				<div class="panel-head">
					<h1>预览</h1>
					<button class="close">×</button>
				</div>
				<div class="panel-body">
					<ul>
						<!--预览项目将添加到这里-->
					</ul>
				</div>
				<div class="panel-foot">
					<button class="btn close">关闭</button>
				</div>
			</div>
		</div>
	<!--preview end-->
	
	<!--搜索弹出框开始-->
	<div class="input" id="search">
		<form id="queryMenuForm" name="queryMenuForm" action="/control/menu/menu">
			<h1>
				菜单搜索<span class="close">×</span>
			</h1>
			<ul>
				<li>
					<span>菜单编号：</span>
					<input type="text" id="query_menuId" name="menuId" value="${menuSearchVo.menuId}" />
				</li>
				<li>
					<span>菜单名称：</span>
					<input type="text" id="query_menuName" name="menuName" value="${menuSearchVo.menuName }" />
				</li>
				<li>
					<span>菜单路径：</span>
					<input type="text" id="query_menuUrl" name="menuUrl" value="${menuSearchVo.menuUrl }" />
				</li>
				<li>
					<span>菜单类型：</span>
					<select class="select" id="query_menuType" name="menuType" data-code="D10031" select-value="${menuSearchVo.menuType }">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>父菜单编号：</span>
					<input type="text" id="query_faMenu" name="faMenu" value="${menuSearchVo.faMenu }" />
				</li>
				<li>
					<span>录入人代码：</span>
					<input type="text" id="query_inputOperatorCode" name="inputOperatorCode" value="${menuSearchVo.inputOperatorCode }" />
				</li>
				<li>
					<span>录入人姓名：</span>
					<input type="text" id="query_inputOperatorName" name="inputOperatorName" value="${menuSearchVo.inputOperatorName }" />
				</li>
				<li>
					<span>核准人代码：</span>
					<input type="text" id="query_auditOperatorCode" name="auditOperatorCode" value="${menuSearchVo.auditOperatorCode }" />
				</li>
				<li>
					<span>核准人姓名：</span>
					<input type="text" id="query_auditOperatorName" name="auditOperatorName" value="${menuSearchVo.auditOperatorName }" />
				</li>
				<li>
					<span>录入时间：</span>
					<div class="time">
						<input type="text" id="query_inputDatetimeStartTime" name="inputDatetimeStartTime" value="${menuSearchVo.inputDatetimeStartTime }" />
						<input type="text" id="query_inputDatetimeEndTime" name="inputDatetimeEndTime" value="${menuSearchVo.inputDatetimeEndTime }" />
					</div>
				</li>
				<li>
					<span>核准时间：</span>
					<div class="time">
						<input type="text" id="query_auditDatetimeStartTime" name="auditDatetimeStartTime" value="${innerAccountSearchVo.auditDatetimeStartTime }" />
						<input type="text" id="query_auditDatetimeEndTime" name="auditDatetimeEndTime" value="${innerAccountSearchVo.auditDatetimeEndTime }" />
					</div>
				</li>
				<li>
					<span>生效时间：</span>
					<div class="time">
						<input type="text" id="query_effectDatetimeStartTime" name="effectDatetimeStartTime" value="${innerAccountSearchVo.effectDatetimeStartTime }" />
						<input type="text" id="query_effectDatetimeEndTime" name="effectDatetimeEndTime" value="${innerAccountSearchVo.effectDatetimeEndTime }" />
					</div>
				</li>
				<li>
					<span>最近更新时间：</span>
					<div class="time">
						<input type="text" id="query_updateDatetimeStartTime" name="updateDatetimeStartTime" value="${innerAccountSearchVo.updateDatetimeStartTime }" />
						<input type="text" id="query_updateDatetimeEndTime" name="updateDatetimeEndTime" value="${innerAccountSearchVo.updateDatetimeEndTime }" />
					</div>
				</li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">搜索</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
	</div>
	<!--搜索弹出框结束-->

	<!---------------------------【新增】【录入】弹出框------------------------->
	<div class="input" id="new">
		<form id="inputMenuNewForm" name="inputMenuNewForm" action="/control/menu/inputMenuNew" method="post">
			<h1>
				菜单新增录入<span class="close">×</span>
			</h1>
			<ul>
				<li><span>菜单名称：</span><input type="text" class="menuName" id="input_menuName_new" name="menuName" /></li>
					<li>
					<span>菜单类型：</span>
					<select class="select menuType" id="input_menuType_new" name="menuType" data-code="D10031">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>菜单路径：</span><input type="text" id="input_menuUrl_new" name="menuUrl" /></li>
				<li><span>父菜单编号：</span><input type="text" id="input_faMenu_new" name="faMenu" /></li>
				<li>
					<span>备注：</span>
					<textarea id="input_remark_new" name="remark"></textarea>
				</li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">确定</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
		<div class="inputMask"></div>
	</div>
	<!--新增弹出框结束-->

	<!---------------------------【变更】【录入】弹出框------------------------->
	<div class="input" id="update">
		<form id="inputMenuUpdateForm" name="inputMenuUpdateForm" action="/control/menu/inputMenuUpdate" method="post">
			<h1>
				菜单变更录入<span class="close">×</span>
			</h1>
			<ul>
				<li><span>菜单编号：</span><input type="text" id="input_menuId_update" name="menuId" readonly="true"/>
				<li><span>菜单名称：</span><input type="text" class="menuName" id="input_menuName_update" name="menuName" /></li>
					<li>
					<span>菜单类型：</span>
					<select class="select menuType" id="input_menuType_update" name="menuType" data-code="D10031">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>菜单路径：</span><input type="text" id="input_menuUrl_update" name="menuUrl" /></li>
				<li><span>父菜单编号：</span><input type="text" id="input_faMenu_update" name="faMenu" /></li>
				<li>
					<span>备注：</span>
					<textarea id="input_remark_update" name="remark"></textarea>
				</li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">确定</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
	</div>
	<!--变更弹出框结束-->

	<script type="text/javascript" src="/js/menu/menu.js"></script>
	<script type="text/javascript" src="/js/menu/common-menu.js"></script>
</body>

</html>