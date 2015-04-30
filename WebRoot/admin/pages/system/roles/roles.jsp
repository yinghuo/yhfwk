<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://open.yinghuo.info/form" prefix="r" %>

<!doctype html>
<html>
  <head>
    <%@include file='/admin/pages/import.jsp'%>
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit.js"></script>
  </head>
  <script type="text/javascript">
  	function sousuo()
  	{
  		document.getElementById("frmSearch").submit();
  	}
  	function reloadmenu()
    {
    	window.parent.window.parent.window.location="${pageContext.request.contextPath}/login!access.action";
    }
    function add()
    {
    	window.location.href="${pageContext.request.contextPath}/master/system/role.action";
    }
  </script>
  <body>
  	<div class="box">
	  		<div class="box_border">
	        	<div class="box_top">
	          		<div class="box_top_l fl">	          		
	          			<b class="pl15">查询搜索</b>
	          		</div>
	               	<div class="box_top_r fr pr15"><a href="#" onclick="reloadmenu()" class="color307fb1">刷新菜单缓存</a></div>
	          	</div>
	          	<div class="box_center pt5 pb5">
	          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/system/role!listRoles.action" method="post">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>角色名：</td>
	          				<td><input id="searrolename" type="text" name="eid" class="input-text lh25" value="${eid }" size="50"></td>
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
              	<th>角色名</th>
              	<th width="200">操作</th>
         	</tr>
         	<s:iterator value="rolesALL" id="element" status="st">
			<tr>
				<td>${st.index+1}</td>
				<td><s:property value="#element.rname"/></td>
				<td>
					<a href="${pageContext.request.contextPath}/master/system/role!doEditRoles.action?eid=<s:property value="#element.rid"/>" class="fa fa-edit">修改</a>
					<a href="#" id="comsubmit_delete" callfunction=",result," promptInfo='确认删除角色[<s:property value="rname"/>]？' url="${pageContext.request.contextPath}/master/system/role!doDelete.action?eid=${rid}" class="fa fa-remove">删除</a>
				</td>
			</tr>
			</s:iterator>
  	 	</table>
  	 	<div class="page mt10 fr pr10">
         	<div class="pagination">
            	<ul>
            		<r:Page page="pages" count="9">
            			<s:if test="#attr.IsFirst">
							<li class="first-child disabled"><span>上一页</span></li>
						</s:if>
						<s:else>
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/system/role!listRoles.action?page=${pageNowNum-1}&eid=${eid}">上一页</a></li>
						</s:else>
						<r:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/system/role!listRoles.action?page=${pageIndex}&eid=${eid}">${pageIndex}</a></li>
							</s:else>
						</r:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/system/role!listRoles.action?page=${pageNowNum+1}&eid=${eid}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</r:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
  </body>
</html>
