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
$('#inputDictionarySubNewForm').submit(function(event) {
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
        			window.location='/dictionarySub/toMyDictionarySubTmp';
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
	$("#input_dictEntry_update").val($(this).parents('tr').find('td').eq(0).text());
    $("#input_SubEntry_update").val($(this).parents('tr').find('td').eq(1).text());
    $("#input_dictName_update").val($(this).parents('tr').find('td').eq(2).text());
    $("#input_dictEnName_update").val($(this).parents('tr').find('td').eq(3).text());
})

// --------------------------AJAX 提交 【变更】【录入】FORM表单--------------------------
$('#inputDictionaryUpdateForm').submit(function(event) {
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
        			window.location='/dictionary/toMyDictionarySubTmp';
        		} else {
        			return false;
        		}
        	}
        }
	});
});

// 点击【注销】按钮
$('.inputDrop').click(function() {
	var dictEntry = $(this).parents('tr').find('td').eq(0).text();
	var subEntry = $(this).parents('tr').find('td').eq(1).text();
	var params = {
			"dictEntry":dictEntry,
			"subEntry":subEntry
	};
    if (confirm("确认要【注销】此数据字典子项：【"+subEntry+"】?")) {
		$.ajax({
			type : "post",
			url : "/dictionarySub/inputDictionarySubDrop",
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/dictionarySub/toMyDictionarySubTmp';
				}
			}
		});
	}
})