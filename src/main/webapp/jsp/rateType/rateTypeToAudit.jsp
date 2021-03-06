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
		<title>待复核列表</title>
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
				<h3>当前位置：<span>利率维护> 待复核列表</span></h3>
			</div>
			<!--table start-->
<div class="table">
					<table>
						<tr>
							<th>操作序列号</th>
							<th>操作类型</th>
							<th>利率种类代码</th>
							<th>利率种类名称</th>
							<th>币种</th>
							<th>计息年度天数</th>
							<th>备注</th>
							<th>录入人姓名</th>
							<th>录入人代码</th>
							<th>录入时间</th>
							<th>核准人代码</th>
							<th>核准人姓名</th>
							<th>核准时间</th>
							<th>操作执行状态</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${response.rateTypeTmpDtoList }" var="rateTypeTmp">
						<!-- 录入人与复核人不能相同 -->
						<c:if test="${request.operId ne rateTypeTmp.inputOperatorCode }">
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
							<td>${rateTypeTmp.currency }</td>
							<td>${rateTypeTmp.yearIrstDays }</td>
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
										<button class="btn audit">复核</button>
									</c:when>
									<c:when test="${OPER_CHANGE eq rateTypeTmp.operType && AUDIT_NO eq rateTypeTmp.operExecuteStatus }">
									<%-- 变更、待复核 --%>
										<button class="btn audit">复核</button>
									</c:when>
									<c:when test="${OPER_CANCEL eq rateTypeTmp.operType && AUDIT_NO eq rateTypeTmp.operExecuteStatus }">
									<%-- 注销、待复核 --%>
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
		
	<div class="mask">
			<div class="modal">
			<form id="auditForm" name="auditForm" action="" method="post">
				<div class="modal-head">
					<h3 class="audit-title">利率种类复核</h3>
					<a href="javascript:;" class="close">×</a>
				</div>
				<div class="modal-body">
					<div class="title">
						<h3>原始数据</h3>
						<h3>复核数据</h3>
					</div>
					<!------------------ 左侧原始数据列表 ------------------>
					<div class="left">
						<div class="item">
							<input type="text" id="input_rateTypeCode" disabled="disabled" />
							<span>利率种类代码：</span>
						</div>
						<input type="hidden" id="input_operType" disabled="disabled">
						<div class="item">
							<input type="text" id="input_rateTypeName" disabled="disabled" />
							<span>利率种类名称：</span>
						</div>
						<div class="item">
							<input type="text" id="input_currency" disabled="disabled" />
							<span>币种：</span>
						</div>
						<div class="item">
							<input type="text" id="input_yearIrstDays" disabled="disabled" />
							<span>计息年度天数：</span>
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
							<input type="text" id="audit_rateTypeCode" name="rateTypeCode" />
							<span>利率种类代码：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_rateTypeName" name="rateTypeName" />
							<span>利率种类名称：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_currency" name="currency" />
							<span>币种：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_yearIrstDays" name="yearIrstDays" />
							<span>计息年度天数：</span>
						</div>
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
		
		<script type="text/javascript" src="/js/rateType/rateTypeToAudit.js"></script>
		
	</body>

</html>