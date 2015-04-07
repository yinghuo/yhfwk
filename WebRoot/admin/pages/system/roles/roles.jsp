<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://open.rockontrol/form" prefix="r" %>

<!doctype html>
<html>
  <head>
    <%@include file='/admin/pages/importResource.jsp'%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/iframe.js"></script>
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit.js"></script>
  </head>
  <script type="text/javascript">
  	function result(data)
  		{
  			alert(data["msg"]);
			if(data["error"]=="0")
			{
				window.location.href=window.location.href;
			}
  		}
  	function sousuo()
  	{
  		//window.location.href="${pageContext.request.contextPath}/master/system/role!listRoles.action?eid="+$("#searrolename").val();
  		document.getElementById("frmSearch").submit();
  	}
  	function reloadmenu()
    {
    	window.parent.window.parent.window.location="${pageContext.request.contextPath}/login!access.action";
    }
  </script>
  <body>
     <div class="centerRightContainer">
     	<div class="centerRight">
     		<h6 id="NavMap"></h6>
     		<form id="frmSearch" action="${pageContext.request.contextPath}/master/system/role!listRoles.action" method="post">
     		<div class="blueDivBox">
     			<label>角色名：</label>
				<input id="searrolename" name="eid" type="text" value="${eid }"/>
				<span class="searchTextBox">					
					<input onClick="sousuo()" type="button" class="blueBtn" value="搜索"/>
				</span>
				 <div style="float:right;">
			    	<input id="btnAdd2" onclick="reloadmenu()" type="button" class="blueBtn" style="float:right;" value="刷新菜单缓存"/>		
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
							<label>角色名</label>
						</th>
						<th>
							<label style="width:100px;">角色状态</label>
						</th>
						<th>
							<label>角色菜单</label>
						</th>
						<th class="borderRightNone">
							<label class="borderRightNone">操作</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="rolesALL" id="element" status="st">
					<tr>
						<td>${st.index+1}</td>
						<td><s:property value="#element.rname"/></td>
						<td>可用</td>
						<td><s:property value="#element.menuname"/></td>
						<td class="borderRightNone">
							<a href="${pageContext.request.contextPath}/master/system/role!doEditRoles.action?eid=<s:property value="#element.rid"/>" class="modifyBtn">修改</a>
							<a id="comsubmit_delete" callfunction=",result," promptInfo='确认删除角色[<s:property value="rname"/>]？' url="${pageContext.request.contextPath}/master/system/role!doDelete.action?eid=${rid}" class="delLoadBtn">删除</a>
						</td>
					</tr>
					</s:iterator>
				</tbody>
			</table>
			<r:Page page="pages" count="9">
    			 <div class="news-pager">
					<s:if test="#attr.IsFirst">
						<a href="javascript:{}" class="pager-pre pager-disable">上一页</a>
					</s:if>
					<s:else>
						<a href="${pageContext.request.contextPath}/master/system/role!listRoles.action?page=${pageNowNum-1}&eid=${eid}" class="pager-pre">上一页</a>
					</s:else>
					
					<s:if test="#attr.HasUpGroup">
						<div class="info">...</div>
					</s:if>
					
					<r:PageNum>
						<s:if test="#attr.IsNow">
							<a class="javascript:{}" style="color: red;">${pageIndex}</a>
						</s:if>
						<s:else>
							<a href="${pageContext.request.contextPath}/master/system/role!listRoles.action?page=${pageIndex}&eid=${eid}">${pageIndex}</a>
						</s:else>
					</r:PageNum>
					
					<s:if test="#attr.HasDnGroup">
						<div class="info">...</div>		
					</s:if>
					
					<s:if test="#attr.IsLast">
						<a class="pager-pre pager-disable">下一页</a>
					</s:if>
					<s:else>
						<a class="" href="${pageContext.request.contextPath}/master/system/role!listRoles.action?page=${pageNowNum+1}&eid=${eid}">下一页</a>
					</s:else>
					<div class="info">共${pageMaxNum}页</div>
				</div>
            	</r:Page>
     	</div>
     	
     </div>
  </body>
</html>
