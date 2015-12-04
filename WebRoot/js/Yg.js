
function loadDef(ids)
{
	$.ajax({
		url:urldomain+"/master/yggl/ygxx!loadDefaultUser.action",
		type:"get",
		timeout:1200000,
		success:function(data){
			if(data)
			{
				if(data["error"]==0)
				{
					var name=data["name"];
					var id=data["id"];
					
					if(ids.length>0)
					{
						//判断是否存在子级
						if(ids[0] instanceof Array)
						{
							//遍历处理
							for(var i=0;i<ids.length;i++)
							{
								var arr=ids[i];
								
								$("#"+arr[0]).val(id);
								$("#"+arr[1]).val(name);
							}
						}
						else if(typeof ids[0] == "string")
						{
							$("#"+ids[0]).val(id);
							$("#"+ids[1]).val(name);
						}							
					}
				}
			}
		}
	});
}