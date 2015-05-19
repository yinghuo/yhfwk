/**

	modify	2015-05-17	Daniel 	新增多选框模式
	modify	2015-05-17	Daniel	1：修复文本输入正确离开后进行校验和赋值
	modify	2015-05-18	Daniel	1：修复id定位高度滚动问题
*/
//为指定的元素初始化下拉框,tag为内容标记的名称
function YSelect(id,tagid,u,func,ischeck)
{
	var control=document.getElementById(id);
	var showId=id;
	var rect=control.getBoundingClientRect();
	var height=control.offsetHeight;
	var width=control.offsetWidth;
	//var scrolltop=0;
	//console.log("元素Left:"+rect.left);
	//console.log("元素Top:"+rect.top);
	//console.log("元素Height:"+height);
	//console.log("元素Width:"+width);
	
	var showControl=document.getElementById(tagid);
	var showState=false;
	//this.showState=showState;
	
	var url=u;	
	var call=func;
	var ischeckBox=ischeck;
	
	var dataControl;
	
	var controlIn=false;
	
	this.show=function(sid,values)
	{
		if(showControl!=null){
			if(sid)//更新位置
			{
				showId=sid;
				control=document.getElementById(sid);
				rect=control.getBoundingClientRect();
				height=control.offsetHeight;
				width=control.offsetWidth;
				var scrolltop=getScrollTop();
				showControl.style.left=rect.left+"px";
				showControl.style.top=(rect.top+height+scrolltop)+"px";
				showControl.style.width=width+"px";
			}
			
			//2015-05-17	如果是多选需要还原值
			if(ischeckBox)
			{
				//将文本框的值赋值到元素
				setCheckList(values);				
			}
			
			
			showControl.style.display="block";
			showState=true;
		}
	}
	
	function getScrollTop(){
		var scrollTop=0;
		if(document.documentElement&&document.documentElement.scrollTop)
	    {
	        scrollTop=document.documentElement.scrollTop;
	    }
	    else if(document.body)
	    {
	        scrollTop=document.body.scrollTop;
	    }
	    return scrollTop;
	}
	
	function hiden()
	{
		if(!controlIn)
		{
			if(showControl!=null){
				showControl.style.display="none";
				showState=false;
			}
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
						resetHeight(data.length);
					}
				},
				error:function(xmlHttpRequest, error){
					insertError();
				}
			});
		}
	};
	
	function resetHeight(length)
	{
		if(length==0)//无内容
		{
			//showControl.style.height="0px";
			//重置已选择值
			if(call)call(showId,"","");
			hiden();
		}
		else
		{
			var _height=length*25;
			if(_height<200)
				showControl.style.height=_height+"px";
		}
	}
	
	//2015-05-16	新增筛选操作，按照指定值，展示指定的内容
	//2015-05-17	新增返回值列表，筛序结果进行返回以待后续处理。
	function Screening(value)
	{
		//遍历所有的列表，展示前端匹配的值
		var childs=dataControl.childNodes;
		var scount=0;
		var returnList=new Array();
		for(var child in childs)
		{
			child=childs[child];
			//var value=child.getAttribute("value");
			var txt=child.innerHTML;			
			
			if(!StringUtils.IsBlank(txt))
			{
				var valueItem=child.getAttribute("value");
				
				if(txt.startsWith(value))
				{
					child.style.display="";
					var returnObj=new Array(2);
					returnObj[0]=valueItem;
					returnObj[1]=txt;
					returnList[scount]=returnObj;
					scount++;
				}else
					child.style.display="none";
			}
		}
		
		if(this.state)this.show();
		
		//统计显示个数，重订高度
		resetHeight(scount);
		
		return returnList;
	}
	
	
	//2015-05-17	新增多选框赋值
	function getCheckList()
	{
		var returnValue=new Array(2);
		returnValue[0]="";
		returnValue[1]="";
		var childs=dataControl.childNodes;
		for(var child in childs)
		{
			child=childs[child];
			var txt=child.innerHTML;
			
			if(StringUtils.IsBlank(txt))continue;
			
			//获取值，获取显示值
			var valueItem=child.getAttribute("value");
			var labelItem=child.getAttribute("text");
			var checked=child.getAttribute("checked");
			
			if(checked=="true")
			{
				var valueList=returnValue[0];
				if(valueList.length>1)
				{
					returnValue[0]+="、";
					returnValue[1]+="、";
				}
				returnValue[0]+=valueItem;
				returnValue[1]+=labelItem;
			}
		}
		return returnValue;
	}
	
	//2015-05-17	默认设置值
	function setCheckList(values)
	{
		if(values)
		{
			var valueList=values.split("、");
			
			var childs=dataControl.childNodes;
			for(var child in childs)
			{
				child=childs[child];
				var txt=child.innerHTML;
				
				if(StringUtils.IsBlank(txt))continue;
				
				var valueItem=child.getAttribute("value");
				var labelItem=child.getAttribute("text");
				var checked=child.getAttribute("checked");
				
				var meCheckbox=child.childNodes.item(0);
				//比较值是否相等
				for(var value in valueList)
				{
					value=valueList[value];
					if(value==labelItem)
					{
						meCheckbox.checked=true;
						child.setAttribute("checked",meCheckbox.checked);
						break;
					}
					else
					{
						meCheckbox.checked=false;
						child.setAttribute("checked",meCheckbox.checked);
					}
				}				
			}
		}
		else//重置所有勾选
		{	
			var childs=dataControl.childNodes;
			for(var child in childs)
			{
				child=childs[child];
				var txt=child.innerHTML;
				
				if(StringUtils.IsBlank(txt))continue;
				
				var valueItem=child.getAttribute("value");
				var labelItem=child.getAttribute("text");
				var checked=child.getAttribute("checked");
				
				var meCheckbox=child.childNodes.item(0);
				meCheckbox.checked=false;
				child.setAttribute("checked",meCheckbox.checked);
			}
		}
	}
	
	function insertData(id,name)
	{
		var li=document.createElement("li");
		li.style.height="25px";
		li.style.paddingLeft="6px";
		li.style.lineHeight="25px";
		li.style.cursor="pointer";
		//设置属性
		li.setAttribute("value",id);
		if(ischeckBox)
			li.setAttribute("text",name);
		
		li.onmouseover=function(e)
		{
			//event=event?event:window.event;
   			//var _target=event.srcElement?event.srcElement:event.target;
   			e=e||event;
   			var _target=e.srcElement?e.srcElement:e.target;
			_target.style.backgroundColor="#ccc";
		};
		li.onmouseout=function(e)
		{
			e=e||event;
   			var _target=e.srcElement?e.srcElement:e.target;
			_target.style.backgroundColor="";
		};
		li.onclick=function(e){
			e=e||event;
   			var _target=e.srcElement?e.srcElement:e.target;
			//
			var value=_target.getAttribute("value");
			
			if(!ischeckBox){//非单选框模式
				if(call)call(showId,value,_target.innerHTML);
				controlIn=false;
				hiden();
			}
			else
			{
				//勾选框
				//2015-05-17	Daneil	修复bug，判断点击的是li还是checkBox
				if(_target.tagName=="INPUT")
				{
					//_target=_target.parentNode;
					_target.parentNode.setAttribute("checked",_target.checked);
				}
				else
				{
					var meCheckbox=_target.childNodes.item(0);
					meCheckbox.checked=!meCheckbox.checked;
					_target.setAttribute("checked",meCheckbox.checked);
				}
				//勾选赋值，显示所有的值
				var checkedList=getCheckList();
				if(call)call(showId,checkedList[0],checkedList[1]);
				controlIn=false;				
			}				
		};
		
		if(ischeckBox)
		{
			//var cBox=document.createElement("input");
			//cBox.type="checkbox";
			//cBox.onclick=function(e)
			//{
			//	alert('');
			//};
			//li.appendChild(cBox,null);
			//li.appendChild(name,null);
			//li.innerHTML+=name;
			li.innerHTML="<input type='checkbox'>"+name;
						
		}else
			li.innerHTML=name;
			
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
	
	function addEvent(el,type,func)
	{
		el.addEventListener ? el.addEventListener(type, func, false) : el.attachEvent('on' + type, func);
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
		scrolltop=getScrollTop();
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
		
		tagdiv.onmouseover=function(e)
		{
			controlIn=true;
		};
		tagdiv.onmouseout=function(e)
		{
			controlIn=false;
		};
		
		tagdiv.onclick=function(e)
		{
			//元素单击，阻止事件传递
			e=e||event;
			if(e.stopPropagation)
				e.stopPropagation();
			else
				e.cancelBubble=true;
		}
		
		addEvent(document,"click",function(e){
			e=e||event;
   			var _target=e.srcElement?e.srcElement:e.target;
   			if(_target.id!=showId)hiden();
		});
		
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
		hiden : hiden,
		screening : Screening
	}
}