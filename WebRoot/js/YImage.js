/*
	图片预览组件
	Daniel 2015-04-30
	
	V1.1 2015-05-02 Daniel	1：新增默认图片展示函数.show()，提供三种重载调用。
							   show(path,name);//加载指定路径的指定名称的图片，会对name的参数做校验，如果name不为空，则进行path+name作为路径展示。
							   show(url);//加载指定路径的图片显示，不做任何的判断，直接显示图片。
							   show();//显示当前的图片框。
	
	V1.0 2015-04-30	Daniel	1：完成基本的图片预览逻辑	
*/

ImagePreview.allowExtention=".jpg,.bmp,.gif,.png";

function ImagePreview(fileId,imageId){
	
	this.fileId=fileId;
	this.imageId=imageId;
	this.fileJs;
	this.imageJs=document.getElementById(imageId);
	this.imageJs.style.display="none";
	this.clearBtn;
	this.selectPath="";
	this.extention="";
	
	var _self=this;
	
	this.show=function()
	{
		if(arguments.length!=0)
		{
			var url;
			if(arguments.length==2)//path name
			{
				/*if(StringUtils.StartWith(arguments[0].toLowerCase(),"http"))
				{
					url=arguments[0]+arguments[1];
				}
				else
				{
					url=location.protocol+location.hostname+arguments[0]+arguments[1]
				}*/
				if(arguments[1]){
					url=arguments[0]+arguments[1];
					this.imageJs.src=url;
					this.imageJs.style.display="block";
				}
			}
			else if(arguments.length==1)
			{
				url=arguments[0];
				this.imageJs.src=url;
				this.imageJs.style.display="block";
			}
		}
		else
			this.imageJs.style.display="block";
	}
	
	//绑定选择事件
	this.bind=function(){
		this.fileJs=document.getElementById(fileId);
		$("#"+fileId).on("change",function(e){
			_self.selectPath=_self.fileJs.value;
			_self.selectDone();
		});
	}
	
	this.showClear=function(state)
	{
		if(this.clearBtn==null){
			this.clearBtn=document.getElementById(imageId+"Clear");
			this.clearBtn=document.createElement("input");
			this.clearBtn.type="button";
			this.clearBtn.value="清除";
			this.clearBtn.className="ext_btn ext_btn_error";
			this.clearBtn.style.marginRight="5px";
			this.clearBtn.onclick=function(e)
			{
				_self.clear();
			}
			this.fileJs.parentNode.parentNode.insertBefore(this.clearBtn,this.fileJs.parentNode);
		}
		this.clearBtn.style.display=state?"":"none";
	}
	
	this.clear=function()
	{
		this.clearBtn.style.display="none";
		this.imageJs.style.display="none";
		var newPreview =document.getElementById(imageId+"Preview");
		if(newPreview!=null)newPreview.style.display="none";
		if (this.fileJs.outerHTML) {
        	this.fileJs.outerHTML = this.fileJs.outerHTML;
        	this.bind();
        }else{
        	this.fileJs.value="";
            this.selectPath="";
			this.extention="";
       	}
	}
	
	this.selectDone=function(){
		this.extention=this.selectPath.substring(this.selectPath.lastIndexOf(".")+1).toLowerCase();
		var browserVersion= window.navigator.userAgent.toUpperCase();
		if(ImagePreview.allowExtention.indexOf(this.extention)>-1){
			//是有效的预览文件,兼容浏览器进行预览
			if(this.fileJs.files){//HTML5\chrome\火狐7+
				if(window.FileReader){
		       		var reader = new FileReader(); 
		         	reader.onload = function(e){
		         		_self.imageJs.setAttribute("src",e.target.result);
		         		_self.imageJs.style.display="block";
		         		_self.showClear(true);
		     		}  
		     		reader.readAsDataURL(this.fileJs.files[0]);
		     	}else if(browserVersion.indexOf("SAFARI")>-1){
		        	alert("不支持Safari6.0以下浏览器的图片预览!");
		     	}
			}else if(browserVersion.indexOf("MSIE")>-1){
				if(browserVersion.indexOf("MSIE 6")>-1){//IE6
		        	this.imageJs.setAttribute("src",this.selectPath);
		        	this.imageJs.style.display="block";
		       	}else{
		       		 this.fileJs.select();
		       		 if(browserVersion.indexOf("MSIE 9")>-1)this.fileJs.blur();
		       		 var newPreview =document.getElementById(imageId+"Preview");
		       		 if(newPreview==null){
		             	newPreview =document.createElement("div");
		                newPreview.setAttribute("id",imageId+"Preview");
		                newPreview.style.width = this.imageJs.width+"px";
		                newPreview.style.height = this.imageJs.height+"px";
		                this.imageJs.parentNode.insertBefore(newPreview,this.imageJs);
		           	 }
		           	 newPreview.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + this.fileJs.value + "')"; 
		           	 newPreview.style.display="";
		           	 this.imageJs.style.display="none";
		           	 this.showClear(true);
		       	}
			}else if(browserVersion.indexOf("FIREFOX")>-1){//firefox
				var firefoxVersion= parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);
		       	if(firefoxVersion<7){//firefox7以下版本
		       		this.imageJs.setAttribute("src",this.fileJs.files[0].getAsDataURL());
		    	}else{//firefox7.0+                    
		       		this.imageJs.setAttribute("src",window.URL.createObjectURL(this.fileJs.files[0]));
		    	}
		    	this.imageJs.style.display="block";
		    	this.showClear(true);
			}else{
		    	document.getElementById(imgPreviewId).setAttribute("src",this.fileJs.value);
		    	this.imageJs.style.display="block";
		    	this.showClear(true);
		    } 
		}
	}
	
	this.bind();
}