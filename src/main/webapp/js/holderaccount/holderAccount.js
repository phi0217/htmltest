var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();

//点击【搜索】按钮
$(".search").click(function(){
	$("#search").fadeIn(50);
});
// 点击【新增】按钮
$(".addNew").click(function(){
	$("#new").fadeIn(50);
});
//点击【变更】按钮
$(".update").click(function(){
	$("#update").fadeIn(50);
});

//点击【自动生成持有人账号号码】按钮
$('#get_holderAccountSn').click(function(){
	$.ajax({
		type : 'POST',
        url : '/member/holderaccount/getholderaccountsn',
        dataType : "JSON",
        success : function(data) {
        	if (data["resultCode"] != null) {
        		if (data["resultCode"] === RESULT_FLAG_SUCCESS) {
        			$('#input_holderAccount_new').val(data["holderAccount"]);
        		} else {
        			return false;
        		}
        	}
        }
	});
});

$("#input_memberId_new").blur(function() {
	var memberId = $(this).val();
	var params = {
		"memberId" : memberId
	};
	$.ajax({
		type : 'POST',
		url : '/member/holderaccount/querymemberbymemberid',
		dataType : "JSON",
		data : params,
		success : function(data) {
			if (data["resultCode"] != null) {
				if (data["resultCode"] === RESULT_FLAG_SUCCESS) {
					var memberDtoList = data["memberDtoList"];
					var member = memberDtoList[0];
					$('#input_memberShortName_new').val(member["memberShortName"]);
					$('#input_memberName_new').val(member["memberName"]);
				} else {
					alert(data["resultCode"]);
					return false;
				}
			}
		}
	});
});

//--------------------------AJAX 提交 【搜索】FORM表单--------------------------
$('#queryHolderAccountForm').submit(function(event) {
//	event.preventDefault();
	var form = $(this);
	$.ajax({
		type : form.attr('method'),
        url : form.attr('action'),
        dataType : "JSON",
        data : form.serialize(),
        success : function(data) {
        	if (data["resultCode"] != null) {
//        		alert(data["resultCode"]);
//        		alert(data["resultMessage"]);
        		if (data["resultCode"] === RESULT_FLAG_SUCCESS) {
        			
        		} else {
        			return false;
        		}
        	}
        }
	});
});

// --------------------------AJAX 提交 【新增】【录入】FORM表单--------------------------
$('#inputHolderAccountNewForm').submit(function(event) {
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
        		window.location='/member/holderaccount/holderaccounttmp';
        	}
        }
	});
});

// 点击【变更】按钮
$('.inputUpdate').click(function() {
	// 自动填写该条目原值
	$("#input_holderAccount_update").val($(this).parents('tr').find('td').eq(0).text());
	$("#input_memberId_update").val($(this).parents('tr').find('td').eq(1).text());
	$("#input_holderShortNameCn_update").val($(this).parents('tr').find('td').eq(4).text());
	$("#input_holderNameCn_update").val($(this).parents('tr').find('td').eq(5).text());
	$("#input_holderShortNameEn_update").val($(this).parents('tr').find('td').eq(6).text());
	$("#input_holderNameEn_update").val($(this).parents('tr').find('td').eq(7).text());
	var unCorpBank = $(this).parents('tr').find('td').eq(8).text().trim();
	$("#input_unCorpBank_update").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == unCorpBank) {
	    	that.attr("selected", true);
	    }
	});
	$("#input_invoiceTitle_update").val($(this).parents('tr').find('td').eq(9).text());
	var feesIdentityType = $(this).parents('tr').find('td').eq(10).text().trim();
	$("#input_feesIdentityType_update").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == feesIdentityType) {
	    	that.attr("selected", true);
	    }
	});
	var prefixType = $(this).parents('tr').find('td').eq(11).text().trim();
	$("#input_prefixType_update").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == prefixType) {
	    	that.attr("selected", true);
	    }
	});
	var investorType = $(this).parents('tr').find('td').eq(12).text().trim();
	$("#input_investorType_update").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == investorType) {
	    	that.attr("selected", true);
	    }
	});
	$("#input_remark_update").val($(this).parents('tr').find('td').eq(13).text());
});

// --------------------------AJAX 提交 【变更】【录入】FORM表单--------------------------
$('#inputHolderAccountUpdateForm').submit(function(event) {
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
        		window.location='/member/holderaccount/holderaccounttmp';
        	}
        }
	});
});

// 点击【注销】按钮
$('.inputDrop').click(function() {
	var holderAccount = $(this).parents('tr').find('td').eq(0).text();
	var params = {
			"holderAccount":holderAccount
	};
    if (confirm("确认要【注销】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : "post",
			url : "/member/holderaccount/inputholderaccountdrop/"+holderAccount,
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/member/holderaccount/holderaccounttmp';
				}
			}
		});
	}
});

// 点击【激活】按钮
$('.inputActivate').click(function() {
	var holderAccount = $(this).parents('tr').find('td').eq(0).text();
	var params = {
			"holderAccount":holderAccount
	};
    if (confirm("确认要【激活】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : "post",
			url : "/member/holderaccount/inputholderaccountactivate/"+holderAccount,
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/member/holderaccount/holderaccounttmp';
				}
			}
		});
	}
});

// 点击【冻结】按钮
$('.inputFreeze').click(function() {
	var holderAccount = $(this).parents('tr').find('td').eq(0).text();
	var params = {
			"holderAccount":holderAccount
	};
    if (confirm("确认要【冻结】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : "post",
			url : "/member/holderaccount/inputholderaccountfreeze/"+holderAccount,
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/member/holderaccount/holderaccounttmp';
				}
			}
		});
	}
});

// 点击【解冻】按钮
$('.inputUnfreeze').click(function() {
	var holderAccount = $(this).parents('tr').find('td').eq(0).text();
	var params = {
			"holderAccount":holderAccount
	};
    if (confirm("确认要【解冻】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : "post",
			url : "/member/holderaccount/inputholderaccountunfreeze/"+holderAccount,
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(params),
			success : function(data) {
				if (data["resultCode"] != null) {
					alert(data["resultCode"]);
//					alert(data["resultMessage"]);
					window.location='/member/holderaccount/holderaccounttmp';
				}
			}
		});
	}
});