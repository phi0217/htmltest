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
		<title>我的申请列表</title>
		<link rel="stylesheet" href="/css/common/common.css" />
		<script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="/js/common/common.js"></script>
		
		<c:set var="OPER_ADD" value="<%=ControlFieldConstants.OPER_ADD%>" />
		<c:set var="OPER_CHANGE" value="<%=ControlFieldConstants.OPER_CHANGE%>" />
		<c:set var="OPER_CANCEL" value="<%=ControlFieldConstants.OPER_CANCEL%>" />
		
		<c:set var="AUDIT_NO" value="<%=ControlFieldConstants.AUDIT_NO%>" />
		<c:set var="AUDIT_IN" value="<%=ControlFieldConstants.AUDIT_IN%>" />
		<c:set var="AUDIT_YES" value="<%=ControlFieldConstants.AUDIT_YES%>" />
		<c:set var="AUDIT_CANCEL" value="<%=ControlFieldConstants.AUDIT_CANCEL%>" />
		
		<c:set var="RESULT_FLAG_SUCCESS" value="<%=ControlFieldConstants.RESULT_FLAG_SUCCESS%>" />
		<input type="hidden" name="RESULT_FLAG_SUCCESS" id="RESULT_FLAG_SUCCESS" value="<%=ControlFieldConstants.RESULT_FLAG_SUCCESS%>" />
	</head>

	<body>
		<div class="main">
			<div class="title">
				<h3>当前位置：<span>数据字典子项 > 我的申请列表</span></h3>
			</div>
			<!--table start-->
			<div class="table-container">
				<!--table list-->
				<div class="table">
					<table>
						<tr>
							<th>操作序列号</th>
							<th>操作类型</th>
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
							<th>操作执行状态</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${response.dictionarySubTmpDtoList }" var="dictionarySubTmp">
							<tr>
								<td>${dictionarySubTmp.opSequenceNo }</td>
								<td>
									<c:choose>
										<c:when test="${OPER_ADD eq dictionarySubTmp.operType }">
											新增
										</c:when>
										<c:when test="${OPER_CHANGE eq dictionarySubTmp.operType }">
											变更
										</c:when>
										<c:when test="${OPER_CANCEL eq dictionarySubTmp.operType }">
											注销
										</c:when>
									</c:choose>
								</td>
								<td>${dictionarySubTmp.dictEntry }</td>
								<td>${dictionarySubTmp.subEntry }</td>
								<td>${dictionarySubTmp.subName }</td>
								<td>${dictionarySubTmp.subEnName }</td>
								<td>${dictionarySubTmp.inputOperatorCode }</td>
								<td>${dictionarySubTmp.inputOperatorName }</td>
								<td><fmt:formatDate value="${dictionarySubTmp.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${dictionarySubTmp.auditOperatorCode }</td>
								<td>${dictionarySubTmp.auditOperatorName }</td>
								<td><fmt:formatDate value="${dictionarySubTmp.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<c:choose>
										<c:when test="${AUDIT_NO eq dictionarySubTmp.operExecuteStatus }">
											待复核
										</c:when>
										<c:when test="${AUDIT_IN eq dictionarySubTmp.operExecuteStatus }">
											复核中
										</c:when>
										<c:when test="${AUDIT_YES eq dictionarySubTmp.operExecuteStatus }">
											已复核
										</c:when>
										<c:when test="${AUDIT_CANCEL eq dictionarySubTmp.operExecuteStatus }">
											已作废
										</c:when>
									</c:choose>
								</td>
								<td>
								<c:choose>
									<c:when test="${OPER_ADD eq dictionarySubTmp.operType && AUDIT_NO eq dictionarySubTmp.operExecuteStatus }">
									<%-- 新增、待复核 --%>
										<button class="btn modify modifyNew">修改</button>
										<button class="btn delete deleteNew">删除</button>
									</c:when>
									<c:when test="${OPER_CHANGE eq dictionarySubTmp.operType && AUDIT_NO eq dictionarySubTmp.operExecuteStatus }">
									<%-- 变更、待复核 --%>
										<button class="btn modify modifyUpdate">修改</button>
										<button class="btn delete deleteUpdate">删除</button>
									</c:when>
									<%-- 注销、待复核 --%>
									<c:when test="${OPER_CANCEL eq dictionarySubTmp.operType && AUDIT_NO eq dictionarySubTmp.operExecuteStatus }">
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
			<form id="modifyDictionarySubNewForm" name="modifyDictionarySubNewForm" action="/dictionarySub/modifyDictionarySubNew" method="post">
				<h1>数据字典子项新增修改<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="modify_opSequenceNo_new" name="opSequenceNo" />
					<input type="hidden" id="modify_operType_new" name="operType" />
					<li><span>数据字典编号：</span><input type="text" id="modify_dictEntry_new" name="dictEntry" readonly="readonly" /></li>
					<li><span>数据字典子项编号：</span><input type="text" id="modify_subEntry_new" name="subEntry" readonly="readonly" /></li>
					<li><span>数据字典名称（中文）：</span><input type="text" id="modify_subName_new" name="subName" /></li>
					<li><span>数据字典名称（英文）：</span><input type="text" id="modify_subEnName_new" name="subEnName" /></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		
		<!---------------------------【变更】【修改】弹出框------------------------->
		<div class="input" id="modifyUpdate">
			<form id="modifyDictionarySubUpdateForm" name="modifyDictionarySubUpdateForm" action="/dictionarySub/modifyDictionarySubUpdate" method="post">
				<h1>数据字典子项变更修改<span class="close">×</span></h1>
				<ul>
				<input type="hidden" id="modify_opSequenceNo_update" name="opSequenceNo" />
				<input type="hidden" id="modify_operType_update" name="operType" />
				<input type="hidden" id="modify_dictEntry_update" name="dictEntry" />
				<input type="hidden" id="modify_SubEntry_update" name="SubEntry" />
					<li>
						<span>数据字典子项名称（中文）：</span>
						<input type="text" id="modify_subName_update" name="subName" />
					</li>
					<li>
						<span>数据字典子项名称（英文）：</span>
						<input type="text" id="modify_subEnName_update" name="subEnName" />
					</li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>

	<script type="text/javascript" src="/js/dictionary/dictionarySubTmp.js"></script>

	</body>

</html>