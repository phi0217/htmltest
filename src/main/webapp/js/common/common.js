$(function() {
	/*头部菜单样式*/
	$(".header .nav li").mouseenter(function() {
		$(this).css("background", "#0f88eb").siblings('li').css("background", "transparent");
		$(".menu").css('display', 'block');
	})
	$(".header .nav").mouseleave(function() {
		//		$(".menu").css("display", 'none');
	});
	$(".menu").mouseenter(function() {
		$(this).css("display", 'block');
	})
	$(".menu").mouseleave(function() {
		$(this).css("display", 'none');
		$(".nav li").css("background", "transparent");
	})
	//设置table横向滚动条位置
	function set() {
		var height = $(window).height() - $(".header").height() - $(".main .title").height() - 52;
		$(".table").css({
			minHeight: height
		});
	}
	set();
	//2.选中当前行
	var curLine = ""; //选中表格的当前行 当前tr(jquery对象)
	$('tr').click(function() {
		if($(this).index() !== 0) {
			curLine = $(this);
			$(this).css('background', '#EDEDED');
			$(this).siblings("tr:nth-of-type(odd)").css("background", "#fff");
			$(this).siblings("tr:nth-of-type(even)").css("background", "#f9f5f1");
			$(this).find('input[type="radio"]').prop('checked', true);
		}
	})

	/*3.
	 显示页面上对应操作所需的弹框
	 * 给对应的button按钮添加点击事件
	 * 使对应的ID的弹框显示
	 * 关闭操作统一由绑定在.close按钮上的事件控制
	 * 具体的操作以下方js语句为例
	 * */

	//	$(".audit").click(function() {
	//		$(".mask").fadeIn(50);
	//	});
	//关闭弹框，通用
	$('.close').click(function() {
		$(this).parents('.mask').hide(50);
	})
	$('.close').click(function() {
		$(this).parents('.input').hide(50);
	})

	//4.数据字典查询功能
	function loadSelect() {
		$(".select").each(function() {
			var that = $(this);
			var url = '/dictionary/queryDictionarySubNameMap/' + that.data('code');
			$.ajax({
				type: "get",
				url: url,
				async: false,
				success: function(res) {
					res = JSON.parse(res);
					res = res.dictSubNameMap;
					for(var key in res) {
						$("<option value='" + key + "'>" + res[key] + "</option>").appendTo(that);
					}
				},
				error: function(res) {
					console.log("error" + res);
				}
			});

		})
	}
	loadSelect();
	//加载常量类
	function loadConstant() {
		var types = $("[data-type]");
		types.each(function() {
			var that = $(this);
			var text = that.html();
			var url = '/dictionary/queryDictionarySubNameMap/' + that.data('type');
			if(text !== "") {
				$.ajax({
					type: "get",
					url: url,
					async: true,
					success: function(res) {
						res = JSON.parse(res);
						res = res.dictSubNameMap;
						for(var key in res) {
							if(key == text) {
								that.text(res[key]);
							}
						}
					},
					error: function(res) {
						console.log("error" + res)
					}
				});
			}

		})
	}
	loadConstant();
	//5.table预览当前行
	var tableTitle = [];
	$('.table th').each(function() {
		tableTitle.push($(this).html());
	});
	//双击查看
	$('td').dblclick(function() {
		var dom = $(this);
		loadMes(dom);
	});
	//点击查看按钮查看
	$(".see").click(function() {
		if(curLine) {
			var dom = curLine.find('td').eq(0);
			loadMes(dom);
		} else {
			alert("请选择要查看的项目！")
		}
	})

	function loadMes(dom) {
		$('.preview').fadeIn(50);
		$('.preview ul').empty();
		var data = [];
		dom.parents('tr').find('td').each(function() {
			data.push($(this).html());
		});
		for(var i = 1; i < data.length; i++) {
			$('<li><span>' + tableTitle[i] + ':</span><p>' + data[i] + '</p></li>').appendTo($('.preview ul'))
		}
		$(".preview ul li").each(function() { //控制左右两侧两个li的高度统一
			var index = $(this).index();
			if(index % 2 == 0) {
				var height_1 = $(".preview ul li").eq(index).height();
				var height_2 = $(".preview ul li").eq(index + 1).height();
				if(height_1 > height_2) {
					$(".preview ul li").eq(index + 1).height(height_1);
				} else {
					$(".preview ul li").eq(index).height(height_2);
				}
			}
		})
	}
	//关闭
	$('.preview .close').click(function() {
		$(this).parents('.preview').fadeOut(30);
	});
	//6.时间输入框
	$('.time').each(function() {
		var time = $(this).find('input');
		var time_1 = time.eq(0);
		var time_2 = time.eq(1);
		time_1.attr("readonly","readonly");
		time_2.attr("readonly","readonly");
		$("<span>至</span>").insertBefore(time_2);
		time_1.fdatepicker({
			format: 'yyyy-mm-dd hh:ii',
			pickTime: true
		});
		time_2.fdatepicker({
			format: 'yyyy-mm-dd hh:ii',
			pickTime: true
		});
	});

});