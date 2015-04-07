/*
	@title：iFrame页面公用函数 1.0
	主要为iFrame页面提供辅助功能函数
	
	@author Daniel
	@create 2014-05-13
	@version 1.0
*/
window.onload = function() {
	//处理map显示
	var showItem=document.getElementById("NavMap");
	if(showItem!=null)
		window.parent.endShow(showItem);
}