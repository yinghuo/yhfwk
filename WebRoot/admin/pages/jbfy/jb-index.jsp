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
	        	<div class="box_top">
	          		<div class="box_top">	          		
	          			<b class="pl15">查询搜索</b>
	          		</div>
	          	</div>
	          	<div class="box_center pt5 pb5">
	          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/jbfy/jbxx.action" method="post">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>牛只编号：</td>
	          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="30"></td>
	          				<td>耳标编号：</td>
	          				<td><input id="" type="text" name="" class="input-text lh25" value="" size="30"></td>
	          			</tr>
	          		</table>
	          		</form>
	          	</div>	          	
	         </div>
	         <div class="pb5 pt5 pr10">
	          		<div class="search_bar_btn" style="text-align:right;">
	          			<input type="button" name="button" onClick="search()" class="btn btn82 btn_search" value="查询">
	          			<input type="button" name="button" onClick="add()" class="btn btn82 btn_add" value="新增">
	          		</div>
	         </div>
	 </div>
  	
  	<div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
             	<th width="80">序号</th>
              	<th width="200">牛只编号</th>
              	<th width="200">发病日期</th>
              	<th width="200">疾病种类</th>
              	<th width="200">疾病名称</th>
              	<th width="200">主要症状</th>
              	<th width="200">发病原因</th>
              	<th width="200">严重程度</th>
              	<th width="200">处置情况</th>
              	<th width="200">是否弃奶</th>
              	<th width="200">兽医</th>
              	<th width="200">操作</th>
         	</tr>
         	<s:iterator value="jblist" status="status" id="jb">
						<tr>
							<td>${status.count }</td>
							<td><s:property value="#jb.nzjbxx.nzbh"/></td>
							<td><s:date name="#jb.fbrq" format="yyyy年MM月dd日"/></td>
							<td><s:property value="#jb.jbzl"/></td>
							<td><s:property value="#jb.jbmc"/></td>
							<td><s:property value="#jb.zyzz"/></td>
							<td><s:property value="#jb.fbyy"/></td>
							<td><s:property value="#jb.yzcd"/></td>
							<td><s:property value="#jb.czqk"/></td>
							<td><y:EnumLabel enumName="SFPZ" value="${jb.fsqn}"/></td>
							<td><s:property value="#jb.sys"/></td>
							<td>
								<a title="修改" onclick="edit('<s:property value="#jb.xh"/>')" class="fa fa-edit cr-p">修改</a>
								<a title="删除" id="comsubmit_delete" promptInfo='确认删除该条发情信息吗？' callfunction=",deleteDone," url="${pageContext.request.contextPath}/master/jbfy/jbxx!delete.action?id=<s:property value="#jb.xh"/>" class="fa fa-remove cr-p">删除</a>
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
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/jbfy/jbxx.action?p=${pageNowNum-1}${searchString}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/jbfy/jbxx.action?p=${pageIndex}${searchString}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/jbfy/jbxx.action?p=${pageNowNum+1}${searchString}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</i:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
 	<script type="text/javascript">
     	showmap("疾病防疫管理 > 疾病登记列表");
     	function search()
     	{
     		document.getElementById("frmSearch").submit();
     	}
     	
     	function add()
     	{
     		window.location.href="${pageContext.request.contextPath}/admin/pages/jbfy/jb-add.jsp";
     	}
     	
     	function edit(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/jbfy/jbxx!edit.action?id="+id;
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
