<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YString.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YNav.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/frame.js"></script>
		<frameset rows="108,*" framespacing="0" frameborder="no" border="0" >
			 <frame src="head.jsp" name="headFrame" scrolling="no" noresize="noresize" id="headFrame" frameborder="0" marginheight="0" marginwidth="0"></frame>
			 <frameset cols="220,*" framespacing="0" frameborder="no" border="0">

				<frame src="centerLeft.jsp"  name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame"></frame>
				<frame src="" name="rightFrame" scrolling="no" noresize="noresize" id="rightFrame"></frame>
			 </frameset>	
		</frameset>
	<noframes>
		<body></body>
	</noframes>
	
</html>
