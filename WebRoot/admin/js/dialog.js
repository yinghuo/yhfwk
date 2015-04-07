$(function() {
	$(".dialogCancel,.dialogClose").bind("click",function() {
		$("#dialog").hide();
		$("#dialogContext").empty();
		$("#maskLayer").hide();
	});
});