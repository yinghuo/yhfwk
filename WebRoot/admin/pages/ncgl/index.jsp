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
	          				<td>牛场编号：</td>
	          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="30"></td>
	          				<td>牛场名称：</td>
	          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="30"></td>
	          			</tr>
	          		</table>
	          		</form>
	          	</div>	          	
	         </div>
	         <div class="pb5 pt5 pr10">
	          		<div class="search_bar_btn" style="text-align:right;">
	          			<input type="button" name="button" onClick="search()" class="btn btn82 btn_search" value="查询">
	          			<input type="button" name="button" onClick="add()" class="btn btn82 btn_add" value="新授权">
	          		</div>
	         </div>
	</div>
  	<div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
             	<th width="80">序号</th>
             	<th width="200">牛场编号</th>
              	<th width="200">牛场名称</th>
              	<th width="200">负责人</th>
              	<th width="200">负责人电话</th>
              	<th width="200">授权开始时间</th>
              	<th width="200">到期时间</th>
              	<th width="200">管理员账号</th>
              	<th width="200">操作</th>
         	</tr>
         	<s:iterator value="nclist" status="status" id="ncxx">
				<tr>
					<td>${status.count }</td>
					<td><s:property value="#ncxx.ncbh"/></td>
					<td><s:property value="#ncxx.ncmc"/></td>
					<td><s:property value="#ncxx.fzr"/></td>
					<td><s:property value="#ncxx.fzrdh"/></td>
					<td><s:date name="#ncxx.kssysj" format="yyyy年MM月dd日"/></td>
					<td><s:date name="#ncxx.tzsysj" format="yyyy年MM月dd日"/></td>
					<td><s:property value="#ncxx.user.uloginname"/></td>
					<td>
						<a title="修改" onclick="edit('<s:property value="#ncxx.xh"/>')" class="fa fa-edit cr-p">修改</a>
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
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/ncgl/ncxx.action?p=${pageNowNum-1}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/ncgl/ncxx.action?p=${pageIndex}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/ncgl/ncxx.action?p=${pageNowNum+1}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</i:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
     <script>
     	showmap("牧场信息管理 > 牛场授权列表");
     	function add(){
     		window.location.href="${pageContext.request.contextPath}/admin/pages/ncgl/add.jsp";
     	}
     	function edit(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/ncgl/ncgl!edit.action?id="+id;
     	}
     </script>
  </body>
</html>