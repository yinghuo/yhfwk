/*
	@title：centerLeft页面辅助函数 1.0
	centerLeft左侧菜单的业务操作函数
	
	@author XueChao Sun
	@create 2014-05-13
	@version 1.0
	
	@modify by Daniel@2014-05-13	1:添加bindEvent()函数，需要手动重新为元素绑定事件。2：添加showMenus()函数，展示菜单。3：添加clearMenus()函数，清除菜单显示区域
	@modify by Daniel@2014-07-29	1:添加页面加载完成后触发头页面的菜单加载事件。
*/
$(function() {
	//加载完成触发菜单加载
	window.parent.window.frames["headFrame"].leftcomplete=true;
	//bindEvent();
});
//Menus Id
var nowShowId="";

/**
	处理菜单元素，为元素绑定处理事件
	@author XueChao Sun
*/
function bindEvent()
{
	//默认加载第一个菜单对应的页面
	var firstLeftMenu = $(window.parent.frames["leftFrame"].document).find(".selected_leftMenu"),
		rightPageName = firstLeftMenu.attr("rightPageName"),
		rightFrame = $(window.parent.document).find("#rightFrame");


	$(rightFrame).attr("src",rightPageName);

	
	//添加无默认菜单逻辑 by Daniel
	if(firstLeftMenu.length==0)//无3级默认菜单
	{
		window.parent.beginShow("");
		$(rightFrame).attr("src","nopage.jsp");
	}
	else
	{
		//$(rightFrame).attr("src","rightPages/"+rightPageName); @modify by Daniel@2014-05-13 注释，应该改为直接显示菜单的连接，不会只为rightPages文件夹下的
		window.parent.beginShow(firstLeftMenu.attr("id"));
		//添加空页处理逻辑 by Daniel
		if("javascript:{}"!=rightPageName)
			$(rightFrame).attr("src",rightPageName);
		else
			$(rightFrame).attr("src","nopage.jsp");
	}
	//展开菜单
	$(".leftFirstMenu span").bind("click",function() {
		var submenuItems = $(this).next("ul");
		if(submenuItems.length != 0) {
			$(submenuItems).slideToggle();
			$(this).toggleClass("unfold_LeftMenu");
		}
	});
	
	//左侧菜单切换,右侧更换页面
	$(".leftFirstMenu ul li").bind("click",function() {
		var rightPageName = $(this).attr("rightPageName"),
			rightFrame = $(window.parent.document).find("#rightFrame");
		
		$("#centerLeft li").removeClass("selected_leftMenu");
		$(this).addClass("selected_leftMenu");

		$(rightFrame).attr("src",rightPageName);

		//$(rightFrame).attr("src","rightPages/"+rightPageName); @modify by Daniel@2014-05-13 同Line:28
		window.parent.beginShow($(this).attr("id"));
		//添加空页处理逻辑 by Daniel
		if("javascript:{}"!=rightPageName)
			$(rightFrame).attr("src",rightPageName);
		else
			$(rightFrame).attr("src","nopage.jsp");

	});
}

/**
	展示指定的菜单
	@param menu 从head.js传递过来的需要展示的菜单
	@param id 从head.js传递过来的当前主菜单的编号，用于互斥显示
	@author Daniel
	
*/
function showMenus(menu,id)
{
	if(id!=nowShowId)//重复显示锁
	{
		nowShowId=id;
		clearMenus();
		var menulv2=$(menu).children(":first");
		$("#centerLeft").append(menulv2.children().clone(true));
		bindEvent();
	}
}

/**
	清理菜单内容区域
	@author Daniel
*/
function clearMenus()
{
	$("#centerLeft").empty();
}

