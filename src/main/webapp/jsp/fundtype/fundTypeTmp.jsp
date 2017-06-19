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
				<h3>当前位置：<span>资金种类 > 我的申请列表</span></h3>
			</div>
			<!--table start-->
			<div class="table-container">
				<!--table list-->
				<div class="table">
					<table>
						<tr>
							<th>操作序列号</th>
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
							<th>录入人代码</th>
							<th>录入人姓名</th>
							<th>录入时间</th>
							<th>核准人代码</th>
							<th>核准人姓名</th>
							<th>核准时间</th>
							<th>操作执行状态</th>
							<th>操作类型</th>
						</tr>
						<c:forEach items="${response.fundTypeTmpDto }" var="fundTypeTmp">
							<tr>
								<td>${fundTypetmp.opSequenceNo }</td>
								<td>
									<c:choose>
										<c:when test="${OPER_ADD eq fundTypetmp.operType }">
											新增
										</c:when>
										<c:when test="${OPER_CHANGE eq fundTypetmp.operType }">
											变更
										</c:when>
										<c:when test="${OPER_CANCEL eq fundTypetmp.operType }">
											注销
										</c:when>
									</c:choose>
								</td>
								<td>${fundTypetmp.fundTypeStatus }</td>
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
								<td><fmt:formatDate value="${fundTypetmp.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${fundTypetmp.auditOperatorCode }</td>
								<td>${fundTypetmp.auditOperatorName }</td>
								<td><fmt:formatDate value="${fundTypetmp.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<c:choose>
										<c:when test="${AUDIT_NO eq fundTypetmp.operExecuteStatus }">
											待复核
										</c:when>
										<c:when test="${AUDIT_IN eq fundTypetmp.operExecuteStatus }">
											复核中
										</c:when>
										<c:when test="${AUDIT_YES eq fundTypetmp.operExecuteStatus }">
											已复核
										</c:when>
										<c:when test="${AUDIT_CANCEL eq fundTypetmp.operExecuteStatus }">
											已作废
										</c:when>
									</c:choose>
								</td>
								<td>
								<c:choose>
									<c:when test="${OPER_ADD eq fundTypetmp.operType && AUDIT_NO eq fundTypetmp.operExecuteStatus }">
									<%-- 新增、待复核 --%>
										<button class="btn modify modifyNew">修改</button>
										<button class="btn delete deleteNew">删除</button>
									</c:when>
									<c:when test="${OPER_CHANGE eq fundTypetmp.operType && AUDIT_NO eq fundTypetmp.operExecuteStatus }">
									<%-- 变更、待复核 --%>
										<button class="btn modify modifyUpdate">修改</button>
										<button class="btn delete deleteUpdate">删除</button>
									</c:when>
									<%-- 注销、待复核 --%>
									<c:when test="${OPER_CANCEL eq fundTypetmp.operType && AUDIT_NO eq fundTypetmp.operExecuteStatus }">
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
			<form id="modifyfundTypeNewForm" name="modifyfundTypeNewForm" action="/fundType/modifynew" method="post">
				<h1>资金种类新增修改<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="modify_opSequenceNo_new" name="opSequenceNo" />
					<input type="hidden" id="modify_operType_new" name="operType" />
					<li><span>币种：</span><input type="text" id="modify_fundType_new" name="fundType" /></li>
					<li><span>币种代码：</span><input type="text" id="modify_fundTypeCode_new" name="fundTypeCode" /></li>
					<li><span>币种名称（中文）：</span><input type="text" id="modify_fundTypeNameCn_new" name="fundTypeNameCn" /></li>
					<li><span>币种名称（英文）：</span><input type="text" id="modify_fundTypeNameEn_new" name="fundTypeNameEn" /></li>
					<li><span>币种符号：</span><input type="text" id="modify_fundTypeSign_new" name="fundTypeSign" /></li>
					<li><span>币种发行国家（地区）：</span><input type="text" id="modify_publishNation_new" name="publishNation" /></li>
					<li><span>备注：</span><textarea id="modify_remark_new" name="remark"></textarea></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		
		<!---------------------------【变更】【修改】弹出框------------------------->
		<div class="input" id="modifyUpdate">
			<form id="modifyfundTypeUpdateForm" name="modifyfundTypeUpdateForm" action="/fundType/modifyccyupdate" method="post">
				<h1>核算币种变更修改<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="modify_opSequenceNo_update" name="opSequenceNo" />
					<input type="hidden" id="modify_operType_update" name="operType" />
					<input type="hidden" id="modify_fundType_update" name="fundType" />
					<li><span>币种名称（中文）：</span><input type="text" id="modify_fundTypeNameCn_update" name="fundTypeNameCn" /></li>
					<li><span>币种名称（英文）：</span><input type="text" id="modify_fundTypeNameEn_update" name="fundTypeNameEn" /></li>
					<li><span>备注：</span><textarea id="modify_remark_update" name="remark"></textarea></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		
		<script type="text/javascript" src="/js/fundtype/fundTypetmp.js"></script>
		
	</body>
	
</html>