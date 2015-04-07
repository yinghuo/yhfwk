$(document).ready(function(){
	//获取品类跟

	readyGetcategory();
	//获取一级品类
	$("#rootprocateid").change(function(){
		$("#oneprocateid").find("option").remove();
		$("#twoprocateid").find("option").remove();
			var pid=$("#rootprocateid").val();
			$.ajax({
				url:urldomain+"/feedback/category!findCategoryByPid.action",
				type:"post",
				data:"categoryPid="+pid,
				timeout:1200000,
				async:false,
				beforeSend:function(xhr){
					return true;
		 		},		 		
		 		success:function(data){
		 			
		 			$("#oneprocateid").append("<option value=''>请选一级品类</option>");
			 		for(var i=0;i<data.length;i++){
			 				$("#oneprocateid").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
			 		}
		 			
		 		},
		 		error:function(xmlHttpRequest, error){
					
				}
		}); 
	});
	//获取二级品类
	$("#oneprocateid").change(function(){
		$("#twoprocateid").find("option").remove();
			var pid=$("#oneprocateid").val();
			$.ajax({
				url:urldomain+"/feedback/category!findCategoryByPid.action",
				type:"post",
				data:"categoryPid="+pid,
				timeout:1200000,
				async:false,
				beforeSend:function(xhr){
					return true;
		 		},		 		
		 		success:function(data){
		 			
		 			$("#twoprocateid").append("<option value=''>请选二级品类</option>");
			 		for(var i=0;i<data.length;i++){
			 				$("#twoprocateid").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
			 		}
		 			
		 		},
		 		error:function(xmlHttpRequest, error){
					
				}
		}); 
	});
});
function readyGetcategory(){
	$("#rootprocateid").find("option").remove();
	$("#oneprocateid").find("option").remove();
	$("#twoprocateid").find("option").remove();
	$.ajax({
		url:urldomain+"/feedback/category!findCategoryRoot.action",
		type:"post",
		timeout:1200000,
		async:false,
		beforeSend:function(xhr){
			return true;
 		},		 		
 		success:function(data){
 			
 			$("#rootprocateid").append("<option value=''>请选择品类根</option>");
	 		for(var i=0;i<data.length;i++){
	 				$("#rootprocateid").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
	 		}
 			
 		},
 		error:function(xmlHttpRequest, error){
			
		}
}); 
	$.ajax({
		url:urldomain+"/feedback/category!findCategoryByPid.action",
		type:"post",
		data:"level=1",
		timeout:1200000,
		async:false,
		beforeSend:function(xhr){
			return true;
 		},		 		
 		success:function(data){
 			
 			$("#oneprocateid").append("<option value=''>请选一级品类</option>");
	 		for(var i=0;i<data.length;i++){
	 				$("#oneprocateid").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
	 		}
 			
 		},
 		error:function(xmlHttpRequest, error){
			
		}
}); 
	$.ajax({
		url:urldomain+"/feedback/category!findCategoryByPid.action",
		type:"post",
		data:"level=2",
		timeout:1200000,
		async:false,
		beforeSend:function(xhr){
			return true;
 		},		 		
 		success:function(data){
 			
 			$("#twoprocateid").append("<option value=''>请选二级品类</option>");
	 		for(var i=0;i<data.length;i++){
	 				$("#twoprocateid").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
	 		}
 			
 			
 		},
 		error:function(xmlHttpRequest, error){
			
		}
}); 
}
function updateGetcategory(){
	var rootprocateid=$("#rootprocateid").val();
	var oneprocateid=$("#oneprocateid").val();
	var twoprocateid=$("#twoprocateid").val();
	$("#oneprocateid").find("option").remove();
	$("#twoprocateid").find("option").remove();
		$.ajax({
			url:urldomain+"/feedback/category!findCategoryByPid.action",
			type:"post",
			data:"categoryPid="+rootprocateid,
			timeout:1200000,
			async:false,
			beforeSend:function(xhr){
				return true;
	 		},		 		
	 		success:function(data){
	 			
	 			$("#oneprocateid").append("<option value=''>请选一级品类</option>");
		 		for(var i=0;i<data.length;i++){
		 				$("#oneprocateid").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
		 		}
		 		 $("#oneprocateid option[value='"+oneprocateid+"']").selected();
	 		},
	 		error:function(xmlHttpRequest, error){
				
			}
	}); 
		$.ajax({
			url:urldomain+"/feedback/category!findCategoryByPid.action",
			type:"post",
			data:"categoryPid="+oneprocateid,
			timeout:1200000,
			async:false,
			beforeSend:function(xhr){
				return true;
	 		},		 		
	 		success:function(data){
	 			
	 			$("#twoprocateid").append("<option value=''>请选二级品类</option>");
		 		for(var i=0;i<data.length;i++){
		 				$("#twoprocateid").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
		 		}
		 		 $("#twoprocateid option[value='"+twoprocateid+"']").selected();
		 		
	 		},
	 		error:function(xmlHttpRequest, error){
				
			}
	}); 
}