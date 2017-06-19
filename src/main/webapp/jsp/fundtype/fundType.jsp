<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page
	import="com.xinfengtech.fund.interfaces.constants.FundFieldConstants"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>资金种类</title>
		<link rel="stylesheet" href="/css/common/common.css" />
		<script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="/js/common/common.js"></script>

		<c:set var="EFFECT_NO" value="<%=FundFieldConstants.EFFECT_NO%>" />
		<c:set var="EFFECT_YES" value="<%=FundFieldConstants.EFFECT_YES%>" />
		<c:set var="EFFECT_CANCEL" value="<%=FundFieldConstants.EFFECT_CANCEL%>" />

		<c:set var="RESULT_FLAG_SUCCESS" value="<%=FundFieldConstants.RESULT_FLAG_SUCCESS%>" />
		<input type="hidden" name="RESULT_FLAG_SUCCESS" id="RESULT_FLAG_SUCCESS" value="<%=FundFieldConstants.RESULT_FLAG_SUCCESS%>" />
	</head>

	<body>
		<div class="main">
			<div class="title">
				<h3>
				当前位置：<span>资金种类 > 资金种类</span>
			</h3>
				<button class="btn addNew inputNew">新增</button>
				<button class="btn drop inputDrop">注销</button>
				<button class="btn search query">查询</button>
				<button class="btn subjectCodeUpdate inputSubjectCodeUpdate">存款会计科目变更</button>
				<button class="btn overdraftAccntUpdate inputOverdraftAccntUpdate">透支核算账户变更</button>
				<button class="btn overdraftProvisionAccntUpdate inputOverdraftProvisionAccntUpdate">透支核算备抵账户变更</button>
				<button class="btn fundTypeUpdate inputFundTypeUpdate">资金种类变更</button>
				<button class="btn see">查看</button>
			</div>
			<!--table start-->
			<div class="table-container">
				<!--table list-->
				<div class="table">
					<table>
						<tr>
							<th>资金种类代码</th>
							<th>资金种类名称</th>
							<th>币种</th>
							<th>存款会计科目代码</th>
							<th>存款计息标志</th>
							<th>存款计息周期</th>
							<th>存款结息日</th>
							<th>存款利息付息账号</th>
							<th>是否允许透支</th>
							<th>透支核算账号</th>
							<th>透支备抵核算账号</th>
							<th>透支利息收入账号</th>
							<th>透支利息应收款种类代码</th>
							<th>备注</th>
							<th>录入人代码</th>
							<th>录入人姓名</th>
							<th>录入时间</th>
							<th>核准人代码</th>
							<th>核准人姓名</th>
							<th>核准时间</th>
							<th>生效状态</th>
							<th>生效时间</th>
							<th>最近更新序号</th>
							<th>最近更新时间</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${response.fundTypeDto }" var="fundType">
							<tr>
								<td>${fundType.fundTypeCode }</td>
								<td>${fundType.fundTypeName }</td>
								<td>${fundType.currency }</td>
								<td>${fundType.subjectCode }</td>
								<td>${fundType.irstFlag }</td>
								<td>${fundType.cashIrstPeriod }</td>
								<td>${fundType.irstSettleDate }</td>
								<td>${fundType.irstDepPayAccnt }</td>
								<td>${fundType.overdraftFlag }</td>
								<td>${fundType.overdraftAccnt }</td>
								<td>${fundType.overdraftProvisionAccnt }</td>
								<td>${fundType.overdraftIrstIncomeAccnt }</td>
								<td>${fundType.receivableKindCode }</td>
								<td>${fundType.remark }</td>
								<td>${fundType.inputOperatorCode }</td>
								<td>${fundType.inputOperatorName }</td>
								<td>
									<fmt:formatDate value="${fundType.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>${fundType.auditOperatorCode }</td>
								<td>${fundType.auditOperatorName }</td>
								<td>
									<fmt:formatDate value="${fundType.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>
									<c:choose>
										<c:when test="${EFFECT_NO eq fundType.effectStatus }">
											未生效
										</c:when>
										<c:when test="${EFFECT_YES eq fundType.effectStatus }">
											已生效
										</c:when>
										<c:when test="${EFFECT_CANCEL eq fundType.effectStatus }">
											已注销
										</c:when>
									</c:choose>
								</td>
								<td>
									<fmt:formatDate value="${fundType.effectDatetime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>${fundType.updateSequenceNo }</td>
								<td>
									<fmt:formatDate value="${fundType.updateDatetime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>
									<c:choose>
										<c:when test="${EFFECT_YES eq fundType.effectStatus }">
											<button class="btn update inputUpdate">变更</button>
											<button class="btn delete inputDrop">注销</button>
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
		<!---------------------------【新增】【录入】弹出框------------------------->
		<div class="input" id="new">
			<form id="inputfundTypeNewForm" name="inputfundTypeNewForm" action="/fundType/inputFundTypenew" method="post">
				<h1>
				资金种类新增录入<span class="close">×</span>
			</h1>
				<ul>
					<li><span>资金种类代码：</span><input type="text" id="input_fundTypeCode_new" name="fundTypeCode" /></li>
					<li><span>资金种类名称：</span><input type="text" id="input_fundTypeName_new" name="fundTypeName" /></li>
					<li><span>币种：</span><input type="text" id="input_currency_new" name="currency" /></li>
					<li><span>存款会计科目代码：</span><input type="text" id="input_subjectCode_new" name="subjectCode" /></li>
					<li><span>存款计息标志：</span><input type="text" id="input_irstFlag_new" name="irstFlag" /></li>
					<li><span>存款计息周期：</span><input type="text" id="input_cashIrstPeriod_new" name="cashIrstPeriod" /></li>
					<li><span>存款结息日：</span><input type="text" id="input_irstSettleDate_new" name="irstSettleDate" /></li>
					<li><span>存款利息付息账号：</span><input type="text" id="input_irstDepPayAccnt_new" name="irstDepPayAccnt" /></li>
					<li><span>是否允许透支：</span><input type="text" id="input_overdraftFlag_new" name="overdraftFlag" /></li>
					<li><span>透支核算账号：</span><input type="text" id="input_overdraftAccnt_new" name="overdraftAccnt" /></li>
					<li><span>透支核算备抵账号：</span><input type="text" id="input_overdraftProvisionAccnt_new" name="overdraftProvisionAccnt" /></li>
					<li><span>透支利息收入账号：</span><input type="text" id="input_overdraftIrstIncomeAccnt_new" name="overdraftIrstIncomeAccnt" /></li>
					<li><span>透支利息应收款种类代码：</span><input type="text" id="input_receivableKindCode_new" name="receivableKindCode" /></li>
					<li><span>备注：</span>
						<textarea id="input_remark_new" name="remark"></textarea></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		<!---------------------------【资金种类变更】【录入】弹出框------------------------->
		<div class="input" id="fundTypeUpdate">
			<form id="inputfundTypeUpdateForm" name="inputfundTypeUpdateForm" action="/fundType/inputccyupdate" method="post">
				<h1>
				资金种类变更录入<span class="close">×</span>
			</h1>
				<ul>
					<input type="hidden" id="input_fundType_update" name="fundType" />
					<li><span>资金种类名称：</span> <input type="text" id="input_fundTypeName_update" name="fundTypeName" /></li>
					<li><span>存款计息标志：</span> <input type="text" id="input_irstFlag_update" name="irstFlag" /></li>
					<li><span>存款计息周期：</span> <input type="text" id="input_cashIrstPeriod_update" name="cashIrstPeriod" /></li>
					<li><span>存款结息日：</span> <input type="text" id="input_irstSettleDate_update" name="irstSettleDate" /></li>
					<li><span>存款利息付息账号：</span> <input type="text" id="input_irstDepPayAccnt_update" name="irstDepPayAccnt" /></li>
					<li><span>透支标志：</span> <input type="text" id="input_overdraftFlag_update" name="overdraftFlag" /></li>
					<li><span>透支核算账户：</span> <input type="text" id="input_overdraftAccnt_update" name="overdraftAccnt" /></li>
					<li><span>透支核算备抵账户：</span> <input type="text" id="input_overdraftProvisionAccnt_update" name="overdraftProvisionAccnt" /></li>
					<li><span>透支利息应收款种类代码：</span> <input type="text" id="input_fundTypeNameEn_update" name="fundTypeNameEn" /></li>
					<li><span>透支利息收入账户：</span> <input type="text" id="input_overdraftIrstIncomeAccnt_update" name="overdraftIrstIncomeAccnt" /></li>
					<li><span>备注：</span> <input type="text" id="input_remark_update" name="remark" /></li>
				</ul>
				<div class="btns">
					<button class="btn submit" type="submit">确定</button>
					<!-- <button class="btn close" type="button">取消</button> -->
				</div>
			</form>
		</div>
		<!---------------------------【存款会计科目变更】【录入】弹出框------------------------->
		<div class="input" id="subjectCodeUpdate">
			<form id="inputsubjectCodeUpdateForm" name="inputsubjectCodeUpdateForm" action="/fundType/inputsubjectCodeupdate" method="post">
				<h1>
				存款会计科目变更录入<span class="close">×</span>
			</h1>
				<ul>
					<input type="hidden" id="input_fundType_update" name="fundType" />
					<li><span>资金种类代码：</span> <input type="text" id="input_fundTypeCode_update" name="fundTypeCode" readonly="readonly" /></li>
					<li><span>资金种类名称：</span> <input type="text" id="input_fundTypeName_update" name="fundTypeName" readonly="readonly" /></li>
					<li><span>币种：</span> <input type="text" id="input_currency_update" name="currency" readonly="readonly" /></li>
					<li><span>存款会计科目代码：</span> <input type="text" id="input_subjectCode_update" name="subjectCode" /></li>
					<li><span>存款会计科目名称：</span> <input type="text" id="input_subjectName_update" name="subjectName" /></li>
				</ul>
				<div class="btns">
					<button class="btn submit" type="submit">确定</button>
					<!-- <button class="btn close" type="button">取消</button> -->
				</div>
			</form>
		</div>
		<!---------------------------【透支核算账户变更】【录入】弹出框------------------------->
		<div class="input" id="overdraftAccntUpdate">
			<form id="inputoverdraftAccntUpdateForm" name="inputoverdraftAccntUpdateForm" action="/fundType/inputoverdraftAccntupdate" method="post">
				<h1>
				透支核算账户变更录入<span class="close">×</span>
			</h1>
				<ul>
					<input type="hidden" id="input_fundType_update" name="fundType" />
					<li><span>资金种类代码：</span> <input type="text" id="input_fundTypeCode_update" name="fundTypeCode" readonly="readonly" /></li>
					<li><span>资金种类名称：</span> <input type="text" id="input_fundTypeName_update" name="fundTypeName" readonly="readonly" /></li>
					<li><span>币种：</span> <input type="text" id="input_currency_update" name="currency" readonly="readonly" /></li>
					<li><span>透支核算账户名称：</span> <input type="text" id="input_overdraftAccntName_update" name="overdraftAccntName" /></li>
					<li><span>透支核算账户账号：</span> <input type="text" id="input_overdraftAccnt_update" name="overdraftAccnt" /></li>
				</ul>
				<div class="btns">
					<button class="btn submit" type="submit">确定</button>
					<!-- <button class="btn close" type="button">取消</button> -->
				</div>
			</form>
		</div>
		<!---------------------------【透支核算备抵账户变更】【录入】弹出框------------------------->
		<div class="input" id="overdraftProvisionAccntUpdate">
			<form id="inputoverdraftProvisionAccntUpdateForm" name="inputoverdraftProvisionAccntUpdateForm" action="/fundType/inputoverdraftProvisionAccntupdate" method="post">
				<h1>
				透支核算备抵账户变更录入<span class="close">×</span>
			</h1>
				<ul>
					<input type="hidden" id="input_fundType_update" name="fundType" />
					<li><span>资金种类代码：</span> <input type="text" id="input_fundTypeCode_update" name="fundTypeCode" readonly="readonly" /></li>
					<li><span>资金种类名称：</span> <input type="text" id="input_fundTypeName_update" name="fundTypeName" readonly="readonly" /></li>
					<li><span>币种：</span> <input type="text" id="input_currency_update" name="currency" readonly="readonly" /></li>
					<li><span>透支核算备抵账户名称：</span> <input type="text" id="input_overdraftProvisionAccntName_update" name="overdraftProvisionAccntName" /></li>
					<li><span>透支核算备抵账户账号：</span> <input type="text" id="input_overdraftProvisionAccnt_update" name="overdraftProvisionAccnt" /></li>
				</ul>
				<div class="btns">
					<button class="btn submit" type="submit">确定</button>
					<!-- <button class="btn close" type="button">取消</button> -->
				</div>
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

		<script type="text/javascript" src="/js/fundtype/fundType.js"></script>

	</body>

</html>