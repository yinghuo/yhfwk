/*
	Title：异步数据提交 1.0
	modity Daniel 2014-09-25	1:修复使用的时候重复绑定事件bug。
*/
$(document).ready(function(){
	//alert($("input[type=button][id^=comsubmit],a[id^=comsubmit],div[id^=comsubmit]").length);
	$("input[type=button][id^=comsubmit],a[id^=comsubmit],div[id^=comsubmit],p[id^=comsubmit]").unbind("click").bind("click",function(){ //   /.each(
		var url= $(this).attr("url");		
		var callfunction=$(this).attr("callfunction");
		var frm = $(this).attr('name');
		var promptInfo = $(this).attr('promptInfo');
		
		var validatafun= $(this).attr('validata');
		
		if(validatafun)
		{
			if(!eval(validatafun+"()"))
			{
				return;
			}
		}
		
		if(typeof(url)=="undefined"&&frm)
		{
			url=$("#"+frm).attr("action");
		}
		//debugger;
		var callfunctions;
		if(callfunction)
		{
			callfunctions = callfunction.split(',');
		}
		
		$.ajax({
				url:url,
				type:"post",
				data:frm?$('#'+frm).serialize():'',//;    $('form#'+$(this).attr('name')).formSerialize()				  $.param($('#'+frm))
				timeout:120000,
				beforeSend:function(xhr){
					if(callfunction)
					{
						if(callfunctions.length>1&&callfunctions[0])
							return eval(callfunctions[0]+"()");
					}
					
					if(promptInfo){
						if(!confirm(promptInfo!='default'?promptInfo:'<s:text name="errors.delete.confirm"/>')){
			 				return false;
			 			}
					}
					
				},
				success:function(data){
					
					if(callfunction)
					{
						if(callfunctions.length>2&&callfunctions[1])
							eval(callfunctions[1]+"(data)");
					}		
					
				},
				error:function(xmlHttpRequest, error){
					if(callfunction)
					{
						if(callfunctions.length>2&&callfunctions[2])
							//alert(callfunctions[2]);
							eval(callfunctions[2]+"()");
						
					}
				}	 		
			});
	});
	
});

