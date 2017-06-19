var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();
// --------------------------操作类型【新增】，点击【修改】按钮--------------------------
$(".modifyNew").click(function() {
	$("#modifyNew").fadeIn(50);
	// 自动填写该条目原值
	$("#modify_opSequenceNo_new").val($(this).parents('tr').find('td').eq(0).text());
	$("#modify_operType_new").val($(this).parents('tr').find('td').eq(1).text().trim());
	$("#modify_holderAccount_new").val($(this).parents('tr').find('td').eq(2).text());
	$("#modify_memberId_new").val($(this).parents('tr').find('td').eq(3).text());
	$("#modify_holderShortNameCn_new").val($(this).parents('tr').find('td').eq(6).text());
	$("#modify_holderNameCn_new").val($(this).parents('tr').find('td').eq(7).text());
	$("#modify_holderShortNameEn_new").val($(this).parents('tr').find('td').eq(8).text());
	$("#modify_holderNameEn_new").val($(this).parents('tr').find('td').eq(9).text());
	var unCorpBank = $(this).parents('tr').find('td').eq(10).text().trim();
	$("#modify_unCorpBank_new").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == unCorpBank) {
	    	that.attr("selected", true);
	    }
	});
	$("#modify_invoiceTitle_new").val($(this).parents('tr').find('td').eq(11).text());
	var feesIdentityType = $(this).parents('tr').find('td').eq(12).text().trim();
	$("#modify_feesIdentityType_new").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == feesIdentityType) {
	    	that.attr("selected", true);
	    }
	});
	var prefixType = $(this).parents('tr').find('td').eq(13).text().trim();
	$("#modify_prefixType_new").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == prefixType) {
	    	that.attr("selected", true);
	    }
	});
	var investorType = $(this).parents('tr').find('td').eq(14).text().trim();
	$("#modify_investorType_new").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == investorType) {
	    	that.attr("selected", true);
	    }
	});
	$("#modify_remark_new").val($(this).parents('tr').find('td').eq(15).text());
})

// --------------------------AJAX 提交 【新增】【修改】FORM表单--------------------------
$('#modifyHolderAccountNewForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#modify_operType_new").val();
	var holderAccount = $("#modify_holderAccount_new").val();
	if (confirm("确认要修改【"+operType+"】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : form.attr('method'),
	        url : form.attr('action'),
	        dataType : "JSON",
	        data : form.serialize(),
	        success : function(data) {
	        	if (data["resultCode"] != null) {
	        		alert(data["resultCode"]);
//	        		alert(data["resultMessage"]);
	        		if (data["resultCode"] === RESULT_FLAG_SUCCESS) {
	        			
	        		} else {
	        			return false;
	        		}
	        		window.location='/member/holderaccount/holderaccounttmp';
	        	}
	        }
		});
	}
});


// --------------------------操作类型【新增】，点击【删除】按钮--------------------------
$('.deleteNew').click(function() {
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var holderAccount = $(this).parents('tr').find('td').eq(2).text();
	var params = {
			"opSequenceNo":opSequenceNo
	};
    if (confirm("确认要撤销【"+operType+"】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : "post",
			url : "/member/holderaccount/deleteholderaccountnew/"+opSequenceNo,
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
})

// --------------------------操作类型【变更】，点击【修改】按钮--------------------------
$(".modifyUpdate").click(function() {
	$("#modifyUpdate").fadeIn(50);
	// 自动填写该条目原值
	$("#modify_opSequenceNo_update").val($(this).parents('tr').find('td').eq(0).text());
	$("#modify_operType_update").val($(this).parents('tr').find('td').eq(1).text().trim());
	$("#modify_holderAccount_update").val($(this).parents('tr').find('td').eq(2).text());
	$("#modify_memberId_update").val($(this).parents('tr').find('td').eq(3).text());
	$("#modify_holderShortNameCn_update").val($(this).parents('tr').find('td').eq(6).text());
	$("#modify_holderNameCn_update").val($(this).parents('tr').find('td').eq(7).text());
	$("#modify_holderShortNameEn_update").val($(this).parents('tr').find('td').eq(8).text());
	$("#modify_holderNameEn_update").val($(this).parents('tr').find('td').eq(9).text());
	var unCorpBank = $(this).parents('tr').find('td').eq(10).text().trim();
	$("#modify_unCorpBank_update").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == unCorpBank) {
	    	that.attr("selected", true);
	    }
	});
	$("#modify_invoiceTitle_update").val($(this).parents('tr').find('td').eq(11).text());
	var feesIdentityType = $(this).parents('tr').find('td').eq(12).text().trim();
	$("#modify_feesIdentityType_update").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == feesIdentityType) {
	    	that.attr("selected", true);
	    }
	});
	var prefixType = $(this).parents('tr').find('td').eq(13).text().trim();
	$("#modify_prefixType_update").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == prefixType) {
	    	that.attr("selected", true);
	    }
	});
	var investorType = $(this).parents('tr').find('td').eq(14).text().trim();
	$("#modify_investorType_update").find("option").each(function(data) {
		var that = $(this);
	    if(that.text() == investorType) {
	    	that.attr("selected", true);
	    }
	});
	$("#modify_remark_update").val($(this).parents('tr').find('td').eq(15).text());
})

// --------------------------AJAX 提交 【变更】【修改】FORM表单--------------------------
$('#modifyHolderAccountUpdateForm').submit(function(event) {
	event.preventDefault();
	var form = $(this);
	var operType = $("#modify_operType_update").val();
	var holderAccount = $("#modify_holderAccount_update").val();
	if (confirm("确认要修改【"+operType+"】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : form.attr('method'),
	        url : form.attr('action'),
	        dataType : "JSON",
	        data : form.serialize(),
	        success : function(data) {
	        	if (data["resultCode"] != null) {
	        		alert(data["resultCode"]);
//	        		alert(data["resultMessage"]);
	        		if (data["resultCode"] === RESULT_FLAG_SUCCESS) {
	        			
	        		} else {
	        			return false;
	        		}
	        		window.location='/member/holderaccount/holderaccounttmp';
	        	}
	        }
		});
	}
});

// --------------------------操作类型【变更】，点击【删除】按钮--------------------------
$('.deleteUpdate').click(function() {
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var holderAccount = $(this).parents('tr').find('td').eq(2).text();
	var params = {
			"opSequenceNo":opSequenceNo
	};
    if (confirm("确认要撤销【"+operType+"】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : "post",
			url : "/member/holderaccount/deleteholderaccountupdate/"+opSequenceNo,
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
})

// --------------------------操作类型【注销】，点击【删除】按钮--------------------------
$('.deleteDrop').click(function() {
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var holderAccount = $(this).parents('tr').find('td').eq(2).text();
	var params = {
			"opSequenceNo":opSequenceNo
	};
    if (confirm("确认要撤销【"+operType+"】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : "post",
			url : "/member/holderaccount/deleteholderaccountdrop/"+opSequenceNo,
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
})

// --------------------------操作类型【激活】，点击【删除】按钮--------------------------
$('.deleteActivate').click(function() {
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var holderAccount = $(this).parents('tr').find('td').eq(2).text();
	var params = {
			"opSequenceNo":opSequenceNo
	};
    if (confirm("确认要撤销【"+operType+"】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : "post",
			url : "/member/holderaccount/deleteholderaccountactivate/"+opSequenceNo,
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
})

// --------------------------操作类型【冻结】，点击【删除】按钮--------------------------
$('.deleteFreeze').click(function() {
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var holderAccount = $(this).parents('tr').find('td').eq(2).text();
	var params = {
			"opSequenceNo":opSequenceNo
	};
    if (confirm("确认要撤销【"+operType+"】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : "post",
			url : "/member/holderaccount/deleteholderaccountfreeze/"+opSequenceNo,
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
})

// --------------------------操作类型【解冻】，点击【删除】按钮--------------------------
$('.deleteUnfreeze').click(function() {
	var opSequenceNo = $(this).parents('tr').find('td').eq(0).text();
	var operType =  $(this).parents('tr').find('td').eq(1).text().trim();
	var holderAccount = $(this).parents('tr').find('td').eq(2).text();
	var params = {
			"opSequenceNo":opSequenceNo
	};
    if (confirm("确认要撤销【"+operType+"】此持有人账号：【"+holderAccount+"】?")) {
		$.ajax({
			type : "post",
			url : "/member/holderaccount/deleteholderaccountunfreeze/"+opSequenceNo,
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
})