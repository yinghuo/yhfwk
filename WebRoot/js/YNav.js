/*
	@title：web导航/网站地图1.0
	实现整个网站的面包屑导航或者网站地图的描述。
	
	@author XueChao Sun
	@author Daniel.Yim
	@create 2014-04-18
	@version 1.0
*/

var NavMap=(function()
	{
		window.ItemList=new Array();
		//TODO 可修改为通过字符串和异步url加载数据
		var testStr="";
		
		var load=function(values)
		{			
			//判断是否是json字符串还是url
			if(StringUtils.StartWith(values,"http:"))
			{
				loadUrl(values);
			}
			else if(StringUtils.StartWith(values,"["))
			{
				loadJson(values);
			}
		}
		
		var showItem;
		
		var show=function(key,fun)
		{			
			if(!StringUtils.IsBlank(key))
			{
				var item = window.ItemList[key];
				if(item!=null)
				{
					if(!fun)fun=this.showItem;
					//modify Daniel 2014-08-22 1：取消一级
					showItems(item.parent,fun);
				}
			}
		}
		
		function showItems(item,fun)
		{
			fun(item);
			if(item.parent==null)return;
			showItems(item.parent,fun);
		}
		
		function loadJson(values)
		{
		   //初始化json对象
		   var jsonObjects=JSON.parse(values);
		   //遍历初始化对象
		   for(var i=0;i<jsonObjects.length;i++)
		   {
		   		eachJson(jsonObjects[i],null);
		   }
		}
		
		function eachJson(jsonNode,parentNode)
		{
			var item =new NavItem();
			item.key=jsonNode["key"];
			item.parent=parentNode;
			item.title=jsonNode["title"];
			item.url=jsonNode["url"];	
					
			window.ItemList[item.key]=item;			
			if(jsonNode["children"].length==0)return;
			for(var i=0;i<jsonNode["children"].length;i++)
		    {
		   		eachJson(jsonNode["children"][i],item);
		    }			
		}
		
		function loadUrl(url)
		{
			
		}
		return {
		    load: load,
		    show: show,
		    showItem:showItem
		}
	}
).call(this)

/*
	统一函数调用
*/
NavMap.showItem=function(item)
{
	var title = item["title"],
		url = item["url"],
		newBreadcrumbu = "<a href='"+url+"'>"+title+"</a>",
		aList = $("#breadCrumb a");
		
	if(aList.length == 0){
		$("#breadCrumb").append(newBreadcrumbu);
	}
	else {
		var curFirstCrumb = $("#breadCrumb a").eq(0);
		$(curFirstCrumb).before(newBreadcrumbu+">");
	}
}

function NavItem()
{
	//属性声明
	this.key=null;
	this.parent=null;
	this.title="";
	this.url="#";
}

var parentMenuIds=[];
function setLeftTopMenu(key)
{			
	if(!StringUtils.IsBlank(key))
	{
		var item = window.ItemList[key];
		parentMenuIds=[];
		if(item!=null)
		{
			getParentMenuIds(item);
			for(var i= 0 ;i<parentMenuIds.length;i++){
				var menuId = parentMenuIds[i];
				if(i == 0){
					var leftLastMenu = window.frames["leftFrame"].document.getElementById(menuId),
					    centerLeft = window.frames["leftFrame"].document.getElementById("centerLeft");
					
					$(centerLeft).find("li").removeClass("selected_leftMenu");
					$(leftLastMenu).addClass("selected_leftMenu");
				}
				if(i == 1){
					var leftFirstMenu = window.frames["leftFrame"].document.getElementById(menuId),
						leftFirstMenuBtn = $(leftFirstMenu).find("span"),
						submenuItems = $(leftFirstMenu).find("ul");

					if(submenuItems.length != 0) {
						$(submenuItems).slideDown();
						$(leftFirstMenuBtn).addClass("unfold_LeftMenu");
					}
				}
				if(i == 2){
					var topMenu = window.frames["headFrame"].document.getElementById(menuId),
						headMenu = window.frames["headFrame"].document.getElementById("menu");

					$(headMenu).find("a").removeClass("curMenu");
					$(topMenu).addClass("curMenu");
				}
			}
			
		}
	}
}

function getParentMenuIds(item)
{
	parentMenuIds.push(item["key"]);
	if(item.parent!=null)
	{
		getParentMenuIds(item.parent);
	}
	
}

