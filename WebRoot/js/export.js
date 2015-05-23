/*
	数据导出js
*/


function dataExport(e)
{
	//
	e=e||event;
    var _target=e.srcElement?e.srcElement:e.target;
    
    var fileType=_target.getAttribute("data");
    
    if(ymask==null)ymask=new YMask();
	ymask.show("请稍等，导出数据正在读取中....");			
    
    //绑定离开事件
	$(window).bind('beforeunload', function () {
		return "当前数据文件正在导出，确定离开放弃数据导出吗？";
	});
    
    //导出指定的数据
    $.ajax({
    	url:urldomain+"/master/data/export.action",
		type:"post",
		data:"fileType="+fileType,
		success:function(data){
			//读取文件成功			
			readFileDone(data);
		},
		error:function(xmlHttpRequest, error){
			ymask.close();
		}
		
    });
}

function readFileDone(data)
{
	if(!IsObject(data))
	{
		try{
			data=JSON.parse(data);
		}catch(e)
		{
			ymask.close();
			alert("无法解析返回信息！");
			return;
		}
	}
	
	if(data.error==0)
	{
		//数据读取完成
		ymask.showtxt("共读取到"+data.msg+"条数据，正在创建导出文件....");
		downloadFile();		
	}
	else
	{
		ymask.close();
		alert(data.msg);
		unbindload();
	}	
}

function downloadFile()
{
	 $.ajax({
    	url:urldomain+"/master/data/export!exportData.action",
		type:"get",
		success:function(data){
			unbindload();
			jsonResult(data,function(data){
			 	if(data["error"]==0)
			 		unbindload();
					ymask.close();
			   		window.location.href=urldomain+"/master/data/export!download.action";
			});
		},
		error:function(xmlHttpRequest, error){
			unbindload();
			ymask.close();
		}
    });
}
