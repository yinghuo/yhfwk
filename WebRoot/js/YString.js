/*
	@title：String辅助类1.0
	
	@author Daniel.Yim
	@create 2014-04-18
	@version 1.0
	
	@modify Daniel 2014-08-01 1:js函数兼容浏览器调试
*/

if(typeof("".trim)!="function")
	String.prototype.trim=function()
	{
		//if(typeof(this)!="undefined"&&typeof(this)=="String")
			return this.replace(/(^\s*)|(\s*$)/g,'');
		//return this;
	}

if(typeof("".startsWith)!="function")
	String.prototype.startsWith=function(str)
	{
		return StringUtils.StartWith(this,str);
	}

function StringUtils(){}
StringUtils.IsBlank=function(value)
{
	return (value==null||typeof(value)=="undefined"||value.trim()=="");
}

StringUtils.StartWith=function(str,val)
{
 	if(!StringUtils.IsBlank(str)&&!StringUtils.IsBlank(val))
 	{
 		if(val.length>str.length)return false;
 		return str.indexOf(val)==0;
 	}
}