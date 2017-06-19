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
		<title>核算币种</title>
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
				<h3>当前位置：<span>核算币种 > 核算币种</span></h3>
				<button class="btn addNew inputNew">新增</button>
			</div>
			<!--table start-->
			<div class="table-container">
				<!--table list-->
				<div class="table">
					<table>
						<tr>
							<th>币种</th>
							<th>币种代码</th>
							<th>币种名称（中文）</th>
							<th>币种名称（英文）</th>
							<th>币种符号</th>
							<th>币种发行国家（地区）</th>
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
						<c:forEach items="${response.currencyDtoList }" var="currency">
						<tr>
							<td>${currency.currency }</td>
							<td>${currency.currencyCode }</td>
							<td>${currency.currencyNameCn }</td>
							<td>${currency.currencyNameEn }</td>
							<td>${currency.currencySign }</td>
							<td>${currency.publishNation }</td>
							<td>${currency.remark }</td>
							<td>${currency.inputOperatorCode }</td>
							<td>${currency.inputOperatorName }</td>
							<td><fmt:formatDate value="${currency.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${currency.auditOperatorCode }</td>
							<td>${currency.auditOperatorName }</td>
							<td><fmt:formatDate value="${currency.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
								<c:choose>
									<c:when test="${EFFECT_NO eq currency.effectStatus }" >
										未生效
									</c:when>
									<c:when test="${EFFECT_YES eq currency.effectStatus }" >
										已生效
									</c:when>
									<c:when test="${EFFECT_CANCEL eq currency.effectStatus }" >
										已注销
									</c:when>
								</c:choose>
							</td>
							<td><fmt:formatDate value="${currency.effectDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${currency.updateSequenceNo }</td>
							<td><fmt:formatDate value="${currency.updateDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
							<c:choose>
								<c:when test="${EFFECT_YES eq currency.effectStatus }">
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
			<form id="inputCurrencyNewForm" name="inputCurrencyNewForm" action="/currency/inputccynew" method="post">
				<h1>核算币种新增录入<span class="close">×</span></h1>
				<ul>
					<li><span>币种：</span><input type="text" id="input_currency_new" name="currency" /></li>
					<li><span>币种代码：</span><input type="text" id="input_currencyCode_new" name="currencyCode" /></li>
					<li><span>币种名称（中文）：</span><input type="text" id="input_currencyNameCn_new" name="currencyNameCn" /></li>
					<li><span>币种名称（英文）：</span><input type="text" id="input_currencyNameEn_new" name="currencyNameEn" /></li>
					<li><span>币种符号：</span><input type="text" id="input_currencySign_new" name="currencySign" /></li>
					<li><span>币种发行国家（地区）：</span><input type="text" id="input_publishNation_new" name="publishNation" /></li>
					<li><span>备注：</span><textarea id="input_remark_new" name="remark"></textarea></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		<!---------------------------【变更】【录入】弹出框------------------------->
		<div class="input" id="update">
			<form id="inputCurrencyUpdateForm" name="inputCurrencyUpdateForm" action="/currency/inputccyupdate" method="post">
				<h1>核算币种变更录入<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="input_currency_update" name="currency" />
					<li>
						<span>币种名称（中文）：</span>
						<input type="text" id="input_currencyNameCn_update" name="currencyNameCn" />
					</li>
					<li>
						<span>币种名称（英文）：</span>
						<input type="text" id="input_currencyNameEn_update" name="currencyNameEn" />
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
		
		<script type="text/javascript" src="/js/currency/currency.js"></script>
		
	</body>
	
</html>