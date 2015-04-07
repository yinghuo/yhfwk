<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="../../common/css/blue.css" rel="stylesheet" type="text/css">
		<script type="text/Javascript" src="../../common/js/tab.js"></script>
        <script type="text/javascript" src="<%=basePath%>/coalmcd/common/datepicker/WdatePicker.js" defer="defer" ></script>
        <link rel="stylesheet" type="text/css"
			href="<%=basePath%>common/css/layout.css"></link>
		<link rel="stylesheet" href="<%=basePath%>common/css/style.css"
			type="text/css"></link>
		<script src="<%=basePath%>common/js/common.js" type="text/javascript"></script>
		 
		<script src="<%=basePath%>common/js/front.js" type="text/javascript"></script>
		<title>能源物流公共服务平台</title>
		<style type="text/css">
.strsub {
	width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
	</head>
	<body>
	     <jsp:include page="../../front/top.jsp"></jsp:include>
		<!-- saved from url=(0013)about:internet -->
		<!-- amstock script-->
		<script type="text/javascript" src="swfobject.js"></script>
		<table width="900" border="0" cellspacing="0" cellpadding="3"
			align="center">
			<tr>
				<td valign="top" class="text" align="center">
					<b><font size="3">总收入和各行业收入的关系</font>
					</b>
				</td>
			</tr>
		</table>
		<div id="flashcontent"  >
			<strong></strong>
		</div>

		<script type="text/javascript">
		// <![CDATA[	
		var so = new SWFObject("amstock.swf", "amcolumn", "900", "500", "8", "");
		so.addParam("wmode","transparent");
		so.addVariable("settings_file", encodeURIComponent("amstock_settings.xml"));
		so.write("flashcontent");	
		// ]]>
	</script>
		<!-- end of amstock script -->
		<jsp:include page="../../front/bottom.jsp"></jsp:include>
	</body>
</html>
