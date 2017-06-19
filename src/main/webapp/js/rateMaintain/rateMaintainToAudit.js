var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();
// --------------------------操作类型【新增】／【变更】／【注销】，点击【复核】按钮--------------------------
$(".audit").click(audit);
function audit(event) {
	$(".mask").fadeIn(50);
	emptyAuditMask();
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var rateTypeCode = $(this).parents('tr').find('td').eq(2).text();
	if ("新增" === operType) {
		$(".modal-head").find('h3.audit-title').html("利率维护复核");
		// 左侧原始数据列表：自动填写该条目原值
		$("#input_rateTypeCode").val(rateTypeCode).attr("style","background:#ccc");
	    $("#input_operType").val(operType);
	    $("#input_rateTypeName").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#input_rateValue").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#input_effectDatetime").val($(this).parents('tr').find('td').eq(5).text()).attr("style","background:#ccc");
	    $("#input_remark").val($(this).parents('tr').find('td').eq(6).text()).attr("style","background:#ccc");
	    // 右侧复核数据列表
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    
	    $("#auditForm").attr("action", "/rateMaintain/auditrateMaintainnew");
	}
}
// --------------------------AJAX 提交 【复核】FORM表单--------------------------
$('#auditForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#input_operType").val();
	var rateTypeCode = $("#input_rateTypeCode").val();
	if (confirm("确认要【"+operType+"】此利率种类：【"+rateTypeCode+"】?")) {
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
            		window.location='/rateMaintain/rateMaintainaudit';
            	}
            }
    	});
	}
	return false;
});

// 清空表单内的value值及style样式
function emptyAuditMask() {
	$(".modal-head").find('h3.audit-title').empty();
    $("#input_rateTypeCode").val("").removeAttr("style");
    $("#input_rateTypeName").val("").removeAttr("style");
    $("#input_currency").val("").removeAttr("style");
    $("#input_rateValue").val("").removeAttr("style");
    $("#input_effectDatetime").val("").removeAttr("style");
    $("#input_remark").val("").removeAttr("style");
}