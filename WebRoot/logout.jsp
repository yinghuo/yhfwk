<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- 
	Title：系统登出页面
		   系统登出后，不直接跳转到登陆页面，先跳转到此页面，进行框架判断，然后进行统一跳转。

 --%>
<script>
	<%
		String t=request.getParameter("t");
		if(t!=null&&t!="")
		{
	%>
			window.top.location="${pageContext.request.contextPath}<%=t%>";
	<%
		}
		else
		{
	%>
			window.top.location="${pageContext.request.contextPath}/";
	<%
		}
	%>
</script>