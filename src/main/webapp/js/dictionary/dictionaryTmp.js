var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();
// --------------------------操作类型【新增】，点击【修改】按钮--------------------------
$(".modifyNew").click(function() {
	$("#modifyNew").fadeIn(50);
	// 自动填写该条目原值
	$("#modify_opSequenceNo_new").val($(this).parents('tr').find('td').eq(0).text());
	$("#modify_operType_new").val($(this).parents('tr').find('td').eq(1).text().trim());
    $("#modify_dictEntry_new").val($(this).parents('tr').find('td').eq(2).text());
    $("#modify_dictName_new").val($(this).parents('tr').find('td').eq(3).text());
    $("#modify_dictEnName_new").val($(this).parents('tr').find('td').eq(4).text());
    $("#modify_subSysCode_new").val($(this).parents('tr').find('td').eq(6).text());
    $("#modify_remark_new").val($(this).parents('tr').find('td').eq(7).text());
})

// --------------------------AJAX 提交 【新增】【修改】FORM表单--------------------------
$('#modifyDictionaryNewForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#modify_operType_new").val();
	var dictEntry = $("#modify_dictEntry_new").val();
	if (confirm("确认要修改【"+operType+"】此核算币种：【"+dictEntry+"】?")) {
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
	        		window.location='/dictionary/toMyDictionaryTmp';
	        	}
	        }
		});
	}
});

// --------------------------操作类型【变更】，点击【修改】按钮--------------------------
$(".modifyUpdate").click(function() {
	$("#modifyUpdate").fadeIn(50);
	// 自动填写该条目原值
	$("#modify_opSequenceNo_update").val($(this).parents('tr').find('td').eq(0).text());
	$("#modify_operType_update").val($(this).parents('tr').find('td').eq(1).text().trim());
	$("#modify_dictEntry_update").val($(this).parents('tr').find('td').eq(2).text());
    $("#modify_dictName_update").val($(this).parents('tr').find('td').eq(3).text());
    $("#modify_dictEnName_update").val($(this).parents('tr').find('td').eq(4).text());
    $("#modify_subSysCode_update").val($(this).parents('tr').find('td').eq(6).text());
    $("#modify_remark_update").val($(this).parents('tr').find('td').eq(7).text());
})

// --------------------------AJAX 提交 【变更】【修改】FORM表单--------------------------
$('#modifyDictionaryUpdateForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#modify_operType_update").val();
	var dictEntry = $("#modify_dictEntry_update").val();
	if (confirm("确认要修改【"+operType+"】此核算币种：【"+dictEntry+"】?")) {
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
	        		window.location='/dictionary/toMyDictionaryTmp';
	        	}
	        }
		});
	}
});

// --------------------------操作类型【新增】，点击【删除】按钮--------------------------
$('.deleteNew').click(function() {
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var dictEntry = $(this).parents('tr').find('td').eq(2).text();
	var params = {
			"opSequenceNo":opSequenceNo,
			"dictEntry":dictEntry
	};
    if (confirm("确认要撤销【"+operType+"】此核算币种：【"+dictEntry+"】?")) {
		$.ajax({
			type : "post",
			url : "/dictionary/deleteDictionaryNew",
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/dictionary/toMyDictionaryTmp';
				}
			}
		});
	}
})

// --------------------------操作类型【变更】，点击【删除】按钮--------------------------
$('.deleteUpdate').click(function() {
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var dictEntry = $(this).parents('tr').find('td').eq(2).text();
	var params = {
			"opSequenceNo":opSequenceNo,
			"dictEntry":dictEntry
	};
    if (confirm("确认要撤销【"+operType+"】此核算币种：【"+dictEntry+"】?")) {
		$.ajax({
			type : "post",
			url : "/dictionary/deleteDictionaryUpdate",
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/dictionary/toMyDictionaryTmp';
				}
			}
		});
	}
})

// --------------------------操作类型【注销】，点击【删除】按钮--------------------------
$('.deleteDrop').click(function() {
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var dictEntry = $(this).parents('tr').find('td').eq(2).text();
	var params = {
			"opSequenceNo":opSequenceNo,
			"dictEntry":dictEntry
	};
    if (confirm("确认要撤销【"+operType+"】此核算币种：【"+dictEntry+"】?")) {
		$.ajax({
			type : "post",
			url : "/dictionary/deleteDictionaryDrop",
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/dictionary/toMyDictionaryTmp';
				}
			}
		});
	}
})