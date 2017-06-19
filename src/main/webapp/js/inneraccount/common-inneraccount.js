// 核算币种下拉菜单查询功能
$(function() {
	function loadCurrencySelect() {
		$(".currencySelect").each(function() {
			var that = $(this);
			$.ajax({
				type : "get",
				url : "/fund/currency/queryCurrencyMap",
				dataType : "jsonp",
				async : false,
				jsonpCallback : "load",
				cache : false,
				timeout : 5000,
				success : function(data) {
					data = data.currencyMapList[0];
					for ( var key in data) {
						if (data.hasOwnProperty(key)) {
							$('<option value=' + key + '>' + data[key] + '</option>').appendTo(that);
						}
					}
				},
				error : function(data) {
					console.log("数据加载错误！")
				}
			});
		});
	}
	loadCurrencySelect();
})

// 内部账户账号自动生成校验位
$(".innerAccount").blur(function() {
	var innerAccount = $('.innerAccount').val();
	if (innerAccount.length >= 12) {
		var prefix = innerAccount.substring(0, 12);
		var params = {
				"prefix" : prefix
		}
		$.ajax({
			type : 'POST',
			url : '/fund/inneraccount/getinneraccountcheckbit',
			dataType : "JSON",
			data : params,
			success : function(data) {
				if (data["resultCode"] != null) {
					if (data["resultCode"] === '1') {
						$('.innerAccount').val(data["innerAccount"]);
					} else {
//						alert(data["resultCode"]);
						alert(data["resultMessage"]);
						return false;
					}
				}
			}
		});
	}
});

// 根据账号获取核算币种／会计科目信息
$(".innerAccount").bind('input propertychange change', function() {
	$('.currencyNameCn').val("");
	$('.subjectName').val("");
	var innerAccount = $(this).val();
	if (innerAccount.length >= 2) {
		var currencyCode = innerAccount.substring(0, 2);
		$(".currencyCode").val(currencyCode);
		var params = {
			"currencyCode" : currencyCode
		};
		$.ajax({
			type : 'POST',
			url : '/fund/inneraccount/querycurrencybycurrencycode',
			dataType : "JSON",
			data : params,
			success : function(data) {
				if (data["resultCode"] != null) {
					if (data["resultCode"] === '1') {
						var currencyDtoList = data["currencyDtoList"];
						var currency = currencyDtoList[0];
						$(".currency").find("option").each(function(data) {
							var that = $(this);
							if (that.val() == currency["currencyCode"]) {
								that.attr("selected", true);
							}
						});
						$('.currencyNameCn').val(currency["currencyNameCn"]);
					} else {
//						alert(data["resultCode"]);
						alert(data["resultMessage"]);
						return false;
					}
				}
			}
		});
	}
	if (innerAccount.length >= 10) {
		var subjectCode = innerAccount.substring(2, 10)
		$(".subjectCode").val(subjectCode);
		var params = {
			"subjectCode" : subjectCode
		};
		$.ajax({
			type : 'POST',
			url : '/fund/inneraccount/querysubjectdatabysubjectcode',
			dataType : "JSON",
			data : params,
			success : function(data) {
				if (data["resultCode"] != null) {
					if (data["resultCode"] === '1') {
						var subjectDataDtoList = data["subjectDataDtoList"];
						var subjectData = subjectDataDtoList[0];
						$('.subjectName').val(subjectData["subjectName"]);
					} else {
//						alert(data["resultCode"]);
						alert(data["resultMessage"]);
						return false;
					}
				}
			}
		});
	}
});

// 内部账户权限为"全局"时，所有者不可输入
$(".innerAccountAuthorityType").change(function(){
	var value = $(this).find("option").eq(1).val();
	if ($(this).val() == value) {
		$('.innerAccountOwnership').val("").attr('readonly',true);
	} else {
		$('.innerAccountOwnership').removeAttr('readonly');
	}
});

// 根据币种下拉选项变化实时改变内部账户账号
$(".currency").change(function(){
	$('.currencyNameCn').val("");
	var currencyCode = $(this).find("option:selected").val();
	$(".currencyCode").val(currencyCode);
	var innerAccount = $(".innerAccount").val();
	if (innerAccount <= 2) {
		var newInnerAccount = currencyCode
		$(".innerAccount").val(newInnerAccount);
	} else {
		var suffix = innerAccount.substring(2);
		var newInnerAccount = currencyCode + suffix;
		$(".innerAccount").val(newInnerAccount).trigger("blur");
	}
	var params = {
			"currencyCode" : currencyCode
	};
	$.ajax({
		type : 'POST',
		url : '/fund/inneraccount/querycurrencybycurrencycode',
		dataType : "JSON",
		data : params,
		success : function(data) {
			if (data["resultCode"] != null) {
				if (data["resultCode"] === '1') {
					var currencyDtoList = data["currencyDtoList"];
					var currency = currencyDtoList[0];
					$('.currencyNameCn').val(currency["currencyNameCn"]);
				} else {
//					alert(data["resultCode"]);
					alert(data["resultMessage"]);
					return false;
				}
			}
		}
	});
});

// 分页信息

// 当前页（跳转页）页数
var currentPage = $('#toCurrentPage').val();
// 总共页数
var totalPage = $('#totalPage').text();

init();

$('#toCurrentPage').blur(function() {
	if ($(this).val() <= 0 || $(this).val() > totalPage) {
		$('#paegSubmit').attr("disabled", "disabled");
	}
});

$("#prev").click(function(){
	init();
	if(currentPage >= 2){
		currentPage--;
	}
    $('#toCurrentPage').val(currentPage);
    $('#paegSubmit').click();
    $('#currentPage').text(currentPage);
})

$("#next").click(function(){
	init();
	if(currentPage < totalPage){
		currentPage++;
	}
	$('#toCurrentPage').val(currentPage);
	$('#paegSubmit').click();
	$('#currentPage').text(currentPage);
})

function init() {
	if (currentPage <= 1) {
		$('#toCurrentPage').val(1);
		$("#prev").attr("disabled", "disabled");
	} else {
		$("#prev").removeAttr("disabled");
	}
	if (totalPage == 0) {
		$('#totalPage').text(1);
		$('#currentPage').text(1);
	}
	if (currentPage == totalPage) {
		$("#next").attr("disabled", "disabled");
	} else {
		$("#next").removeAttr("disabled");
	}
}

// 搜索条件回写后，select自动选择
$(function() {
	$("select").each(function() {
		var that = $(this);
		var val = that.attr("select-value");
		that.find("option").each(function() {
			if ($(this).val() == val) {
				$(this).attr("selected", true);
			}
		})
	})
});