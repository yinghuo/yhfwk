/*
	Title：异步数据提交 1.0
	modity Daniel 2014-09-25	1:修复使用的时候重复绑定事件bug。
	
	v3.0
	modify 2015-05-02	1:添加表单异步文件提交功能
*/
$(document).ready(function(){
	$("input[type=button][id^=comsubmit],input[type=submit][id^=comsubmit],a[id^=comsubmit],div[id^=comsubmit],p[id^=comsubmit],button[id^=comsubmit]").unbind("click").bind("click",function(){ //   /.each(
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
		
		//V3.0判断提交方式
		if(checkFileInForm(frm))//含有文件域的提交
		{
			var frmObj=$("#"+frm);
			frmObj.attr("action",url);
			frmObj.attr("method","post");
			frmObj.ajaxSubmit({
				dataType:'json',
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
		}
		else
		{		
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
		}
	});
});

//
function checkFileInForm(fid)
{
	var hasFileSelect=false;
	$("#"+fid).find("input[type='file']").each(function(){
		if($(this).val().length>0)
			hasFileSelect=true;
	});
	return hasFileSelect;
}

function jsonResult(data,call)
{
	if(!IsObject(data))
	{
		try{
			data=JSON.parse(data);
		}catch(e)
		{
			alert("无法解析返回信息！");
		}
	}
	
	if(data.msg)
	{
		alert(data.msg);
	}
	call(data);
}

function htmlResult(id,data)
{
	$("#"+id).html(data);
}
