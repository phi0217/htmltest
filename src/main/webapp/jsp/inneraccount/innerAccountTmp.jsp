<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>内部账户痕迹表</title>
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
				当前位置：<span>内部账户 > 内部账户痕迹表</span>	<span>总共${response.pageInfo.totalItems }条</span>
			</h3>
			<!-- 操作人信息 -->
			<input type="hidden" id="operCode" name="operCode" value="${request.operCode }"/>
			<button class="btn modify modify">修改</button>
			<button class="btn delete delete">删除</button>
			<button class="btn audit">核准</button>
			<button class="btn see">查看</button>
			<button class="btn search query">搜索</button>
		</div>
		<form id="listTmpByPageForm" name="listTmpByPageForm" action="/fund/inneraccount/inneraccounttmp" method="post">
		<!--table start-->
		<div class="table-container">
			<!--table list-->
			<div class="table">
				<table>
					<tr>
						<th>操作</th>
						<th>操作序列号</th>
						<th>操作类型</th>
						<th>内部账户帐号</th>
						<th>内部账号名称</th>
						<th>币种</th>
						<th>内部账户权限类型</th>
						<th>内部账户所有者(持有人账号)</th>
						<th>账户类型</th>
						<th>机内账户类型</th>
						<th>会计科目代码</th>
						<th>会计科目名称</th>
						<th>会计科目余额方向</th>
						<th>结转类型</th>
						<th>透支标志</th>
						<th>核销类型</th>
						<th>备注</th>
						<th>录入人代码</th>
						<th>录入人姓名</th>
						<th>录入时间</th>
						<th>核准人代码</th>
						<th>核准人姓名</th>
						<th>核准时间</th>
						<th>操作执行状态</th>
					</tr>
					<c:forEach items="${response.innerAccountTmpVoList }" var="innerAccountTmp">
						<tr>
							<td><input type="radio" name="radio" /></td>
							<td>${innerAccountTmp.opSequenceNo }</td>
							<td data-type="D10014">${innerAccountTmp.operType }</td>
							<td>${innerAccountTmp.innerAccount }</td>
							<td>${innerAccountTmp.innerAccountName }</td>
							<td>${innerAccountTmp.currency }</td>
							<td data-type="D10003">${innerAccountTmp.innerAccountAuthorityType }</td>
							<td>${innerAccountTmp.innerAccountOwnership }</td>
							<td data-type="D10009">${innerAccountTmp.accountType }</td>
							<td data-type="D10012">${innerAccountTmp.specialAccountType }</td>
							<td>${innerAccountTmp.subjectCode }</td>
							<td>${innerAccountTmp.subjectName }</td>
							<td data-type="D10004">${innerAccountTmp.subjectBalanceDirection }</td>
							<td data-type="D10005">${innerAccountTmp.balanceTransferType }</td>
							<td data-type="D10006">${innerAccountTmp.overdraftFlag }</td>
							<td data-type="D10008">${innerAccountTmp.verifyType }</td>
							<td>${innerAccountTmp.remark }</td>
							<td>${innerAccountTmp.inputOperatorCode }</td>
							<td>${innerAccountTmp.inputOperatorName }</td>
							<td><fmt:formatDate value="${innerAccountTmp.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${innerAccountTmp.auditOperatorCode }</td>
							<td>${innerAccountTmp.auditOperatorName }</td>
							<td><fmt:formatDate value="${innerAccountTmp.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td data-type="D10015">${innerAccountTmp.operExecuteStatus }</td>
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
		<form id="queryInnerAccountTmpForm" name="queryInnerAccountTmpForm" action="/fund/inneraccount/inneraccounttmp">
			<h1>
				内部账户搜索<span class="close">×</span>
			</h1>
			<ul>
				<li>
					<span>操作类型：</span>
					<select class="select" id="query_operType" name="operType" data-code="D10014" select-value="${innerAccountTmpSearchVo.operType }">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>内部账户账号：</span>
					<input type="text" id="query_innerAccount" name="innerAccount" value="${innerAccountTmpSearchVo.innerAccount }" />
				</li>
				<li>
					<span>内部账户名称：</span>
					<input type="text" id="query_innerAccountName" name="innerAccountName" value="${innerAccountTmpSearchVo.innerAccountName }" /></li>
				<li>
					<span>内部账户权限类型：</span>
					<select class="select" id="query_innerAccountAuthorityType" name="innerAccountAuthorityType" data-code="D10003" select-value="${innerAccountTmpSearchVo.innerAccountAuthorityType }">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>内部账户所有者(持有人账号)：</span>
					<input type="text" id="query_innerAccountOwnership" name="innerAccountOwnership" value="${innerAccountTmpSearchVo.innerAccountOwnership }" />
				</li>
				<li>
					<span>币种：</span>
						<select  class="currencySelect" id="query_currency" name="currency" select-value="${innerAccountTmpSearchVo.currencyCode }">
							<option value="">--请选择--</option>
						</select>
				</li>
				<li>
					<span>会计科目代码：</span>
					<input type="text" id="query_subjectCode" name="subjectCode" value="${innerAccountTmpSearchVo.subjectCode }" />
				</li>
				<li>
					<span>会计科目名称：</span>
					<input type="text" id="query_subjectName" name="subjectName" value="${innerAccountTmpSearchVo.subjectName }" />
				</li>
				<li>
					<span>会计科目余额方向：</span>
					<select class="select" id="query_subjectBalanceDirection" name="subjectBalanceDirection" data-code="D10004" select-value="${innerAccountTmpSearchVo.subjectBalanceDirection }">
						<option value="">--请选择--</option>
					</select>
				</li>
				<%-- <li>
					<span>账户余额：</span>
					<input type="text" id="query_innerAccountBalance" name="innerAccountBalance" value="${innerAccountTmpSearchVo.innerAccountBalance }" />
				</li> --%>
				<li>
					<span>结转标志：</span>
					<select class="select" id="query_balanceTransferType" name="balanceTransferType" data-code="D10005" select-value="${innerAccountTmpSearchVo.balanceTransferType }">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>透支标志：</span>
					<select class="select" id="query_overdraftFlag" name="overdraftFlag" data-code="D10006" select-value="${innerAccountTmpSearchVo.overdraftFlag }">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>核销标志：</span>
					<select class="select" id="query_verifyType" name="verifyType" data-code="D10008" select-value="${innerAccountTmpSearchVo.verifyType }">
						<option value="">--请选择--</option>
					</select>
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
		<form id="modifyInnerAccountNewForm" name="modifyInnerAccountNewForm" action="/fund/inneraccount/modifyinneraccountnew" method="post">
			<h1>
				内部账户新增修改<span class="close">×</span>
			</h1>
			<ul>
				<input type="hidden" id="modify_opSequenceNo_new" name="opSequenceNo" />
				<input type="hidden" id="modify_operType_new" name="operType" />
				<li><span>内部账户账号：</span><input type="text" class="innerAccount" id="modify_innerAccount_new" name="innerAccount" /></li>
				<!-- 币种代码 -->
				<input type="hidden" class="currencyCode" id="modify_currencyCode_new" name="currencyCode" readonly="true" />
				<li>
					<span>币种：</span>
					<select class="currencySelect currency" id="modify_currency_new" name="currency">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>币种名称（中文）：</span><input type="text" class="currencyNameCn" id="modify_currencyNameCn_new" name="currencyNameCn" disabled="true" /></li>
				<!-- 会计科目代码 -->
				<input type="hidden" class="subjectCode" id="modify_subjectCode_new" name="subjectCode" />
				<li><span>会计科目名称：</span><input type="text" class="subjectName" id="modify_subjectName_new" name="subjectName" disabled="true" /></li>
				<li><span>内部账户名称：</span><input type="text" id="modify_innerAccountName_new" name="innerAccountName" /></li>
				<li>
					<span>内部账户权限类型：</span>
					<select class="select innerAccountAuthorityType" id="modify_innerAccountAuthorityType_new" name="innerAccountAuthorityType" data-code="D10003">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>内部账户所有者(持有人账号)：</span><input type="text" class="innerAccountOwnership" id="modify_innerAccountOwnership_new" name="innerAccountOwnership" /></li>
				<li>
					<span>会计科目余额方向：</span>
					<select class="select" id="modify_subjectBalanceDirection_new" name="subjectBalanceDirection" data-code="D10004">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>结转标志：</span>
					<select class="select" id="modify_balanceTransferType_new" name="balanceTransferType" data-code="D10005">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>透支标志：</span>
					<select class="select" id="modify_overdraftFlag_new" name="overdraftFlag" data-code="D10006">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>核销标志：</span>
					<select class="select" id="modify_verifyType_new" name="verifyType" data-code="D10008">
						<option value="">--请选择--</option>
					</select>
				</li>
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
		<form id="modifyInnerAccountUpdateForm" name="modifyInnerAccountUpdateForm" action="/fund/inneraccount/modifyinneraccountupdate" method="post">
			<h1>
				内部账户变更修改<span class="close">×</span>
			</h1>
			<ul>
				<input type="hidden" id="modify_opSequenceNo_update" name="opSequenceNo" />
				<input type="hidden" id="modify_operType_update" name="operType" />
				<li><span>内部账户账号：</span><input type="text" class="innerAccount" id="modify_innerAccount_update" name="innerAccount" readonly="true" /></li>
				<!-- 币种代码 -->
				<input type="hidden" class="currencyCode" id="modify_currencyCode_update" name="currencyCode" readonly="true" />
				<li><span>币种名称（中文）：</span><input type="text" class="currencyNameCn" id="modify_currencyNameCn_update" name="currencyNameCn" disabled="true" /></li>
				<!-- 会计科目代码 -->
				<input type="hidden" class="subjectCode" id="modify_subjectCode_update" name="subjectCode" />
				<li><span>会计科目名称：</span><input type="text" class="subjectName" id="modify_subjectName_update" name="subjectName" disabled="true" /></li>
				<li><span>内部账户名称：</span><input type="text" id="modify_innerAccountName_update" name="innerAccountName" /></li>
				<li>
					<span>内部账户权限类型：</span>
					<select class="select innerAccountAuthorityType" id="modify_innerAccountAuthorityType_update" name="innerAccountAuthorityType" data-code="D10003">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>内部账户所有者(持有人账号)：</span><input type="text" class="innerAccountOwnership" id="modify_innerAccountOwnership_update" name="innerAccountOwnership" /></li>
				<li>
					<span>会计科目余额方向：</span>
					<select class="select" id="modify_subjectBalanceDirection_update" name="subjectBalanceDirection" data-code="D10004">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>结转标志：</span>
					<select class="select" id="modify_balanceTransferType_update" name="balanceTransferType" data-code="D10005">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>透支标志：</span>
					<select class="select" id="modify_overdraftFlag_update" name="overdraftFlag" data-code="D10006">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>核销标志：</span>
					<select class="select" id="modify_verifyType_update" name="verifyType" data-code="D10008">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>备注：</span><textarea id="modify_remark_update" name="remark"></textarea></li>
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
				<li><span>内部账户账号：</span><input type="text" class="innerAccount" id="audit_innerAccount_new" name="innerAccount" /></li>
				<!-- 币种代码 -->
				<input type="hidden" class="currencyCode" id="audit_currencyCode_new" name="currencyCode" readonly="true" />
				<li>
					<span>币种：</span>
						<select class="currencySelect currency" id="audit_currency_new" name="currency">
						<option value="">--请选择--</option>
						</select>
				</li>
				<li><span>币种名称（中文）：</span><input type="text" class="currencyNameCn" id="audit_currencyNameCn_new" name="currencyNameCn" disabled="true" /></li>
				<!-- 会计科目代码 -->
				<input type="hidden" class="subjectCode" id="audit_subjectCode_new" name="subjectCode" />
				<li><span>会计科目名称：</span><input type="text" class="subjectName" id="audit_subjectName_new" name="subjectName" disabled="true" /></li>
				<li><span>内部账户名称：</span><input type="text" id="audit_innerAccountName_new" name="innerAccountName" /></li>
				<li>
					<span>内部账户权限类型：</span>
					<select class="select innerAccountAuthorityType" id="audit_innerAccountAuthorityType_new" name="innerAccountAuthorityType" data-code="D10003">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>内部账户所有者(持有人账号)：</span><input type="text" class="innerAccountOwnership" id="audit_innerAccountOwnership_new" name="innerAccountOwnership" /></li>
				<li>
					<span>会计科目余额方向：</span>
					<select class="select" id="audit_subjectBalanceDirection_new" name="subjectBalanceDirection" data-code="D10004">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>结转标志：</span>
					<select class="select" id="audit_balanceTransferType_new" name="balanceTransferType" data-code="D10005">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>透支标志：</span>
					<select class="select" id="audit_overdraftFlag_new" name="overdraftFlag" data-code="D10006">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>核销标志：</span>
					<select class="select" id="audit_verifyType_new" name="verifyType" data-code="D10008">
						<option value="">--请选择--</option>
					</select>
				</li>
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
				<li><span>内部账户账号：</span><input type="text" class="innerAccount" id="audit_innerAccount_update" name="innerAccount" readonly="true" /></li>
				<!-- 币种代码 -->
				<input type="hidden" class="currencyCode" id="audit_currencyCode_update" name="currencyCode" readonly="true" />
				<li><span>币种名称（中文）：</span><input type="text" class="currencyNameCn" id="audit_currencyNameCn_update" name="currencyNameCn" disabled="true" /></li>
				<!-- 会计科目代码 -->
				<input type="hidden" class="subjectCode" id="audit_subjectCode_update" name="subjectCode" />
				<li><span>会计科目名称：</span><input type="text" class="subjectName" id="audit_subjectName_update" name="subjectName" disabled="true" /></li>
				<li><span>内部账户名称：</span><input type="text" id="audit_innerAccountName_update" name="innerAccountName" /></li>
				<li>
					<span>内部账户权限类型：</span>
					<select class="select innerAccountAuthorityType" id="audit_innerAccountAuthorityType_update" name="innerAccountAuthorityType" data-code="D10003">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>内部账户所有者(持有人账号)：</span><input type="text" class="innerAccountOwnership" id="audit_innerAccountOwnership_update" name="innerAccountOwnership" /></li>
				<li>
					<span>会计科目余额方向：</span>
					<select class="select" id="audit_subjectBalanceDirection_update" name="subjectBalanceDirection" data-code="D10004">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>结转标志：</span>
					<select class="select" id="audit_balanceTransferType_update" name="balanceTransferType" data-code="D10005">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>透支标志：</span>
					<select class="select" id="audit_overdraftFlag_update" name="overdraftFlag" data-code="D10006">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>核销标志：</span>
					<select class="select" id="audit_verifyType_update" name="verifyType" data-code="D10008">
						<option value="">--请选择--</option>
					</select>
				</li>
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
		<form id="auditDropForm" name="auditDropForm" action="" method="post">
			<h1>
				内部账户注销核准<span class="close">×</span>
			</h1>
			<ul>
				<input type="hidden" id="audit_opSequenceNo_drop" name="opSequenceNo" />
				<input type="hidden" id="audit_operType_drop" name="operType" />
				<li><span>内部账户账号：</span><input type="text" class="innerAccount" id="audit_innerAccount_drop" name="innerAccount" /></li>
				<!-- 币种代码 -->
				<input type="hidden" class="currencyCode" id="audit_currencyCode_drop" name="currencyCode" readonly="true" />
				<li><span>币种名称（中文）：</span><input type="text" class="currencyNameCn" id="audit_currencyNameCn_drop" name="currencyNameCn" disabled="true" /></li>
				<!-- 会计科目代码 -->
				<input type="hidden" class="subjectCode" id="audit_subjectCode_drop" name="subjectCode" />
				<li><span>会计科目名称：</span><input type="text" class="subjectName" id="audit_subjectName_drop" name="subjectName" disabled="true" /></li>
				<li><span>内部账户名称：</span><input type="text" id="audit_innerAccountName_drop" name="innerAccountName" disabled="true" /></li>
				<li>
					<span>内部账户权限类型：</span>
					<select class="select innerAccountAuthorityType" id="audit_innerAccountAuthorityType_drop" name="innerAccountAuthorityType" data-code="D10003" disabled="true">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li><span>内部账户所有者(持有人账号)：</span><input type="text" class="innerAccountOwnership" id="audit_innerAccountOwnership_drop" name="innerAccountOwnership" disabled="true" /></li>
				<li>
					<span>会计科目余额方向：</span>
					<select class="select" id="audit_subjectBalanceDirection_drop" name="subjectBalanceDirection" data-code="D10004" disabled="true">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>结转标志：</span>
					<select class="select" id="audit_balanceTransferType_drop" name="balanceTransferType" data-code="D10005" disabled="true">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>透支标志：</span>
					<select class="select" id="audit_overdraftFlag_drop" name="overdraftFlag" data-code="D10006" disabled="true">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>核销标志：</span>
					<select class="select" id="audit_verifyType_drop" name="verifyType" data-code="D10008" disabled="true">
						<option value="">--请选择--</option>
					</select>
				</li>
				<li>
					<span>备注：</span>
					<textarea id="audit_remark_drop" name="remark"></textarea>
				</li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">确定</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
	</div>
	<!--【注销】【核准】弹出框结束-->

	<script type="text/javascript" src="/js/inneraccount/innerAccountTmp.js"></script>
	<script type="text/javascript" src="/js/inneraccount/common-inneraccount.js"></script>

</body>

</html>