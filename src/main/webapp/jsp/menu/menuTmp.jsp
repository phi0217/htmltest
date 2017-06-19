<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>菜单痕迹表</title>
<link rel="stylesheet" href="/css/common/common.css" />
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
				当前位置：<span>菜单 > 菜单痕迹表痕迹表</span>	<span>总共${response.pageInfo.totalItems }条</span>
			</h3>
			<!-- 操作人信息 -->
			<input type="hidden" id="operCode" name="operCode" value="${request.operCode }"/>
			<button class="btn modify modify">修改</button>
			<button class="btn delete delete">删除</button>
			<button class="btn audit">核准</button>
			<button class="btn see">查看</button>
			<button class="btn search query">搜索</button>
		</div>
		<form id="listTmpByPageForm" name="listTmpByPageForm" action="/control/menu/menuTmp" method="post">
		<!--table start-->
		<div class="table-container">
			<!--table list-->
			<div class="table">
				<table>
					<tr>
						<th>操作</th>
						<th>操作序列号</th>
						<th>操作类型</th>
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
						<th>操作执行状态</th>
					</tr>
					<c:forEach items="${response.menuTmpVoList }" var="menuTmp">
						<tr>
							<td><input type="radio" name="radio" /></td>
							<td>${menuTmp.opSequenceNo }</td>
							<td data-type="D10014">${menuTmp.operType }</td>
							<td>${menuTmp.menuId }</td>
							<td>${menuTmp.menuName }</td>
							<td>${menuTmp.menuUrl }</td>
							<td data-type="D10031">${menuTmp.menuType }</td>
							<td>${menuTmp.faMenu }</td>
							<td>${menuTmp.remark }</td>
							<td>${menuTmp.inputOperatorCode }</td>
							<td>${menuTmp.inputOperatorName }</td>
							<td><fmt:formatDate value="${menuTmp.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${menuTmp.auditOperatorCode }</td>
							<td>${menuTmp.auditOperatorName }</td>
							<td><fmt:formatDate value="${menuTmp.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td data-type="D10015">${menuTmp.operExecuteStatus }</td>
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
		<form id="queryMenuTmpForm" name="queryMenuTmpForm" action="/control/menu/menuTmp">
			<h1>
				菜单痕迹表搜索<span class="close">×</span>
			</h1>
			<ul>
				<li>
					<span>操作类型：</span>
					<select class="select" id="query_operType" name="operType" data-code="D10014" select-value="${menuTmpSearchVo.operType }">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>菜单编号：</span>
					<input type="text" id="query_menuId" name="menuId" value="${menuTmpSearchVo.menuId}" />
				</li>
				<li>
					<span>菜单名称：</span>
					<input type="text" id="query_menuName" name="menuName" value="${menuTmpSearchVo.menuName }" />
				</li>
				<li>
					<span>菜单路径：</span>
					<input type="text" id="query_menuUrl" name="menuUrl" value="${menuTmpSearchVo.menuUrl }" />
				</li>
				<li>
					<span>菜单类型：</span>
					<select class="select" id="query_menuType" name="menuType" data-code="D10031" select-value="${menuTmpSearchVo.menuType }">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>父菜单编号：</span>
					<input type="text" id="query_faMenu" name="faMenu" value="${menuTmpSearchVo.faMenu }" />
				</li>
				<li>
					<span>录入人代码：</span>
					<input type="text" id="query_inputOperatorCode" name="inputOperatorCode" value="${innerAccountTmpSearchVo.inputOperatorCode }" />
				</li>
				<li>
					<span>录入人姓名：</span>
					<input type="text" id="query_inputOperatorName" name="inputOperatorName" value="${innerAccountTmpSearchVo.inputOperatorName }" />
				</li>
				<li>
					<span>核准人代码：</span>
					<input type="text" id="query_auditOperatorCode" name="auditOperatorCode" value="${innerAccountTmpSearchVo.auditOperatorCode }" />
				</li>
				<li>
					<span>核准人姓名：</span>
					<input type="text" id="query_auditOperatorName" name="auditOperatorName" value="${innerAccountTmpSearchVo.auditOperatorName }" />
				</li>
				<li>
					<span>录入时间：</span>
					<div class="time">
						<input type="text" id="query_inputDatetimeStartTime" name="inputDatetimeStartTime" value="${innerAccountTmpSearchVo.inputDatetimeStartTime }" />
						<input type="text" id="query_inputDatetimeEndTime" name="inputDatetimeEndTime" value="${innerAccountTmpSearchVo.inputDatetimeEndTime }" />
					</div>
				</li>
				<li>
					<span>核准时间：</span>
					<div class="time">
						<input type="text" id="query_auditDatetimeStartTime" name="auditDatetimeStartTime" value="${innerAccountTmpSearchVo.auditDatetimeStartTime }" />
						<input type="text" id="query_auditDatetimeEndTime" name="auditDatetimeEndTime" value="${innerAccountTmpSearchVo.auditDatetimeEndTime }" />
					</div>
				</li>
				<li>
					<span>操作执行状态：</span>
					<select class="select" id="query_operExecuteStatus" name="operExecuteStatus" data-code="D10015" select-value="${innerAccountTmpSearchVo.operExecuteStatus }">
						<option value="">--请选择--</option>
					</select>
				</li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">搜索</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
	</div>
	<!--搜索弹出框结束-->

	<!---------------------------【新增】【修改】弹出框------------------------->
	<div class="input" id="modifyNew">
		<form id="modifyMenuNewForm" name="modifyMenuNewForm" action="/control/menu/modifymenuNew" method="post">
			<h1>
				内部账户新增修改<span class="close">×</span>
			</h1>
			<ul>
				<input type="hidden" id="modify_opSequenceNo_new" name="opSequenceNo" />
				<input type="hidden" id="modify_operType_new" name="operType" />
				<li><span>菜单编号：</span><input type="text" class="menuId" id="modify_menuId_new" name="menuId" /></li>
				<li><span>菜单名称：</span><input type="text" class="menuName" id="modify_menuName_new" name="menuName" /></li>
					<li>
					<span>菜单类型：</span>
					<select class="select menuType" id="modify_menuType_new" name="menuType" data-code="D10031">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>菜单路径：</span><input type="text" id="modify_menuUrl_new" name="menuUrl" /></li>
				<li><span>父菜单编号：</span><input type="text" id="modify_faMenu_new" name="faMenu" /></li>
				<li>
					<span>备注：</span>
					<textarea id="modify_remark_new" name="remark"></textarea>
				</li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">确定</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
	</div>
	<!--【新增】【修改】弹出框结束-->

	<!---------------------------【变更】【修改】弹出框------------------------->
	<div class="input" id="modifyUpdate">
		<form id="modifyMenuUpdateForm" name="modifyMenuUpdateForm" action="/control/menu/modifyMenuUpdate" method="post">
			<h1>
				菜单变更修改<span class="close">×</span>
			</h1>
			<ul>
				<input type="hidden" id="modify_opSequenceNo_update" name="opSequenceNo" />
				<input type="hidden" id="modify_operType_update" name="operType" />
					<li><span>菜单编号：</span><input type="text" class="menuId" id="modify_menuId_update" name="menuId" /></li>
				<li><span>菜单名称：</span><input type="text" class="menuName" id="modify_menuName_update" name="menuName" /></li>
					<li>
					<span>菜单类型：</span>
					<select class="select menuType" id="modify_menuType_update" name="menuType" data-code="D10031">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>菜单路径：</span><input type="text" id="modify_menuUrl_update" name="menuUrl" /></li>
				<li><span>父菜单编号：</span><input type="text" id="modify_faMenu_update" name="faMenu" /></li>
				<li>
					<span>备注：</span>
					<textarea id="modify_remark_update" name="remark"></textarea>
				</li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">确定</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
	</div>
	<!--【变更】【修改】弹出框结束-->
	
	<!---------------------------【新增】【核准】弹出框------------------------->
	<div class="input" id="auditNew">
		<form id="auditNewForm" name="auditNewForm" action="" method="post">
			<h1>
				内部账户新增核准<span class="close">×</span>
			</h1>
			<ul>
				<input type="hidden" id="audit_opSequenceNo_new" name="opSequenceNo" />
				<input type="hidden" id="audit_operType_new" name="operType" />
				<li><span>菜单编号：</span><input type="text" class="menuId" id="audit_menuId_new" name="menuId" /></li>
				<li><span>菜单名称：</span><input type="text" class="menuName" id="audit_menuName_new" name="menuName" /></li>
					<li>
					<span>菜单类型：</span>
					<select class="select menuType" id="audit_menuType_new" name="menuType" data-code="D10031">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>菜单路径：</span><input type="text" id="audit_menuUrl_new" name="menuUrl" /></li>
				<li><span>父菜单编号：</span><input type="text" id="audit_faMenu_new" name="faMenu" /></li>
				<li>
					<span>备注：</span>
					<textarea id="audit_remark_new" name="remark"></textarea>
				</li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">确定</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
	</div>
	<!--【新增】【核准】弹出框结束-->
	
	<!---------------------------【变更】【核准】弹出框------------------------->
	<div class="input" id="auditUpdate">
		<form id="auditUpdateForm" name="auditUpdateForm" action="" method="post">
			<h1>
				内部账户变更核准<span class="close">×</span>
			</h1>
			<ul>
				<input type="hidden" id="audit_opSequenceNo_update" name="opSequenceNo" />
				<input type="hidden" id="audit_operType_update" name="operType" />
				<li><span>菜单编号：</span><input type="text" class="menuId" id="audit_menuId_update" name="menuId" /></li>
				<li><span>菜单名称：</span><input type="text" class="menuName" id="audit_menuName_update" name="menuName" /></li>
					<li>
					<span>菜单类型：</span>
					<select class="select menuType" id="audit_menuType_update" name="menuType" data-code="D10031">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>菜单路径：</span><input type="text" id="audit_menuUrl_update" name="menuUrl" /></li>
				<li><span>父菜单编号：</span><input type="text" id="audit_faMenu_update" name="faMenu" /></li>
				<li>
					<span>备注：</span>
					<textarea id="audit_remark_update" name="remark"></textarea>
				</li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">确定</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
	</div>
	<!--【变更】【核准】弹出框结束-->

	<!---------------------------【注销】【核准】弹出框------------------------->
	<div class="input" id="auditDrop">
		<form id="auditDropForm" name="auditDropForm" action="/control/menu/auditMenuDrop" method="post">
			<h1>
				内部账户注销核准<span class="close">×</span>
			</h1>
			<ul>
				<input type="hidden" id="audit_opSequenceNo_drop" name="opSequenceNo" />
				<input type="hidden" id="audit_operType_drop" name="operType" />
						<li><span>菜单编号：</span><input type="text" class="menuId" id="audit_menuId_drop" name="menuId" readonly="readonly" /></li>
				<li><span>菜单名称：</span><input type="text" class="menuName" id="audit_menuName_drop" name="menuName" disabled="true" /></li>
					<li>
					<span>菜单类型：</span>
					<select class="select menuType" id="audit_menuType_drop" name="menuType" data-code="D10031" disabled="true">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>菜单路径：</span><input type="text" id="audit_menuUrl_drop" name="menuUrl" disabled="true" /></li>
				<li><span>父菜单编号：</span><input type="text" id="audit_faMenu_drop" name="faMenu" disabled="true" /></li>
				<li>
					<span>备注：</span>
					<textarea id="audit_remark_update" name="remark" disabled="true"></textarea>
				</li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">确定</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
	</div>
	<!--【注销】【核准】弹出框结束-->

	<script type="text/javascript" src="/js/menu/menuTmp.js"></script>
	<script type="text/javascript" src="/js/menu/common-menu.js"></script>

</body>

</html>