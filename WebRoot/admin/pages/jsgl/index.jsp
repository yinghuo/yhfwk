<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="i" uri="http://open.yinghuo.info/form" %>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box">
	  		<div class="box_border">
	        	<div class="box_top">
	          		<div class="box_top">	          		
	          			<b class="pl15">查询搜索</b>
	          		</div>
	          	</div>
	          	<div class="box_center pt5 pb5">
	          		<form id="frmSearch" action="" method="post">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>圈舍编号：</td>
	          				<td><input id="" type="text" name="" class="input-text lh25" value="" size="50"></td>
	          				<td>圈舍名称：</td>
	          				<td><input id="" type="text" name="" class="input-text lh25" value="" size="50"></td>
	          			</tr>
	          		</table>
	          		</form>
	          	</div>	          	
	         </div>
	         <div class="pb5 pt5 pr10">
	          		<div class="search_bar_btn" style="text-align:right;">
	          			<input type="button" name="button" onClick="sousuo()" class="btn btn82 btn_search" value="查询">
	          			<input type="button" name="button" onClick="add()" class="btn btn82 btn_add" value="新增">
	          		</div>
	         </div>
	 </div>
  	 
  	 <div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
             	<th width="80">序号</th>
              	<th width="200">圈舍编号</th>
              	<th width="200">圈舍名称</th>
              	<th width="200">圈舍类别</th>
              	<th width="200">所属牛场名称</th>
              	<th width="200">操作</th>
         	</tr>
         	<s:iterator value="jslist" status="status" id="jsxx">
						<tr>
							<td>${status.count }</td>
							<td><s:property value="#jsxx.jsbh"/></td>
							<td><s:property value="#jsxx.jsmc"/></td>
							<td><s:property value="#jsxx.jslb"/></td>
							<td><s:property value="#jsxx.ncjbxx.ncmc"/></td>
							<td>
								<a href="#" class="fa fa-edit">修改</a>
								<a href="#" class="fa fa-remove">删除</a>
							</td>
						</tr>
			</s:iterator>
  	 	</table>
  	 	<div class="page mt10 fr pr10">
         	<div class="pagination">
            	<ul>
            		<i:Page page="pager" count="9">
            			<s:if test="#attr.IsFirst">
							<li class="first-child disabled"><span>上一页</span></li>
						</s:if>
						<s:else>
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/jsgl/jsgl.action?page=${pageNowNum-1}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/jsgl/jsgl.action?page=${pageIndex}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/jsgl/jsgl.action?page=${pageNowNum+1}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</i:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
     <script>
     	showmap("圈舍信息管理 > 圈舍信息列表");
     	function add()
     	{
     		window.location.href="${pageContext.request.contextPath}/admin/pages/jsgl/add.jsp";
     	}
     </script>
  </body>
</html>