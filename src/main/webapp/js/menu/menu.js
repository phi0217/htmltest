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
$('#queryMenuForm').submit(function(event) {
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
$('#inputMenuNewForm').submit(function(event) {
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
					window.location = '/control/menu/menuTmp';
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
	$("#input_menuId_update").val($(curLine[0]).find('td').eq(1).text());
	$("#input_menuName_update").val($(curLine[0]).find('td').eq(2).text());
	$("#input_menuUrl_update").val($(curLine[0]).find('td').eq(3).text());
	var menuType = $(curLine[0]).find('td').eq(4).text().trim();
	$("#input_menuType_update").find("option").each(function(data) {
		var that = $(this);
		if (that.text() == menuType) {
			that.attr("selected", true).trigger("change");
		}
	});
	$("#input_faMenu_update").val($(curLine[0]).find('td').eq(5).text());
	$("#input_remark_update").val($(curLine[0]).find('td').eq(6).text());
});

// --------------------------AJAX 提交 【变更】【录入】FORM表单--------------------------
$('#inputMenuUpdateForm').submit(function(event) {
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
					window.location = '/control/menu/menuTmp';
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
	var menuId = $(curLine[0]).find('td').eq(1).text();
	var params = {
		"menuId" : menuId
	};
	if (confirm("确认要【注销】此内部账户：【" + menuId + "】?")) {
		$.ajax({
			type : "post",
			url : "/control/menu/inputMenudrop/" + menuId,
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					if (data["resultCode"] === '1') {
						window.location = '/control/menu/menuTmp';
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