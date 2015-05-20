<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box">
    	<div class="box_border">
       		<div class="box_top">
           		<div class="box_top_l fl"><b class="pl15">导入数据预览</b></div>
         	</div>
     	</div>
  	</div>
  	<div class="pb5 pt5 pr10">
  		<div class="search_bar_btn" style="text-align:right;">
  			<input type="button" onclick="importData()" class="btn btn82 btn_export" value="导入">
  		</div>
  	</div>
  	
  	<div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
  	 			<th>序号</th>
  	 			<s:iterator value="#session._session_myimportdata_head_" id="head">
  	 				<th>${head}</th>
  	 			</s:iterator>
         	</tr>
         	<s:iterator value="#session._session_myimportdata_" id="data" status="status">
  	 			<tr>
  	 				<td>${status.count}</td>
  	 				<s:iterator value="data" id="dataItem">
  	 					<td>${dataItem}</td>
  	 				</s:iterator>
  	 			</tr>
  	 		</s:iterator>
       	</table>
     </div>     
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YMask.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/import.js"></script>
  	 <script>
  	 	showmap("导入数据管理 > 数据预览");
		$(window).bind('beforeunload', function () {
			return "导入数据还未保存，离开将会放弃数据导入，确定离开吗？";
		});
  	 </script>
  </body>
 </html>
