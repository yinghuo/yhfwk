$(document).ready(function(){
			$("#province").change(function(){
				$("#regbrandid").find("option").remove();
				$("#regbrandid").append("<option value=''>选择区域品牌</option>");
				var pcode=$("#province").val();
				//if(pcode!=null&&pcode!=""){
					$.ajax({
						url:urldomain+"/admin/brand!queryRegbrand.action",
						type:"post",
						data:'ajaxprovince='+pcode,
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		for(var i=0;i<data.length;i++){
				 			
				 	$("#regbrandid").append("<option value='"+data[i].RB_ID+"'>"+data[i].RB_NAME+"</option>");
				 		}
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				}); 
				//}
					
			});
			$("#city").change(function(){
				$("#regbrandid").find("option").remove();
				$("#regbrandid").append("<option value=''>选择区域品牌</option>");
				var pcode=$("#city").val();
				if(pcode==null||pcode==""){
					pcode=$("#province").val();
				}
				if(pcode!=null&&pcode!=""){
					$.ajax({
						url:urldomain+"/admin/brand!queryRegbrand.action",
						type:"post",
						data:'ajaxprovince='+pcode,
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		for(var i=0;i<data.length;i++){
				 			
				 			$("#regbrandid").append("<option value='"+data[i].RB_ID+"'>"+data[i].RB_NAME+"</option>");
				 		}
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				});
				}
			 
			});
			$("#county").change(function(){
				$("#regbrandid").find("option").remove();
				$("#regbrandid").append("<option value=''>选择区域品牌</option>");
				var pcode=$("#county").val();
				if(pcode==null||pcode==""){
					pcode=$("#city").val();
				}
				if(pcode!=null&&pcode!=""){
					$.ajax({
						url:urldomain+"/admin/brand!queryRegbrand.action",
						type:"post",
						data:'ajaxprovince='+pcode,
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		for(var i=0;i<data.length;i++){
				 			
				 			$("#regbrandid").append("<option value='"+data[i].RB_ID+"'>"+data[i].RB_NAME+"</option>");
				 		}
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				}); 
				}
			
			});
			//判断是否默认加载城市
			var province =$("#province option:selected").val();
			var city =$("#city option:selected").val();
			var county =$("#county option:selected").val();
			var codeparam="";
				if(province!=null&&province!=""){
					codeparam=province;
				}
				if(city!=null&&city!=""){
					codeparam=city;
				}
				if(county!=null&&county!=""){
					codeparam=county;
				}
				//if(codeparam!=null&&codeparam!=""){
					$.ajax({
						url:urldomain+"/admin/brand!queryRegbrand.action",
						type:"post",
						data:'ajaxprovince='+codeparam,
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		for(var i=0;i<data.length;i++){
				 			
				 			$("#regbrandid").append("<option value='"+data[i].RB_ID+"'>"+data[i].RB_NAME+"</option>");
				 		}
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				});
				//}
			
			});