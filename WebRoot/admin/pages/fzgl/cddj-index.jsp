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
	          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/fzgl/cddj.action" method="post">
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
	          			<input type="button" name="button" onClick="add()" class="btn btn82 btn_add" value="新增">
	          			<div class="fileButton" style="display:inline;">
	          				<form id="importform" style="display:inline;" action="${pageContext.request.contextPath}/master/data/import.action" method='post' enctype='multipart/form-data'>
			          			<input type="button" class="btn btn82 btn_export" value="导入">
			          			<input type="hidden" name="fileType" value="10">
			          			<input id="imgfile" class="fileInput cr-p" accept=".xlsx,.xls" type="file" name="upfile">
		          			</form>
	          			</div>
	          			<input type="button" name="button" data="10" onClick="dataExport()" class="btn btn82 btn_export" value="导出">
	          		</div>
	         </div>
	</div>
	<div class="box span10 oh mt5">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
				<thead>
					<tr>
						<th>牛只编号</th>
						<!-- <th>配种时间</th>  -->
						<th>编号（公牛号）</th>
						<th>泌乳状态</th>
						<th>产犊时间</th>
						<th>产犊类型</th>
						<th>产犊难易</th>
						<th>胎位</th>
						<th>胎儿数量</th>
						<th width="200">操作</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="cdlist" status="status" id="cdxx">
						<tr>
							<td><s:property value="#cdxx.nzjbxx.nzbh"/></td>
							<%/* <td>
								<s:if test="#cdxx.nzjbxx.nzfzzt!=null">
									<s:date name="#cdxx.nzjbxx.nzfzzt.sj" format="yyyy-MM-dd"/>
								</s:if>
								<s:else>
									 -- 
								</s:else>
							</td>*/%>
							<td></td>
							<td>
								<s:if test="#cdxx.nzjbxx.nzmrzt!=null">
									<y:EnumLabel enumName="NZMRZT" value="${cdxx.nzjbxx.nzmrzt.zt}" />
								</s:if>
								<s:else>
									 -- 
								</s:else>		
							</td>
							
							<td><s:date name="#cdxx.cdsj" format="yyyy年MM月dd日"/></td>
							<td><s:property value="#cdxx.cdlx"/></td>
							<td><y:EnumLabel enumName="CDNYCD" value="${cdxx.cdny}"/></td>
							<td><y:EnumLabel enumName="CDTW" value="${cdxx.tw}"/></td>
							<td><s:property value="#cdxx.tesl"/></td>
							<td>
								<a onclick="edit('<s:property value="#cdxx.xh"/>')" class="fa fa-edit cr-p">修改</a>
								<a title="删除" id="comsubmit_delete" promptInfo='确认删除该条产犊信息吗？' callfunction=",deleteDone," url="${pageContext.request.contextPath}/master/fzgl/cddj!delete.action?id=<s:property value="#cdxx.xh"/>" class="fa fa-remove cr-p">删除</a>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<div class="page mt10 fr pr10">
         	<div class="pagination">
            	<ul>
            		<i:Page page="pager" count="9">
            			<s:if test="#attr.IsFirst">
							<li class="first-child disabled"><span>上一页</span></li>
						</s:if>
						<s:else>
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/fzgl/cddj.action?page=${pageNowNum-1}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/fzgl/cddj.action?page=${pageIndex}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/fzgl/cddj.action?page=${pageNowNum+1}">下一页</a></li>
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
     	showmap("产犊信息管理 > 产犊信息列表");
     	function search()
     	{
     		document.getElementById("frmSearch").submit();
     	}
     	
     	function add()
     	{
     		window.location.href="${pageContext.request.contextPath}/admin/pages/fzgl/cddj-add.jsp";
     	}
     	
     	function edit(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/fzgl/cddj!edit.action?id="+id;
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