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

<c:set var="RESULT_FLAG_SUCCESS"
	value="<%=FundFieldConstants.RESULT_FLAG_SUCCESS%>" />
<input type="hidden" name="RESULT_FLAG_SUCCESS" id="RESULT_FLAG_SUCCESS"
	value="<%=FundFieldConstants.RESULT_FLAG_SUCCESS%>" />
</head>

<body>
	<div class="main">
		<div class="title">
			<h3>
				当前位置：<span>资金种类 > 待复核列表</span>
			</h3>
		</div>
		<!--table start-->
		<div class="table-container">
			<!--table list-->
			<div class="table">
				<table>
					<tr>
						<th>操作序列号</th>
						<th>操作类型</th>
						<th>资金种类代码</th>
						<th>资金种类名称</th>
						<th>币种</th>
						<th>存款会计科目代码</th>
						<th>存款利息标志</th>
						<th>存款计息周期</th>
						<th>存款结息日</th>
						<th>存款利息付息账号</th>
						<th>是否允许透支</th>
						<th>透支核算账号</th>
						<th>透支核算备抵账号</th>
						<th>透支利息收入账号</th>
						<th>透支利息应收款种类代码</th>
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
					<c:forEach items="${response.fundTypeTmpDto }"
						var="fundTypetmp">
						<!-- 录入人与复核人不能相同 -->
						<c:if test="${request.operCode ne fundTypetmp.inputOperatorCode }">
							<tr>
								<td>${fundTypetmp.opSequenceNo }</td>
								<td><c:choose>
										<c:when test="${OPER_ADD eq fundTypetmp.operType }">
										新增
									</c:when>
										<c:when test="${OPER_CHANGE eq fundTypetmp.operType }">
										变更
									</c:when>
										<c:when test="${OPER_CANCEL eq fundTypetmp.operType }">
										注销
									</c:when>
									</c:choose></td>
								<td>${fundTypetmp.fundTypeCode }</td>
								<td>${fundTypetmp.fundTypeName }</td>
								<td>${fundTypetmp.currency }</td>
								<td>${fundTypetmp.subjectCode }</td>
								<td>${fundTypetmp.irstFlag }</td>
								<td>${fundTypetmp.cashIrstPeriod }</td>
								<td>${fundTypetmp.irstSettleDate }</td>
								<td>${fundTypetmp.irstDepPayAccnt }</td>
								<td>${fundTypetmp.overdraftFlag }</td>
								<td>${fundTypetmp.overdraftAccnt }</td>
								<td>${fundTypetmp.overdraftProvisionAccnt }</td>
								<td>${fundTypetmp.overdraftIrstIncomeAccnt }</td>
								<td>${fundTypetmp.receivableKindCode }</td>
								<td>${fundTypetmp.remark }</td>
								<td>${fundTypetmp.inputOperatorCode }</td>
								<td>${fundTypetmp.inputOperatorName }</td>
								<td><fmt:formatDate value="${fundTypetmp.inputDatetime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>${fundTypetmp.auditOperatorCode }</td>
								<td>${fundTypetmp.auditOperatorName }</td>
								<td><fmt:formatDate value="${fundTypetmp.auditDatetime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><c:choose>
										<c:when test="${AUDIT_NO eq fundTypetmp.operExecuteStatus }">
										待复核
									</c:when>
										<c:when test="${AUDIT_IN eq fundTypetmp.operExecuteStatus }">
										复核中
									</c:when>
										<c:when test="${AUDIT_YES eq fundTypetmp.operExecuteStatus }">
										已复核
									</c:when>
										<c:when
											test="${AUDIT_CANCEL eq fundTypetmp.operExecuteStatus }">
										已作废
									</c:when>
									</c:choose></td>
								<td><c:choose>
										<c:when
											test="${OPER_ADD eq fundTypetmp.operType && AUDIT_NO eq fundTypetmp.operExecuteStatus }">
											<%-- 新增、待复核 --%>
											<button class="btn audit">复核</button>
										</c:when>
										<c:when
											test="${OPER_CHANGE eq fundTypetmp.operType && AUDIT_NO eq fundTypetmp.operExecuteStatus }">
											<%-- 变更、待复核 --%>
											<button class="btn audit">复核</button>
										</c:when>
										<c:when
											test="${OPER_CANCEL eq fundTypetmp.operType && AUDIT_NO eq fundTypetmp.operExecuteStatus }">
											<%-- 注销、待复核 --%>
											<button class="btn audit">复核</button>
										</c:when>
									</c:choose></td>
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
					<h3 class="audit-title">资金种类复核</h3>
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
							<input type="text" id="input_fundTypeCode" disabled="disabled" />
							<span>资金种类代码：</span>
						</div>
						<input type="hidden" id="input_operType" disabled="disabled">
						<div class="item">
							<input type="text" id="input_fundTypeName" disabled="disabled" />
							<span>资金种类名称：</span>
						</div>
						<div class="item">
							<input type="text" id="input_currency" disabled="disabled" /> <span>币种：</span>
						</div>
						<div class="item">
							<input type="text" id="input_subjectCode" disabled="disabled" />
							<span>存款会计科目代码：</span>
						</div>
						<div class="item">
							<input type="text" id="input_irstFlag" disabled="disabled" /> <span>存款计息标志：</span>
						</div>
						<div class="item">
							<input type="text" id="input_cashIrstPeriod" disabled="disabled" />
							<span>存款计息周期：</span>
						</div>
						<div class="item">
							<input type="text" id="input_irstSettleDate" disabled="disabled" />
							<span>存款结息日：</span>
						</div>
						<div class="item">
							<input type="text" id="input_irstDepPayAccnt" disabled="disabled" />
							<span>存款利息付息账号：</span>
						</div>
						<div class="item">
							<input type="text" id="input_overdraftFlag" disabled="disabled" />
							<span>是否允许透支：</span>
						</div>
						<div class="item">
							<input type="text" id="input_overdraftAccnt" disabled="disabled" />
							<span>透支核算账号：</span>
						</div>
						<div class="item">
							<input type="text" id="input_overdraftProvisionAccnt"
								disabled="disabled" /> <span>透支备抵核算账号：</span>
						</div>
						<div class="item">
							<input type="text" id="input_overdraftIrstIncomeAccnt"
								disabled="disabled" /> <span>透支利息收入账号：</span>
						</div>
						<div class="item">
							<input type="text" id="input_receivableKindCode"
								disabled="disabled" /> <span>透支利息应收款种类代码：</span>
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
							<input type="text" id="audit_fundTypeCode" name="fundTypeCode" />
							<span>资金种类代码：</span>
						</div>
						<input type="hidden" id="audit_operType" name="operType">
						<div class="item">
							<input type="text" id="audit_fundTypeName" name="fundTypeName" />
							<span>资金种类名称：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_currency" name="currency" /> <span>币种：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_subjectCode" name="subjectCode" />
							<span>存款会计科目代码：</span>
						</div>
						<div class="item">
							<select id="audit_irstFlag" name="irstFlag"
								onchange="irstFlagFunction(this.options[this.options.selectedIndex].value)">
								<option value="">--请选择--</option>
								<option value="${IRST_FLAG_NO }">不计息</option>
								<option value="${IRST_FLAG_YES }">计息</option>
							</select> <span>存款计息标志：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_cashIrstPeriod"
								name="cashIrstPeriod" /> <span>存款计息周期：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_irstSettleDate" 
								name="irstSettleDate" /> <span>存款结息日：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_irstDepPayAccnt"
								name="irstDepPayAccnt" /> <span>存款利息付息账号：</span>
						</div>
						<div class="item">
							<select id="audit_overdraftFlag" name="overdraftFlag" 
							onchange="overdraftFlagFunction(this.options[this.options.selectedIndex].value)">
								<option value="">--请选择--</option>
								<option value="${OVERDRAFT_FLAG_NO }">不允许</option>
								<option value="${OVERDRAFT_FLAG_YES }">允许</option>
							</select> <span>透支标志：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_overdraftAccnt" 
								name="overdraftAccnt" /> <span>透支核算账号：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_overdraftProvisionAccnt"
								 name="overdraftProvisionAccnt" /> <span>透支备抵核算账号：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_overdraftIrstIncomeAccnt"
								" name="overdraftIrstIncomeAccnt" /> <span>透支利息收入账号：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_receivableKindCode"
								 name="receivableKindCode" /> <span>透支利息应收款种类代码：</span>
						</div>
						<div class="item">
							<textarea id="audit_remark" name="remark"></textarea>
							<span>备注：</span>
						</div>
					</div>
					<div class="modal-foot">
						<button class="btn submit" type="submit">确定</button>
						<button class="btn close" type="button">取消</button>
					</div>
			</form>
		</div>
	</div>

	<script type="text/javascript" src="/js/fundtype/fundTypeToAudit.js"></script>
	<script type="text/javascript">
		$(function() {
			function irstFlagFunction(irstFlag) {
				if (irstFlag == 'IRST_FLAG_NO' ) {
					$('audit_cashIrstPeriod').attr("readonly",true);
					$('audit_irstSettleDate').attr("readonly",true);
					$('audit_irstDepPayAccnt').attr("readonly",true);
				} 
			}
			function overdraftFlagFunction(overdraftFlag){
				if(overdraftFlag == 'OVERDRAFT_FLAG_NO'){
					$('audit_overdraftAccnt').attr("readonly",true);
					$('audit_overdraftProvisionAccnt').attr("readonly",true);
					$('audit_overdraftIrstIncomeAccnt').attr("readonly",true);
					$('audit_receivableKindCode').attr("readonly",true);
				}
			}
		})
	</script>
</body>

</html>