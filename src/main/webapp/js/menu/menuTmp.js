// 点击【搜索】按钮
$(".search").click(function() {
	$("#search").fadeIn(50);
});

//--------------------------AJAX 提交 【搜索】FORM表单--------------------------
$('#queryMenuTmpForm').submit(function(event) {
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
	var menuId = $(curLine[0]).find('td').eq(3).text();
	var menuName = $(curLine[0]).find('td').eq(4).text();
	var menuUrl = $(curLine[0]).find('td').eq(5).text();
	var menuType = $(curLine[0]).find('td').eq(6).text().trim();
	var faMenu = $(curLine[0]).find('td').eq(7).text();
	var remark = $(curLine[0]).find('td').eq(16).text();
	var inputOperatorCode = $(curLine[0]).find('td').eq(9).text();
	var operExecuteStatus = $(curLine[0]).find('td').eq(15).text().trim();

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
		$("#modify_menuId_new").val(menuId).trigger("change");
		$("#modify_menuName_new").val(menuName);
		$("#modify_menuUrl_new").val(menuUrl);
		$("#modify_menuType_new").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == menuType) {
				that.attr("selected", true);
			}
		});
		$("#modify_faMenu_new").val(faMenu);
		$("#modify_remark_new").val(remark);
	}

	// --------------------------操作类型【变更】--------------------------
	if ('变更' === operType && operCode === inputOperatorCode && '待复核' === operExecuteStatus) {
		$("#modifyUpdate").fadeIn(50);
		// 自动填写该条目原值
		$("#modify_opSequenceNo_update").val(opSequenceNo);
		$("#modify_operType_update").val(operType);
		$("#modify_menuId_update").val(menuId).trigger("change");
		$("#modify_menuName_update").val(menuName);
		$("#modify_menuUrl_update").val(menuUrl);
		$("#modify_menuType_update").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == menuType) {
				that.attr("selected", true);
			}
		});
		$("#modify_faMenu_update").val(faMenu);
		$("#modify_remark_update").val(remark);
	}
});

//--------------------------AJAX 提交 【新增】【修改】FORM表单--------------------------
$('#modifyMenuNewForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#modify_operType_new").val();
	var menuId = $("#modify_menuId_new").val();
	if (confirm("确认要修改【" + operType + "】此菜单编号：【" + menuId + "】?")) {
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
						window.location = '/control/menu/menuTmp';
					} else {
						return false;
					}
				}
			}
		});
	}
});

//--------------------------AJAX 提交 【变更】【修改】FORM表单--------------------------
$('#modifyMenuUpdateForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#modify_operType_update").val();
	var menuId = $("#modify_menuId_update").val();
	if (confirm("确认要修改【" + operType + "】此内部账户：【" + menuId + "】?")) {
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
						window.location = '/control/menu/menuTmp';
					} else {
						return false;
					}
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
	var menuId = $(curLine[0]).find('td').eq(3).text();
	var inputOperatorCode = $(curLine[0]).find('td').eq(9).text();
	var operExecuteStatus = $(curLine[0]).find('td').eq(15).text().trim();

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
		if (confirm("确认要撤销【" + operType + "】此菜单：【" + menuId + "】?")) {
			$.ajax({
				type : "post",
				url : "/control/menu/deleteMenuNew/" + opSequenceNo,
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(params),
				success : function(data) {
					if (data["resultCode"] != null) {
//						alert(data["resultCode"]);
						alert(data["resultMessage"]);
						window.location = '/control/menu/menuTmp';
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
		if (confirm("确认要撤销【" + operType + "】此菜单：【" + menuId + "】?")) {
			$.ajax({
				type : "post",
				url : "/control/menu/deleteMenuUpdate/" + opSequenceNo,
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(params),
				success : function(data) {
					if (data["resultCode"] != null) {
//						alert(data["resultCode"]);
						alert(data["resultMessage"]);
						window.location = '/control/menu/menuTmp';
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
		if (confirm("确认要撤销【" + operType + "】此内部账户：【" + menuId + "】?")) {
			$.ajax({
				type : "post",
				url : "/control/menu/deleteMenuDrop/" + opSequenceNo,
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(params),
				success : function(data) {
					if (data["resultCode"] != null) {
//						alert(data["resultCode"]);
						alert(data["resultMessage"]);
						window.location = '/control/menut/menuTmp';
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
	var menuId = $(curLine[0]).find('td').eq(3).text();
	var inputOperatorCode = $(curLine[0]).find('td').eq(9).text();
	var operExecuteStatus = $(curLine[0]).find('td').eq(15).text().trim();

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
		$("#auditNewForm").attr("action", "/control/menu/auditMenuNew");
	}

	// --------------------------操作类型【变更】--------------------------
	if ('变更' === operType && operCode != inputOperatorCode && '待复核' === operExecuteStatus) {
		$("#auditUpdate").fadeIn(50);
		// 自动填写该条目原始
		$("#audit_opSequenceNo_update").val(opSequenceNo);
		$("#audit_operType_update").val(operType);
		$("#audit_menuId_update").val(menuId).trigger("change");
		// 手动填写核准数据
		$("#auditUpdateForm").attr("action", "/control/menu/auditMenuUpdate");
	}

	// --------------------------操作类型【注销】--------------------------
	if ('注销' === operType && operCode != inputOperatorCode && '待复核' === operExecuteStatus) {
		$("#auditDrop").fadeIn(50);
		var menuId = $(curLine[0]).find('td').eq(3).text();
		var menuName = $(curLine[0]).find('td').eq(4).text();
		var menuUrl = $(curLine[0]).find('td').eq(5).text();
		var menuType = $(curLine[0]).find('td').eq(6).text().trim();
		var faMenu = $(curLine[0]).find('td').eq(7).text();
		var remark = $(curLine[0]).find('td').eq(16).text();
		// 自动填写该条目原始
		$("#audit_opSequenceNo_drop").val(opSequenceNo);
		$("#audit_operType_drop").val(operType);
		$("#audit_menuId_drop").val(menuId).trigger("change");
		$("#audit_menuName_drop").val(menuName);
		$("#audit_menuUrl_drop").val(menuUrl);
		$("#audit_menuType_drop").find("option").each(function(data) {
			var that = $(this);
			if (that.text() == menuType) {
				that.attr("selected", true);
			}
		});
		$("#audit_faMenu_drop").val(faMenu);
		$("#audit_remark_drop").val(remark);
	}

});
//--------------------------AJAX 提交【新增】【核准】FORM表单--------------------------
$('#auditNewForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#audit_operType_new").val();
	var menuId = $("#audit_menuId_new").val();
	if (confirm("确认要【" + operType + "】此内部账户：【" + menuId + "】?")) {
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
						window.location = '/control/menu/menu';
					} else {
						return false;
					}
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
	var menuId = $("#audit_menuId_update").val();
	if (confirm("确认要【" + operType + "】此菜单：【" + menuId + "】?")) {
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
						window.location = '/control/menu/menu';
					} else {
						return false;
					}
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
	var menuId = $("#audit_menuId_drop").val();
	if (confirm("确认要【" + operType + "】此内部账户：【" + menuId + "】?")) {
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
						window.location = '/control/menu/menu';
					} else {
						return false;
					}
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