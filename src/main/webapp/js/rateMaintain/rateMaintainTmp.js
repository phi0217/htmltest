var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();
// --------------------------操作类型【新增】，点击【修改】按钮--------------------------
$(".modifyNew").click(function() {
	$("#modifyNew").fadeIn(50);
	// 自动填写该条目原值
	$("#modify_opSequenceNo_new").val($(this).parents('tr').find('td').eq(0).text());
	$("#modify_operType_new").val($(this).parents('tr').find('td').eq(1).text().trim());
    $("#modify_rateTypeCode_new").val($(this).parents('tr').find('td').eq(2).text());
    $("#modify_rateTypeName_new").val($(this).parents('tr').find('td').eq(3).text());
    $("#modify_rateValue_new").val($(this).parents('tr').find('td').eq(4).text());
    $("#modify_effectDatetime_new").val($(this).parents('tr').find('td').eq(5).text());
    $("#modify_remark_new").val($(this).parents('tr').find('td').eq(6).text());
})
$(" #modifyNew .close").click(function() {
		$("#modifyNew").hide(50);
})

// --------------------------AJAX 提交 【新增】【修改】FORM表单--------------------------
$('#modifyRateMaintainNewForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#modify_operType_new").val();
	var rateTypeCode = $("#modify_rateTypeCode_new").val();
	if (confirm("确认要修改【"+operType+"】此利率种类：【"+rateTypeCode+"】?")) {
		$.ajax({
			type : form.attr('method'),
	        url : form.attr('action'),
	        dataType : "JSON", 
	        data : form.serialize(),
	        success : function(data) {
	        	if (data["resultCode"] != null) {
	        		alert(data["resultCode"]);
	//        		alert(data["resultMessage"]);
	        		if (data["resultCode"] === RESULT_FLAG_SUCCESS) {
	        			
	        		} else {
	        			return false;
	        		}
	        		window.location='/rateMaintain/rateMaintaintmp';
	        	}
	        }
		});
	}
});


// --------------------------操作类型【新增】，点击【删除】按钮--------------------------
$('.deleteNew').click(function() {
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var rateTypeCode = $(this).parents('tr').find('td').eq(2).text();
	var params = {
			"opSequenceNo":opSequenceNo
	};
    if (confirm("确认要撤销【"+operType+"】此利率种类：【"+rateTypeCode+"】?")) {
		$.ajax({
			type : "post",
			url : "/rateType/deleterateTypenew/"+opSequenceNo,
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/rateType/rateTypetmp';
				}
			}
		});
	}
})