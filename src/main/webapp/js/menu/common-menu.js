
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