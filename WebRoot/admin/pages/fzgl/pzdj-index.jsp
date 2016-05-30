<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="i" uri="http://open.yinghuo.info/form" %>
<%@ taglib prefix="y" uri="http://open.yinghuo.info/taglib/form"%>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box">
	  		<div class="box_border">
	        	<!-- <div class="box_top">
	          		<div class="box_top">	          		
	          			<b class="pl15">查询搜索</b>
	          		</div>
	          	</div> -->
	          	<div class="box_center pt5 pb5">
	          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/fzgl/pzdj.action" method="post">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>牛只编号：</td>
	          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="30"></td>
	          				<td>耳标编号：</td>
	          				<td><input id="eb" type="text" name="eb" class="input-text lh25" value="${eb}" size="30"></td>
	          			</tr>
	          		</table>
	          		</form>
	          	</div>	          	
	         </div>
	         <div class="pb5 pt5 pr10">
	          		<div class="search_bar_btn" style="text-align:right;">
	          			<input type="button" name="button" onClick="search()" class="btn btn82 btn_search" value="查询">
	          			<%//<input type="button" name="button" onClick="add()" class="btn btn82 btn_add" value="新增">%>
	          			<div class="fileButton" style="display:inline;">
	          				<form id="importform" style="display:inline;" action="${pageContext.request.contextPath}/master/data/import.action" method='post' enctype='multipart/form-data'>
			          			<input type="button" class="btn btn82 btn_export" value="导入">
			          			<input type="hidden" name="fileType" value="6">
			          			<input id="imgfile" class="fileInput cr-p" accept=".xlsx,.xls" type="file" name="upfile">
		          			</form>
	          			</div>
	          			<input type="button" name="button" data="6" onClick="dataExport()" class="btn btn82 btn_export" value="导出">
	          		</div>
	         </div>
	</div>
  	<div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
              	<th>牛只编号</th>
              	<th width="120">配种时间</th>
              	<th>情期</th>
              	<th>繁殖状态</th>
              	<%//<th>繁殖天数</th> %>
              	<th>冻精编号</th>
              	<th>冻精类型</th>
              	<th width="200">操作</th>
         	</tr>
         	<s:iterator value="pzlist" status="status" id="pzxx">
				<tr>
					<td><s:property value="#pzxx.nzjbxx.nzbh"/></td>
					<td><s:date name="#pzxx.pzsj" format="yyyy-MM-dd HH:mm"/></td>
					<td><s:property value="#pzxx.nzjbxx.qq"/></td>
					<td>
						<y:EnumLabel enumName="NZFZZT" value="${pzxx.nzjbxx.nzfzzt.zt}" />
						(<s:if test="#pzxx.nzjbxx.nzfzzt!=null">
							<s:property value="#pzxx.nzjbxx.nzfzzt.day"/>天
						</s:if>
						<s:else>
							0天
						</s:else>)
					</td>
					<%/*<td>
						<s:if test="#pzxx.nzjbxx.nzfzzt!=null">
							<s:property value="#pzxx.nzjbxx.nzfzzt.day"/>天
						</s:if>
						<s:else>
							0天
						</s:else>
					</td>*/%>
					<td><s:property value="#pzxx.djbh"/></td>
					<td><s:property value="#pzxx.djlx"/></td>
					<td>
						<a title="修改" onclick="edit('<s:property value="#pzxx.xh"/>')" class="fa fa-edit cr-p">修改</a>
						<a title="删除" id="comsubmit_delete" promptInfo='确认删除该条配种信息吗？' callfunction=",deleteDone," url="${pageContext.request.contextPath}/master/fzgl/pzdj!delete.action?id=<s:property value="#pzxx.xh"/>" class="fa fa-remove cr-p">删除</a>
						<s:if test="#pzxx.nzjbxx.nzfzzt!=null && #pzxx.nzjbxx.nzfzzt.zt==0">
							<a title="初检" onclick="chujian('<s:property value="#pzxx.xh"/>')" class="fa fa-medkit cr-p">初检</a>
						</s:if>
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
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/fzgl/pzdj.action?p=${pageNowNum-1}${searchString}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/fzgl/pzdj.action?p=${pageIndex}${searchString}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/fzgl/pzdj.action?p=${pageNowNum+1}${searchString}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</i:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YMask.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/import.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/export.js"></script>
     <script>
     	showmap("配种信息管理 > 牛只配种信息列表");
     	function search()
     	{
     		document.getElementById("frmSearch").submit();
     	}
     	
     	<%/*function add(){
     		window.location.href="${pageContext.request.contextPath}/admin/pages/fzgl/pzdj-add.jsp";
     	}*/%>
		
		function chujian(id)
		{
			window.location.href="${pageContext.request.contextPath}/master/fzgl/rjcj!addCj.action?id="+id;
		}
		
     	function edit(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/fzgl/pzdj!edit.action?id="+id;
     	}
     	
     	function deleteDone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.reload();
     		});
     	}
     </script>
  </body>
</html>