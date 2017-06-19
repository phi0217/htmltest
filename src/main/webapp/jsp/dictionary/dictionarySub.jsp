<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.xinfengtech.control.interfaces.constants.ControlFieldConstants"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>数据字典子项</title>
		<link rel="stylesheet" href="/css/common/common.css" />
		<script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="/js/common/common.js"></script>
		
		<c:set var="EFFECT_NO" value="<%=ControlFieldConstants.EFFECT_NO%>" />
		<c:set var="EFFECT_YES" value="<%=ControlFieldConstants.EFFECT_YES%>" />
		<c:set var="EFFECT_CANCEL" value="<%=ControlFieldConstants.EFFECT_CANCEL%>" />
		
		<c:set var="RESULT_FLAG_SUCCESS" value="<%=ControlFieldConstants.RESULT_FLAG_SUCCESS%>" />
		<input type="hidden" name="RESULT_FLAG_SUCCESS" id="RESULT_FLAG_SUCCESS" value="<%=ControlFieldConstants.RESULT_FLAG_SUCCESS%>" />
	</head>

	<body>
		<div class="main">
			<div class="title">
				<h3>当前位置：<span> 
				<a href="/dictionary/toDictionary">数据字典</a>
				> 数据字典子项</span></h3>
				<button class="btn addNew inputNew">新增</button>
				<a class="btn" href="/dictionarySub/toauditDictionarySubOper">查看待复核数据字典子项</a>
				<a class="btn" href="/dictionarySub/toMyDictionarySubTmp">查看我的申请列表</a>
			</div>
			<!--table start-->
			<div class="table-container">
				<!--table list-->
				<div class="table">
					<table data-dictEntry="${response.dictEntry}">
						<tr>
							<th>字典条目</th>
							<th>字典子项</th>
							<th>子项中文名称</th>
							<th>子项英文名称</th>
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
						<c:forEach items="${response.dictionarySubDtoList }" var="dictionarySub">
						<tr>
							<td>${dictionarySub.dictEntry }</td>
							<td>${dictionarySub.subEntry }</td>
							<td>${dictionarySub.subName }</td>
							<td>${dictionarySub.subEnName }</td>
							<td>${dictionarySub.inputOperatorCode }</td>
							<td>${dictionarySub.inputOperatorName }</td>
							<td><fmt:formatDate value="${dictionarySub.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${dictionarySub.auditOperatorCode }</td>
							<td>${dictionarySub.auditOperatorName }</td>
							<td><fmt:formatDate value="${dictionarySub.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
								<c:choose>
									<c:when test="${EFFECT_NO eq dictionarySub.effectStatus }" >
										未生效
									</c:when>
									<c:when test="${EFFECT_YES eq dictionarySub.effectStatus }" >
										已生效
									</c:when>
									<c:when test="${EFFECT_CANCEL eq dictionarySub.effectStatus }" >
										已注销
									</c:when>
								</c:choose>
							</td>
							<td><fmt:formatDate value="${dictionarySub.effectDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${dictionarySub.updateSequenceNo }</td>
							<td><fmt:formatDate value="${dictionarySub.updateDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
							<c:choose>
								<c:when test="${EFFECT_YES eq dictionarySub.effectStatus }">
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
			<form id="inputDictionarySubNewForm" name="inputDictionarySubNewForm" action="/dictionarySub/inputDictionarySubNew" method="post">
				<h1>数据字典新增录入<span class="close">×</span></h1>
				<ul>
					<li><input type="hidden" id="input_dictEntrySub_new" name="dictEntry" value="${response.dictEntry }" /></li>
					<li><span>数据字典子项编号：</span><input type="text" id="input_subEntry_new" name="subEntry" /></li>
					<li><span>数据字典子项名称（中文）：</span><input type="text" id="input_subName_new" name="subName" /></li>
					<li><span>数据字典子项名称（英文）：</span><input type="text" id="input_subEnName_new" name="subEnName" /></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		<!---------------------------【变更】【录入】弹出框------------------------->
		<div class="input" id="update">
			<form id="inputDictionaryUpdateForm" name="inputDictionaryUpdateForm" action="/dictionarySub/inputDictionarySubUpdate" method="post">
				<h1>数据字典子项变更录入<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="input_dictEntry_update" name="dictEntry" />
					<input type="hidden" id="input_SubEntry_update" name="subEntry" />
					<li>
						<span>数据字典子项名称（中文）：</span>
						<input type="text" id="input_dictName_update" name="subName" />
					</li>
					<li>
						<span>数据字典子项名称（英文）：</span>
						<input type="text" id="input_dictEnName_update" name="subEnName" />
					</li>
				</ul>
				<div class="btns">
					<button class="btn submit" type="submit" >确定</button>
					<!-- <button class="btn close" type="button">取消</button> -->
				</div>
			</form>
		</div>
		
		<script type="text/javascript" src="/js/dictionary/dictionarySub.js"></script>
	</body>
<!-- <script>
	var value = $('tr').eq(1).find('td').eq(0).html();
	$('#input_dictEntrySub_update,#input_dictEntrySub_new').val(value);
</script> -->
</html>