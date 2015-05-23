/**
	
*/
var ymask;

function YMask(element)
{
	var showElement;
	if(element)showElement=element;
	
	var canLeave=true;//是否可以离开
	
	var showDiv;
	var showDivId="ymask_id";
	
	var showLoadingDiv;
	var showLoadingDivId="yloading_id";
	var showLoadingTextDiv;
	var showLoadingTextId="yloading_txt_id";
	var showLoadingImg;
	var showLoadingImgId="yloading_img_id";
	
	var btnDiv;
	var btnDivId="yloading_btns";
	var btnLeft;
	var btnLeftCall;
	var btnRight;
	var btnRightCall;
	
	function createLoading()
	{
		showLoadingDiv=document.getElementById(showLoadingDivId);
		if(showLoadingDiv==null)
		{
			showLoadingDiv=document.createElement("div");
			showLoadingDiv.id=showLoadingDivId;
			showLoadingDiv.style.background="#fff";
			showLoadingDiv.style.width="400px";
			showLoadingDiv.style.height="100px";
			showLoadingDiv.style.lineHeight="100px";
			showLoadingDiv.style.position="absolute";
			showLoadingDiv.style.top="50%";
			showLoadingDiv.style.left="50%";
			showLoadingDiv.style.marginLeft="-200px";
			showLoadingDiv.style.marginTop="-50px";
			showLoadingDiv.style.zIndex="1990001";
			showLoadingDiv.style.display="none";
			
			//Image
			showLoadingImg=document.createElement("img");
			showLoadingImg.id=showLoadingImgId;
			showLoadingImg.src=urldomain+"/images/loading.gif";
			showLoadingImg.style.width="40px";
			showLoadingImg.style.height="40px";
			showLoadingImg.style.marginLeft="30px";
			showLoadingDiv.appendChild(showLoadingImg);
			
			showLoadingTextDiv=document.createElement("span");
			showLoadingTextDiv.id=showLoadingTextId
			showLoadingTextDiv.style.marginLeft="30px";
			showLoadingTextDiv.innerHTML="";
			
			showLoadingDiv.appendChild(showLoadingTextDiv);
			
			//btns
			
			
			document.body.appendChild(showLoadingDiv);
		}
	}
	
	function createMask()
	{
		showDiv=document.getElementById(showDivId);
		if(showDiv==null)
		{
			showDiv=document.createElement("div");
			showDiv.id=showDivId;
			showDiv.style.background="#000";
			showDiv.style.width="100%";
			showDiv.style.height="100%";
			showDiv.style.position="absolute";
			showDiv.style.top="0";
			showDiv.style.left="0";
			showDiv.style.zIndex="1990000";
			showDiv.style.opacity="0.7";
			showDiv.style.filter="Alpha(opacity=70)";
			showDiv.style.display="none";
			
			document.body.appendChild(showDiv);
		}
	}
	
	function showBtns(lct,lc,lrt,lr)
	{
		btnDiv==document.getElementById(btnDivId);
		btnLeftCall=lc;
		btnRightCall=lr;
		if(btnDiv==null)
		{
			btnDiv=document.createElement("div");
			btnDiv.id=btnDivId;
			btnDiv.style.background="#fff";
			btnDiv.style.width="400px";
			btnDiv.style.height="40px";
			btnDiv.style.lineHeight="40px";
			btnDiv.style.position="absolute";
			btnDiv.style.top="50%";
			btnDiv.style.left="50%";
			btnDiv.style.marginLeft="-200px";
			btnDiv.style.marginTop="50px";
			btnDiv.style.zIndex="1990001";
			btnDiv.style.borderTop="#ccc 1px solid";
			btnDiv.style.display="none";
			
			//添加Btns
			btnLeft=document.createElement("div");
			btnLeft.style.width="100px";
			btnLeft.style.height="30px";
			btnLeft.style.lineHeight="30px";
			btnLeft.style.marginTop="5px";
			btnLeft.style.float="left";
			btnLeft.style.marginLeft="30px";
			btnLeft.style.textAlign="center";
			btnLeft.setAttribute("class","ext_btn_submit cr-p");
			
			btnRight=document.createElement("div");
			btnRight.style.width="100px";
			btnRight.style.height="30px";
			btnRight.style.lineHeight="30px";
			btnRight.style.marginTop="5px";
			btnRight.style.float="right";
			btnRight.style.marginRight="30px";
			btnRight.style.textAlign="center";
			btnRight.setAttribute("class","ext_btn_success cr-p");
			
			btnDiv.appendChild(btnLeft);
			btnDiv.appendChild(btnRight);
			
			document.body.appendChild(btnDiv);
		}
		btnLeft.innerHTML=lct;
		btnLeft.onclick=lc;
		btnRight.innerHTML=lrt;
		btnRight.onclick=lr;
		btnDiv.style.display="";		
	}
	
	createMask();
	createLoading();
	
	function show(text)
	{
		showDiv.style.display="";
		showLoadingDiv.style.display="";
		
		if(text)
			showLoadingTextDiv.innerHTML=text;		
	}
	
	function showTxt(text)
	{
		showLoadingTextDiv.innerHTML=text;
	}
	
	function close()
	{
		showDiv.style.display="none";
		showLoadingDiv.style.display="none";
		if(btnDiv)
			btnDiv.style.display="none";
	}
	
	return{
		show:show,
		showtxt:showTxt,
		showbtn:showBtns,
		close:close
	}
}