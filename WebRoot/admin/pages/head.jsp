<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!Doctype html>
<html>
<head>
	
	<!--<s:if test="#session._sys_user==null">
		<script>window.parent.location="${pageContext.request.contextPath}/login.jsp";</script>
	</s:if>-->
	
	<%@include file='importResource.jsp'%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/head.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/head.js"></script>
	<script type="text/javascript">
		
		function logout()
		{
				$.ajax({
					url:"${pageContext.request.contextPath}/login!logout.action?t="+new Date().getTime(),
					type:"get",
					success:function(data){
						toIndex();
					}
				});
		}
		
		function toIndex()
		{
			<%-- medify Daniel 2014-08-15 1：修复无目录部署跳转问题 --%>
			var todo="${pageContext.request.contextPath}";
			window.parent.window.parent.window.location=todo==""?"/":todo;
		}
		
	</script>
</head>
<body>
	<div class="headContainer">
		<div class="logo"></div>
		<div class="login"> 
			当前用户：<label><s:property value="#session.uname"/> </label>
			权限组：<label><s:property value="#session.urole"/> </label>
			<a href="javascript:toIndex()">返回前台</a>
			<a onclick="logout()">退出</a>
		</div>
		<script type="text/javascript">
			var menusJson='${sessionScope._sys_mymenus_json}';
			window.parent.initMap(menusJson);
		</script>
		<div class="menu" id="menu">
			<s:iterator value="#session._sys_mymenus" id="element" status="st">
				<a id="<s:property value="mid"></s:property>" href="javascript:{}" <s:if test="#st.first">class="curMenu"</s:if>><s:property value="mname"></s:property></a>
				<menu id="menu_<s:property value="mid"></s:property>" style="display:none">
					<ul name="child">
						<s:iterator value="child" id="child" status="stchild">
							<li id="<s:property value="mid"></s:property>" class="leftFirstMenu">
								<span <s:if test="#stchild.first">class="unfold_LeftMenu"</s:if>><s:property value="mname"></s:property></span>
								<ul <s:if test="#stchild.first">style="display:block;"</s:if>>
									<s:iterator value="child" id="child2" status="stchild2">
										<s:if test="maction!=null">
											<li id="<s:property value="mid"></s:property>" <s:if test="#stchild.first&&#stchild2.first">class="selected_leftMenu"</s:if> rightPageName="${pageContext.request.contextPath}<s:property value="maction"></s:property>"><s:property value="mname"></s:property></li>
										</s:if>
										<s:else>
											<li id="<s:property value="mid"></s:property>" <s:if test="#stchild.first&&#stchild2.first">class="selected_leftMenu"</s:if> rightPageName="javascript:{}"><s:property value="mname"></s:property></li>
										</s:else>
									</s:iterator>
								</ul>							
							</li>
						</s:iterator>
					</ul>
				</menu>
			</s:iterator>
		</div>
		
	</div>
</body>
</html>