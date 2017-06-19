var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();

// 点击【新增】按钮
$(".addNew").click(function(){
	$("#new").fadeIn(50);
});
//点击【变更】按钮
$(".update").click(function(){
	$("#update").fadeIn(50);
});

// --------------------------AJAX 提交 【新增】【录入】FORM表单--------------------------
$('#inputCurrencyNewForm').submit(function(event) {
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
        			
        		} else {
        			return false;
        		}
        		window.location='/fund/currency/currencytmp';
        	}
        }
	});
});

// 点击【变更】按钮
$('.inputUpdate').click(function() {
	// 自动填写该条目原值
	$("#input_currency_update").val($(this).parents('tr').find('td').eq(0).text());
    $("#input_currencyNameCn_update").val($(this).parents('tr').find('td').eq(2).text());
    $("#input_currencyNameEn_update").val($(this).parents('tr').find('td').eq(3).text());
    $("#input_remark_update").val($(this).parents('tr').find('td').eq(6).text());
});

// --------------------------AJAX 提交 【变更】【录入】FORM表单--------------------------
$('#inputCurrencyUpdateForm').submit(function(event) {
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
        			
        		} else {
        			return false;
        		}
        		window.location='/fund/currency/currencytmp';
        	}
        }
	});
});

// 点击【注销】按钮
$('.inputDrop').click(function() {
	var currency = $(this).parents('tr').find('td').eq(0).text();
	var params = {
			"currency":currency
	};
    if (confirm("确认要【注销】此核算币种：【"+currency+"】?")) {
		$.ajax({
			type : "post",
			url : "/fund/currency/inputccydrop/"+currency,
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/fund/currency/currencytmp';
				}
			}
		});
	}
});