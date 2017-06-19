<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.xinfengtech.member.interfaces.constants.MemberFieldConstants"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>持有人账号</title>
<link rel="stylesheet" href="/css/common/common.css" />
<script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>

<c:set var="HOLDER_ACCOUNT_UN_AUDIT"
	value="<%=MemberFieldConstants.HOLDER_ACCOUNT_UN_AUDIT%>" />
<c:set var="HOLDER_ACCOUNT_NORMAL"
	value="<%=MemberFieldConstants.HOLDER_ACCOUNT_NORMAL%>" />
<c:set var="HOLDER_ACCOUNT_DROP"
	value="<%=MemberFieldConstants.HOLDER_ACCOUNT_DROP%>" />
<c:set var="HOLDER_ACCOUNT_FREEZE"
	value="<%=MemberFieldConstants.HOLDER_ACCOUNT_FREEZE%>" />

<c:set var="EFFECT_NO" value="<%=MemberFieldConstants.EFFECT_NO%>" />
<c:set var="EFFECT_YES" value="<%=MemberFieldConstants.EFFECT_YES%>" />
<c:set var="EFFECT_CANCEL"
	value="<%=MemberFieldConstants.EFFECT_CANCEL%>" />
<c:set var="EFFECT_FREEZE"
	value="<%=MemberFieldConstants.EFFECT_FREEZE%>" />

<c:set var="RESULT_FLAG_SUCCESS"
	value="<%=MemberFieldConstants.RESULT_FLAG_SUCCESS%>" />
<input type="hidden" name="RESULT_FLAG_SUCCESS" id="RESULT_FLAG_SUCCESS"
	value="<%=MemberFieldConstants.RESULT_FLAG_SUCCESS%>" />
</head>

<body>
	<div class="main">
		<div class="title">
			<h3>
				当前位置：<span>持有人账号 > 持有人账号</span>
			</h3>
			<button class="btn addNew inputNew">新增</button>
			<button class="btn search query">搜索</button>
		</div>
		<!--table start-->
		<div class="table-container">
			<!--table list-->
			<div class="table">
				<table>
					<tr>
						<th>持有人账号</th>
						<th>参与者编号</th>
						<th>参与者简称</th>
						<th>参与者全称</th>
						<th>持有人账号简称（中文）</th>
						<th>持有人账号全称（中文）</th>
						<th>持有人帐号简称（英文）</th>
						<th>持有人帐号全称（英文）</th>
						<th>非法人机构对应的银行</th>
						<th>发票抬头</th>
						<th>交易身份类型</th>
						<th>持有人账号首字母</th>
						<th>投资者标识</th>
						<th>备注</th>
						<th>录入人代码</th>
						<th>录入人姓名</th>
						<th>录入时间</th>
						<th>核准人代码</th>
						<th>核准人姓名</th>
						<th>核准时间</th>
						<th>生效状态</th>
						<th>生效时间</th>
						<th>持有人账号状态</th>
						<th>开户时间</th>
						<th>销户时间</th>
						<th>最近更新序号</th>
						<th>最近更新时间</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${response.holderAccountVoList }"
						var="holderAccount">
						<tr>
							<td>${holderAccount.holderAccount }</td>
							<td>${holderAccount.memberId }</td>
							<td>${holderAccount.memShortName }</td>
							<td>${holderAccount.memFullName }</td>
							<td>${holderAccount.holderShortNameCn }</td>
							<td>${holderAccount.holderNameCn }</td>
							<td>${holderAccount.holderShortNameEn }</td>
							<td>${holderAccount.holderNameEn }</td>
							<td>${holderAccount.unCorpBank }</td>
							<td>${holderAccount.invoiceTitle }</td>
							<td><c:choose>
									<c:when test="${'1' eq holderAccount.feesIdentityType }">
										境内
									</c:when>
									<c:when test="${'2' eq holderAccount.feesIdentityType }">
										境外
									</c:when>
								</c:choose>
							<td>${holderAccount.prefixType }</td>
							</td>
							<td><c:choose>
									<c:when test="${'1' eq holderAccount.investorType }">
										投资者标识1
									</c:when>
									<c:when test="${'2' eq holderAccount.investorType }">
										投资者标识2
									</c:when>
									<c:when test="${'3' eq holderAccount.investorType }">
										投资者标识3
									</c:when>
									<c:when test="${'4' eq holderAccount.investorType }">
										投资者标识4
									</c:when>
									<c:when test="${'5' eq holderAccount.investorType }">
										投资者标识5
									</c:when>
								</c:choose></td>
							<td>${holderAccount.remark }</td>
							<td>${holderAccount.inputOperatorCode }</td>
							<td>${holderAccount.inputOperatorName }</td>
							<td><fmt:formatDate value="${holderAccount.inputDatetime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${holderAccount.auditOperatorCode }</td>
							<td>${holderAccount.auditOperatorName }</td>
							<td><fmt:formatDate value="${holderAccount.auditDatetime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><c:choose>
									<c:when test="${EFFECT_NO eq holderAccount.effectStatus }">
										未生效
									</c:when>
									<c:when test="${EFFECT_YES eq holderAccount.effectStatus }">
										已生效
									</c:when>
									<c:when test="${EFFECT_CANCEL eq holderAccount.effectStatus }">
										已注销
									</c:when>
									<c:when test="${EFFECT_FREEZE eq holderAccount.effectStatus }">
										已冻结
									</c:when>
								</c:choose></td>
							<td><fmt:formatDate value="${holderAccount.effectDatetime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><c:choose>
									<c:when
										test="${HOLDER_ACCOUNT_UN_AUDIT eq holderAccount.holderAccountStatus }">
										未复核
									</c:when>
									<c:when
										test="${HOLDER_ACCOUNT_NORMAL eq holderAccount.holderAccountStatus }">
										正常
									</c:when>
									<c:when
										test="${HOLDER_ACCOUNT_DROP eq holderAccount.holderAccountStatus }">
										已注销
									</c:when>
									<c:when
										test="${HOLDER_ACCOUNT_FREEZE eq holderAccount.holderAccountStatus }">
										已冻结
									</c:when>
								</c:choose></td>
							<td><fmt:formatDate
									value="${holderAccount.accountOpenDatetime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><fmt:formatDate
									value="${holderAccount.accountCancelDatetime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${holderAccount.updateSequenceNo }</td>
							<td><fmt:formatDate value="${holderAccount.updateDatetime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><c:choose>
									<c:when
										test="${HOLDER_ACCOUNT_NORMAL eq holderAccount.holderAccountStatus }">
										<button class="btn update inputUpdate">变更</button>
										<button class="btn delete inputDrop">注销</button>
										<button class="btn delete inputFreeze">冻结</button>
									</c:when>
									<c:when
										test="${HOLDER_ACCOUNT_FREEZE eq holderAccount.holderAccountStatus }">
										<button class="btn delete inputUnfreeze">解冻</button>
									</c:when>
									<c:when
										test="${HOLDER_ACCOUNT_DROP eq holderAccount.holderAccountStatus }">
										<button class="btn delete inputActivate">激活</button>
									</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!--table end-->
	</div>

	<!--搜索弹出框开始-->
	<div class="input" id="search">
		<form id="queryHolderAccountForm" name="queryHolderAccountForm"
			action="/member/holderaccount/fuzzyqueryholderaccount" method="post">
			<h1>
				持有人账号搜索<span class="close">×</span>
			</h1>
			<ul>
				<li><span>参与者编号：</span><input type="text" id="query_memberId"
					name="memberId" /></li>
				<li><span>参与者简称：</span><input type="text"
					id="query_memberShortName" name="memberShortName" /></li>
				<li><span>参与者全称：</span><input type="text" id="query_memberName"
					name="memberName" /></li>
				<li><span>持有人账号：</span><input type="text"
					id="query_holderAccount" name="holderAccount" /></li>
				<li><span>持有人账号简称（中文）：</span><input type="text"
					id="query_holderShortNameCn" name="holderShortNameCn" /></li>
				<li><span>持有人账号全称（中文）：</span><input type="text"
					id="query_holderNameCn" name="holderNameCn" /></li>
				<li><span>持有人账号状态：</span> <select
					id="query_holderAccountStatus" name="holderAccountStatus">
						<option value="">--请选择--</option>
						<option value="${HOLDER_ACCOUNT_NORMAL}">正常</option>
						<option value="${HOLDER_ACCOUNT_FREEZE}">已冻结</option>
						<option value="${HOLDER_ACCOUNT_DROP}">已注销</option>
				</select></li>
				<li><span>交易身份类型：</span> <select id="query_feesIdentityType"
					name="feesIdentityType">
						<option value="">--请选择--</option>
						<option value="1">境内</option>
						<option value="2">境外</option>
				</select></li>
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
		<form id="inputHolderAccountNewForm" name="inputHolderAccountNewForm"
			action="/member/holderaccount/inputholderaccountnew" method="post">
			<h1>
				持有人账号新增录入<span class="close">×</span>
			</h1>
			<ul>
				<li><span>持有人账号：</span> <input type="text"
					id="input_holderAccount_new" name="holderAccount" /> <input
					type="button" id="get_holderAccountSn" value="自动生成持有人账号号码" /></li>
				<li><span>参与者编号：</span><input type="text"
					id="input_memberId_new" name="memberId" /></li>
				<li><span>参与者简称：</span><input type="text"
					id="input_memberShortName_new" name="memberShortName" disabled="true" /></li>
				<li><span>参与者全称：</span><input type="text" id="input_memberName_new"
					name="memberName"  disabled="true" /></li>
				<li><span>持有人账号简称（中文）：</span><input type="text"
					id="input_holderShortNameCn_new" name="holderShortNameCn" /></li>
				<li><span>持有人账号全称（中文）：</span><input type="text"
					id="input_holderNameCn_new" name="holderNameCn" /></li>
				<li><span>持有人帐号简称（英文）：</span><input type="text"
					id="input_holderShortNameEn_new" name="holderShortNameEn" /></li>
				<li><span>持有人帐号全称（英文）：</span><input type="text"
					id="input_holderNameEn_new" name="holderNameEn" /></li>
				<li><span>非法人机构对应的托管银行：</span> <select
					id="input_unCorpBank_new" name="unCorpBank">
						<option value="">--请选择--</option>
						<option value="托管银行1">托管银行1</option>
						<option value="托管银行2">托管银行2</option>
						<option value="托管银行3">托管银行3</option>
						<option value="托管银行4">托管银行4</option>
						<option value="托管银行5">托管银行5</option>
				</select></li>
				<li><span>发票抬头：</span><input type="text"
					id="input_invoiceTitle_new" name="invoiceTitle" /></li>
				<li><span>交易身份类型：</span> <select
					id="input_feesIdentityType_new" name="feesIdentityType">
						<option value="">--请选择--</option>
						<option value="1">境内</option>
						<option value="2">境外</option>
				</select></li>
				<li><span>持有人账号首字母：</span> <select id="input_prefixType_new"
					name="prefixType">
						<option value="">--请选择--</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></li>
				<li><span>投资者标识：</span> <select id="input_investorType_new"
					name="investorType">
						<option value="">--请选择--</option>
						<option value="1">投资者标识1</option>
						<option value="2">投资者标识2</option>
						<option value="3">投资者标识3</option>
						<option value="4">投资者标识4</option>
						<option value="5">投资者标识5</option>
				</select></li>
				<li><span>备注：</span> <textarea id="input_remark_new"
						name="remark"></textarea></li>
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
		<form id="inputHolderAccountUpdateForm"
			name="inputHolderAccountUpdateForm"
			action="/member/holderaccount/inputholderaccountupdate" method="post">
			<h1>
				持有人账号变更录入<span class="close">×</span>
			</h1>
			<ul>
				<li><span>持有人账号：</span><input type="text"
					id="input_holderAccount_update" name="holderAccount" /></li>
				<li><span>参与者编号：</span><input type="text"
					id="input_memberId_update" name="memberId" /></li>
				<li><span>参与者简称：</span><input type="text"
					id="input_memberShortName_update" name="memberShortName" disabled="true" /></li>
				<li><span>参与者全称：</span><input type="text" id="input_memberName_update"
					name="memberName"  disabled="true" /></li>
				<li><span>持有人账号简称（中文）：</span><input type="text"
					id="input_holderShortNameCn_update" name="holderShortNameCn" /></li>
				<li><span>持有人账号全称（中文）：</span><input type="text"
					id="input_holderNameCn_update" name="holderNameCn" /></li>
				<li><span>持有人帐号简称（英文）：</span><input type="text"
					id="input_holderShortNameEn_update" name="holderShortNameEn" /></li>
				<li><span>持有人帐号全称（英文）：</span><input type="text"
					id="input_holderNameEn_update" name="holderNameEn" /></li>
				<li><span>非法人机构对应的托管银行：</span> <select
					id="input_unCorpBank_update" name="unCorpBank">
						<option value="">--请选择--</option>
						<option value="托管银行1">托管银行1</option>
						<option value="托管银行2">托管银行2</option>
						<option value="托管银行3">托管银行3</option>
						<option value="托管银行4">托管银行4</option>
						<option value="托管银行5">托管银行5</option>
				</select></li>
				<li><span>发票抬头：</span><input type="text"
					id="input_invoiceTitle_update" name="invoiceTitle" /></li>
				<li><span>交易身份类型：</span> <select
					id="input_feesIdentityType_update" name="feesIdentityType">
						<option value="">--请选择--</option>
						<option value="1">境内</option>
						<option value="2">境外</option>
				</select></li>
				<li><span>持有人账号首字母：</span> <select id="input_prefixType_update"
					name="prefixType">
						<option value="">--请选择--</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></li>
				<li><span>投资者标识：</span> <select id="input_investorType_update"
					name="investorType">
						<option value="">--请选择--</option>
						<option value="1">投资者标识1</option>
						<option value="2">投资者标识2</option>
						<option value="3">投资者标识3</option>
						<option value="4">投资者标识4</option>
						<option value="5">投资者标识5</option>
				</select></li>
				<li><span>备注：</span> <textarea id="input_remark_new"
						name="remark"></textarea></li>
			</ul>
			<div class="btns">
				<button class="btn submit" type="submit">确定</button>
				<button class="btn close" type="button">取消</button>
			</div>
		</form>
	</div>
	<!--变更弹出框结束-->

	<script type="text/javascript" src="/js/holderaccount/holderAccount.js"></script>

</body>

</html>