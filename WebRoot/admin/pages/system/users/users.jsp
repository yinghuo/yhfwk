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
  		//window.location.href="${pageContext.request.contextPath}/master/system/user!listUsers.action?loginName="+$("#searusername").val();
  		document.getElementById("frmSearch").submit();
  	}
  </script>
  <body>
     <div class="centerRightContainer">
     	<div class="centerRight">
     		<h6 id="NavMap"></h6>
     		<form id="frmSearch" action="${pageContext.request.contextPath}/master/system/user!listUsers.action" method="post">
	     		<div class="blueDivBox">
	     			<label>用户名：</label>
					<input id="searusername" name="loginName" type="text" value="${loginName}"/>
					<span class="searchTextBox">				
						<input onClick="sousuo()" type="button" class="blueBtn" value="搜索"/>
					</span>
				</div>
			</form>
			<table cellpadding="0" cellspacing="0" class="checkboxTable">
				<thead>
					<tr>
						<th>
							<label>序号</label>
						</th>
						<th>
							<label>用户名</label>
						</th>
						<th>
							<label>登陆名</label>
						</th>
						<th>
							<label>用户角色</label>
						</th>
						<th class="borderRightNone">
							<label class="borderRightNone">操作</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="users" id="element" status="st">
					<tr>
						<td>${st.index+1}</td>
						<td><s:property value="uname"/></td>
						<td><s:property value="uloginname"/></td>
						<td><s:property value="role.rname"/></td>
						<td class="borderRightNone">
							<a href="${pageContext.request.contextPath}/master/system/user!doEdit.action?id=${uid}" class="modifyBtn">修改</a>
							<a id="comsubmit_delete" callfunction=",result," promptInfo='确认删除用户[<s:property value="uname"/>]？' url="${pageContext.request.contextPath}/master/system/user!doDelete.action?id=${uid}" class="delLoadBtn">删除</a>
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
						<a href="${pageContext.request.contextPath}/master/system/user!listUsers.action?page=${pageNowNum-1}&loginName=${loginName}" class="pager-pre">上一页</a>
					</s:else>
					
					<s:if test="#attr.HasUpGroup">
						<div class="info">...</div>
					</s:if>
					
					<r:PageNum>
						<s:if test="#attr.IsNow">
							<a class="javascript:{}" style="color: red;">${pageIndex}</a>
						</s:if>
						<s:else>
							<a href="${pageContext.request.contextPath}/master/system/user!listUsers.action?page=${pageIndex}&loginName=${loginName}">${pageIndex}</a>
						</s:else>
					</r:PageNum>
					
					<s:if test="#attr.HasDnGroup">
						<div class="info">...</div>		
					</s:if>
					
					<s:if test="#attr.IsLast">
						<a class="pager-pre pager-disable">下一页</a>
					</s:if>
					<s:else>
						<a class="" href="${pageContext.request.contextPath}/master/system/user!listUsers.action?page=${pageNowNum+1}&loginName=${loginName}">下一页</a>
					</s:else>
					<div class="info">共${pageMaxNum}页</div>
				</div>
            	</r:Page>
     	</div>
     	
     </div>
  </body>
</html>
