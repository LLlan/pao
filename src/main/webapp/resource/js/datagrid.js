$(function() {
	$(".list").on("click", function() {
		var pageSize = $("#pageSize").val();
		common_search(1, pageSize);
	})
	$(".previousPage").on("click", function() {
		var current = parseInt($("#hid_current").val());
		var pageSize = $("#pageSize").val();
		if(current - 1 > 0) {
			common_search(current - 1, pageSize);
		}
	})
	$(".nextPage").on("click", function() {
		var current = parseInt($("#hid_current").val());
		var pageSize = $("#pageSize").val();
		common_search(current + 1, pageSize);
	})
	$(".goPage").on("click", function() {
		var parent = $(this).parent();
		if(!parent.is(".active")) {
			var current = parseInt($(this).html());
			var pageSize = $("#pageSize").val();
			common_search(current, pageSize);
		}
	})
	$("#pageSize").on("change", function(){
		common_search(1, $(this).val());
	});
})

function common_search(current,pageSize) {
	$.customMask();
	var url = $(".search_form").attr("action");
	url += "?current=" + current + "&pageSize=" + (pageSize ? pageSize : 10);
	$(".search_form").attr("action", url);
	$(".search_form").submit();
}

function common_reload() {
	$.customMask();
	common_search(1);
}

