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
				    	<a id="btnAdd2" class="blueBtn" href="${pageContext.request.contextPath}/admin/pages/fzgl/rjdj-add.jsp" style="float:right;padding:0px 8px;">新增配种信息</a>		
				    </div>
				</div>
			</form>
			<table cellpadding="0" cellspacing="0" class="checkboxTable">
				<thead>
					<tr>
						<th>
							<label>牛只编号</label>
						</th>
						<th>
							<label>配种时间</label>
						</th>
						<th>
							<label>冻精编号</label>
						</th>
						<th>
							<label>冻精类型</label>
						</th>
						<th>
							<label>配种员</label>
						</th>
						<th class="borderRightNone" width="120">
							<label class="borderRightNone">操作</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="pzlist" status="status" id="pzxx">
						<tr>
							<td>${status.count }</td>
							<td><s:property value="#pzxx.nzbh"/></td>
							<td><s:date name="#pzxx.pzsj" format="yyyy年MM月dd日"/></td>
							<td><s:property value="#pzxx.djbh"/></td>
							<td><s:property value="#pzxx.djlx"/></td>
							<td><s:property value="#pzxx.pzy"/></td>
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
     	showmap("配种信息管理 > 牛只配种信息列表");
     </script>
  </body>
</html>