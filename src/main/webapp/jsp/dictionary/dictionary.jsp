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
		<title>数据字典</title>
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
				<h3>当前位置：<span>数据字典 > 数据字典</span></h3>
				<button class="btn addNew inputNew">新增</button>
				<a class="btn" href="/dictionary/toauditDictionaryOper">查看待复核数据字典</a>
				<a class="btn" href="/dictionary/toMyDictionaryTmp">查看我的申请列表</a>
			</div>
			<!--table start-->
			<div class="table-container">
				<!--table list-->
				<div class="table">
					<table>
						<tr>
							<th>字典条目</th>
							<th>字典中文名称</th>
							<th>字典英文名称</th>
							<th>字典数据类型</th>
							<th>子系统代码</th>
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
						<c:forEach items="${response.dictionaryDtoList }" var="dictionary">
						<tr>
							<td>${dictionary.dictEntry }</td>
							<td>${dictionary.dictName }</td>
							<td>${dictionary.dictEnName }</td>
							<td data-dictType="${dictionary.dictType}">
								<c:choose>
								<c:when test="${dictionary.dictType eq 1 }">数字</c:when>
								<c:when test="${dictionary.dictType eq 2 }">字符串</c:when>
								<c:otherwise>其他</c:otherwise>
								</c:choose>
							</td>
							<td>${dictionary.subSysCode }</td>
							<td>${dictionary.remark }</td>
							<td>${dictionary.inputOperatorCode }</td>
							<td>${dictionary.inputOperatorName }</td>
							<td><fmt:formatDate value="${dictionary.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${dictionary.auditOperatorCode }</td>
							<td>${dictionary.auditOperatorName }</td>
							<td><fmt:formatDate value="${dictionary.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
								<c:choose>
									<c:when test="${EFFECT_NO eq dictionary.effectStatus }" >
										未生效
									</c:when>
									<c:when test="${EFFECT_YES eq dictionary.effectStatus }" >
										已生效
									</c:when>
									<c:when test="${EFFECT_CANCEL eq dictionary.effectStatus }" >
										已注销
									</c:when>
								</c:choose>
							</td>
							<td><fmt:formatDate value="${dictionary.effectDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${dictionary.updateSequenceNo }</td>
							<td><fmt:formatDate value="${dictionary.updateDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
							<c:choose>
								<c:when test="${EFFECT_YES eq dictionary.effectStatus }">
									<button class="btn update inputUpdate">变更</button>
									<a href="/dictionarySub/toDictionarySub/${dictionary.dictEntry }" class="btn">查看子项</a>
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
			<form id="inputDictionaryNewForm" name="inputDictionaryNewForm" action="/dictionary/inputDictionaryNew" method="post">
				<h1>数据字典新增录入<span class="close">×</span></h1>
				<ul>
					<li><span>数据字典名称（中文）：</span><input type="text" id="input_dictName_new" name="dictName" /></li>
					<li><span>数据字典名称（英文）：</span><input type="text" id="input_dictEnName_new" name="dictEnName" /></li>
					<li><span>子系统代码：</span><input type="text" id="input_subSysCode_new" name="subSysCode" /></li>
					<li><span>数据类型：</span>
					 <select id="input_dictType_new" name="dictType" class="select" data-code="D10002">
	                   
	              	</select></li>
	              	
	              	
					<li><span>备注：</span><textarea id="input_remark_new" name="remark"></textarea></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		<!---------------------------【变更】【录入】弹出框------------------------->
		<div class="input" id="update">
			<form id="inputDictionaryUpdateForm" name="inputDictionaryUpdateForm" action="/dictionary/inputDictionaryUpdate" method="post">
				<h1>数据字典变更录入<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="input_dictEntry_update" name="dictEntry" />
					<li>
						<span>数据字典名称（中文）：</span>
						<input type="text" id="input_dictName_update" name="dictName" />
					</li>
					<li>
						<span>数据字典名称（英文）：</span>
						<input type="text" id="input_dictEnName_update" name="dictEnName" />
					</li>
					<li>
						<span>子系统代码：</span>
						<input type="text" id="input_subSysCode_update" name="subSysCode" />
					</li>
					<li>
					<input type="hidden" id="input_dictType_update" name="dictType">
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
		<div id="aa"></div>
		<script type="text/javascript" src="/js/dictionary/dictionary.js"></script>
<script>
	$(function() {
		function loadSelect() {
			
			$(".select").each(function() {
				var that = $(this);
				var url = 'http://localhost/dictionary/queryDictionarySubNameMap/' + that.data('code');
				$.ajax({
					type: "get",
					url: url,
					async: false,
					success: function(res) {
						res = JSON.parse(res);
						res = res.dictSubNameMap;
						
						for(var key in res) {
							$("<option value='" + key + "'>" + res[key] + "</option>").appendTo(that);
						}
					},
					error: function(res) {
						console.log("error" + res);
					}
				});

			})
		}		
		loadSelect();
	})
</script>
		
		
	</body>

</html>