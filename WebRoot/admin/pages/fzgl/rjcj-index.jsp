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
	          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/fzgl/rjcj.action" method="post">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>牛只编号：</td>
	          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="30"></td>
	          				<td>耳标编号：</td>
	          				<td><input id="eb" type="text" name="eb" class="input-text lh25" value="${eb}" size="30"></td>
	          				<td>妊检结果：</td>
	          				<td>
	          					<select id="cjjg" name="rj.cjjg" class="select" >
									<option value="">所有结果</option>
									<y:EnumValues value="${rj.cjjg}" enumName="CJJG">
										<option value="${value}" ${selected}>${label}</option>
									</y:EnumValues>
								</select>
	          				</td>
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
			          			<input type="hidden" name="fileType" value="7">
			          			<input id="imgfile" class="fileInput cr-p" accept=".xlsx,.xls" type="file" name="upfile">
		          			</form>
	          			</div>
	          			<input type="button" name="button" data="7" onClick="dataExport()" class="btn btn82 btn_export" value="导出">
	          		</div>
	         </div>
	</div>
  	<div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
              	<th width="200">牛只编号</th>
              	<th>最近配种时间</th>
              	<th>编号(公牛号)</th>
              	<th>繁殖状态</th><!-- 泌乳状态 -->
              	<th>预产日期</th>
              	<th>妊检1</th><!-- 默认计算初检日期， -->
              	<th>结果</th><!-- 已孕 未孕 -->
              	<th>妊检2</th>
              	<th>结果</th><!-- 有胎 无胎 -->
              	<th>妊检3</th>
              	<th>结果</th><!-- 有胎 无胎 -->
              	<th>备注</th>
         	</tr>
         	<s:iterator value="rjlist" status="status" id="rjcj">
						<tr id="r-${status.index}">
							<td><s:property value="#rjcj.nzjbxx.nzbh"/></td>							
							<td>
								<s:if test="#rjcj.nzjbxx.nzfzzt!=null">
									<s:date name="#rjcj.nzjbxx.nzfzzt.sj" format="yyyy-MM-dd"/>
								</s:if>
								<s:else>
									 -- 
								</s:else>
							</td>
							<td> -- </td>
							<td><y:EnumLabel enumName="NZFZZT" value="${rjcj.nzjbxx.nzfzzt.zt}" /></td>
							<td>
								<s:if test="#rjcj.nzjbxx.nzfzzt!=null&&(#rjcj.nzjbxx.nzfzzt.zt==1||#rjcj.nzjbxx.nzfzzt.zt==2)">
									<s:date name="#rjcj.nzjbxx.nzfzzt.tssj" format="yyyy-MM-dd"/>
								</s:if>
								<s:else>
									 -- 
								</s:else>
							</td>
							<td><s:date name="#rjcj.cjrq" format="yyyy年MM月dd日"/></td>
							<td><y:EnumLabel enumName="CJJG" value="${rjcj.cjjg}" /></td>
							<td>								
								<s:if test="#rjcj.rj2rq==null">
									<span id="rj2rq-${status.index}"></span>
									<a href="javascript:{}" onClick="WdatePicker({el:'rj2rq-${status.index}',dateFmt:'yyyy-MM-dd',onpicked:function(dp){picked(dp,'2-${status.index}');}})">选择日期</a>
								</s:if>
								<s:else>
									<s:date name="#rjcj.rj2rq" format="yyyy年MM月dd日"/>
								</s:else>
							</td>
							<td>
								<s:if test="#rjcj.rj2jg==-1">
									<form id="frm-${status.index}">
										<input type="hidden" name="id" value="${rjcj.xh}">
										<input id="2-${status.index}" type="hidden" name="rj.rj2rq" value="">
									</form>
									<a id="comsubmit_jc" name="frm-${status.index}" callfunction=",handlerDone," url="${pageContext.request.contextPath}/master/fzgl/rjcj!jc.action?t=2&v=0&r=${status.index}" href="javascript:{}">有胎</a>/
									<a id="comsubmit_jc" name="frm-${status.index}" callfunction=",handlerDone," url="${pageContext.request.contextPath}/master/fzgl/rjcj!jc.action?t=2&v=1&r=${status.index}" href="javascript:{}">无胎</a>
								</s:if>
								<s:else>
									<y:EnumLabel enumName="CJJG2" value="${rjcj.rj2jg}" />
								</s:else>								
							</td>
							<td>
								<s:if test="#rjcj.rj3rq==null">
									<span id="rj3rq-${status.index}"></span>
									<a href="javascript:{}" onClick="WdatePicker({el:'rj3rq-${status.index}',dateFmt:'yyyy-MM-dd',onpicked:function(dp){picked(dp,'3-${status.index}');}})">选择日期</a>
								</s:if>
								<s:else>
									<s:date name="#rjcj.rj3rq" format="yyyy年MM月dd日"/>
								</s:else>
							<td>
								<s:if test="#rjcj.rj3jg==-1">
									<form id="frm3-${status.index}">
										<input type="hidden" name="id" value="${rjcj.xh}">
										<input id="3-${status.index}" type="hidden" name="rj.rj3rq" value="">
									</form>
									<a id="comsubmit_jc" name="frm3-${status.index}" callfunction=",handlerDone," url="${pageContext.request.contextPath}/master/fzgl/rjcj!jc.action?t=3&v=0&r=${status.index}" href="javascript:{}">有胎</a>/
									<a id="comsubmit_jc" name="frm3-${status.index}" callfunction=",handlerDone," url="${pageContext.request.contextPath}/master/fzgl/rjcj!jc.action?t=3&v=1&r=${status.index}" href="javascript:{}">无胎</a>
								</s:if>
								<s:else>
									<y:EnumLabel enumName="CJJG2" value="${rjcj.rj3jg}" />
								</s:else>	
							</td>
							<td></td>
							<!-- <td>
								<a title="修改" onclick="edit('<s:property value="#rjcj.xh"/>')" class="fa fa-edit cr-p">修改</a>
								<a title="删除" id="comsubmit_delete" promptInfo='确认删除该条妊检信息吗？' callfunction=",deleteDone," url="${pageContext.request.contextPath}/master/fzgl/rjcj!delete.action?id=<s:property value="#rjcj.xh"/>" class="fa fa-remove cr-p">删除</a>
								<s:if test="#rjcj.nzjbxx.nzfzzt!=null && (#rjcj.nzjbxx.nzfzzt.zt==1||#rjcj.nzjbxx.nzfzzt.zt==2||#rjcj.nzjbxx.nzfzzt.zt==3)">
									<a title="复检" onclick="fujian('<s:property value="#rjcj.xh"/>')" class="fa fa-medkit cr-p">复检</a>
								</s:if>
							</td>
							 -->
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
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/fzgl/rjcj.action?p=${pageNowNum-1}${searchString}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/fzgl/rjcj.action?p=${pageIndex}${searchString}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/fzgl/rjcj.action?p=${pageNowNum+1}${searchString}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</i:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
  	 <script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YMask.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/import.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/export.js"></script>
     <script>
     	showmap("妊娠检查信息管理 > 牛只妊娠初检信息列表");
     	function search()
     	{
     		document.getElementById("frmSearch").submit();
     	}
     	
     	<%/*function add()
     	{
     		window.location.href="${pageContext.request.contextPath}/admin/pages/fzgl/rjcj-add.jsp";
     	}*/%>
     	
     	function fujian(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/fzgl/rjfj!addFj.action?id="+id;
     	}
     	
     	function edit(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/fzgl/rjcj!edit.action?id="+id;
     	}
     	
     	function deleteDone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.reload();
     		});
     	}
     	
     	function picked(dp,id)
     	{
     		$("#"+id).val(dp.cal.getDateStr());
     	}
     	
     	function handlerDone(data)
     	{
     		jsonResult(data,function(data){     			
     			if(data["error"]==0)
     			{
     				var rid=data["r"];
     				var tid=data["t"];
     				var row=document.getElementById("r-"+rid);
     				if(tid=="2")
     				{
     					row.cells[7].innerHTML=data["d"];
     					row.cells[8].innerHTML=data["v"];
     				}
     				else if(tid=="3")
     				{
     					row.cells[9].innerHTML=data["d"];
     					row.cells[10].innerHTML=data["v"];
     				}
     			}
     		});
     	}
     	
     </script>
  </body>
</html>