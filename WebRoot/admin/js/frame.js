/*
	@title：iFrame框架公用函数 1.0
	主要为iFrame框架集提供辅助功能函数
	
	@author Daniel
	@create 2014-05-13
	@version 1.0
*/
var showMenuId="";//当前展示的菜单ID标记
var showControl=null;//当前展示页面的导航条回传

/**
	默认注册导航控件事件，详细请参照NavMap使用说明
*/
NavMap.showItem=function(item)
{
	if(showControl!=null)
	{
		if(StringUtils.IsBlank(showControl.innerHTML))
		{
			showControl.innerHTML = item.title;
		}
		else
		{
			//showControl.innerHTML = '<a href="'+urldomain+item.url+'">'+item.title+'</a> 《 '+showControl.innerHTML;
			showControl.innerHTML = item.title+' 《 '+showControl.innerHTML;
		}
	}
}

/**
	初始化函数，初始化NavMap控件，详细请参照NavMap使用说明
*/
function initMap(jsonStr)
{
	NavMap.load(jsonStr.toString());
}

/**
	显示开始，在centerLeft.js中预备进行页面跳转的时候进行调用，缓存菜单ID
*/
function beginShow(id)
{
	showMenuId=id;
}

/**
	显示结束，在iframe.js中加载完成后调用，传递菜单map的控件，需要right Iframe页面中引用iframe.js并且页面的存放map的div的id属性为NavMap，可以在iframe.js中修改
*/
function endShow(dcontrol)
{
	showControl=dcontrol;
	NavMap.show(showMenuId);
}

$("#rightFrame").load(function(){ 
    console.log("加载完成。。。。");
}); 
