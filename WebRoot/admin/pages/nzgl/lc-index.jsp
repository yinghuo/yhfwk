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
	          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="30"></td>
	          			</tr>
	          		</table>
	          		</form>
	          	</div>	          	
	         </div>
	         <div class="pb5 pt5 pr10">
	          		<div class="search_bar_btn" style="text-align:right;">
	          			<input type="button" name="button" onClick="search()" class="btn btn82 btn_search" value="查询">
	          			<%//<input type="button" name="button" onClick="add()" class="btn btn82 btn_add" value="新增">%>
	          		</div>
	         </div>
	</div>
  	
  	<div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
             	<th width="80">序号</th>
              	<th width="200">牛只编号</th>
              	<th width="200">所属圈舍</th>
              	<th width="200">离群日期</th>
              	<th width="200">离群类型</th>
              	<th width="200">离群体重</th>
              	<th width="200">去向</th>
              	<th width="200">经手人</th>
              	<th width="200">操作</th>
         	</tr>
         	<s:iterator value="lclist" status="status" id="lcxx">
				<tr>
					<td>${status.count}</td>
					<td><s:property value="#lcxx.nzjbxx.nzbh"/></td>
					<td><s:property value="#lcxx.nzjbxx.jsjbxx.jsbh"/></td>
					<td><s:date name="#lcxx.lqrq" format="yyyy-MM-dd HH:mm"/></td>
					<td><s:property value="#lcxx.lqlx"/></td>
					<td><s:property value="#lcxx.lqtz"/></td>
					<td><s:property value="#lcxx.qx"/></td>
					<td><s:property value="#lcxx.jsr"/></td>
					<td>
						<a >删除</a>
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
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/nzgl/lcxx.action?p=${pageNowNum-1}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/nzgl/lcxx.action?p=${pageIndex}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/nzgl/lcxx.action?p=${pageNowNum+1}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</i:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
     <script>
     	showmap("牛只信息管理 > 离场信息列表");
     </script>
  </body>
</html>