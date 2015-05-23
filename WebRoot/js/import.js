/*
	数据导入js
*/

var importExcelExtention=".xls,.xlsx";

$(function(){
	
	//为文件选择框增加移入事件
	$(".fileInput").on("mouseover",function(){
		var t=$(this);
		var parent=t.parent();
		$(parent).find("input:first").css({"color":"#fff","background":"url('"+urldomain+"/images/btn_export_hover.gif') 0px 0px no-repeat"});
	});
	$(".fileInput").on("mouseleave",function(){
		var t=$(this);
		var parent=t.parent();
		$(parent).find("input:first").css({"color":"","background":"url('"+urldomain+"/images/btn_export.gif') 0px 0px no-repeat"});
	});
	
	$(".fileInput").on("change",function(){
		//获取选择的文件
		var filePath=$(this).val();
		if(filePath)
		{
			//后缀检验
			var _meExtention=filePath.substring(filePath.lastIndexOf(".")+1).toLowerCase();
			if(importExcelExtention.indexOf(_meExtention)>-1)
			{
				if(ymask==null)ymask=new YMask();
				ymask.show("请稍等，数据正在上传解析中，上传进度：0%");				
				//绑定离开事件
				$(window).bind('beforeunload', function () {
			        return "当前数据文件正在导入，离开会导致数据异常，确定离开吗？";
			    });
							
				//文件上传
				var t=$(this);
				var parent=t.parent();
				
				$(parent).ajaxSubmit({
					dataType:'json',
					beforeSend: function() {
						
					},
					uploadProgress: function(event, position, total, percentComplete) {
						if(percentComplete>100)percentComplete=100;
						ymask.showtxt("请稍等，数据正在上传解析中，上传进度："+percentComplete+"%");
						if(percentComplete==100)
							ymask.showtxt("数据文件上传完成，请等待解析处理....");
					},
					success: function(data) {
						//上传成功
						selectFileDone(data);
					},
					error:function(xhr){
						ymask.close();
						unbindload();
						alert("数据上传网络异常，请报告管理员!");
					}
				});
				
			}
			else
			{				
				alert("文件格式无法识别，请选择正确的数据文件！");
			}
		}
	});
	
});

function selectFileDone(data)
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
		//文件上传完成，等待解析
		ymask.showtxt("数据文档解析完成，共识别"+data.msg+"条数据！");
			
		//提示是否继续
		ymask.showbtn(
			"预览数据",
			function(){
				unbindload();
				ymask.showtxt("浏览导入数据细项，正在跳转....");
				window.location.href=urldomain+"/admin/pages/data/import.jsp";
			},
			"直接导入",
			function(){
				importData();
			}
		);
	}
	else
	{
		ymask.close();
		alert(data.msg);
		unbindload();
	}	
}

function importData()
{
	
	if(!confirm('确认导入数据吗？')){
		return false;
	}

	$.ajax({
		url:urldomain+"/master/data/import!importData.action",
		type:"get",
		beforeSend:function(xhr){
			if(ymask==null)ymask=new YMask();
			ymask.show("请稍等，数据正在导入中....");	
		},
		success:function(data){
			ymask.close();
			unbindload();
			jsonResult(data,function(data){
			 	if(data["error"]==0)
			   		window.location.href=urldomain+data["url"];
			});
		},
		error:function(xmlHttpRequest, error){
			ymask.close();
		}
	});	
}
