<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.xinfengtech.fund.interfaces.constants.FundFieldConstants"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>我的申请列表</title>
		<link rel="stylesheet" href="/css/common/common.css" />
		<script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="/js/common/common.js"></script>
		
		<c:set var="OPER_ADD" value="<%=FundFieldConstants.OPER_ADD%>" />
		<c:set var="OPER_CHANGE" value="<%=FundFieldConstants.OPER_CHANGE%>" />
		<c:set var="OPER_CANCEL" value="<%=FundFieldConstants.OPER_CANCEL%>" />
		
		<c:set var="AUDIT_NO" value="<%=FundFieldConstants.AUDIT_NO%>" />
		<c:set var="AUDIT_IN" value="<%=FundFieldConstants.AUDIT_IN%>" />
		<c:set var="AUDIT_YES" value="<%=FundFieldConstants.AUDIT_YES%>" />
		<c:set var="AUDIT_CANCEL" value="<%=FundFieldConstants.AUDIT_CANCEL%>" />
		
		<c:set var="RESULT_FLAG_SUCCESS" value="<%=FundFieldConstants.RESULT_FLAG_SUCCESS%>" />
		<input type="hidden" name="RESULT_FLAG_SUCCESS" id="RESULT_FLAG_SUCCESS" value="<%=FundFieldConstants.RESULT_FLAG_SUCCESS%>" />
	</head>

	<body>
		<div class="main">
			<div class="title">
				<h3>当前位置：<span>利率维护 > 我的申请列表</span></h3>
			</div>
			<!--table start-->
			<div class="table-container">
				<!--table list-->
				<div class="table">
					<table>
						<tr>
							<th>操作序列号</th>
							<th>操作类型</th>
							<th>利率种类代码</th>
							<th>利率种类名称</th>
							<th>币种</th>
							<th>计息年度天数</th>
							<th>利率值</th>
							<th>备注</th>
							<th>录入人代码</th>
							<th>录入人姓名</th>
							<th>生效时间</th>
							<th>录入时间</th>
							<th>核准人代码</th>
							<th>核准人姓名</th>
							<th>核准时间</th>
							<th>操作执行状态</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${response.rateMaintainTmpDtoList }" var="rateTypeTmp">
							<tr>
								<td>${rateMaintainTmp.opSequenceNo }</td>
								<td>
									<c:choose>
										<c:when test="${OPER_ADD eq rateMaintainTmp.operType }">
											新增
										</c:when>
										<c:when test="${OPER_CHANGE eq rateMaintainTmp.operType }">
											变更
										</c:when>
										<c:when test="${OPER_CANCEL eq rateMaintainTmp.operType }">
											注销
										</c:when>
									</c:choose>
								</td>
								<td>${rateMaintainTmp.rateTypeCode }</td>
								<td>${rateMaintainTmp.rateTypeName }</td>
								<td>${rateMaintainTmp.currency}</td>
								<td>${rateMaintainTmp.yearIrstDays}</td>
								<td>${rateMaintainTmp.rateValue}</td>
								<td>${rateMaintainTmp.remark }</td>
								<td>${rateMaintainTmp.inputOperatorCode }</td>
								<td>${rateMaintainTmp.inputOperatorName }</td>
								<td><fmt:formatDate value="${rateMaintainTmp.effectDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><fmt:formatDate value="${rateMaintainTmp.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${rateMaintainTmp.auditOperatorCode }</td>
								<td>${rateMaintainTmp.auditOperatorName }</td>
								<td><fmt:formatDate value="${rateTypeTmp.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<c:choose>
										<c:when test="${AUDIT_NO eq rateMaintainTmp.operExecuteStatus }">
											待复核
										</c:when>
										<c:when test="${AUDIT_IN eq rateMaintainTmp.operExecuteStatus }">
											复核中
										</c:when>
										<c:when test="${AUDIT_YES eq rateMaintainTmp.operExecuteStatus }">
											已复核
										</c:when>
										<c:when test="${AUDIT_CANCEL eq rateMaintainTmp.operExecuteStatus }">
											已作废
										</c:when>
									</c:choose>
								</td>
								<td>
								<c:choose>
									<c:when test="${OPER_ADD eq rateTypeTmp.operType && AUDIT_NO eq rateTypeTmp.operExecuteStatus }">
									<%-- 新增、待复核 --%>
										<button class="btn revise modifyNew">修改</button>
										<button class="btn delete deleteNew">删除</button>
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
		<!---------------------------【新增】【修改】弹出框------------------------->
		<div class="input" id="modifyNew">
			<form id="modifyRateMaintainNewForm" name="modifyRateMaintainNewForm" action="/rateMaintain/modifyrateMaintainnew" method="post">
				<h1>利率维护修改<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="modify_opSequenceNo_new" name="opSequenceNo" />
					<input type="hidden" id="modify_operType_new" name="operType" />
					<li><span>利率种类代码：</span><input type="text" id="modify_rateTypeCode_new" name="rateTypeCode" /></li>
					<li><span>利率种类名称：</span><input type="text" id="modify_rateTypeName_new" name="rateTypeName" /></li>
					<li><span>利率值：</span><input type="text" id="modify_rateValue_new" name="rateValue" /></li>
					<li><span>生效时间：</span><input type="text" id="modify_effectDatetime_new" name="effectDatetime" /></li>
					<li><span>备注：</span><textarea id="modify_remark_new" name="remark"></textarea></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		
	<script type="text/javascript" src="/js/rateMaintain/rateMaintainTmp.js"></script>

	</body>

</html>