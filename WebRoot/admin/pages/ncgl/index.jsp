<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="i" uri="http://open.yinghuo.info/form" %>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/importResource.jsp'%>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/iframe.js"></script>
  </head>
  <body>
     <div class="centerRightContainer">
     	<div class="centerRight">
     		<form id="frmSearch" action="" method="post">
	     		<div class="blueDivBox">
	     			<label>牛场名称：</label>
					<input id="" name="" type="text" value=""/>
					<label style="margin-left:10px;">牛场编号：</label>
					<input id="" name="" type="text" value=""/>
					<span class="searchTextBox">					
						<input onClick="" type="button" class="blueBtn" value="搜索"/>
					</span>
					 <div style="float:right;">
				    	<a id="btnAdd2" class="blueBtn" href="${pageContext.request.contextPath}/admin/pages/ncgl/add.jsp" style="float:right;padding:0px 8px;">新增牛场信息</a>		
				    </div>
				</div>
			</form>
			<table cellpadding="0" cellspacing="0" class="checkboxTable">
				<thead>
					<tr>
						<th>
							<label>序号</label>
						</th>
						<th>
							<label>牛场名称</label>
						</th>
						<th>
							<label>负责人</label>
						</th>
						<th>
							<label>开始使用时间</label>
						</th>
						<th>
							<label>到期时间</label>
						</th>
						<th class="borderRightNone" width="120">
							<label class="borderRightNone">操作</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="nclist" status="status" id="ncxx">
						<tr>
							<td>${status.count }</td>
							<td><s:property value="#ncxx.ncmc"/></td>
							<td><s:property value="#ncxx.fzr"/></td>
							<td><s:date name="#ncxx.kssysj" format="yyyy年MM月dd日"/></td>
							<td><s:date name="#ncxx.tzsysj" format="yyyy年MM月dd日"/></td>
							<td>
								<a >修改</a>
								<a >删除</a>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
     	</div>
     </div>
     <script>
     	
     </script>
  </body>
</html>