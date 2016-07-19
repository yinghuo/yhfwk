$(function(){
	//查询所有需要排序的order
	$(".order").on("click",function(){
		
		var type=$(this).attr("type");
		var parms=$(this).attr("value");
		var a=$(this).find(".fa");
		var icon=$(this).find(".fa")[0];
		if(type==1)
		{
			type = 0;
			$(icon).removeClass("fa-caret-down");
			$(icon).addClass("fa-caret-up");
			$(this).attr("type",0)
			$(this).attr("title","升序");
		}
		else if(type==0)
		{
			type = 1;
			$(icon).removeClass("fa-caret-up");
			$(icon).addClass("fa-caret-down");
			$(this).attr("type",1)
			$(this).attr("title","降序");
		}
		
		
		//url
		var url = $(this).attr("url");
		if(url){
			window.location.href=url+"&oname="+parms+"&otype="+type;
		}
		
	});
});