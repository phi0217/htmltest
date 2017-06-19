var RESULT_FLAG_SUCCESS = $("#RESULT_FLAG_SUCCESS").val();
// --------------------------AJAX 提交 【新增】【录入】FORM表单--------------------------
$('#inputRateMaintainNewForm').submit(function(event) {
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
        			window.location='/rateMaintain/rateMaintainTmp';
        		} else {
        			return false;
        		}       		
        	}
        }
	});
});