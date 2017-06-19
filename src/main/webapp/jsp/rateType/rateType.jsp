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
		<title>利率种类</title>
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
				<h3>当前位置：<span>利率种类 > 利率种类</span></h3>
				<button class="btn addNew inputNew">新增</button>
			</div>
			<!--table start-->
			<div class="table-container">
				<!--table list-->
				<div class="table">
					<table>
						<tr>
							<th>利率种类代码</th>
							<th>利率种类名称</th>
							<th>利率种类</th>
							<th>计息年度天数</th>
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
						<c:forEach items="${response.rateTypeDtoList }" var="rateType">
						<tr>
							<td>${rateType.rateTypeCode }</td>
							<td>${rateType.rateTypeName}</td>
							<td>${rateType.currency}</td>
							<td>${rateType.yearIrstDays}</td>
							<td>${rateType.remark }</td>
							<td>${rateType.inputOperatorCode }</td>
							<td>${rateType.inputOperatorName }</td>
							<td><fmt:formatDate value="${rateType.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${rateType.auditOperatorCode}</td>
							<td>${rateType.auditOperatorName }</td>
							<td><fmt:formatDate value="${rateType.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
								<c:choose>
									<c:when test="${EFFECT_NO eq rateType.effectStatus }" >
										未生效
									</c:when>
									<c:when test="${EFFECT_YES eq rateType.effectStatus }" >
										已生效
									</c:when>
									<c:when test="${EFFECT_CANCEL eq rateType.effectStatus }" >
										已注销
									</c:when>
								</c:choose>
							</td>
							<td><fmt:formatDate value="${rateType.effectDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${rateType.updateSequenceNo }</td>
							<td><fmt:formatDate value="${rateType.updateDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
							<c:choose>
								<c:when test="${EFFECT_YES eq rateType.effectStatus }">
									<button class="btn revise inputUpdate">变更</button>
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
			<form id="inputRateTypeNewForm" name="inputRateTypeNewForm" action="/rateType/inputrateTypenew" method="post">
				<h1>利率种类新增录入<span class="close">×</span></h1>
				<ul>
				    <li><span>利率种类代码：</span><input type="text" id="input_rateTypeCode_new" name="rateTypeCode" /></li>
					<li><span>利率种类名称：</span><input type="text" id="input_rateTypeName_new" name="rateTypeName" /></li>
					<li><span>币种：</span><input type="text" id="input_currency_new" name="currency" /></li>
					<li><span>计息年度天数：</span><input type="text" id="input_yearIrstDays_new" name="yearIrstDays" /></li>
					<li><span>备注：</span><textarea id="input_remark_new" name="remark"></textarea></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		<!---------------------------【变更】【录入】弹出框------------------------->
		<div class="input" id="update">
			<form id="inputRateTypeUpdateForm" name="inputRateTypeUpdateForm" action="/rateType/inputrateTypeupdate" method="post">
				<h1>利率种类变更录入<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="input_rateTypeCode_update" name="rateTypeCode" />
					<li>
						<span>利率种类名称：</span>
						<input type="text" id="input_rateTypeName_update" name="rateTypeName" />
					</li>
					<li>
						<span>币种：</span>
						<input type="text" id="input_currency_update" name="currency" />
					</li>
					<li>
						<span>计息年度天数：</span>
						<input type="text" id="input_yearIrstDays_update" name="yearIrstDays" />
					</li>
					<li>
						<span>备注：</span>
						<input type="text" id="input_remark_update" name="remark" />
					</li>
				</ul>
				<div class="btns">
					<button class="btn submit" type="submit" >确定</button>
					<!-- <button class="btn close" type="button">取消</button> -->
				</div>
			</form>
		</div>
		
		<script type="text/javascript" src="/js/rateType/rateType.js"></script>

	</body>

