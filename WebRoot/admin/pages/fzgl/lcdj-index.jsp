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
     		<h6 id="NavMap"></h6>
     		<form id="frmSearch" action="" method="post">
	     		<div class="blueDivBox">
	     			<label>牛只编号：</label>
					<input id="" name="" type="text" value=""/>
					<label style="margin-left:10px;">耳标编号：</label>
					<input id="" name="" type="text" value=""/>
					<span class="searchTextBox">					
						<input onClick="" type="button" class="blueBtn" value="搜索"/>
					</span>
					 <div style="float:right;">
				    	<a id="btnAdd2" class="blueBtn" href="${pageContext.request.contextPath}/admin/pages/fzgl/lcdj-add.jsp" style="float:right;padding:0px 8px;">新增流产信息</a>		
				    </div>
				</div>
			</form>
			<table cellpadding="0" cellspacing="0" class="checkboxTable">
				<thead>
					<tr>
						<td>${status.count }</td>
						<th>
							<label>牛只编号</label>
						</th>
						<th>
							<label>流产日期</label>
						</th>
						<th>
							<label>流产原因</label>
						</th>
						<th>
							<label>胎儿类型</label>
						</th>
						<th>
							<label>发现人</label>
						</th>
						<th>
							<label>发现方式</label>
						</th>
						<th class="borderRightNone" width="120">
							<label class="borderRightNone">操作</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="lclist" status="status" id="lcxx">
						<tr>
							<td>${status.count }</td>
							<td><s:property value="#lcxx.nzbh"/></td>
							<td><s:date name="#lcxx.lcrq" format="yyyy年MM月dd日"/></td>
							<td><s:property value="#lcxx.lcyy"/></td>
							<td><s:property value="#lcxx.telx"/></td>
							<td><s:property value="#lcxx.fxr"/></td>
							<td><s:property value="#lcxx.fxfs"/></td>
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
     	showmap("流产信息管理 > 牛只流产信息列表");
     </script>
  </body>
</html>