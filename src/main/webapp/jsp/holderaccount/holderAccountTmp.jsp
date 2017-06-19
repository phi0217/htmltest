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
		<title>我的申请列表</title>
		<link rel="stylesheet" href="/css/common/common.css" />
		<script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="/js/common/common.js"></script>
				
		<c:set var="HOLDER_ACCOUNT_UN_AUDIT" value="<%=MemberFieldConstants.HOLDER_ACCOUNT_UN_AUDIT%>" />
		<c:set var="HOLDER_ACCOUNT_NORMAL" value="<%=MemberFieldConstants.HOLDER_ACCOUNT_NORMAL%>" />
		<c:set var="HOLDER_ACCOUNT_DROP" value="<%=MemberFieldConstants.HOLDER_ACCOUNT_DROP%>" />
		<c:set var="HOLDER_ACCOUNT_FREEZE" value="<%=MemberFieldConstants.HOLDER_ACCOUNT_FREEZE%>" />
		
		<c:set var="OPER_ADD" value="<%=MemberFieldConstants.OPER_ADD%>" />
		<c:set var="OPER_CHANGE" value="<%=MemberFieldConstants.OPER_CHANGE%>" />
		<c:set var="OPER_CANCEL" value="<%=MemberFieldConstants.OPER_CANCEL%>" />
		<c:set var="OPER_ACTIVATE" value="<%=MemberFieldConstants.OPER_ACTIVATE%>" />
		<c:set var="OPER_FREEZE" value="<%=MemberFieldConstants.OPER_FREEZE%>" />
		<c:set var="OPER_UNFREEZE" value="<%=MemberFieldConstants.OPER_UNFREEZE%>" />
		
		<c:set var="AUDIT_NO" value="<%=MemberFieldConstants.AUDIT_NO%>" />
		<c:set var="AUDIT_IN" value="<%=MemberFieldConstants.AUDIT_IN%>" />
		<c:set var="AUDIT_YES" value="<%=MemberFieldConstants.AUDIT_YES%>" />
		<c:set var="AUDIT_CANCEL" value="<%=MemberFieldConstants.AUDIT_CANCEL%>" />
		
		<c:set var="RESULT_FLAG_SUCCESS" value="<%=MemberFieldConstants.RESULT_FLAG_SUCCESS%>" />
		<input type="hidden" name="RESULT_FLAG_SUCCESS" id="RESULT_FLAG_SUCCESS" value="<%=MemberFieldConstants.RESULT_FLAG_SUCCESS%>" />
	</head>

	<body>
		<div class="main">
			<div class="title">
				<h3>当前位置：<span>持有人账号 > 我的申请列表</span></h3>
				<!-- <button class="btn search query">搜索</button> -->
			</div>
			<!--table start-->
			<div class="table-container">
				<!--table list-->
				<div class="table">
					<table>
						<tr>
							<th>操作序列号</th>
							<th>操作类型</th>
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
							<th>操作执行状态</th>
							<th>持有人账号状态</th>
							<th>开户时间</th>
							<th>销户时间</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${response.holderAccountTmpVoList }" var="holderAccountTmp">
						<tr>
							<td>${holderAccountTmp.opSequenceNo }</td>
							<td>
								<c:choose>
									<c:when test="${OPER_ADD eq holderAccountTmp.operType }">
										新增
									</c:when>
									<c:when test="${OPER_CHANGE eq holderAccountTmp.operType }">
										变更
									</c:when>
									<c:when test="${OPER_CANCEL eq holderAccountTmp.operType }">
										注销
									</c:when>
									<c:when test="${OPER_ACTIVATE eq holderAccountTmp.operType }">
										激活
									</c:when>
									<c:when test="${OPER_FREEZE eq holderAccountTmp.operType }">
										冻结
									</c:when>
									<c:when test="${OPER_UNFREEZE eq holderAccountTmp.operType }">
										解冻
									</c:when>
								</c:choose>
							</td>
							<td>${holderAccountTmp.holderAccount }</td>
							<td>${holderAccountTmp.memberId }</td>
							<td>${holderAccountTmp.memShortName }</td>
							<td>${holderAccountTmp.memFullName }</td>
							<td>${holderAccountTmp.holderShortNameCn }</td>
							<td>${holderAccountTmp.holderNameCn }</td>
							<td>${holderAccountTmp.holderShortNameEn }</td>
							<td>${holderAccountTmp.holderNameEn }</td>
							<td>${holderAccountTmp.unCorpBank }</td>
							<td>${holderAccountTmp.invoiceTitle }</td>
							<td>
								<c:choose>
									<c:when test="${'1' eq holderAccountTmp.feesIdentityType }" >
										境内
									</c:when>
									<c:when test="${'2' eq holderAccountTmp.feesIdentityType }" >
										境外
									</c:when>
								</c:choose>
							<td>${holderAccountTmp.prefixType }</td>
							</td>
							<td>
								<c:choose>
									<c:when test="${'1' eq holderAccountTmp.investorType }" >
										投资者标识1
									</c:when>
									<c:when test="${'2' eq holderAccountTmp.investorType }" >
										投资者标识2
									</c:when>
									<c:when test="${'3' eq holderAccountTmp.investorType }" >
										投资者标识3
									</c:when>
									<c:when test="${'4' eq holderAccountTmp.investorType }" >
										投资者标识4
									</c:when>
									<c:when test="${'5' eq holderAccountTmp.investorType }" >
										投资者标识5
									</c:when>
								</c:choose>
							</td>
							<td>${holderAccountTmp.remark }</td>
							<td>${holderAccountTmp.inputOperatorCode }</td>
							<td>${holderAccountTmp.inputOperatorName }</td>
							<td><fmt:formatDate value="${holderAccountTmp.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${holderAccountTmp.auditOperatorCode }</td>
							<td>${holderAccountTmp.auditOperatorName }</td>
							<td><fmt:formatDate value="${holderAccountTmp.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
								<c:choose>
									<c:when test="${AUDIT_NO eq holderAccountTmp.operExecuteStatus }">
										待复核
									</c:when>
									<c:when test="${AUDIT_IN eq holderAccountTmp.operExecuteStatus }">
										复核中
									</c:when>
									<c:when test="${AUDIT_YES eq holderAccountTmp.operExecuteStatus }">
										已复核
									</c:when>
									<c:when test="${AUDIT_CANCEL eq holderAccountTmp.operExecuteStatus }">
										已作废
									</c:when>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${HOLDER_ACCOUNT_UN_AUDIT eq holderAccountTmp.holderAccountStatus }" >
										未复核
									</c:when>
									<c:when test="${HOLDER_ACCOUNT_NORMAL eq holderAccountTmp.holderAccountStatus }" >
										正常
									</c:when>
									<c:when test="${HOLDER_ACCOUNT_DROP eq holderAccountTmp.holderAccountStatus }" >
										已注销
									</c:when>
									<c:when test="${HOLDER_ACCOUNT_FREEZE eq holderAccountTmp.holderAccountStatus }" >
										已冻结
									</c:when>
								</c:choose>
							</td>
							<td><fmt:formatDate value="${holderAccountTmp.accountOpenDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td><fmt:formatDate value="${holderAccountTmp.accountCancelDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
								<c:choose>
									<c:when test="${OPER_ADD eq holderAccountTmp.operType && AUDIT_NO eq holderAccountTmp.operExecuteStatus }">
									<%-- 新增、待复核 --%>
										<button class="btn modify modifyNew">修改</button>
										<button class="btn delete deleteNew">删除</button>
									</c:when>
									<c:when test="${OPER_CHANGE eq holderAccountTmp.operType && AUDIT_NO eq holderAccountTmp.operExecuteStatus }">
									<%-- 变更、待复核 --%>
										<button class="btn modify modifyUpdate">修改</button>
										<button class="btn delete deleteUpdate">删除</button>
									</c:when>
									<%-- 注销、待复核 --%>
									<c:when test="${OPER_CANCEL eq holderAccountTmp.operType && AUDIT_NO eq holderAccountTmp.operExecuteStatus }">
										<button class="btn delete deleteDrop">删除</button>
									</c:when>
									<%-- 激活、待复核 --%>
									<c:when test="${OPER_ACTIVATE eq holderAccountTmp.operType && AUDIT_NO eq holderAccountTmp.operExecuteStatus }">
										<button class="btn delete deleteActivate">删除</button>
									</c:when>
									<%-- 冻结、待复核 --%>
									<c:when test="${OPER_FREEZE eq holderAccountTmp.operType && AUDIT_NO eq holderAccountTmp.operExecuteStatus }">
										<button class="btn delete deleteFreeze">删除</button>
									</c:when>
									<%-- 解冻、待复核 --%>
									<c:when test="${OPER_UNFREEZE eq holderAccountTmp.operType && AUDIT_NO eq holderAccountTmp.operExecuteStatus }">
										<button class="btn delete deleteUnfreeze">删除</button>
									</c:when>
								</c:choose>
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!--table end-->
		</div>

		<!--搜索弹出框开始-->
		<div class="input" id="search">
			<form id="queryHolderAccountForm" name="queryHolderAccountForm" action="/member/holderaccount/queryholderaccounttmp" method="post">
				<h1>持有人账号搜索<span class="close">×</span></h1>
				<ul>
					<li><span>参与者编号：</span><input type="text" id="query_memberId" name="memberId" /></li>
					<li><span>参与者简称：</span><input type="text" id="query_memberShortName" name="memberShortName" /></li>
					<li><span>参与者全称：</span><input type="text" id="query_memberName" name="memberName" /></li>
					<li><span>持有人账号：</span><input type="text" id="query_holderAccount" name="holderAccount" /></li>
					<li><span>持有人账号简称（中文）：</span><input type="text" id="query_holderShortNameCn" name="holderShortNameCn" /></li>
					<li><span>持有人账号全称（中文）：</span><input type="text" id="query_holderNameCn" name="holderNameCn" /></li>
					<li>
						<span>持有人账号状态：</span>
						<select id="query_holderAccountStatus" name="holderAccountStatus">
							<option value="">--请选择--</option>
							<option value="${HOLDER_ACCOUNT_NORMAL}">正常</option>
							<option value="${HOLDER_ACCOUNT_FREEZE}">已冻结</option>
							<option value="${HOLDER_ACCOUNT_DROP}">已注销</option>
						</select>
					</li>
					<li>
						<span>交易身份类型：</span>
						<select id="query_feesIdentityType" name="feesIdentityType">
							<option value="">--请选择--</option>
							<option value="1">境内</option>
							<option value="2">境外</option>
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
			<form id="modifyHolderAccountNewForm" name="modifyHolderAccountNewForm" action="/member/holderaccount/modifyholderaccountnew" method="post">
				<h1>持有人账号新增修改<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="modify_opSequenceNo_new" name="opSequenceNo" />
					<input type="hidden" id="modify_operType_new" name="operType" />
					<li><span>持有人账号：</span><input type="text" id="modify_holderAccount_new" name="holderAccount" /></li>
					<li><span>参与者编号：</span><input type="text" id="modify_memberId_new" name="memberId" /></li>
					<li><span>持有人账号简称（中文）：</span><input type="text" id="modify_holderShortNameCn_new" name="holderShortNameCn" /></li>
					<li><span>持有人账号全称（中文）：</span><input type="text" id="modify_holderNameCn_new" name="holderNameCn" /></li>
					<li><span>持有人帐号简称（英文）：</span><input type="text" id="modify_holderShortNameEn_new" name="holderShortNameEn" /></li>
					<li><span>持有人帐号全称（英文）：</span><input type="text" id="modify_holderNameEn_new" name="holderNameEn" /></li>
					<li>
						<span>非法人机构对应的托管银行：</span>
						<select id="modify_unCorpBank_new" name="unCorpBank">
							<option value="">--请选择--</option>
							<option value="托管银行1">托管银行1</option>
							<option value="托管银行2">托管银行2</option>
							<option value="托管银行3">托管银行3</option>
							<option value="托管银行4">托管银行4</option>
							<option value="托管银行5">托管银行5</option>
						</select>
					</li>
					<li><span>发票抬头：</span><input type="text" id="modify_invoiceTitle_new" name="invoiceTitle" /></li>
					<li>
						<span>交易身份类型：</span>
						<select id="modify_feesIdentityType_new" name="feesIdentityType">
							<option value="">--请选择--</option>
							<option value="1">境内</option>
							<option value="2">境外</option>
						</select>
					</li>
					<li>
						<span>持有人账号首字母：</span>
						<select id="modify_prefixType_new" name="prefixType">
							<option value="">--请选择--</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</li>
					<li>
						<span>投资者标识：</span>
						<select id="modify_investorType_new" name="investorType">
							<option value="">--请选择--</option>
							<option value="1">投资者标识1</option>
							<option value="2">投资者标识2</option>
							<option value="3">投资者标识3</option>
							<option value="4">投资者标识4</option>
							<option value="5">投资者标识5</option>
						</select>
					</li>
					<li><span>备注：</span><textarea id="modify_remark_new" name="remark"></textarea></li>
				</ul>
				<div class="btns">
					<button class="btn submit" type="submit">确定</button>
					<button class="btn close" type="button">取消</button>
				</div>
			</form>
			<div class="inputMask"></div>
		</div>

		<!--新增修改弹出框结束-->
		<!---------------------------【变更】【修改】弹出框------------------------->
		<div class="input" id="modifyUpdate">
			<form id="modifyHolderAccountUpdateForm" name="modifyHolderAccountUpdateForm" action="/member/holderaccount/modifyholderaccountupdate" method="post">
				<h1>持有人账号变更修改<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="modify_opSequenceNo_update" name="opSequenceNo" />
					<input type="hidden" id="modify_operType_update" name="operType" />
					<li><span>持有人账号：</span><input type="text" id="modify_holderAccount_update" name="holderAccount" /></li>
					<li><span>参与者编号：</span><input type="text" id="modify_memberId_update" name="memberId" /></li>
					<li><span>持有人账号简称（中文）：</span><input type="text" id="modify_holderShortNameCn_update" name="holderShortNameCn" /></li>
					<li><span>持有人账号全称（中文）：</span><input type="text" id="modify_holderNameCn_update" name="holderNameCn" /></li>
					<li><span>持有人帐号简称（英文）：</span><input type="text" id="modify_holderShortNameEn_update" name="holderShortNameEn" /></li>
					<li><span>持有人帐号全称（英文）：</span><input type="text" id="modify_holderNameEn_update" name="holderNameEn" /></li>
					<li>
						<span>非法人机构对应的托管银行：</span>
						<select id="modify_unCorpBank_update" name="unCorpBank">
							<option value="">--请选择--</option>
							<option value="托管银行1">托管银行1</option>
							<option value="托管银行2">托管银行2</option>
							<option value="托管银行3">托管银行3</option>
							<option value="托管银行4">托管银行4</option>
							<option value="托管银行5">托管银行5</option>
						</select>
					</li>
					<li><span>发票抬头：</span><input type="text" id="modify_invoiceTitle_update" name="invoiceTitle" /></li>
					<li>
						<span>交易身份类型：</span>
						<select id="modify_feesIdentityType_update" name="feesIdentityType">
							<option value="">--请选择--</option>
							<option value="1">境内</option>
							<option value="2">境外</option>
						</select>
					</li>
					<li>
						<span>持有人账号首字母：</span>
						<select id="modify_prefixType_update" name="prefixType">
							<option value="">--请选择--</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</li>
					<li>
						<span>投资者标识：</span>
						<select id="modify_investorType_update" name="investorType">
							<option value="">--请选择--</option>
							<option value="1">投资者标识1</option>
							<option value="2">投资者标识2</option>
							<option value="3">投资者标识3</option>
							<option value="4">投资者标识4</option>
							<option value="5">投资者标识5</option>
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
		<!--变更修改弹出框结束-->
		
		<script type="text/javascript" src="/js/holderaccount/holderAccountTmp.js"></script>

	</body>

</html>