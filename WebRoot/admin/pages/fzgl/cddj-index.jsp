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
				    	<a id="btnAdd2" class="blueBtn" href="${pageContext.request.contextPath}/admin/pages/fzgl/cddj-add.jsp" style="float:right;padding:0px 8px;">新增产犊信息</a>		
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
							<label>产犊时间</label>
						</th>
						<th>
							<label>产犊类型</label>
						</th>
						<th>
							<label>产犊难易</label>
						</th>
						<th>
							<label>胎位</label>
						</th>
						<th>
							<label>接产员</label>
						</th>
						<th>
							<label>胎儿数量</label>
						</th>
						<th class="borderRightNone" width="120">
							<label class="borderRightNone">操作</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="cdlist" status="status" id="cdxx">
						<tr>
							<td>${status.count }</td>
							<td><s:property value="#cdxx.nzbh"/></td>
							<td><s:date name="#cdxx.cdsj" format="yyyy年MM月dd日"/></td>
							<td><s:property value="#cdxx.cdlx"/></td>
							<td><s:property value="#cdxx.cdny"/></td>
							<td><s:property value="#cdxx.tw"/></td>
							<td><s:property value="#cdxx.jcy"/></td>
							<td><s:property value="#cdxx.tesl"/></td>
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
     	showmap("产犊信息管理 > 产犊信息列表");
     </script>
  </body>
</html>