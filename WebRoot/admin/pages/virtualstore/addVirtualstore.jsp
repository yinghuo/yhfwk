<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!Doctype html>
<html>
<head>
	<%@include file='../importResource.jsp'%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/iframe.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/table.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/createAreaBrand.css" />
		 <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ProvincesCC.js"></script>
		 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/jquery-calendar.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-calendar.js"></script>
		 	<script type="text/javascript" src="${pageContext.request.contextPath}/vendor/jqueryvalidation/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/vendor/jqueryvalidation/jquery.validate.min.js"></script>
 <style type="text/css">
		#allmap {width: 100%;height: 100%;overflow: auto;margin:0;}
</style>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=1c79e3213511afafe17f8658f4a9eb99"></script>
	 	
<script type="text/javascript">
		$(function(){
			//获取搜索条件的值
			$("#buttonsunmit").click(function(){
				$("#submit").validate();
			});
			//取消
			$("#cancel").click(function(){
			 window.location.href="${pageContext.request.contextPath}/admin/virtualstore.action";
			});
			
			});
		
	</script> 	
	<script type="text/javascript">
			$(document).ready(function(){
					//查询虚拟店铺类型的方法
				$.ajax({
						url:"${pageContext.request.contextPath}/admin/virtualstore!queryVirtualStoreType.action",
						type:"post",
						timeout:1200000,
						beforeSend:function(xhr){
							return true;
				 		},		 		
				 		success:function(data){
				 		$("#vstId").append("<option value=''>请选择企业类型</option>");
				 		for(var i=0;i<data.length;i++){
				 				$("#vstId").append("<option value='"+data[i].vstId+"'>"+data[i].vstName+"</option>");
				 		}
				 			
				 		},
				 		error:function(xmlHttpRequest, error){
							
						}
				}); 
				//查询结束 
					//验证开始
					  $("#submit").validate({   
		        		 messages: {

		        				 vsVstId:"请选择店铺类型",
		        				 vsStoreUrl:"请输入店铺链接地址"
		        				 
		        				 
		        				 
		        				 
		  							 }
		     								});
					//验证结束
			});
	</script>
</head>
<body>
	<div id="countdiv" class="centerRightContainer">
		<div class="centerRight">
			<h6 id="NavMap"></h6>
			<form id="submit" action="${pageContext.request.contextPath}/admin/virtualstore!saveVirtualStore.action" method="post">
			<table cellpadding="0" cellspacing="0">
				<thead>
					<tr>
						<th colspan="3" class="borderRightNone">
							<label>新增虚拟店铺</label>
						</th>
					</tr>
				</thead>
				<tbody>
				<tr>
						<td>店铺类型:</td>
						<td  align="left">
								<select id="vstId" name="vsVstId" style="width:260px;" class="required">
									<s:if test="virtualStore.vsVstId!=''&&virtualStore.vsVstId!=null">
										<option value="<s:property value="virtualStore.vsVstId"/>"><s:property value="virtualStore.virtualStoreType.vstName"/></option>
									</s:if>
									<s:else>
										
									</s:else>						
								</select>
								<span style='color:red;'>*必填</span>
						</td>
					</tr>
					<tr>
						<td>店铺地址</td>
							<td align="left">
							<input id="vsStoreUrl" style="width:260px;"  name="vsStoreUrl" type="text" class="lightBlueInput required" value="<s:property value="virtualStore.vsStoreUrl"/>"/><span style='color:red;'>*必填</span>	
							</td>
					</tr>				
				</tbody>
			</table>
			 <div class="grayDivBox">
				 <input id="vsId" name="vsId" type="hidden" value="<s:property value="virtualStore.vsId"/>">
			 	<input id="buttonsunmit" type="submit" value="提交" class="lightBlueBtn"/>
			 	<input id="reset" type="reset" value="重置" class="lightBlueBtn"/>
			 	<input id="cancel" type="button" value="取消" class="lightBlueBtn"/>
			 </div>
			 </form>
		</div>
	</div>
	

	
</body>	 
</html>
