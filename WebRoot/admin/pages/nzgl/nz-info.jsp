<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="i" uri="http://open.yinghuo.info/form" %>
<%@ taglib prefix="y" uri="http://open.yinghuo.info/taglib/form"%>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YTab.js"></script>
  </head>
  <body>
		<div class="box">
			
			<table class="form_table pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
					<td class="td_right">所属圈舍：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.jsjbxx.jsmc}</div>
					</td>
					<td class="td_right">牛只类别：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">
								<y:EnumLabel value="${nz.lb}" enumName="NZLB"/>
							</div>
					</td>
					<td class="td_right">牛只品种：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.pz}</div>
					</td>
				</tr>
				<tr>
					<td class="td_right">出生日期：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px"><s:date name="nz.csrq" format="yyyy-MM-dd HH:mm"/></div>
					</td>
					<td class="td_right">牛只性别：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">
								<y:EnumLabel value="${nz.xb}" enumName="NZXB"/>
							</div>
					</td>
					<td class="td_right">月龄：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.yl}</div>
					</td>
					<td class="td_right">初生重：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.csz}</div>
					</td>
				</tr>
				<tr>
					<td class="td_right">入群类型：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">
								<y:EnumLabel value="${nz.rqlx}" enumName="NZRQLX"/>
							</div>
					</td>
					<td class="td_right">入群时间：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px"><s:date name="nz.rqsj" format="yyyy-MM-dd HH:mm"/></div>
					</td>
					<td class="td_right">胎次：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.tc}</div>
					</td>
					<td class="td_right">毛色：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.ms}</div>
					</td>
				</tr>
				
			</table>
		</div>
		<tab>
		<div class="box_border">
			<div class="box_top">
				<div class="box_top tab tab_title">
					<a class="ml10 pa5 cr-p activate" tab="fqjl">发情记录</a>
					<a class="ml10 pa5 cr-p" tab="pzjl">配种记录</a>
					<a class="ml10 pa5 cr-p" tab="cjjl">初检记录</a>
					<a class="ml10 pa5 cr-p" tab="fjjl">复检记录</a>
					<a class="ml10 pa5 cr-p" tab="lcjl">流产记录</a>
					<a class="ml10 pa5 cr-p" tab="cdjl">产犊记录</a>
					<a class="ml10 pa5 cr-p" tab="gnjl">干奶记录</a>
					<span class="ml10">|</span>
					<a class="ml10 pa5 cr-p" tab="cnjl">产奶记录</a>
					<span class="ml10">|</span>
					<a class="ml10 pa5 cr-p" tab="jbjl">疾病记录</a>
					<a class="ml10 pa5 cr-p" tab="myjl">免疫记录</a>
					<a class="ml10 pa5 cr-p" tab="jyjl">检疫记录</a>
					<a class="ml10 pa5 cr-p" tab="cqjl">驱虫记录</a>
					<a class="ml10 pa5 cr-p" tab="htxtjl">护蹄修蹄记录</a>
				</div>
			</div>
		</div>
		<div class="box span10 oh tab_content">
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="80">序号</th>
						<th width="120">发情时间</th>
						<th width="120">发情类型</th>
						<th width="120">发现方式</th>
						<th width="100">发现人</th>
						<th width="120">是否配种</th>
					</tr>
					<s:iterator value="nz.fqdjxxList" status="status" id="fqxx">
						<tr>
							<td>${status.count }</td>
							<td><s:date name="#fqxx.fqsj" format="yyyy年MM月dd日" /></td>
							<td><y:EnumLabel enumName="FQLX" value="${fqxx.fqlx}" /></td>
							<td><y:EnumLabel enumName="FXFS" value="${fqxx.fxfs}" /></td>
							<td><s:property value="#fqxx.fxr" /></td>
							<td><y:EnumLabel enumName="SFPZ" value="${fqxx.sfpz}" /></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="80">序号</th>
						<th width="120">发情时间</th>
						<th width="120">配种时间</th>
						<th width="120">冻精编号</th>
						<th width="120">冻精类型</th>
						<th width="100">配种员</th>
					</tr>
					<s:iterator value="nz.pzdjxxList" status="status" id="pzxx">
						<tr>
							<td>${status.count }</td>
							<td><s:date name="#pzxx.fqsj" format="yyyy年MM月dd日" /></td>
							<td><s:date name="#pzxx.pzsj" format="yyyy年MM月dd日" /></td>
							<td><s:property value="#pzxx.djbh" /></td>
							<td><s:property value="#pzxx.djlx" /></td>
							<td><s:property value="#pzxx.pzy" /></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<div class="tab-view">
				2
			</div>
			<div class="tab-view">
				3
			</div>
			<div class="tab-view">
				4
			</div>
		</div>
		</tab>
		<script>
     	showmap("牛只信息管理 > 牛只信息概览");
     </script>
  </body>
</html>