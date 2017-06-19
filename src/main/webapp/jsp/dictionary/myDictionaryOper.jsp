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
				<h3>当前位置：<span>数据字典 > 我的申请列表</span></h3>
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
							<th>操作执行状态</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${response.dictionaryTmpDtoList }" var="dictionaryTmp">
							<tr>
								<td>${dictionaryTmp.opSequenceNo }</td>
								<td>
									<c:choose>
										<c:when test="${OPER_ADD eq dictionaryTmp.operType }">
											新增
										</c:when>
										<c:when test="${OPER_CHANGE eq dictionaryTmp.operType }">
											变更
										</c:when>
										<c:when test="${OPER_CANCEL eq dictionaryTmp.operType }">
											注销
										</c:when>
									</c:choose>
								</td>
								<td>${dictionaryTmp.dictEntry}</td>
								<td>${dictionaryTmp.dictName }</td>
								<td>${dictionaryTmp.dictEnName }</td>
								<td>
								<c:choose>
								<c:when test="${dictionaryTmp.dictType eq 1 }">数字</c:when>
								<c:when test="${dictionaryTmp.dictType eq 2 }">字符串</c:when>
								<c:otherwise>其他</c:otherwise>
								</c:choose>
								</td>
								<td>${dictionaryTmp.subSysCode }</td>
								<td>${dictionaryTmp.remark }</td>
								<td>${dictionaryTmp.inputOperatorCode }</td>
								<td>${dictionaryTmp.inputOperatorName }</td>
								<td><fmt:formatDate value="${currencyTmp.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${dictionaryTmp.auditOperatorCode }</td>
								<td>${dictionaryTmp.auditOperatorName }</td>
								<td><fmt:formatDate value="${dictionaryTmp.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<c:choose>
										<c:when test="${AUDIT_NO eq dictionaryTmp.operExecuteStatus }">
											待复核
										</c:when>
										<c:when test="${AUDIT_IN eq dictionaryTmp.operExecuteStatus }">
											复核中
										</c:when>
										<c:when test="${AUDIT_YES eq dictionaryTmp.operExecuteStatus }">
											已复核
										</c:when>
										<c:when test="${AUDIT_CANCEL eq dictionaryTmp.operExecuteStatus }">
											已作废
										</c:when>
									</c:choose>
								</td>
								<td>
								<c:choose>
									<c:when test="${OPER_ADD eq dictionaryTmp.operType && AUDIT_NO eq dictionaryTmp.operExecuteStatus }">
									<%-- 新增、待复核 --%>
										<button class="btn modify modifyNew">修改</button>
										<button class="btn delete deleteNew">删除</button>
									</c:when>
									<c:when test="${OPER_CHANGE eq dictionaryTmp.operType && AUDIT_NO eq dictionaryTmp.operExecuteStatus }">
									<%-- 变更、待复核 --%>
										<button class="btn modify modifyUpdate">修改</button>
										<button class="btn delete deleteUpdate">删除</button>
									</c:when>
									<%-- 注销、待复核 --%>
									<c:when test="${OPER_CANCEL eq dictionaryTmp.operType && AUDIT_NO eq dictionaryTmp.operExecuteStatus }">
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
			<form id="modifyDictionaryNewForm" name="modifyDictionaryNewForm" action="/dictionary/modifyDictionaryNew" method="post">
				<h1>数据字典新增修改<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="modify_opSequenceNo_new" name="opSequenceNo" />
					<input type="hidden" id="modify_operType_new" name="operType" />
					<li><span>数据字典编号：</span><input type="text" id="modify_dictEntry_new" name="dictEntry" readonly="readonly" /></li>
					<li><span>数据字典名称（中文）：</span><input type="text" id="modify_dictName_new" name="dictName" /></li>
					<li><span>数据字典名称（英文）：</span><input type="text" id="modify_dictEnName_new" name="dictEnName" /></li>
					<li><span>子系统代码：</span><input type="text" id="modify_subSysCode_new" name="subSysCode" /></li>
					<li><span>数据类型：</span>
					 <select id="modify_dictType_new" name="dictType" class="dictType" >
	                   <option></option>
	                   <option value="1">数字</option>
	                   <option value="2">字符串</option>
	              	</select></li>
					<li><span>备注：</span><textarea id="modify_remark_new" name="remark"></textarea></li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>
		
		<!---------------------------【变更】【修改】弹出框------------------------->
		<div class="input" id="modifyUpdate">
			<form id="modifyDictionaryUpdateForm" name="modifyDictionaryUpdateForm" action="/dictionary/modifyDictionaryUpdate" method="post">
				<h1>数据字典变更修改<span class="close">×</span></h1>
				<ul>
					<input type="hidden" id="modify_opSequenceNo_update" name="opSequenceNo" />
					<input type="hidden" id="modify_operType_update" name="operType" />
				<input type="hidden" id="modify_dictEntry_update" name="dictEntry" />
					<li>
						<span>数据字典名称（中文）：</span>
						<input type="text" id="modify_dictName_update" name="dictName" />
					</li>
					<li>
						<span>数据字典名称（英文）：</span>
						<input type="text" id="modify_dictEnName_update" name="dictEnName" />
					</li>
					<li>
						<span>子系统代码：</span>
						<input type="text" id="modify_subSysCode_update" name="subSysCode" />
					</li>
					<li>
						<span>数据类型：</span>
						<select id="imodify_dictType_update" name="dictType">
	                   <option></option>
	                   <option value="1">数字</option>
	                   <option value="2">字符串</option>
	              	</select>
					</li>
					<li>
						<span>备注：</span>
						<input type="text" id="modify_remark_update" name="remark" />
					</li>
				</ul>
				<button class="btn submit" type="submit">提交</button>
				<!-- <button class="btn close" type="button">取消</button> -->
			</form>
			<div class="inputMask"></div>
		</div>

	<script type="text/javascript" src="/js/dictionary/dictionaryTmp.js"></script>

	</body>

</html>