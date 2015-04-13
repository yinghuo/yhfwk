/*
	Title：部件异步加载 2.1
	2014-07-02 Daniel 修复DOM事件冒泡Bug
*/
$(document).ready(function(){
	$("div[id^=widget_]").each(function(){
		var url= $(this).attr("url");
		var body=$(this).children("div[name='body']");
		//$(body).addClass("body");
		if(url!="")
		{
			var no=new Date().getTime();
			var id=$(this).attr("id");
			var waitdiv = "<div id='showload_"+no+"' align='center' style='width:100%;height:10px;background-color:#ffffff;padding-top:20px;'>正在努力拉取数据中..</div>"; 
			//var body=$(this).children("div[name='body']");
			//$(body).addClass("body");
			
			$(this).append(waitdiv); 
			$.ajax({
					url:url,//+"_widget.jsp",
					type:"post",
					data:'',
					timeout:1200000,
					beforeSend:function(xhr){
						return true;
			 		},		 		
			 		success:function(data){
			 			$("#showload_"+no).remove();
			 			//$("#"+id).empty();
			 			//$("#"+id).html(data);	
			 			$(body).empty();
			 			$(body).html(data);
			 		},
			 		error:function(xmlHttpRequest, error){
						$("#showload_"+no).html("数据拉取失败！&nbsp;&nbsp;&nbsp;<a hreg=''>重新加载</a>");
					}
			});
		}
	});
	$("[id^=widgetData_]").each(function(){
		$(this).bind("loaddata",function(){
			var url= $(this).attr("url");
			var callfunction=$(this).attr("callfunction");
			var callfunctions;
			if(callfunction)
			{
				callfunctions = callfunction.split(',');
			}		
			$.ajax({
				url:url,
				type:"post",
				data:$(this).attr("data")?$(this).attr("data"):"",
				timeout:1200000,
				beforeSend:function(xhr){
					if(callfunctions.length>1)
						return eval(callfunctions[0]);
				},
				success:function(data){	
					if(callfunctions.length>2)
						eval(callfunctions[1]+"(data)");
				},
				error:function(xmlHttpRequest, error){
					if(callfunctions.length>3)
						eval(callfunctions[2]);
				}	 		
			});
		});
		
		var auto=$(this).attr("auto");
		if(auto!="false")
			$(this).trigger("loaddata");
		
	});
	
});