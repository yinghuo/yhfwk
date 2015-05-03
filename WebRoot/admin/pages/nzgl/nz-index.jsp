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
	          				<td>牛只编号：</td>
	          				<td><input id="" type="text" name="" class="input-text lh25" value="" size="30"></td>
	          				<td>牛场编号：</td>
	          				<td><input id="" type="text" name="" class="input-text lh25" value="" size="30"></td>
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
              	<th width="200">所属圈舍</th>
              	<th width="200">耳标编号</th>
              	<th width="200">计步器编号</th>
              	<th width="200">出生日期</th>
              	<th width="200">操作</th>
         	</tr>
         	<s:iterator value="nzlist" status="status" id="nzxx">
				<tr>
					<td>${status.count}</td>
					<td><s:property value="#nzxx.nzbh"/></td>
					<td><s:property value="#nzxx.jsjbxx.jsmc"/></td>
					<td><s:property value="#nzxx.ebbh"/></td>
					<td><s:property value="#nzxx.jbqbh"/></td>
					<td><s:date name="#nzxx.csrq" format="yyyy年MM月dd日"/></td>
					<td>
						<a >修改</a>
						<a >删除</a>
						<a href="${pageContext.request.contextPath}/master/nzgl/zsxx!add.action?id=<s:property value="#nzxx.xh"/>">转舍</a>
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
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/nzgl/nzxx.action?page=${pageNowNum-1}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/nzgl/nzxx.action?page=${pageIndex}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/nzgl/nzxx.action?page=${pageNowNum+1}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</i:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
     <script>
     	showmap("牛只信息管理 > 牛只信息列表");
     	function add()
     	{
     		window.location.href="${pageContext.request.contextPath}/admin/pages/nzgl/nz-add.jsp";
     	}
     </script>
  </body>
</html>