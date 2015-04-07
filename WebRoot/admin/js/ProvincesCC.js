$(document).ready(function(){
	
	
					$.ajax({
					url:urldomain+"/admin/regbrand!queryDistrict.action",
					type:"post",
					data:'',
					timeout:1200000,
					beforeSend:function(xhr){
						return true;
			 		},		 		
			 		success:function(data){
			 			
			 			
			 	for(var i=0;i<data.length;i++){
			 			if(i==0){
			 			$("#province").append("<option value=''>省</option>");
			 			}
			 		$("#province").append("<option value='"+data[i].code+"'>"+data[i].name+"</option>");
			 		}
			 			
			 		},
			 		error:function(xmlHttpRequest, error){
						
					}
			}); 
			$("#province").change(function(){
			$("#city").find("option").remove();
			$("#county").find("option").remove();
			$("#city").append("<option value='' >市</option>");
			$("#county").append("<option value=''>县</option>");
				var pcode=$("#province").val();
					$.ajax({
					url:urldomain+"/admin/regbrand!queryCityDistrict.action",
					type:"post",
					data:'pcode='+pcode,
					timeout:1200000,
					beforeSend:function(xhr){
						return true;
			 		},		 		
			 		success:function(data){
			 		for(var i=0;i<data.length;i++){
			 		$("#city").append("<option value='"+data[i].code+"'>"+data[i].name+"</option>");
			 		}
			 			
			 		},
			 		error:function(xmlHttpRequest, error){
						
					}
			}); 
			});
			$("#city").change(function(){
				$("#county").find("option").remove();
				$("#county").append("<option value=''>县</option>");
				var pcode=$("#city").val();
					$.ajax({
					url:urldomain+"/admin/regbrand!queryCityDistrict.action",
					type:"post",
					data:'pcode='+pcode,
					timeout:1200000,
					beforeSend:function(xhr){
						return true;
			 		},		 		
			 		success:function(data){
			 		for(var i=0;i<data.length;i++){
			 		$("#county").append("<option value='"+data[i].code+"'>"+data[i].name+"</option>");
			 		}
			 			
			 		},
			 		error:function(xmlHttpRequest, error){
						
					}
			}); 
			});
			//判断是否默认加载城市
			var province =$("#province option:selected").val();
				if(province!=null&&province!=""){
					$.ajax({
						url:urldomain+"/admin/regbrand!queryCityDistrict.action",
						type:"post",
						data:'pcode='+province,
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		$("#city").append("<option value=''>市</option>");
				 		for(var i=0;i<data.length;i++){
				 		$("#city").append("<option value='"+data[i].code+"'>"+data[i].name+"</option>");
				 		}
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				}); 
				}
			//判断市是否存在 默认加载县
				var city =$("#city option:selected").val();
				if(city!=null&&city!=""){
					$.ajax({
						url:urldomain+"/admin/regbrand!queryCityDistrict.action",
						type:"post",
						data:'pcode='+city,
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		$("#county").append("<option value=''>县</option>");
				 		for(var i=0;i<data.length;i++){
				 		$("#county").append("<option value='"+data[i].code+"'>"+data[i].name+"</option>");
				 		}
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				}); 
				}
			
			});