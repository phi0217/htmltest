// 点击【搜索】按钮
$(".search").click(function() {
	$("#search").fadeIn(50);
});

//--------------------------AJAX 提交 【搜索】FORM表单--------------------------
$('#queryInnerAccountTmpForm').submit(function(event) {
//	event.preventDefault();
	var form = $(this);
	var search = form.serialize();
	search = JSON.stringify(search);
	sessionStorage.setItem("search", search);
	$.ajax({
		type : form.attr('method'),
		url : form.attr('action'),
		dataType : "JSON",
		data : form.serialize(),
		success : function(data) {
			if (data["resultCode"] != null) {
				if (data["resultCode"] === '1') {
				} else {
					return false;
				}
			}
		}
	});
});

//获取选中表格的当前行：当前tr(jQuery对象)
var curLine = "";
$('tr').click(function() {
	if ($(this).index() > 0) {
		curLine = $(this);
	}
});

// 获取操作人信息
var operCode = $("#operCode").val();

// --------------------------点击【修改】按钮--------------------------
$(".modify").click(function() {
	if (curLine == "") {
		alert("请选择要修改的项目！")
		return false;
	}
	// 获取该条目原值
	var opSequenceNo = $(curLine[0]).find('td').eq(1).text();
	var operType = $(curLine[0]).find('td').eq(2).text().trim();
	var innerAccount = $(curLine[0]).find('td').eq(3).text();
	var currencyCode = innerAccount.substring(0, 2);
	var innerAccountName = $(curLine[0]).find('td').eq(4).text();
	var innerAccountAuthorityType = $(curLine[0]).find('td').eq(6).text().trim();
	var innerAccountOwnership = $(curLine[0]).find('td').eq(7).text();
	var subjectName = $(curLine[0]).find('td').eq(11).text().trim();
	var subjectBalanceDirection = $(curLine[0]).find('td').eq(12).text().trim();
	var balanceTransferType = $(curLine[0]).find('td').eq(13).text().trim();
	var overdraftFlag = $(curLine[0]).find('td').eq(14).text().trim();
	var verifyType = $(curLine[0]).find('td').eq(15).text().trim();
	var remark = $(curLine[0]).find('td').eq(16).text();
	var inputOperatorCode = $(curLine[0]).find('td').eq(17).text();
	var operExecuteStatus = $(curLine[0]).find('td').eq(23).text().trim();

	if (operCode != inputOperatorCode) {
		alert("操作人与录入人不一致，不允许该操作");
	} else if ('待复核' != operExecuteStatus) {
		alert("操作执行状态错误，不允许该操作");
	}
	// --------------------------操作类型【新增】--------------------------
	if ('新增' === operType && operCode === inputOperatorCode && '待复核' === operExecuteStatus) {
		$("#modifyNew").fadeIn(50);
		// 自动填写该条目原值
		$("#modify_opSequenceNo_new").val(opSequenceNo);
		$("#modify_operType_new").val(operType);
		$("#modify_innerAccount_new").val(innerAccount).trigger("change");
		$("#modify_currencyCode_new").val(currencyCode);
		$("#modify_innerAccountName_new").val(innerAccountName);
		$("#modify_innerAccountAuthorityType_new").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == innerAccountAuthorityType) {
				that.attr("selected", true).trigger("change");
			}
		});
		$("#modify_innerAccountOwnership_new").val(innerAccountOwnership);
		$("#modify_subjectName_new").val(subjectName);
		$("#modify_subjectBalanceDirection_new").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == subjectBalanceDirection) {
				that.attr("selected", true);
			}
		});
		$("#modify_balanceTransferType_new").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == balanceTransferType) {
				that.attr("selected", true);
			}
		});
		$("#modify_overdraftFlag_new").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == overdraftFlag) {
				that.attr("selected", true);
			}
		});
		$("#modify_verifyType_new").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == verifyType) {
				that.attr("selected", true);
			}
		});
		$("#modify_remark_new").val(remark);
	}

	// --------------------------操作类型【变更】--------------------------
	if ('变更' === operType && operCode === inputOperatorCode && '待复核' === operExecuteStatus) {
		$("#modifyUpdate").fadeIn(50);
		// 自动填写该条目原值
		$("#modify_opSequenceNo_update").val(opSequenceNo);
		$("#modify_operType_update").val(operType);
		$("#modify_innerAccount_update").val(innerAccount).trigger("change");
		$("#modify_currencyCode_update").val(currencyCode);
		$("#modify_innerAccountName_update").val(innerAccountName);
		$("#modify_innerAccountAuthorityType_update").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == innerAccountAuthorityType) {
				that.attr("selected", true).trigger("change");
			}
		});
		$("#modify_innerAccountOwnership_update").val(innerAccountOwnership);
		$("#modify_subjectName_update").val(subjectName);
		$("#modify_subjectBalanceDirection_update").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == subjectBalanceDirection) {
				that.attr("selected", true);
			}
		});
		$("#modify_balanceTransferType_update").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == balanceTransferType) {
				that.attr("selected", true);
			}
		});
		$("#modify_overdraftFlag_update").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == overdraftFlag) {
				that.attr("selected", true);
			}
		});
		$("#modify_verifyType_update").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == verifyType) {
				that.attr("selected", true);
			}
		});
		$("#modify_remark_update").val(remark);
	}
});

//--------------------------AJAX 提交 【新增】【修改】FORM表单--------------------------
$('#modifyInnerAccountNewForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#modify_operType_new").val();
	var innerAccount = $("#modify_innerAccount_new").val();
	if (confirm("确认要修改【" + operType + "】此内部账户：【" + innerAccount + "】?")) {
		$.ajax({
			type : form.attr('method'),
			url : form.attr('action'),
			dataType : "JSON",
			data : form.serialize(),
			success : function(data) {
				if (data["resultCode"] != null) {
//					alert(data["resultCode"]);
					alert(data["resultMessage"]);
					if (data["resultCode"] === '1') {
					} else {
						return false;
					}
					window.location = '/fund/inneraccount/inneraccounttmp';
				}
			}
		});
	}
});

//--------------------------AJAX 提交 【变更】【修改】FORM表单--------------------------
$('#modifyInnerAccountUpdateForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#modify_operType_update").val();
	var innerAccount = $("#modify_innerAccount_update").val();
	if (confirm("确认要修改【" + operType + "】此内部账户：【" + innerAccount + "】?")) {
		$.ajax({
			type : form.attr('method'),
			url : form.attr('action'),
			dataType : "JSON",
			data : form.serialize(),
			success : function(data) {
				if (data["resultCode"] != null) {
//					alert(data["resultCode"]);
					alert(data["resultMessage"]);
					if (data["resultCode"] === '1') {
					} else {
						return false;
					}
					window.location = '/fund/inneraccount/inneraccounttmp';
				}
			}
		});
	}
});

// --------------------------点击【删除】按钮--------------------------
$('.delete').click(function() {
	if (curLine == "") {
		alert("请选择要删除的项目！")
		return false;
	}
	// 获取该条目原值
	var opSequenceNo = $(curLine[0]).find('td').eq(1).text();
	var operType = $(curLine[0]).find('td').eq(2).text().trim();
	var innerAccount = $(curLine[0]).find('td').eq(3).text();
	var inputOperatorCode = $(curLine[0]).find('td').eq(17).text();
	var operExecuteStatus = $(curLine[0]).find('td').eq(23).text().trim();

	if (operCode != inputOperatorCode) {
		alert("操作人与录入人不一致，不允许该操作");
	} else if ('待复核' != operExecuteStatus) {
		alert("操作执行状态错误，不允许该操作");
	}
	// --------------------------操作类型【新增】--------------------------
	if ('新增' === operType && operCode === inputOperatorCode && '待复核' === operExecuteStatus) {
		var params = {
			"opSequenceNo" : opSequenceNo
		};
		if (confirm("确认要撤销【" + operType + "】此内部账户：【" + innerAccount + "】?")) {
			$.ajax({
				type : "post",
				url : "/fund/inneraccount/deleteinneraccountnew/" + opSequenceNo,
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(params),
				success : function(data) {
					if (data["resultCode"] != null) {
//						alert(data["resultCode"]);
						alert(data["resultMessage"]);
						window.location = '/fund/inneraccount/inneraccounttmp';
					}
				}
			});
		}
	}

	// --------------------------操作类型【变更】--------------------------
	if ('变更' === operType && operCode === inputOperatorCode && '待复核' === operExecuteStatus) {
		var params = {
			"opSequenceNo" : opSequenceNo
		};
		if (confirm("确认要撤销【" + operType + "】此内部账户：【" + innerAccount + "】?")) {
			$.ajax({
				type : "post",
				url : "/fund/inneraccount/deleteinneraccountupdate/" + opSequenceNo,
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(params),
				success : function(data) {
					if (data["resultCode"] != null) {
//						alert(data["resultCode"]);
						alert(data["resultMessage"]);
						window.location = '/fund/inneraccount/inneraccounttmp';
					}
				}
			});
		}
	}

	// --------------------------操作类型【注销】--------------------------
	if ('注销' === operType && operCode === inputOperatorCode && '待复核' === operExecuteStatus) {
		var params = {
			"opSequenceNo" : opSequenceNo
		};
		if (confirm("确认要撤销【" + operType + "】此内部账户：【" + innerAccount + "】?")) {
			$.ajax({
				type : "post",
				url : "/fund/inneraccount/deleteinneraccountdrop/" + opSequenceNo,
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(params),
				success : function(data) {
					if (data["resultCode"] != null) {
//						alert(data["resultCode"]);
						alert(data["resultMessage"]);
						window.location = '/fund/inneraccount/inneraccounttmp';
					}
				}
			});
		}
	}

});

// --------------------------点击【核准】按钮--------------------------
$('.audit').click(function() {
	if (curLine == "") {
		alert("请选择要核准的项目！")
		return false;
	}
	// 获取该条目原值
	var opSequenceNo = $(curLine[0]).find('td').eq(1).text();
	var operType = $(curLine[0]).find('td').eq(2).text().trim();
	var innerAccount = $(curLine[0]).find('td').eq(3).text();
	var inputOperatorCode = $(curLine[0]).find('td').eq(17).text();
	var operExecuteStatus = $(curLine[0]).find('td').eq(23).text().trim();

	if (operCode == inputOperatorCode) {
		alert("复核人与录入人一致，不允许该操作");
	} else if ('待复核' != operExecuteStatus) {
		alert("操作执行状态错误，不允许该操作");
	}
	// --------------------------操作类型【新增】--------------------------
	if ('新增' === operType && operCode != inputOperatorCode && '待复核' === operExecuteStatus) {
		$("#auditNew").fadeIn(50);
		// 自动填写该条目原始
		$("#audit_opSequenceNo_new").val(opSequenceNo);
		$("#audit_operType_new").val(operType);
		// 手动填写核准数据
		$("#auditNewForm").attr("action", "/fund/inneraccount/auditinneraccountnew");
	}

	// --------------------------操作类型【变更】--------------------------
	if ('变更' === operType && operCode != inputOperatorCode && '待复核' === operExecuteStatus) {
		$("#auditUpdate").fadeIn(50);
		// 自动填写该条目原始
		$("#audit_opSequenceNo_update").val(opSequenceNo);
		$("#audit_operType_update").val(operType);
		$("#audit_innerAccount_update").val(innerAccount).trigger("change");
		// 手动填写核准数据
		$("#auditUpdateForm").attr("action", "/fund/inneraccount/auditinneraccountupdate");
	}

	// --------------------------操作类型【注销】--------------------------
	if ('注销' === operType && operCode != inputOperatorCode && '待复核' === operExecuteStatus) {
		$("#auditDrop").fadeIn(50);
		var currencyCode = innerAccount.substring(0, 2);
		var innerAccountName = $(curLine[0]).find('td').eq(4).text();
		var innerAccountAuthorityType = $(curLine[0]).find('td').eq(6).text().trim();
		var innerAccountOwnership = $(curLine[0]).find('td').eq(7).text();
		var subjectName = $(curLine[0]).find('td').eq(11).text().trim();
		var subjectBalanceDirection = $(curLine[0]).find('td').eq(12).text().trim();
		var balanceTransferType = $(curLine[0]).find('td').eq(13).text().trim();
		var overdraftFlag = $(curLine[0]).find('td').eq(14).text().trim();
		var verifyType = $(curLine[0]).find('td').eq(15).text().trim();
		var remark = $(curLine[0]).find('td').eq(16).text();
		// 自动填写该条目原始
		$("#audit_opSequenceNo_drop").val(opSequenceNo);
		$("#audit_operType_drop").val(operType);
		$("#audit_innerAccount_drop").val(innerAccount).trigger("change");
		$("#audit_innerAccountName_drop").val(innerAccountName);
		$("#audit_innerAccountAuthorityType_drop").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == innerAccountAuthorityType) {
				that.attr("selected", true).trigger("change");
			}
		});
		$("#audit_innerAccountOwnership_drop").val(innerAccountOwnership);
		$("#audit_subjectName_drop").val(subjectName);
		$("#audit_subjectBalanceDirection_drop").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == subjectBalanceDirection) {
				that.attr("selected", true);
			}
		});
		$("#audit_balanceTransferType_drop").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == balanceTransferType) {
				that.attr("selected", true);
			}
		});
		$("#audit_overdraftFlag_drop").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == overdraftFlag) {
				that.attr("selected", true);
			}
		});
		$("#audit_verifyType_drop").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == verifyType) {
				that.attr("selected", true);
			}
		});
		$("#audit_remark_drop").val(remark);
		$("#auditDropForm").attr("action", "/fund/inneraccount/auditinneraccountdrop");
	}

});
//--------------------------AJAX 提交【新增】【核准】FORM表单--------------------------
$('#auditNewForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#audit_operType_new").val();
	var innerAccount = $("#audit_innerAccount_new").val();
	if (confirm("确认要【" + operType + "】此内部账户：【" + innerAccount + "】?")) {
		$.ajax({
			type : form.attr('method'),
			url : form.attr('action'),
			dataType : "JSON",
			data : form.serialize(),
			success : function(data) {
				if (data["resultCode"] != null) {
//					alert(data["resultCode"]);
					alert(data["resultMessage"]);
					if (data["resultCode"] === '1') {

					} else {
						return false;
					}
					window.location = '/fund/inneraccount/inneraccount';
				}
			}
		});
	}
	return false;
});

//--------------------------AJAX 提交【变更】【核准】FORM表单--------------------------
$('#auditUpdateForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#audit_operType_update").val();
	var innerAccount = $("#audit_innerAccount_update").val();
	if (confirm("确认要【" + operType + "】此内部账户：【" + innerAccount + "】?")) {
		$.ajax({
			type : form.attr('method'),
			url : form.attr('action'),
			dataType : "JSON",
			data : form.serialize(),
			success : function(data) {
				if (data["resultCode"] != null) {
//					alert(data["resultCode"]);
					alert(data["resultMessage"]);
					if (data["resultCode"] === '1') {
					} else {
						return false;
					}
					window.location = '/fund/inneraccount/inneraccount';
				}
			}
		});
	}
	return false;
});

//--------------------------AJAX 提交【注销】【核准】FORM表单--------------------------
$('#auditDropForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#audit_operType_drop").val();
	var innerAccount = $("#audit_innerAccount_drop").val();
	if (confirm("确认要【" + operType + "】此内部账户：【" + innerAccount + "】?")) {
		$.ajax({
			type : form.attr('method'),
			url : form.attr('action'),
			dataType : "JSON",
			data : form.serialize(),
			success : function(data) {
				if (data["resultCode"] != null) {
//					alert(data["resultCode"]);
					alert(data["resultMessage"]);
					if (data["resultCode"] === '1') {
					} else {
						return false;
					}
					window.location = '/fund/inneraccount/inneraccount';
				}
			}
		});
	}
	return false;
});

//分页相关

function pageMes() {
	search = sessionStorage.getItem("search") || "";
	if(search !== ""){
		search = JSON.parse(search);
	}
	function parseStrObjByFor(strDes, delimiter) {
		var obj = {};
		if (strDes == null || strDes == '') {
			return obj;
		}
		delimiter = delimiter || ";";
		var arr = strDes.split(delimiter);
		var k, v, sub;
		for (var i = 0, len = arr.length; i < len; i++) {
			if (arr[i] !== '') {
				sub = arr[i].split("=");
				k = sub[0];
				v = sub[1];
				if (k !== '') {
					obj[k] = v;
				}
			}
		}
		return obj;
	}
	search = parseStrObjByFor(search, "&");
	for ( var name in search) {
		$('<input type="hidden" name="' + name + '" value="' + search[name] + '" />').appendTo($("#listTmpByPageForm"));
	}
}
pageMes();

$('#listTmpByPageForm').submit(function(event) {
//	event.preventDefault();
	var form = $(this);
	$.ajax({
		type : form.attr('method'),
		url : form.attr('action'),
		dataType : "JSON",
		data : form.serialize()
	});
});