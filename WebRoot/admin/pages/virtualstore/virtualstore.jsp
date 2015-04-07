<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://open.rockontrol/form" prefix="r" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!Doctype html>
<html>
<head>
	<%@include file='../importResource.jsp'%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/iframe.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/table.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ProvincesCC.js"></script>
	 
	<script type="text/javascript">
		$(function(){
			//获取搜索条件的值
			$("#buttonsunmit").click(function(){
				var vstName=$("#vstId option:selected").text();
				$("#vstName").val(vstName);
				$("#submit").submit();
			});
			});
			//加载区域品牌信息
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
		});				
	</script> 
	<script type="text/javascript">
	//批量删除
	  function go() {
	 
            var str="";
           $("input[name='checkbox[]']").each(function(){
	           if(this.checked){
	              str+=$(this).val()+".";
	           }
            });
            if(str==null||str==""){
            alert("选择要删除的数据");
            }else{
                 window.location.href="${pageContext.request.contextPath}/admin/virtualstore!deleteVirtualStoreByid.action?vsId="+str;
            }
      
            
        }
	</script>
</head>
<body>
	<div class="centerRightContainer">
		<div class="centerRight">
			<h6 id="NavMap"></h6>
			<div class="blueDivBox">
			<form id="submit" action="${pageContext.request.contextPath}/admin/virtualstore.action" method="post">
				<label>店铺名称：</label>
				<select id="vstId" name="vsVstId">
					<s:if test="vsVstId!=''&&vsVstId!=null">
						<<option value="<s:property value="vsVstId"/>"><s:property value="vstName"/></option>
					</s:if>
					<s:else>
						
					</s:else>
				</select>
				<input name="vstName" id="vstName" type="hidden" value="">
				<span class="searchTextBox">
					<input id="buttonsunmit" type="button" class="blueBtn" value="搜索"/>
					
				</span>
				</form>
				
			</div>
			<span id="alldelete" onclick="go();" class="delAll">删除全部已选项</span>
			<table cellpadding="0" cellspacing="0" class="checkboxTable">
				<thead>
					<tr>
						<th>
							<label>
								<input type="checkbox"/>
							</label>
						</th>
						<th>
							<label>店铺名称</label>
						</th>
						<th>
							<label>链接地址</label>
						</th>
						<th class="borderRightNone">
							<label class="borderRightNone">操作</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="vsList" id="vl">
						<tr>
							<td><input name="checkbox[]" type="checkbox" value="<s:property value="#vl.vsId"/>"/></td>
							<td><s:property value="#vl.virtualStoreType.vstName"/></td>
							<td><s:property value="#vl.vsStoreUrl"/></td>
							<td class="borderRightNone">
								<a href="${pageContext.request.contextPath}/admin/virtualstore!queryVirtualStoreByid.action?vsId=<s:property value="#vl.vsId"/>" class="modifyBtn">修改</a>
								<a href="${pageContext.request.contextPath}/admin/virtualstore!deleteVirtualStoreByid.action?vsId=<s:property value="#vl.vsId"/>" class="delLoadBtn">删除</a>				
							</td>
							
						</tr>
					</s:iterator>
					
				</tbody>
			</table>
			
			 	 <r:Page page="storepage" count="5">
    			 <div class="news-pager">
					<s:if test="#attr.IsFirst">
						<a href="javascript:{}" class="pager-pre pager-disable">上一页</a>
					</s:if>
					<s:else>
						<a href="virtualstore.action?page=${pageNowNum-1}&vsVstId=<s:property value="vsVstId"/>&vstName=<s:property value="@java.net.URLEncoder@encode(@java.net.URLEncoder@encode(vstName))"/>" class="pager-pre">上一页</a>
					</s:else>
					<!-- pager-current -->
					<s:if test="#attr.HasUpGroup">
						<div class="info">...</div>
					</s:if>
					
					<r:PageNum>
						<s:if test="#attr.IsNow">
							<a class="pager-pre" href="javascript:{}" style="color: red;">${pageIndex}</a>
						</s:if>
						<s:else>
							<a class="pager-pre" href="virtualstore.action?page=${pageIndex}&vsVstId=<s:property value="vsVstId"/>&vstName=<s:property value="@java.net.URLEncoder@encode(@java.net.URLEncoder@encode(vstName))"/>">${pageIndex}</a>
						</s:else>
					</r:PageNum>
					
					<s:if test="#attr.HasDnGroup">
						<div class="info">...</div>		
					</s:if>
					
					<!-- 下一页 -->
					<s:if test="#attr.IsLast">
						<a href="javascript:{}" class="pager-pre pager-disable">下一页</a>
					</s:if>
					<s:else>
						<a href="virtualstore.action?page=${pageNowNum+1}&vsVstId=<s:property value="vsVstId"/>&vstName=<s:property value="@java.net.URLEncoder@encode(@java.net.URLEncoder@encode(vstName))"/>" class="pager-pre">下一页</a>
					</s:else>
					<!-- 其他信息 -->
					<div class="info">共${pageMaxNum}页</div>
				</div>
            	</r:Page>
			
			 <div class="clearFloat"></div>
		</div>
	</div>
</body>
</html>
