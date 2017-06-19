var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();
// --------------------------操作类型【新增】／【变更】／【注销】，点击【复核】按钮--------------------------
$(".audit").click(audit);
function audit(event) {
	$('.mask').fadeIn(50);
	emptyAuditMask();
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var dictEntry = $(this).parents('tr').find('td').eq(2).text();
	var subEntry = $(this).parents('tr').find('td').eq(3).text();
	if ("新增" === operType) {
		$(".modal-head").find('h3.audit-title').html("数据字典子项新增复核");
		// 左侧原始数据列表：自动填写该条目原值
	    $("#input_dictEntry").val(dictEntry).attr("style","background:#ccc");
	    $("#input_operType").val(operType);
	    $("#input_subEntry").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#input_subName").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#input_subEnName").val($(this).parents('tr').find('td').eq(5).text()).attr("style","background:#ccc");
	    // 右侧复核数据列表
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    
	    $("#auditForm").attr("action", "/dictionarySub/auditDictionarySubNew");
	}
	if ("变更" === operType) {
		$(".modal-head").find('h3.audit-title').html("数据字典子项变更复核");
		// 左侧原始数据列表：自动填写该条目原值
		 $("#input_dictEntry").val(dictEntry).attr("style","background:#ccc");
	    $("#input_operType").val(operType);
	    $("#input_subEntry").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#input_subName").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#input_subEnName").val($(this).parents('tr').find('td').eq(5).text()).attr("style","background:#ccc");
	    // 右侧复核数据列表
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_dictEntry").val(dictEntry).attr("readonly","readonly").attr("style","background:#ccc");
	    $("#audit_subEntry").val(subEntry).attr("readonly","readonly").attr("style","background:#ccc");
	    $("#auditForm").attr("action", "/dictionarySub/auditDictionarySubUpdate");
	}
	if ("注销" === operType) {
		$(".modal-head").find('h3.audit-title').html("核算币种注销复核");
		// 左侧原始数据列表：自动填写该条目原值
		$("#input_dictEntry").val(dictEntry).attr("style","background:#ccc");
	    $("#input_operType").val(operType);
	    $("#input_subEntry").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#input_subName").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#input_subEnName").val($(this).parents('tr').find('td').eq(5).text()).attr("style","background:#ccc");
	    // 右侧复核数据列表
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_dictEntry").val(dictEntry).attr("style","background:#ccc");
	    $("#audit_subEntry").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#audit_subName").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#audit_subEnName").val($(this).parents('tr').find('td').eq(5).text()).attr("style","background:#ccc");
	    
	    $("#auditForm").attr("action", "/dictionarySub/auditDictionarySubDrop");
	}
}
// --------------------------AJAX 提交 【复核】FORM表单--------------------------
$('#auditForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#input_operType").val();
	var subEntry = $("#input_subEntry").val();
	if (confirm("确认要【"+operType+"】此数据字典子项：【"+subEntry+"】?")) {
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
            			window.location='/dictionarySub/toauditDictionarySubOper';
            		} else {
            			return false;
            		}
            	}
            }
    	});
	}
	return false;
});

// 清空表单内的value值及style样式
function emptyAuditMask() {
	$(".modal-head").find('h3.audit-title').empty();
	$("#input_dictEntry").val("").removeAttr("style");
    $("#input_subEntry").val("").removeAttr("style");
    $("#input_subName").val("").removeAttr("style");
    $("#input_subEnName").val("").removeAttr("style");
    $("#audit_opSequenceNo").val("").removeAttr("style");
    $("#audit_dictEntry").val("").removeAttr("style");
    $("#audit_subEntry").val("").removeAttr("style");
    $("#audit_subName").val("").removeAttr("style");
    $("#audit_subEnName").val("").removeAttr("style");
}