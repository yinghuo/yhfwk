/*
	@title：省级区域编码3.5.1
	合并不同级的控件管理，将2.0中的节点链式有用户自行绑定维护操作封装到组件，由组件来完成统一的控件管理和值传递。
	
	@author Daniel.Yim
	@create 2014-03-14
	@version 3.1
	
	@modify 3.1		2014-05-06 by Daniel	1：YDistrictItem添加属性isloadnull=false，属性作为描述子级在父级选择默认时是否执行加载动作。
	@modify 3.5 	2014-07-15 by Daniel	1：添加控件初始化功能，添加子项类型type{1:省,2:市,3:县}，指定子项类型，完成属性自动加载
	@modify 3.5.1 	2014-07-18 by Daniel	1：扩展控件属性，完成控件扩展功能。2：优化控件代码，完成代码初始化方法，可以更方便的使用控件
	
	//3.0测试
    	var district=new YDistrict();
          	//district.autohide=false;
          	var item1=new YDistrictItem("sheng");
          	item1.url="${pageContext.request.contextPath}/other/district!getAllProvince.action";
          	var seleurl="${pageContext.request.contextPath}/other/district!getCityByProvinceId.action";
          	var item2=new YDistrictItem("shi");
          	item2.url=seleurl;
          	var item3=new YDistrictItem("xian");
          	item3.url=seleurl;
          	
          	district.bind(item1);
          	district.bind(item2);
          	district.bind(item3);
          	
          	district.init();
	//3.5实例
	与3.0使用相同，主要在加载指定地区的时候使用
	A:更改声明方式，向下兼容。3.0的声明方式也可以用，只是3.0的声明方式不支持加载指定地区，推荐使用3.5版本的声明方式
	var item1=new YDistrictItem("sheng",1);//指定类型
	var item2=new YDistrictItem("shi",2);//指定类型
	var item3=new YDistrictItem("xian",3);//指定类型
	B:初始化的改变，向下兼容。
	district.init();//3.0和3.5都可以使用，默认加载列表的第一项。
	district.init("value");//3.5使用方式，指定一个地区行政区域编码，完成自动加载定位。注意：自动定位仅限于类似行政区域这种有规律的编码
	
	//3.5.1
	向下兼容以前代码，新的控件使用方式，默认参数设置只支持数据的3级联动，如果需要大于3级的操作，请使用3.5版本声明使用
	var district=new YDistrict({
		"autohide":false,//
		"YDistrict.SHENG":{"id":"sheng"},
		"YDistrict.SHI":{"id":"shi"},
		"YDistrict.XIAN":{"id":"xian"},
		"init":true,
		"initvalue":"140212"
	});
*/

//3.5.1 公共属性定义

//全局数据加载URL定义
YDistrict.LoadAllUrl=urldomain+"/other/district!getAllProvince.action";//加载全部的url，默认应用在YDistrict控件的第一个子项上，表示级联的第一个选择位置
YDistrict.LoadNextUrl=urldomain+"/other/district!getCityByProvinceId.action";//加载下一项数据，默认应用在YDistrict控件除第一项以外的子项上。

YDistrict.SHENG=1;
YDistrict.SHI=2;
YDistrict.XIAN=3;

var ydistrictnum=0;
function YDistrict(options)
{	
	//属性声明
	this.id=ydistrictnum;
	ydistrictnum=ydistrictnum+1;
	
	this.value;//组件的结果值	
	this.autohide=true;//是否自动隐藏子集元素，默认为隐藏
	this.Items=new Array();//绑定控件合集
	
	this.inited=false;//添加是否初始化属性，放置多次初始化操作
	
	//获取可供查询的值
	this.getSelectValue=function()
	{
		if(!StringUtils.IsBlank(this.value)&&this.value.length==6)
		{
			var _v1=this.value.substring(0,2);
			var _v2=this.value.substring(2,4);
			var _v3=this.value.substring(4,6);
			
			if(_v2=="00"&&_v3=="00")
			{
				return _v1;
			}
			else if(_v3=="00")
			{
				return _v1+_v2;
			}
		}
		return this.value;
	}
	
	//设置默认选择值，判断默认的是省、市、县
	/*this.setSelectedValue=function(value)
	{
		if(value&&value.length==6)
		{
			console.log("设置默认选择:"+value);
			
		}
	}*/
	
	this.bind=function(item)
	{
		var _me=this;
		if(item instanceof YDistrictItem)//类型过滤
		{
			//存储
			item.index=this.Items.length;
			this.Items[item.index]=item;
			//设置默认属性
			if(this.Items.length>1)
			{
				if(this.autohide)
					item.setVisible(false);
				else
				{
					item.setVisible(true);
					this.value=item.getValue();
				}
			}
			else
			{
				this.value=item.getValue();
			}
			//事件绑定
			item.jqcontrol.bind("change",function(){
				_me.onItemSelectedChange(item.index,item);
			});			
			return true;			
		}
		return false;
	}
	//主体加载数据
	this.init=function()
	{
		if(!this.inited)
		{
			if(arguments.length==0)
				this.initDefault();
			else
				this.initValue(arguments[0]);
			
			this.inited=true;
		}
	}
	
	//默认初始化加载
	this.initDefault=function()
	{
		if(this.Items.length>0)
		{
			this.Items[0].load(null);
		}
	}
	
	//Daniel新增初始化方法，添加数值参数，由于初始化的值不知道是省市县的哪级，所以需要判断，判断后如何跟Item进行判断呢？
	this.initValue=function(value)
	{
		if(value&&value.length==6)//仅限省市县级联使用，其他方式初始化正在设计中
		{
			var _v1=value.substring(0,2);
			var _v2=value.substring(2,4);
			var _v3=value.substring(4,6);
			//获取类型后在序列中查找指定的子项
			for(var i=0;i<this.Items.length;i++)
			{
				var item=this.Items[i];
				if(item.type==YDistrict.SHENG)
					item.selectedValue=_v1+"0000";
				else if(item.type==YDistrict.SHI)
					item.selectedValue=_v1+_v2+"00";
				else if(item.type==YDistrict.XIAN)
					item.selectedValue=_v1+_v2+_v3;
			}
			if(this.Items.length>0)
			{
				this.Items[0].load(null);
			}
		}
	}
	
	this.onItemSelectedChange=function(num,item)
	{
		if(item.IsDefVal())
		{
			//传递隐藏子级，重置value
			if(num>1)
				this.value=this.Items[num-1].getValue();
			else
				this.value=this.Items[0].getValue();
			for(var i=num+1;i<this.Items.length;i+=1)
			{
				var _nextitem=this.Items[i];
				if(this.autohide)_nextitem.setVisible(false);
				_nextitem.loadData("");
				_nextitem.clear();
			}
		}
		else//不是默认值，则显示子级
		{				
			if(this.hasNext(num))
			{
				var _nextitem=this.Items[num+1];
				if(this.autohide)_nextitem.setVisible(true);
				_nextitem.load(item);
			}
			this.value=item.getValue();
			//隐藏重置其他
			for(var i=num+2;i<this.Items.length;i+=1)
			{
				var _nextitem=this.Items[i];
				if(this.autohide)_nextitem.setVisible(false);
				_nextitem.loadData("");
			}
		}	
	}
	
	this.hasNext=function(index)
	{
		return index<this.Items.length-1;
	}
	
	//初始化子项控件
	this.autoBindItem=function(id,url,type){
		var item=new YDistrictItem(id,type);
		item.url=url;		
		this.bind(item);
	}
	
	if(arguments.length!=0)
	{
		var autoinit=false;
		var aindex=0;
		var initvalue=null;
		for(var item in arguments[0])
		{
			var opvalues=arguments[0][item];
			if(item=="YDistrict.SHENG"||item=="YDistrict.SHI"||item=="YDistrict.XIAN")
			{
				var value=eval(item);
				this.autoBindItem(opvalues["id"],(opvalues["url"]&&opvalues["url"]!=null)?opvalues["url"]:(aindex==0?YDistrict.LoadAllUrl:YDistrict.LoadNextUrl),value);
				aindex++;
			}
			else//属性设置
			{
				if(item=="init")
					autoinit=arguments[0][item];
				else if(item=="initvalue")
					initvalue=arguments[0][item];
				else
					eval("this."+item+"="+arguments[0][item]+";");
			}
		}
		if(autoinit&&initvalue)
			this.init(initvalue);
		else if(autoinit)
			this.init();
	}
	
}

//数据项
function YDistrictItem(id,t)
{	
	//属性声明
	this.defoption=null;
	this.jscontrol=null;
	this.jqcontrol=null;
	this.url="";
	this.regparam="";
	this.index;
	this.type=t;//先放置字段进行类型判断 1为省 2为市 3为县
	this.selectedValue=null;//先放置字段存储默认值，加载完后自动选择默认值
	
	this.isloadnull=false;
	
	this.init=function(id)
	{
		if(!StringUtils.IsBlank(id))
		{
			this.id=id;//数据控件的id
			this.jscontrol=document.getElementById(id);
			this.jqcontrol=$("#"+id);
			if(this.jscontrol.options.length>0)
			{
				this.defoption=this.jscontrol.options[0];
			}
		}
	}
	
	this.setVisible=function(visible)
	{		
		if(this.jscontrol!=null)
		{
			this.jscontrol.style.display=visible?"":"none";			
		}
	}
	
	this.getVisible=function()
	{
		if(this.jscontrol!=null)
		{
			return this.jscontrol.style.display!="none";
		}
	}
	
	this.clear=function()
	{
		this.jscontrol.options.length = 0;
		if(this.defoption!=null)
			this.jscontrol.options.add(this.defoption);
			
		if(this.isloadnull)
			this.load();
	}
	
	this.loadData=function(data)
	{
		this.jscontrol.options.length = 0;
		if(this.defoption!=null)
			this.jscontrol.options.add(this.defoption);
		//加载数据应该清空下级数据
		for(var i=0;i<data.length;i+=1)
		{
			var items=data[i];
			//this.jqcontrol.append("<option value='"+items[0]+"'>"+items[1]+"</option>");//this.bindobj
			var optionItem=new Option(items[1],items[0]);
			if(this.selectedValue&&this.selectedValue==items[0])optionItem.selected=true;
			this.jscontrol.options.add(optionItem);
			
		}
		//触发事件
		if(this.getVisible()&&data!=null&&data.length>0)//!StringUtils.IsBlank(data)
			this.jqcontrol.change();
		
	}
	
	this.load=function(item)
	{
		var _me=this;
		if(!StringUtils.IsBlank(this.url))
		{
			var data='';
			if(!StringUtils.IsBlank(this.regparam))
			{
				data='regparam='+this.regparam;
			}
			if(item!=null)//存在上级
			{
				data=data+(StringUtils.IsBlank(data)?"":"&")+"code="+item.getValue();				
			}
			//alert("查询参数为："+data);
			$.ajax({
				url:_me.url,
				type:"post",
				data:data,
				timeout:1200000,
				beforeSend:function(xhr){
					return true;
				},		 		
				success:function(data){
					_me.loadData(data);
				},
				error:function(xmlHttpRequest, error){
					alert("加载失败");
				}
			});
		}
	}
	
	this.getValue=function()
	{
		if(this.jscontrol!=null)
		{
			return this.jscontrol.value;
		}
		return "undefined"
	}
	
	this.IsDefVal=function()
	{
		if(this.defoption!=null)//存在默认值
		{
			return this.jscontrol.value==this.defoption.value;
		}
		return false;
	}
		
	this.init(id);//初始化属性
}

function StringUtils(){}
StringUtils.IsBlank=function(value)
{
	return (typeof(value)=="undefined"||value.trim()=="");
}