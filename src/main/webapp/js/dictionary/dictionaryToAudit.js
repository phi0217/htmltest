var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();
// --------------------------操作类型【新增】／【变更】／【注销】，点击【复核】按钮--------------------------
$(".audit").click(audit);
function audit(event) {
	$('.mask').fadeIn(50);
	emptyAuditMask();
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var dictEntry = $(this).parents('tr').find('td').eq(2).text();
	
	  var dictType = $(this).parents('tr').find('td').eq(5).attr('data-dictType');
	    
	    $('#audit_dictType_show').find("option").each(function(data) {
			var that = $(this);
			if(that.val() == dictType) {
				that.attr("selected", true);
			}
		});
	    $('#input_dictType').find("option").each(function(data) {
	    	var that = $(this);
	    	if(that.val() == dictType) {
	    		that.attr("selected", true);
	    	}
	    });
	    $('#input_dictType').attr("style","background:#ccc");
	if ("新增" === operType) {
		$(".modal-head").find('h3.audit-title').html("数据字典新增复核");
		// 左侧原始数据列表：自动填写该条目原值
	    $("#input_dictEntry").val(dictEntry).attr("style","background:#ccc");
	    $("#input_operType").val(operType);
	    $("#input_dictName").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#input_dictEnName").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#input_subSysCode").val($(this).parents('tr').find('td').eq(6).text()).attr("style","background:#ccc");
	    $("#input_remark").val($(this).parents('tr').find('td').eq(7).text()).attr("style","background:#ccc");
	    // 右侧复核数据列表
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_dictEntry").val(dictEntry).attr("style","background:#ccc");
	    $("#audit_dictType").val(dictType);
	    $("#auditForm").attr("action", "/dictionary/auditDictionaryNew");
	}
	if ("变更" === operType) {
		$(".modal-head").find('h3.audit-title').html("数据字典变更复核");
		// 左侧原始数据列表：自动填写该条目原值
		$("#input_dictEntry").val(dictEntry).attr("style","background:#ccc");
		$("#input_operType").val(operType);
		$("#input_dictName").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#input_dictEnName").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#input_subSysCode").val($(this).parents('tr').find('td').eq(6).text()).attr("style","background:#ccc");
	    $("#input_remark").val($(this).parents('tr').find('td').eq(7).text()).attr("style","background:#ccc");
	    // 右侧复核数据列表
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_dictType").val(dictType);
	    $("#audit_dictEntry").val(dictEntry).attr("readonly","readonly").attr("style","background:#ccc");
	    $("#auditForm").attr("action", "/dictionary/auditDictionaryUpdate");
	}
	if ("注销" === operType) {
		$(".modal-head").find('h3.audit-title').html("核算币种注销复核");
		// 左侧原始数据列表：自动填写该条目原值
		$("#input_dictEntry").val(dictEntry).attr("style","background:#ccc");
	    $("#input_operType").val(operType);
	    $("#input_dictName").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#input_dictEnName").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#input_subSysCode").val($(this).parents('tr').find('td').eq(6).text()).attr("style","background:#ccc");
	    $("#input_remark").val($(this).parents('tr').find('td').eq(7).text()).attr("style","background:#ccc");
	    // 右侧复核数据列表
	    $("#audit_opSequenceNo").val(opSequenceNo);
	    $("#audit_dictEntry").val(dictEntry).attr("style","background:#ccc");
	    $("#audit_dictName").val($(this).parents('tr').find('td').eq(3).text()).attr("style","background:#ccc");
	    $("#audit_dictEnName").val($(this).parents('tr').find('td').eq(4).text()).attr("style","background:#ccc");
	    $("#audit_subSysCode").val($(this).parents('tr').find('td').eq(6).text()).attr("style","background:#ccc");
	    $("#audit_remark").val($(this).parents('tr').find('td').eq(7).text()).attr("style","background:#ccc");
	    
	    $("#auditForm").attr("action", "/dictionary/auditDictionaryDrop");
	}
}
// --------------------------AJAX 提交 【复核】FORM表单--------------------------
$('#auditForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#input_operType").val();
	var dictEntry = $("#input_dictEntry").val();
	if (confirm("确认要【"+operType+"】此数据字典：【"+dictEntry+"】?")) {
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
            			window.location='/dictionary/toauditDictionaryOper';
            		} else {
            			return false;
            		}
            	}
            }
    	});
	}
	return false;
});

 清空表单内的value值及style样式
function emptyAuditMask() {
	$(".modal-head").find('h3.audit-title').empty();
	$("#input_dictEntry").val("").removeAttr("style");
    $("#input_dictName").val("").removeAttr("style");
    $("#input_dictEnName").val("").removeAttr("style");
    $("#input_subSysCode").val("").removeAttr("style");
    $("#input_dictType").val("").removeAttr("style");
    $("#input_remark").val("").removeAttr("style");
    $("#audit_opSequenceNo").val("").removeAttr("style");
    $("#audit_dictEntry").val("").removeAttr("style");
    $("#audit_dictName").val("").removeAttr("style");
    $("#audit_dictEnName").val("").removeAttr("style");
    $("#audit_subSysCode").val("").removeAttr("style");
    $("#audit_dictType").val("").removeAttr("style");
    $("#audit_remark").val("").removeAttr("style");
}