<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!Doctype html>
<html>
<head>
	<%@include file='importResource.jsp'%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/centerLeft.js"></script>

</head>
<body>
	<ul class="centerLeft" id="centerLeft">
		<!-- <li class="leftFirstMenu">
			<span class="unfold_LeftMenu">企业品牌</span>
			<ul style="display:block;">
				<li class="selected_leftMenu" rightPageName="${pageContext.request.contextPath}/admin/regbrand.action">区域品牌管理</li>
				<li rightPageName="regbrandPages/addUpdateRegbrand.jsp">创建区域品牌</li>
			</ul>
		</li>
		<li class="leftFirstMenu">
			<span>品牌</span>
			<ul>
				<li rightPageName="brandPages/addUpdateBrand.jsp">创建品牌</li>
				<li rightPageName="${pageContext.request.contextPath}/admin/brand.action">品牌管理</li>
			</ul>
		</li>
		<li class="leftFirstMenu">
			<span>产品</span>
			<ul>
				<li rightPageName="product/addUpdateProduct.jsp">创建产品</li>
				<li rightPageName="${pageContext.request.contextPath}/admin/product.action">产品管理</li>
			</ul>
		</li>
		<li class="leftFirstMenu">
			<span>追溯唯一码管理</span>
			<ul>
				<li rightPageName="trace/addTraceAndUnique.jsp">添加追溯唯一码</li>
				<li rightPageName="${pageContext.request.contextPath}/admin/trace.action">追溯码唯一码</li>
			</ul>
		</li>
		<li class="leftFirstMenu">
			<span>评价管理</span>
			<ul>
				<li rightPageName="${pageContext.request.contextPath}/admin/evaluation.action">产品管理</li>
			</ul>
		</li>
		<li class="leftFirstMenu">
			<span>危机管理</span>
			<ul>
				<li rightPageName="${pageContext.request.contextPath}/admin/crisismanage.action">危机事件</li>
				<li rightPageName="${pageContext.request.contextPath}/admin/pages/crisis/addCrisisEvent.jsp">新增危机事件</li>
				<li rightPageName="${pageContext.request.contextPath}/admin/crisismanage!queryCrisisTrackAll.action">危机追踪事件</li>
				<li rightPageName="${pageContext.request.contextPath}/admin/pages/crisis/addCrisisTrack.jsp">新增危机事件追踪</li>
				<li rightPageName="${pageContext.request.contextPath}/admin/crisismanage!queryAllCrisisRadio.action">危机事件图集</li>
				<li rightPageName="${pageContext.request.contextPath}/admin/pages/crisis/addCrisisRadio.jsp">新增危机事件图集</li>
								
			</ul>
			
		</li>
			<li class="leftFirstMenu">
			<span>风险预警管理</span>
			<ul>
				<li rightPageName="${pageContext.request.contextPath}/admin/crisismanage!queryDangerPredict.action">风险预警</li>
				<li rightPageName="${pageContext.request.contextPath}/admin/pages/dengerpredictPages/addDangerPredict.jsp">新增风险预警</li>
			</ul>
			
		</li>
		<li class="leftFirstMenu">
			<span>危机流程管理</span>
			<ul>
				<li rightPageName="${pageContext.request.contextPath}/admin/crisisprocess.action">危机流程管理</li>	
				<li rightPageName="${pageContext.request.contextPath}/admin/pages/crisis/addCrisisProcess.jsp">新增危机流程管理</li>															
			</ul>
			
		</li>
		<li class="leftFirstMenu">
			<span>企业管理</span>
			<ul>
				<li rightPageName="${pageContext.request.contextPath}/admin/body.action">企业管理</li>	
				<li rightPageName="${pageContext.request.contextPath}/admin/pages/body/addBody.jsp">新增企业管理</li>		
				<li rightPageName="${pageContext.request.contextPath}/admin/enterplatform.action">企业平台管理</li>														
				<li rightPageName="${pageContext.request.contextPath}/admin/pages/enterPlatForm/addEnterPlatForm.jsp">新增企业平台管理</li>		
				<li rightPageName="${pageContext.request.contextPath}/admin/body!queryAllNoApprovalBody.action">未审批企业</li>
				<li rightPageName="${pageContext.request.contextPath}/admin/certificate.action">企业资质管理</li>
			</ul>
			
		</li> -->
	</ul>

	<!-- <ul class="centerLeft" id="centerLeft"></ul> -->

</body>
</html>