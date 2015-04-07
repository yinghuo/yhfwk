$(document).ready(function(){

			var regbrandid=$("#regbrandid").val();
				$.ajax({
						url:urldomain+"/regbrand/regbrand!queryRegbrand.action",
						type:"post",
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		$("#regbrandid").append("<option value=''>请选区域品牌</option>");
				 		$("#addregbrandid").append("<option value=''>请选区域品牌</option>");
				 		for(var i=0;i<data.length;i++){
				 				$("#regbrandid").append("<option value='"+data[i].RB_ID+"'>"+data[i].RB_NAME+"</option>");
				 				$("#addregbrandid").append("<option value='"+data[i].RB_ID+"'>"+data[i].RB_NAME+"</option>");
				 		}
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				}); 
				$.ajax({
						url:urldomain+"/regbrand/brand!queryBrand.action",
						type:"post",
						data:"regbrandid="+regbrandid,
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		$("#brandid").append("<option value=''>请选品牌</option>");
				 		$("#addbrandid").append("<option value=''>请选品牌</option>");
				 		for(var i=0;i<data.length;i++){
				 				$("#brandid").append("<option value='"+data[i].BR_ID+"'>"+data[i].BR_NAME+"</option>");
				 				$("#addbrandid").append("<option value='"+data[i].BR_ID+"'>"+data[i].BR_NAME+"</option>");
				 		}
				 		
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				}); 
				//根据区域品牌改变查询品牌信息
				$("#regbrandid").change(function(){
					$("#brandid").find("option").remove();
					var regbrandid=$("#regbrandid").val();
					$.ajax({
						url:urldomain+"/regbrand/brand!queryBrand.action",
						type:"post",
						data:"regbrandid="+regbrandid,
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		$("#brandid").append("<option value=''>请选品牌</option>");
				 		$("#addbrandid").append("<option value=''>请选品牌</option>");
				 		for(var i=0;i<data.length;i++){
				 				$("#brandid").append("<option value='"+data[i].BR_ID+"'>"+data[i].BR_NAME+"</option>");
				 			
				 		}
				 		
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				}); 
				});
				//根据区域品牌改变查询品牌信息
				$("#addregbrandid").change(function(){
					$("#addbrandid").find("option").remove();
					var regbrandid=$("#addregbrandid").val();
					$.ajax({
						url:urldomain+"/regbrand/brand!queryBrand.action",
						type:"post",
						data:"regbrandid="+regbrandid,
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		$("#brandid").append("<option value=''>请选品牌</option>");
				 		$("#addbrandid").append("<option value=''>请选品牌</option>");
				 		for(var i=0;i<data.length;i++){
				 				$("#addbrandid").append("<option value='"+data[i].BR_ID+"'>"+data[i].BR_NAME+"</option>");
				 		}
				 		
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				}); 
				});
		});