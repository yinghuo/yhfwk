/**
	
*/

function YLoading(txt)
{
	var loadingId="yloading_id";
	var loadingTextId="yloading_text_id";
	
	
	
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
			
			document.body.appendChild(showDiv);
		}
	}
	
}