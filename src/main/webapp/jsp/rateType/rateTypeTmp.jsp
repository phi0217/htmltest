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
				<h3>当前位置：<span>利率种类 > 我的申请列表</span></h3>
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
							<th>备注</th>
							<th>录入人代码</th>
							<th>录入人姓名</th>
							<th>录入时间</th>
							<th>核准人代码</th>
							<th>核准人姓名</th>
							<th>核准时间</th>
							<th>操作执行状态</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${response.rateTypeTmpDtoList }" var="rateTypeTmp">
							<tr>
								<td>${rateTypeTmp.opSequenceNo }</td>
								<td>
									<c:choose>
										<c:when test="${OPER_ADD eq rateTypeTmp.operType }">
											新增
										</c:when>
										<c:when test="${OPER_CHANGE eq rateTypeTmp.operType }">
											变更
										</c:when>
										<c:when test="${OPER_CANCEL eq rateTypeTmp.operType }">
											注销
										</c:when>
									</c:choose>
								</td>
								<td>${rateTypeTmp.rateTypeCode }</td>
								<td>${rateTypeTmp.rateTypeName }</td>
								<td>${rateTypeTmp.currency}</td>
								<td>${rateTypeTmp.remark }</td>
								<td>${rateTypeTmp.inputOperatorCode }</td>
								<td>${rateTypeTmp.inputOperatorName }</td>
								<td><fmt:formatDate value="${rateTypeTmp.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${rateTypeTmp.auditOperatorCode }</td>
								<td>${rateTypeTmp.auditOperatorName }</td>
								<td><fmt:formatDate value="${rateTypeTmp.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<c:choose>
										<c:when test="${AUDIT_NO eq rateTypeTmp.operExecuteStatus }">
											待复核
										</c:when>
										<c:when test="${AUDIT_IN eq rateTypeTmp.operExecuteStatus }">
											复核中
										</c:when>
										<c:when test="${AUDIT_YES eq rateTypeTmp.operExecuteStatus }">
											已复核
										</c:when>
										<c:when test="${AUDIT_CANCEL eq rateTypeTmp.operExecuteStatus }">
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
									<c:when test="${OPER_CHANGE eq rateTypeTmp.operType && AUDIT_NO eq rateTypeTmp.operExecuteStatus }">
									<%-- 变更、待复核 --%>
										<button class="btn revise modifyUpdate">修改</button>
										<button class="btn delete deleteUpdate">删除</button>
									</c:when>
									<%-- 注销、待复核 --%>
									<c:when test="${OPER_CANCEL eq rateTypeTmp.operType && AUDIT_NO eq rateTypeTmp.operExecuteStatus }">
										<button class="btn delete deleteDrop">删除</button>
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
			<form id="modifyRateTypeNewForm" name="modifyRateTypeNewForm" action="/rateType/modifyrateTypenew" method="post">
				<h1>利率种类新增修改<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="modify_opSequenceNo_new" name="opSequenceNo" />
					<input type="hidden" id="modify_operType_new" name="operType" />
					<li><span>利率种类代码：</span><input type="text" id="modify_rateTypeCode_new" name="rateTypeCode" /></li>
					<li><span>利率种类名称：</span><input type="text" id="modify_rateTypeName_new" name="rateTypeName" /></li>
					<li><span>币种：</span><input type="text" id="modify_currency_new" name="currency" /></li>
					<li><span>计息年度天数：</span><input type="text" id="modify_yearIrstDays_new" name="yearIrstDays" /></li>
					<li><span>备注：</span><textarea id="modify_remark_new" name="remark"></textarea></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		
		<!---------------------------【变更】【修改】弹出框------------------------->
		<div class="input" id="modifyUpdate">
			<form id="modifyRateTypeUpdateForm" name="modifyRateTypeUpdateForm" action="/rateType/modifyrateTypeupdate" method="post">
				<h1>利率种类变更修改<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="modify_opSequenceNo_update" name="opSequenceNo" />
					<input type="hidden" id="modify_operType_update" name="operType" />
					<input type="hidden" id="modify_rateTypeCode_update" name="rateTypeCode" />
					<li><span>利率种类名称：</span><input type="text" id="modify_rateTypeName_update" name="rateTypeName" /></li>
					<li><span>计息年度天数：</span><input type="text" id="modify_yearIrstDays_update" name="yearIrstDays" /></li>
					<li><span>备注：</span><textarea id="modify_remark_update" name="remark"></textarea></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>

	<script type="text/javascript" src="/js/rateType/rateTypeTmp.js"></script>

	</body>

</html>