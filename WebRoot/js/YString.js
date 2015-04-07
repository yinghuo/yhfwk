/*
	@title：String辅助类1.0
	
	@author Daniel.Yim
	@create 2014-04-18
	@version 1.0
	
	@modify Daniel 2014-08-01 1:js函数兼容浏览器调试
*/

if(typeof("".trim)!="function")
	String.prototype.trim=function(value)
	{
		if(typeof(value)!="undefined"&&typeof(value)=="String")
			return StringUtils.Trim(value);
		return value;
	}

function StringUtils(){}
StringUtils.IsBlank=function(value)
{
	return (value==null||typeof(value)=="undefined"||value.trim()=="");
}
StringUtils.Trim=function(value)
{
	return value.replace(/(^\s*)|(\s*$)/g,'');
}
StringUtils.StartWith=function(str,val)
{
 	if(!StringUtils.IsBlank(str)&&!StringUtils.IsBlank(val))
 	{
 		if(val.length>str.length)return false;
 		return str.indexOf(val)==0;
 	}
}