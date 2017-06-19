var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();

// --------------------------操作类型【新增】／【变更】／【注销】，点击【复核】按钮--------------------------
$(".audit").click(audit);
function audit(event) {
	$('.mask').fadeIn(50);
	emptyAuditMask();
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var currency = $(this).parents('tr').find('td').eq(2).text();
	if ("新增" === operType) {
		$(".modal-head").find('h3.audit-title').html("核算币种新增复核");
		// 左侧原始数据列表：自动填写该条目原值
	    $("#input_currency").val(currency).attr("style","background:#ccc");
	    $("#input_operType").val(operType);
	    $("#input_currencyCode").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#input_currencyNameCn").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#input_currencyNameEn").val($(this).parents('tr').find('td').eq(5).text()).attr("style","background:#ccc");
	    $("#input_currencySign").val($(this).parents('tr').find('td').eq(6).text()).attr("style","background:#ccc");
	    $("#input_publishNation").val($(this).parents('tr').find('td').eq(7).text()).attr("style","background:#ccc");
	    $("#input_remark").val($(this).parents('tr').find('td').eq(8).text()).attr("style","background:#ccc");
	    // 右侧复核数据列表
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    
	    $("#auditForm").attr("action", "/fund/currency/auditccynew");
	}
	if ("变更" === operType) {
		$(".modal-head").find('h3.audit-title').html("核算币种变更复核");
		// 左侧原始数据列表：自动填写该条目原值
	    $("#input_currency").val(currency).attr("style","background:#ccc");
	    $("#input_operType").val(operType);
	    $("#input_currencyCode").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#input_currencyNameCn").val($(this).parents('tr').find('td').eq(4).text());
	    $("#input_currencyNameEn").val($(this).parents('tr').find('td').eq(5).text());
	    $("#input_currencySign").val($(this).parents('tr').find('td').eq(6).text()).attr("style","background:#ccc");
	    $("#input_publishNation").val($(this).parents('tr').find('td').eq(7).text()).attr("style","background:#ccc");
	    $("#input_remark").val($(this).parents('tr').find('td').eq(8).text());
	    // 右侧复核数据列表
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_currency").val(currency).attr("readonly","readonly").attr("style","background:#ccc");
	    $("#audit_currencyCode").val($(this).parents('tr').find('td').eq(3).text()).attr("readonly","readonly").attr("style","background:#ccc");
	    $("#audit_currencySign").val($(this).parents('tr').find('td').eq(6).text()).attr("readonly","readonly").attr("style","background:#ccc");
	    $("#audit_publishNation").val($(this).parents('tr').find('td').eq(7).text()).attr("readonly","readonly").attr("style","background:#ccc");
	    
	    $("#auditForm").attr("action", "/fund/currency/auditccyupdate");
	}
	if ("注销" === operType) {
		$(".modal-head").find('h3.audit-title').html("核算币种注销复核");
		// 左侧原始数据列表：自动填写该条目原值
	    $("#input_currency").val(currency).attr("style","background:#ccc");
	    $("#input_operType").val(operType);
	    $("#input_currencyCode").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#input_currencyNameCn").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#input_currencyNameEn").val($(this).parents('tr').find('td').eq(5).text()).attr("style","background:#ccc");
	    $("#input_currencySign").val($(this).parents('tr').find('td').eq(6).text()).attr("style","background:#ccc");
	    $("#input_publishNation").val($(this).parents('tr').find('td').eq(7).text()).attr("style","background:#ccc");
	    $("#input_remark").val($(this).parents('tr').find('td').eq(8).text()).attr("style","background:#ccc");
	    // 右侧复核数据列表
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_currency").val(currency).attr("style","background:#ccc");
	    $("#audit_currencyCode").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#audit_currencyNameCn").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#audit_currencyNameEn").val($(this).parents('tr').find('td').eq(5).text()).attr("style","background:#ccc");
	    $("#audit_currencySign").val($(this).parents('tr').find('td').eq(6).text()).attr("style","background:#ccc");
	    $("#audit_publishNation").val($(this).parents('tr').find('td').eq(7).text()).attr("style","background:#ccc");
	    $("#audit_remark").val($(this).parents('tr').find('td').eq(8).text()).attr("style","background:#ccc");
	    
	    $("#auditForm").attr("action", "/fund/currency/auditccydrop");
	}
}

// --------------------------AJAX 提交 【复核】FORM表单--------------------------
$('#auditForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#input_operType").val();
	var currency = $("#input_currency").val();
	if (confirm("确认要【"+operType+"】此核算币种：【"+currency+"】?")) {
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
            		window.location='/fund/currency/currencytoaudit';
            	}
            }
    	});
	}
	return false;
});

// 清空表单内的value值及style样式
function emptyAuditMask() {
	$(".modal-head").find('h3.audit-title').empty();
	$("#input_currency").val("").removeAttr("style");
    $("#input_currencyCode").val("").removeAttr("style");
    $("#input_currencyNameCn").val("").removeAttr("style");
    $("#input_currencyNameEn").val("").removeAttr("style");
    $("#input_currencySign").val("").removeAttr("style");
    $("#input_publishNation").val("").removeAttr("style");
    $("#input_remark").val("").removeAttr("style");
    $("#audit_opSequenceNo").val("").removeAttr("style");
    $("#audit_currency").val("").removeAttr("style");
    $("#audit_currencyCode").val("").removeAttr("style");
    $("#audit_currencyNameCn").val("").removeAttr("style");
    $("#audit_currencyNameEn").val("").removeAttr("style");
    $("#audit_currencySign").val("").removeAttr("style");
    $("#audit_publishNation").val("").removeAttr("style");
    $("#audit_remark").val("").removeAttr("style");
}