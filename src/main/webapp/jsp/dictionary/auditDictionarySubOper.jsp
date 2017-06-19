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
		<title>待复核列表</title>
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
				<h3>当前位置：<span>数据字典 > 待复核列表</span></h3>
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
										<button class="btn audit">复核</button>
									</c:when>
									<c:when test="${OPER_CHANGE eq dictionarySubTmp.operType && AUDIT_NO eq dictionarySubTmp.operExecuteStatus }">
									<%-- 变更、待复核 --%>
										<button class="btn audit">复核</button>
									</c:when>
									<c:when test="${OPER_CANCEL eq dictionarySubTmp.operType && AUDIT_NO eq dictionarySubTmp.operExecuteStatus }">
									<%-- 注销、待复核 --%>
										<button class="btn audit">复核</button>
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
		
		<!--弹出框-->
		<div class="mask">
			<div class="modal">
			<form id="auditForm" name="auditForm" action="" method="post">
				<div class="modal-head">
					<h3 class="audit-title">数据字典复核</h3>
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
							<input type="text" id="input_dictEntry" disabled="disabled" />
							<span>数据字典编号：</span>
						</div>
						<div class="item">
							<input type="text" id="input_subEntry" disabled="disabled" />
							<span>数据字典子项编号：</span>
						</div>
						<input type="hidden" id="input_operType" disabled="disabled">
						<div class="item">
							<input type="text" id="input_subName" disabled="disabled" />
							<span>数据字典子项名称（中文）：</span>
						</div>
						<div class="item">
							<input type="text" id="input_subEnName" disabled="disabled" />
							<span>数据字典子项名称（英文）：</span>
						</div>
					</div>

					<!------------------ 右侧复核数据列表 ------------------>
					<div class="right">
						<input type="hidden" id="audit_opSequenceNo" name="opSequenceNo" />
						<div class="item">
							<input type="text" id="audit_dictEntry" name="dictEntry" />
							<span>数据字典编号：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_subEntry" name="subEntry" />
							<span>数据字典子项编号：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_subName" name="subName" />
							<span>数据字典子项名称（中文）：</span>
						</div>
						<div class="item">
							<input type="text" id="audit_subEnName" name="subEnName" />
							<span>数据字典子项名称（英文）：</span>
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
		
		<script type="text/javascript" src="/js/dictionary/dictionarySubToAudit.js"></script>
		
	</body>

</html>