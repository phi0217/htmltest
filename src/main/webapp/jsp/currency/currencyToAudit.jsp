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
				<h3>当前位置：<span>核算币种 > 待复核列表</span></h3>
			</div>
			<!--table start-->
			<div class="table-container">
				<!--table list-->
				<div class="table">
					<table>
						<tr>
							<th>操作序列号</th>
							<th>操作类型</th>
							<th>币种</th>
							<th>币种代码</th>
							<th>币种名称（中文）</th>
							<th>币种名称（英文）</th>
							<th>币种符号</th>
							<th>币种发行国家（地区）</th>
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
						<c:forEach items="${response.currencyTmpDtoList }" var="currencyTmp">
						<!-- 录入人与复核人不能相同 -->
						<c:if test="${request.operCode ne currencyTmp.inputOperatorCode }">
						<tr>
							<td>${currencyTmp.opSequenceNo }</td>
							<td>
								<c:choose>
									<c:when test="${OPER_ADD eq currencyTmp.operType }">
										新增
									</c:when>
									<c:when test="${OPER_CHANGE eq currencyTmp.operType }">
										变更
									</c:when>
									<c:when test="${OPER_CANCEL eq currencyTmp.operType }">
										注销
									</c:when>
								</c:choose>
							</td>
							<td>${currencyTmp.currency }</td>
							<td>${currencyTmp.currencyCode }</td>
							<td>${currencyTmp.currencyNameCn }</td>
							<td>${currencyTmp.currencyNameEn }</td>
							<td>${currencyTmp.currencySign }</td>
							<td>${currencyTmp.publishNation }</td>
							<td>${currencyTmp.remark }</td>
							<td>${currencyTmp.inputOperatorCode }</td>
							<td>${currencyTmp.inputOperatorName }</td>
							<td><fmt:formatDate value="${currencyTmp.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${currencyTmp.auditOperatorCode }</td>
							<td>${currencyTmp.auditOperatorName }</td>
							<td><fmt:formatDate value="${currencyTmp.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
								<c:choose>
									<c:when test="${AUDIT_NO eq currencyTmp.operExecuteStatus }">
										待复核
									</c:when>
									<c:when test="${AUDIT_IN eq currencyTmp.operExecuteStatus }">
										复核中
									</c:when>
									<c:when test="${AUDIT_YES eq currencyTmp.operExecuteStatus }">
										已复核
									</c:when>
									<c:when test="${AUDIT_CANCEL eq currencyTmp.operExecuteStatus }">
										已作废
									</c:when>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${OPER_ADD eq currencyTmp.operType && AUDIT_NO eq currencyTmp.operExecuteStatus }">
									<%-- 新增、待复核 --%>
										<button class="btn audit">复核</button>
									</c:when>
									<c:when test="${OPER_CHANGE eq currencyTmp.operType && AUDIT_NO eq currencyTmp.operExecuteStatus }">
									<%-- 变更、待复核 --%>
										<button class="btn audit">复核</button>
									</c:when>
									<c:when test="${OPER_CANCEL eq currencyTmp.operType && AUDIT_NO eq currencyTmp.operExecuteStatus }">
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
		
		<!--弹出框-->
		<div class="mask">
			<div class="modal">
			<form id="auditForm" name="auditForm" action="" method="post">
				<div class="modal-head">
					<h3 class="audit-title">核算币种复核</h3>
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
							<input type="text" id="input_currency" disabled="disabled" />
							<span>币种：</span>
						</div>
						<input type="hidden" id="input_operType" disabled="disabled">
						<div class="item">
							<input type="text" id="input_currencyCode" disabled="disabled" />
							<span>币种代码：</span>
						</div>
						<div class="item">
							<input type="text" id="input_currencyNameCn" disabled="disabled" />
							<span>币种名称（中文）：</span>
						</div>
						<div class="item">
							<input type="text" id="input_currencyNameEn" disabled="disabled" />
							<span>币种名称（英文）：</span>
						</div>
						<div class="item">
							<input type="text" id="input_currencySign" disabled="disabled" />
							<span>币种符号：</span>
						</div>
						<div class="item">
							<input type="text" id="input_publishNation" disabled="disabled" />
							<span>币种发行国家（地区）：</span>
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
							<input type="text" id="audit_currency" name="currency" />
							<span>币种：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_currencyCode" name="currencyCode" />
							<span>币种代码：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_currencyNameCn" name="currencyNameCn" />
							<span>币种名称（中文）：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_currencyNameEn" name="currencyNameEn" />
							<span>币种名称（英文）：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_currencySign" name="currencySign" />
							<span>币种符号：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_publishNation" name="publishNation" />
							<span>币种发行国家（地区）：</span>
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
		
		<script type="text/javascript" src="/js/currency/currencyToAudit.js"></script>
		
	</body>
	
</html>