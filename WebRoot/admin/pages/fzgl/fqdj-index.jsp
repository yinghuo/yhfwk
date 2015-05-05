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
	          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/fzgl/fqdj.action" method="post">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>牛只编号：</td>
	          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="30"></td>
	          				<td>耳标编号：</td>
	          				<td><input id="" type="text" name="" class="input-text lh25" value="" size="30"></td>
	          			</tr>
	          		</table>
	          		</form>
	          	</div>	          	
	         </div>
	         <div class="pb5 pt5 pr10">
	          		<div class="search_bar_btn" style="text-align:right;">
	          			<input type="button" name="button" onClick="search()" class="btn btn82 btn_search" value="查询">
	          			<input type="button" name="button" onClick="add()" class="btn btn82 btn_add" value="新增">
	          		</div>
	         </div>
	 </div>
  	
  	<div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
             	<th width="80">序号</th>
              	<th width="200">牛只编号</th>
              	<th width="200">发情时间</th>
              	<th width="200">发情类型</th>
              	<th width="200">发现方式</th>
              	<th width="200">发现人</th>
              	<th width="200">是否配种</th>
              	<th width="200">操作</th>
         	</tr>
         	<s:iterator value="fqlist" status="status" id="fqxx">
						<tr>
							<td>${status.count }</td>
							<td><s:property value="#fqxx.nzbh"/></td>
							<td><s:date name="#fqxx.fqsj" format="yyyy年MM月dd日"/></td>
							<td><s:property value="#fqxx.fqlx"/></td>
							<td><s:property value="#fqxx.fxfs"/></td>
							<td><s:property value="#fqxx.fxr"/></td>
							<td><s:property value="#fqxx.sfpz"/></td>
							<td>
								<a title="修改" onclick="edit()" class="fa fa-edit cr-p">修改</a>
								<a title="删除" id="comsubmit_delete" promptInfo='？' callfunction=",deleteDone," url="${pageContext.request.contextPath}/master/fzgl/fqdj!delete.action?id=" class="fa fa-remove cr-p">删除</a>
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
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/fzgl/fqdj.action?p=${pageNowNum-1}${searchString}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/fzgl/fqdj.action?p=${pageIndex}${searchString}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/fzgl/fqdj.action?p=${pageNowNum+1}${searchString}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</i:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
     <script>
     	showmap("发情信息管理 > 发情信息列表");
     	
     	function add()
     	{
     		window.location.href="${pageContext.request.contextPath}/admin/pages/fzgl/fqdj-add.jsp";
     	}
     	
     </script>
  </body>
</html>