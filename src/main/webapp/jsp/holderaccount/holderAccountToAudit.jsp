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
		<title>待复核列表</title>
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
				<h3>当前位置：<span>持有人账号 > 待复核列表</span></h3>
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
						<!-- 录入人与复核人不能相同 -->
						<c:if test="${request.operCode ne holderAccountTmp.inputOperatorCode && AUDIT_NO eq holderAccountTmp.operExecuteStatus }">
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
									<c:when test="${AUDIT_NO eq holderAccountTmp.operExecuteStatus }">
									<%-- 待复核 --%>
										<button class="btn audit">复核</button>
									</c:when>
								</c:choose>
							</td>
						</tr>
						</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
			<!--table end-->
		</div>

		<!--搜索弹出框开始-->
		<div class="input" id="search">
			<form id="queryHolderAccountForm" name="queryHolderAccountForm" action="/member/holderaccount/queryholderaccount" method="post">
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
		
		<!------------------ 查看复核 ------------------>				
		<!--弹出框-->
		<div class="mask">
			<div class="modal">
			<form id="auditForm" name="auditForm" action="" method="post">
				<div class="modal-head">
					<h3 class="audit-title">持有人账号复核</h3>
					<a href="javascript:;" class="close">×</a>
				</div>
				<div class="modal-body">
					<div class="title">
						<h3>原始数据</h3>
						<h3>复核数据</h3>
					</div>
					<!------------------ 左侧原始数据列表 ------------------>
					<div class="left">
						<input type="hidden" id="input_operType" disabled="disabled">
						<div class="item">
							<input type="text" id="input_holderAccount" disabled="disabled" />
							<span>持有人账号：</span>
						</div>
						<div class="item">
							<input type="text" id="input_memberId" disabled="disabled" />
							<span>参与者编号：</span>
						</div>
						<div class="item">
							<input type="text" id="input_holderShortNameCn" disabled="disabled" />
							<span>持有人账号简称（中文）：</span>
						</div>
						<div class="item">
							<input type="text" id="input_holderNameCn" disabled="disabled" />
							<span>持有人账号全称（中文）：</span>
						</div>
						<div class="item">
							<input type="text" id="input_holderShortNameEn" disabled="disabled" />
							<span>持有人帐号简称（英文）：</span>
						</div>
						<div class="item">
							<input type="text" id="input_holderNameEn" disabled="disabled" />
							<span>持有人帐号全称（英文）：</span>
						</div>
						<div class="item">
							<input type="text" id="input_unCorpBank" disabled="disabled" />
							<span>非法人机构对应的托管银行：</span>
						</div>
						<div class="item">
							<input type="text" id="input_invoiceTitle" disabled="disabled" />
							<span>发票抬头：</span>
						</div>
						<div class="item">
							<input type="text" id="input_feesIdentityType" disabled="disabled" />
							<span>交易身份类型：</span>
						</div>
						<div class="item">
							<input type="text" id="input_prefixType" disabled="disabled" />
							<span>持有人账号首字母：</span>
						</div>
						<div class="item">
							<input type="text" id="input_investorType" disabled="disabled" />
							<span>投资者标识：</span>
						</div>
						<div class="item">
							<textarea id="input_remark" disabled="disabled"></textarea>
							<span>备注：</span>
						</div>
					</div>

					<!------------------ 右侧复核数据列表 ------------------>
					<div class="right">
						<input type="hidden" id="audit_opSequenceNo" name="opSequenceNo" />
						<div class="item">
							<input type="hidden" id="audit_holderAccount" name="holderAccount" />
							<span>持有人账号：</span>
						</div>
						<!-- 
						<div class="item">
							<input type="hidden" id="audit_memberId" name="memberId" />
							<span>参与者编号：</span>
						</div>
						<div class="item">
							<input type="hidden" id="audit_holderShortNameCn" name="holderShortNameCn" />
							<span>持有人账号简称（中文）：</span>
						</div>
						<div class="item">
							<input type="hidden" id="audit_holderNameCn" name="holderNameCn" />
							<span>持有人账号全称（中文）：</span>
						</div>
						<div class="item">
							<input type="hidden" id="audit_holderShortNameEn" name="holderShortNameEn" />
							<span>持有人帐号简称（英文）：</span>
						</div>
						<div class="item">
							<input type="hidden" id="audit_holderNameEn" name="holderNameEn" />
							<span>持有人帐号全称（英文）：</span>
						</div>
						<div class="item">
							<input type="hidden" id="audit_unCorpBank" name="unCorpBank" />
							<span>非法人机构对应的托管银行：</span>
						</div>
						<div class="item">
							<input type="hidden" id="audit_invoiceTitle" name="invoiceTitle" />
							<span>发票抬头：</span>
						</div>
						<div class="item">
							<input type="hidden" id="audit_feesIdentityType" name="feesIdentityType" />
							<span>交易身份类型：</span>
						</div>
						<div class="item">
							<input type="hidden" id="audit_prefixType" name="prefixType" />
							<span>持有人账号首字母：</span>
						</div>
						<div class="item">
							<input type="hidden" id="audit_investorType" name="investorType" />
							<span>投资者标识：</span>
						</div>
						 -->
						<div class="item">
							<textarea id="audit_remark" name="remark"></textarea>
							<span>备注：</span>
						</div>
					</div>

				</div>
				<div class="modal-foot">
					<button class="btn submit" type="submit">确定</button>
					<button class="btn close" type="button">取消</button>
				</div>
			</form>
			</div>
		</div>
		<!--弹出框结束-->
		<script type="text/javascript" src="/js/holderaccount/holderAccountToAudit.js"></script>

	</body>

</html>