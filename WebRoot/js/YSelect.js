/**


*/
//为指定的元素初始化下拉框,tag为内容标记的名称
function YSelect(id,tagid,u,func)
{
	var control=document.getElementById(id);
	var showId=id;
	var rect=control.getBoundingClientRect();
	var height=control.offsetHeight;
	var width=control.offsetWidth;
	//console.log("元素Left:"+rect.left);
	//console.log("元素Top:"+rect.top);
	//console.log("元素Height:"+height);
	//console.log("元素Width:"+width);
	
	var showControl=document.getElementById(tagid);
	var showState=false;
	//this.showState=showState;
	
	var url=u;	
	var call=func;
	
	var dataControl;
	
	this.show=function(sid)
	{
		if(showControl!=null){
			if(sid)//更新位置
			{
				showId=sid;
				control=document.getElementById(sid);
				rect=control.getBoundingClientRect();
				height=control.offsetHeight;
				width=control.offsetWidth;
				
				showControl.style.left=rect.left+"px";
				showControl.style.top=(rect.top+height)+"px";
				showControl.style.width=width+"px";
			}
			showControl.style.display="block";
			showState=true;
		}
	}
	
	function hiden()
	{
		if(showControl!=null){
			showControl.style.display="none";
			showState=false;
		}
	}
	
	this.state=function(){
		return showState;
	}
	
	function loadData()
	{
		if(url)
		{
			$.ajax({
				url:url,
				type:"post",
				timeout:1200000,
				beforeSend:function(xhr){
					return true;
				},		 		
				success:function(data){
					if(data)
					{
						for(var i=0;i<data.length;i++)
						{
							var item=data[i];
							insertData(item.id,item.name);
						}
						
						//重设大小
						var _height=data.length*25;
						if(_height<200)
							showControl.style.height=_height+"px";
					}
				},
				error:function(xmlHttpRequest, error){
					insertError();
				}
			});
		}
	};
	
	function insertData(id,name)
	{
		var li=document.createElement("li");
		li.innerHTML=name;
		li.style.height="25px";
		li.style.paddingLeft="6px";
		li.style.lineHeight="25px";
		li.style.cursor="pointer";
		//设置属性
		li.setAttribute("value",id);
		
		li.onmouseover=function(e)
		{
			//event=event?event:window.event;
   			//var _target=event.srcElement?event.srcElement:event.target;
   			e=e||event;
   			var _target=e.srcElement?e.srcElement:e.target;
			_target.style.backgroundColor="#ccc";
		};
		li.onmouseout=function(event)
		{
			e=e||event;
   			var _target=e.srcElement?e.srcElement:e.target;
			_target.style.backgroundColor="";
		};
		li.onclick=function(event){
			e=e||event;
   			var _target=e.srcElement?e.srcElement:e.target;
			//
			var value=_target.getAttribute("value");
					
			if(call)call(showId,value,_target.innerHTML);
			hiden();					
		};
				
		dataControl.appendChild(li,null);
	}
	
	function insertError()
	{
		var li=document.createElement("li");
		li.innerHTML="初始化数据失败！";
		li.style.textAlign="center";
		li.style.height="25px";
		li.style.paddingLeft="6px";
		li.style.lineHeight="25px";
		
		dataControl.appendChild(li,null);
		showControl.style.height="60px";
	}
	
	/*var insertData=function()
	{
		if(dataControl!=null)
		{
			//插入测试数据
			for(var i=0;i<30;i++)
			{
				var li=document.createElement("li");
				li.innerHTML="张三";
				li.style.height="25px";
				li.style.paddingLeft="6px";
				li.style.lineHeight="25px";
				li.style.cursor="pointer";
				//设置属性
				li.setAttribute("value","Y0001");
				
				li.onmouseover=function(event)
				{
					var _target=event.target;
					_target.style.backgroundColor="#ccc";
				};
				li.onmouseout=function(event)
				{
					var _target=event.target;
					_target.style.backgroundColor="";
				};
				li.onclick=function(event){
					var _target=event.target;
					//
					var value=_target.getAttribute("value");
					
					if(call)call(value,_target.innerHTML);
					hiden();					
				};
				
				dataControl.appendChild(li,null);
			}
		}
	}*/
	
	
	
	var createTag=function(id)
	{
		var tagdiv=document.createElement("div");
		tagdiv.id=id;
		tagdiv.style.position="absolute";
		tagdiv.style.display="none";
		tagdiv.style.left=rect.left+"px";
		tagdiv.style.top=(rect.top+height)+"px";
		tagdiv.style.border="1px solid #c4c4c4";
		tagdiv.style.backgroundColor="#fff";
		tagdiv.style.width=width+"px";
		tagdiv.style.height="200px";
		tagdiv.style.overflowY="auto";
		
		//tagdiv.onmouseout=_self.hiden;
		
		//if(window.addEventListener)
		//	tagdiv.addEventListener("mouseout",this.hiden,false);
		//else
		//	tagdiv.attachEvent('mouseout',this.hiden); 
		
		//$(tagdiv).bind("mouseleave",this.hiden);
		
		document.body.appendChild(tagdiv,null);
		
		//初始化数据层
		dataControl=document.createElement("ul");
		dataControl.id=id+"Data";
		
		//this.dataControl.onmouseout=_self.hiden;
		
		tagdiv.appendChild(dataControl,null);
		
		return tagdiv;
	};
	
	//如果展示的目标为空，则进行创建
	if(showControl==null){
		showControl=createTag(tagid);
		loadData();
	}	
	
	//var state=function()
	//{
	//	return showState;
	//}
	
	return{
		state: this.state,
		url : url,
		show : this.show,
		hiden : hiden
	}
}