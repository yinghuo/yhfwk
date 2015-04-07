/*
	@title：菜单事件控件1.0
	为页面的主菜单进行点击事件重写
	
	@author XueChao Sun
	@create 2014-05-12
	@version 1.0
	
	@modify by Daniel@2014-05-12 1：为菜单添加属性url放置菜单的连接属性。2：完善绑定函数，依据url属性进行跳转
	@modify by Daniel@2014-05-13 1：修改通过jquery获取左侧菜单列表设置src来展示菜单的方式，改为直接函数调用，传递菜单
*/
$(function() {

	$(".menu a").bind("click",function() {
		//var leftFrame = $(window.parent.document).find("#leftFrame");
		//var url=$(this).attr("url");注释url的使用，主菜单无url设置 by Daniel@2014-05-13
		//if(url)
		//{
			//$(leftFrame).attr("src",url);//centerLeft.jsp
			_that=$(this);
			showMenus=$("#menu_"+$(this).attr("id"));
			//添加非空逻辑 by Daniel
			if(showMenus.children(":first").children().length>0)
			{
				//@modify by Daniel@2014-08-15 1:头部加载完成需要传递菜单项到左侧列表，使用加载信号，添加事件延时处理
				itime=setInterval("loadmenu()",50);
				setTimeout(timeout,3000);
			}
		//}
	});
	//添加默认触发逻辑 by Daniel@2014-05-13
	$(".menu a:first").trigger("click");
})

var leftcomplete=false;
var showMenus;
var _that;
var itime;
function timeout()
{
	leftcomplete=true;
}

function loadmenu()
{
	if(leftcomplete)
	{
		clearInterval(itime);
		var ltf=window.parent.window.frames["leftFrame"];
		ltf.showMenus(showMenus,_that.attr("id"));//添加菜单传递函数，避免多次刷新 by Daniel@2014-05-13
		$(".menu a").removeClass("curMenu");
		_that.addClass("curMenu");
	}
} 
