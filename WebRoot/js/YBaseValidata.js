function IsNull(id,length)
{
	var str = document.getElementById(id).value;
	return str==null||str==""||str.trim().length==0||str.trim().length<length;
}

function IsEqual(ida,idb)
{
	var va=document.getElementById(ida).value;
	var vb=document.getElementById(idb).value;
	return va==vb;
}

function IsDate(id){     
     var str = document.getElementById(id).value.trim();    
     if(str.length!=0){    
         var reg = /^(\d{1,4})-(\d{1,2})-(\d{1,2})$/;     //(-|\/)
         var r = str.match(reg);     
         if(r==null)  
             return false;
         return true;
     }
 }    

function String2Date(datestr,sp)
{
	var darr=datestr.split(sp);
	if(darr[0].length!=4)
		return "";
	if(darr[1].length<2)
		darr[1]="0"+darr[1];
	 if(darr[2].length<2)
		darr[2]="0"+darr[2];
	var resultdate=new Date(darr[0]+sp+darr[1]+sp+darr[2]);
	if(resultdate!="Invalid Date")
		return resultdate
	else
		return "";
}

function IsObject(value)
{
	return typeof value == "object";
}
