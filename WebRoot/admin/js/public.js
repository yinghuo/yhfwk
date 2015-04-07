$(function() {
	//表格复选框全选(表头)
	$(".checkboxTable thead :checkbox").bind("click",function() {
		var checked = $(this)[0].checked,
		    tbodyCheckBox = $(".checkboxTable tbody :checkbox");
		
		if(checked) {
			tbodyCheckBox.each(function() {
				$(this)[0].checked = true;
			});
		}
		else {
			tbodyCheckBox.each(function() {
				$(this)[0].checked = false;
			});
		}
	});
	//表格复选框全选(表体)
	$(".checkboxTable tbody :checkbox").bind("click",function() {
		var tbodyCheckedBox = $(".checkboxTable tbody :checked"),
			tbodyAllCheckBox = $(".checkboxTable tbody :checkbox"),
			theadCheckBox = $(".checkboxTable thead :checkbox");
		
		if(tbodyCheckedBox.length == tbodyAllCheckBox.length) {
			theadCheckBox[0].checked = true;
		}
		else {
			theadCheckBox[0].checked = false;
		}
	})
})