var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();

//点击【搜索】按钮
$(".search").click(function(){
	$("#search").fadeIn(50);
});

// --------------------------操作类型【新增】／【变更】／【注销】／【激活】／【冻结】／【解冻】，点击【复核】按钮--------------------------
$(".audit").click(audit);
function audit(event) {
	$('.mask').fadeIn(50);
	emptyAuditMask();
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var holderAccount = $(this).parents('tr').find('td').eq(2).text();
	var memberId = $(this).parents('tr').find('td').eq(3).text();
	var holderShortNameCn = $(this).parents('tr').find('td').eq(6).text();
	var holderNameCn = $(this).parents('tr').find('td').eq(7).text();
	var holderShortNameEn = $(this).parents('tr').find('td').eq(8).text();
	var holderNameEn = $(this).parents('tr').find('td').eq(9).text();
	var unCorpBank = $(this).parents('tr').find('td').eq(10).text().trim();
	var invoiceTitle = $(this).parents('tr').find('td').eq(11).text();
	var feesIdentityType = $(this).parents('tr').find('td').eq(12).text().trim();
	var prefixType = $(this).parents('tr').find('td').eq(13).text().trim();
	var investorType = $(this).parents('tr').find('td').eq(14).text().trim();
	var remark = $(this).parents('tr').find('td').eq(15).text();
	
	if ("新增" === operType) {
		$(".modal-head").find('h3.audit-title').html("持有人账号新增复核");
		// 左侧原始数据列表：自动填写该条目原值
	    $("#input_operType").val(operType);
	    $("#input_holderAccount").val(holderAccount).attr("style","background:#ccc");
	    $("#input_memberId").val(memberId).attr("style","background:#ccc");
	    $("#input_holderShortNameCn").val(holderShortNameCn).attr("style","background:#ccc");
	    $("#input_holderNameCn").val(holderNameCn).attr("style","background:#ccc");
	    $("#input_holderShortNameEn").val(holderShortNameEn).attr("style","background:#ccc");
	    $("#input_holderNameEn").val(holderNameEn).attr("style","background:#ccc");
	    $("#input_unCorpBank").val(unCorpBank).attr("style","background:#ccc");
	    $("#input_invoiceTitle").val(invoiceTitle).attr("style","background:#ccc");
	    $("#input_feesIdentityType").val(feesIdentityType).attr("style","background:#ccc");
	    $("#input_prefixType").val(prefixType).attr("style","background:#ccc");
	    $("#input_investorType").val(investorType).attr("style","background:#ccc");
	    $("#input_remark").val(remark).attr("style","background:#ccc");
	    // 右侧复核数据列表（查看复核）：自动填写该条目原值
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_holderAccount").val(holderAccount);
	    $("#auditForm").attr("action", "/member/holderaccount/auditholderaccountnew");
	}
	
	if ("变更" === operType) {
		$(".modal-head").find('h3.audit-title').html("持有人账号变更复核");
		// 左侧原始数据列表：自动填写该条目原值
		$("#input_operType").val(operType);
	    $("#input_holderAccount").val(holderAccount).attr("style","background:#ccc");
	    $("#input_memberId").val(memberId).attr("style","background:#ccc");
	    $("#input_holderShortNameCn").val(holderShortNameCn).attr("style","background:#ccc");
	    $("#input_holderNameCn").val(holderNameCn).attr("style","background:#ccc");
	    $("#input_holderShortNameEn").val(holderShortNameEn).attr("style","background:#ccc");
	    $("#input_holderNameEn").val(holderNameEn).attr("style","background:#ccc");
	    $("#input_unCorpBank").val(unCorpBank).attr("style","background:#ccc");
	    $("#input_invoiceTitle").val(invoiceTitle).attr("style","background:#ccc");
	    $("#input_feesIdentityType").val(feesIdentityType).attr("style","background:#ccc");
	    $("#input_prefixType").val(prefixType).attr("style","background:#ccc");
	    $("#input_investorType").val(investorType).attr("style","background:#ccc");
	    $("#input_remark").val(remark).attr("style","background:#ccc");
	    // 右侧复核数据列表（查看复核）：自动填写该条目原值
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_holderAccount").val(holderAccount);
	    $("#auditForm").attr("action", "/member/holderaccount/auditholderaccountupdate");
	}
	
	if ("注销" === operType) {
		$(".modal-head").find('h3.audit-title').html("持有人账号注销复核");
		// 左侧原始数据列表：自动填写该条目原值
		$("#input_operType").val(operType);
	    $("#input_holderAccount").val(holderAccount).attr("style","background:#ccc");
	    $("#input_memberId").val(memberId).attr("style","background:#ccc");
	    $("#input_holderShortNameCn").val(holderShortNameCn).attr("style","background:#ccc");
	    $("#input_holderNameCn").val(holderNameCn).attr("style","background:#ccc");
	    $("#input_holderShortNameEn").val(holderShortNameEn).attr("style","background:#ccc");
	    $("#input_holderNameEn").val(holderNameEn).attr("style","background:#ccc");
	    $("#input_unCorpBank").val(unCorpBank).attr("style","background:#ccc");
	    $("#input_invoiceTitle").val(invoiceTitle).attr("style","background:#ccc");
	    $("#input_feesIdentityType").val(feesIdentityType).attr("style","background:#ccc");
	    $("#input_prefixType").val(prefixType).attr("style","background:#ccc");
	    $("#input_investorType").val(investorType).attr("style","background:#ccc");
	    $("#input_remark").val(remark).attr("style","background:#ccc");
	    // 右侧复核数据列表（查看复核）：自动填写该条目原值
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_holderAccount").val(holderAccount);
	    $("#auditForm").attr("action", "/member/holderaccount/auditholderaccountdrop");
	}
	
	if ("激活" === operType) {
		$(".modal-head").find('h3.audit-title').html("持有人账号激活复核");
		// 左侧原始数据列表：自动填写该条目原值
		$("#input_operType").val(operType);
	    $("#input_holderAccount").val(holderAccount).attr("style","background:#ccc");
	    $("#input_memberId").val(memberId).attr("style","background:#ccc");
	    $("#input_holderShortNameCn").val(holderShortNameCn).attr("style","background:#ccc");
	    $("#input_holderNameCn").val(holderNameCn).attr("style","background:#ccc");
	    $("#input_holderShortNameEn").val(holderShortNameEn).attr("style","background:#ccc");
	    $("#input_holderNameEn").val(holderNameEn).attr("style","background:#ccc");
	    $("#input_unCorpBank").val(unCorpBank).attr("style","background:#ccc");
	    $("#input_invoiceTitle").val(invoiceTitle).attr("style","background:#ccc");
	    $("#input_feesIdentityType").val(feesIdentityType).attr("style","background:#ccc");
	    $("#input_prefixType").val(prefixType).attr("style","background:#ccc");
	    $("#input_investorType").val(investorType).attr("style","background:#ccc");
	    $("#input_remark").val(remark).attr("style","background:#ccc");
	    // 右侧复核数据列表（查看复核）：自动填写该条目原值
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_holderAccount").val(holderAccount);
	    $("#auditForm").attr("action", "/member/holderaccount/auditholderaccountactivate");
	}
	
	if ("冻结" === operType) {
		$(".modal-head").find('h3.audit-title').html("持有人账号冻结复核");
		// 左侧原始数据列表：自动填写该条目原值
		$("#input_operType").val(operType);
	    $("#input_holderAccount").val(holderAccount).attr("style","background:#ccc");
	    $("#input_memberId").val(memberId).attr("style","background:#ccc");
	    $("#input_holderShortNameCn").val(holderShortNameCn).attr("style","background:#ccc");
	    $("#input_holderNameCn").val(holderNameCn).attr("style","background:#ccc");
	    $("#input_holderShortNameEn").val(holderShortNameEn).attr("style","background:#ccc");
	    $("#input_holderNameEn").val(holderNameEn).attr("style","background:#ccc");
	    $("#input_unCorpBank").val(unCorpBank).attr("style","background:#ccc");
	    $("#input_invoiceTitle").val(invoiceTitle).attr("style","background:#ccc");
	    $("#input_feesIdentityType").val(feesIdentityType).attr("style","background:#ccc");
	    $("#input_prefixType").val(prefixType).attr("style","background:#ccc");
	    $("#input_investorType").val(investorType).attr("style","background:#ccc");
	    $("#input_remark").val(remark).attr("style","background:#ccc");
	    // 右侧复核数据列表（查看复核）：自动填写该条目原值
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_holderAccount").val(holderAccount);
	    $("#auditForm").attr("action", "/member/holderaccount/auditholderaccountfreeze");
	}
	
	if ("解冻" === operType) {
		$(".modal-head").find('h3.audit-title').html("持有人账号解冻复核");
		// 左侧原始数据列表：自动填写该条目原值
		$("#input_operType").val(operType);
	    $("#input_holderAccount").val(holderAccount).attr("style","background:#ccc");
	    $("#input_memberId").val(memberId).attr("style","background:#ccc");
	    $("#input_holderShortNameCn").val(holderShortNameCn).attr("style","background:#ccc");
	    $("#input_holderNameCn").val(holderNameCn).attr("style","background:#ccc");
	    $("#input_holderShortNameEn").val(holderShortNameEn).attr("style","background:#ccc");
	    $("#input_holderNameEn").val(holderNameEn).attr("style","background:#ccc");
	    $("#input_unCorpBank").val(unCorpBank).attr("style","background:#ccc");
	    $("#input_invoiceTitle").val(invoiceTitle).attr("style","background:#ccc");
	    $("#input_feesIdentityType").val(feesIdentityType).attr("style","background:#ccc");
	    $("#input_prefixType").val(prefixType).attr("style","background:#ccc");
	    $("#input_investorType").val(investorType).attr("style","background:#ccc");
	    $("#input_remark").val(remark).attr("style","background:#ccc");
	    // 右侧复核数据列表（查看复核）：自动填写该条目原值
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_holderAccount").val(holderAccount);
	    $("#auditForm").attr("action", "/member/holderaccount/auditholderaccountunfreeze");
	}
}
// --------------------------AJAX 提交 【复核】FORM表单--------------------------
$('#auditForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#input_operType").val();
	var holderAccount = $("#input_holderAccount").val();
	if (confirm("确认要【"+operType+"】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
    		type : form.attr('method'),
            url : form.attr('action'),
            dataType : "JSON",
            data : form.serialize(),
            success : function(data) {
            	if (data["resultCode"] != null) {
            		alert(data["resultCode"]);
//                		alert(data["resultMessage"]);
            		if (data["resultCode"] === RESULT_FLAG_SUCCESS) {
            			
            		} else {
            			return false;
            		}
            		window.location='/member/holderaccount/holderaccounttoaudit';
            	}
            }
    	});
	}
	return false;
});

// 清空表单内的value值及style样式
function emptyAuditMask() {
	$(".modal-head").find('h3.audit-title').empty();
    
    $("#input_operType").val("").removeAttr("style");
    $("#input_holderAccount").val("").removeAttr("style");
    $("#input_memberId").val("").removeAttr("style");
    $("#input_holderShortNameCn").val("").removeAttr("style");
    $("#input_holderNameCn").val("").removeAttr("style");
    $("#input_holderShortNameEn").val("").removeAttr("style");
    $("#input_holderNameEn").val("").removeAttr("style");
    $("#input_unCorpBank").val("").removeAttr("style");
    $("#input_invoiceTitle").val("").removeAttr("style");
    $("#input_feesIdentityType").val("").removeAttr("style");
    $("#input_prefixType").val("").removeAttr("style");
    $("#input_investorType").val("").removeAttr("style");
    $("#input_remark").val("").removeAttr("style");
}