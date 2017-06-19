var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();
// --------------------------AJAX 提交 【新增】【录入】FORM表单--------------------------
$('#inputRateTypeNewForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
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
        			window.location='/rateType/rateTypeTmp';
        		} else {
        			return false;
        		}       		
        	}
        }
	});
});

// 点击【变更】按钮
$('.inputUpdate').click(function() {
	// 自动填写该条目原值
	$("#input_rateTypeCode_update").val($(this).parents('tr').find('td').eq(0).text());
    $("#input_rateTypeName_update").val($(this).parents('tr').find('td').eq(1).text());
    $("#input_currency_update").val($(this).parents('tr').find('td').eq(2).text());
    $("#input_yearIrstDays_update").val($(this).parents('tr').find('td').eq(3).text());
    $("#input_remark_update").val($(this).parents('tr').find('td').eq(4).text());
})

// --------------------------AJAX 提交 【变更】【录入】FORM表单--------------------------
$('#inputRateTypeUpdateForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
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
        			window.location='/rateType/rateTypeTmp';
        			
        		} else {
        			return false;
        		}
        	}
        }
	});
});

// 点击【注销】按钮
$('.inputDrop').click(function() {
	var rateType = $(this).parents('tr').find('td').eq(0).text();
	var params = {
			"rateTypeCode":rateTypeCode
	};
    if (confirm("确认要【注销】此利率种类：【"+rateTypeCode+"】?")) {
		$.ajax({
			type : "post",
			url : "/rateType/inputrateTypedrop/"+rateTypeCode,
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/rateType/rateTypeTmp';
				}
			}
		});
	}
})