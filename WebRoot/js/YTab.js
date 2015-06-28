/*
	Tab组件实现
*/

$(document).ready(function(){
	TabsBind();
});


function TabBindId(id)
{
	TagBind($("#"+id));
}


function TabsBind()
{
	//获取所有的选项卡定义
	$("tab").each(function(){
		TagBind($(this));
	});
}

function TagBind(control)
{
	if(control)
	{
		//监测属性定义？
		
	
		//获取按钮组定义
		var tabBtnBar=control.find(".tab_title");
		var tabCViews=control.find(".tab_content");
		if(tabBtnBar&&tabCViews&&tabBtnBar.length>0&&tabCViews.length>0)
		{
			var tabBtns=tabBtnBar.children("a");
			var tabContents=tabCViews.children(".tab-view");
			//alert("按钮组："+tabBtns.length);
			//alert("内容组："+tabContents.length);
			
			if(tabBtns&&tabBtns.length>0)
			{
				var i=0;
				tabBtns.each(function(){
					var _btn=$(this);	
					_btn.attr("href","javascript:{}");
					var index=i;
					
					$(this).on("click",function(){
						//隐藏所有显示
						tabBtnBar.children("a").removeClass("activate");
						tabCViews.children(".tab-view").hide();
						_btn.addClass("activate");
						$(tabContents[index]).show();
					});
					
					i++;
				});
				
				tabBtnBar.children(".activate").trigger("click");
			}
			
		}
	}
}
