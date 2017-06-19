// 点击【搜索】按钮
$(".search").click(function() {
	$("#search").fadeIn(50);
});
// 点击【新增】按钮
$(".addNew").click(function() {
	$("#new").fadeIn(50);
});

// 获取选中表格的当前行：当前tr(jQuery对象)
var curLine = "";
$('tr').click(function() {
	if ($(this).index() > 0) {
		curLine = $(this);
	}
});

// 点击【变更】按钮
$(".inputUpdate").click(function() {
	if (curLine == "") {
		alert("请选择要变更的项目！")
		return false;
	}
	$("#update").fadeIn(50);
});

// --------------------------AJAX 提交 【搜索】FORM表单--------------------------
$('#queryInnerAccountForm').submit(function(event) {
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

// --------------------------AJAX 提交 【新增】【录入】FORM表单--------------------------
$('#inputInnerAccountNewForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	$.ajax({
		type : form.attr('method'),
		url : form.attr('action'),
		dataType : "JSON",
		data : form.serialize(),
		success : function(data) {
			if (data["resultCode"] != null) {
				alert(data["resultMessage"]);
				if (data["resultCode"] === '1') {
					window.location = '/fund/inneraccount/inneraccounttmp';
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
	$("#input_innerAccount_update").val($(curLine[0]).find('td').eq(1).text());
	$("#input_innerAccountName_update").val($(curLine[0]).find('td').eq(2).text());
	var innerAccountAuthorityType = $(curLine[0]).find('td').eq(4).text().trim();
	$("#input_innerAccountAuthorityType_update").find("option").each(function(data) {
		var that = $(this);
		if (that.text() == innerAccountAuthorityType) {
			that.attr("selected", true).trigger("change");
		}
	});
	$("#input_innerAccountOwnership_update").val($(curLine[0]).find('td').eq(5).text());
	var subjectBalanceDirection = $(curLine[0]).find('td').eq(10).text().trim();
	$("#input_subjectBalanceDirection_update").find("option").each(function(data) {
		var that = $(this);
		if (that.text() == subjectBalanceDirection) {
			that.attr("selected", true);
		}
	});
	var balanceTransferType = $(curLine[0]).find('td').eq(11).text().trim();
	$("#input_balanceTransferType_update").find("option").each(function(data) {
		var that = $(this);
		if (that.text() == balanceTransferType) {
			that.attr("selected", true);
		}
	});
	var overdraftFlag = $(curLine[0]).find('td').eq(12).text().trim();
	$("#input_overdraftFlag_update").find("option").each(function(data) {
		var that = $(this);
		if (that.text() == overdraftFlag) {
			that.attr("selected", true);
		}
	});
	var verifyType = $(curLine[0]).find('td').eq(13).text().trim();
	$("#input_verifyType_update").find("option").each(function(data) {
		var that = $(this);
		if (that.text() == verifyType) {
			that.attr("selected", true);
		}
	});
	$("#input_remark_update").val($(curLine[0]).find('td').eq(14).text());
});

// --------------------------AJAX 提交 【变更】【录入】FORM表单--------------------------
$('#inputInnerAccountUpdateForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	$.ajax({
		type : form.attr('method'),
		url : form.attr('action'),
		dataType : "JSON",
		data : form.serialize(),
		success : function(data) {
			if (data["resultCode"] != null) {
				alert(data["resultMessage"]);
				if (data["resultCode"] === '1') {
					window.location = '/fund/inneraccount/inneraccounttmp';
				} else {
					return false;
				}
			}
		}
	});
});

// 点击【注销】按钮
$('.inputDrop').click(function() {
	if (curLine == "") {
		alert("请选择要注销的项目！")
		return false;
	}
	var innerAccount = $(curLine[0]).find('td').eq(1).text();
	var params = {
		"innerAccount" : innerAccount
	};
	if (confirm("确认要【注销】此内部账户：【" + innerAccount + "】?")) {
		$.ajax({
			type : "post",
			url : "/fund/inneraccount/inputinneraccountdrop/" + innerAccount,
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					if (data["resultCode"] === '1') {
						window.location = '/fund/inneraccount/inneraccounttmp';
					} else {
						alert(data["resultMessage"]);
					}
				}
			}
		});
	}
});

// 分页相关
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
		$('<input type="hidden" name="' + name + '" value="' + search[name] + '" />').appendTo($("#listByPageForm"));
	}
}
pageMes();

$('#listByPageForm').submit(function(event) {
//	event.preventDefault();
	var form = $(this);
	$.ajax({
		type : form.attr('method'),
		url : form.attr('action'),
		dataType : "JSON",
		data : form.serialize()
	});
});