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
			
			<table class="form_table pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
					<td class="td_right">所属圈舍：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
					<td class="td_right">牛只类别：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
					<td class="td_right">牛只品种：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
				</tr>
				<tr>
					<td class="td_right">出生日期：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
					<td class="td_right">牛只性别：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
					<td class="td_right">月龄：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
					<td class="td_right">初生重：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
				</tr>
				<tr>
					<td class="td_right">入群类型：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
					<td class="td_right">入群时间：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
					<td class="td_right">胎次：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
					<td class="td_right">毛色：</td>
					<td class="">
							<div class="input-text lh30" style="width:150px">${nz.nzbh}</div>
					</td>
				</tr>
				
			</table>
			
			<div class="box_border">
				<div class="box_top">
					<div class="box_top tab">
						<span class="ml10 pa5 cr-p tab_title" tab="fqjl">发情记录</span>
						<span class="ml10 pa5 cr-p" tab="pzjl">配种记录</span>
						<span class="ml10 pa5 cr-p" tab="cjjl">初检记录</span>
						<span class="ml10 pa5 cr-p" tab="fjjl">复检记录</span>
						<span class="ml10 pa5 cr-p" tab="lcjl">流产记录</span>
						<span class="ml10 pa5 cr-p" tab="cdjl">产犊记录</span>
						<span class="ml10 pa5 cr-p" tab="gnjl">干奶记录</span>
						<span class="ml10">|</span>
						<span class="ml10 pa5 cr-p" tab="cnjl">产奶记录</span>
						<span class="ml10">|</span>
						<span class="ml10 pa5 cr-p" tab="jbjl">疾病记录</span>
						<span class="ml10 pa5 cr-p" tab="myjl">免疫记录</span>
						<span class="ml10 pa5 cr-p" tab="jyjl">检疫记录</span>
						<span class="ml10 pa5 cr-p" tab="cqjl">驱虫记录</span>
						<span class="ml10 pa5 cr-p" tab="htxtjl">护蹄修蹄记录</span>
					</div>
				</div>
			</div>
		</div>
		<div class="box span10 oh">
			<div >
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
		  	 		<tr>
		             	<th width="80">序号</th>
		              	<th width="120">牛只编号</th>
		              	<th width="120">所属圈舍</th>
		              	<th width="120">类别</th>
		              	<th width="100">状态</th>
		              	<th width="120">入群类型</th>
		              	<th width="120">出生日期</th>
		              	<th width="80">性别</th>
		              	<th width="200">操作</th>
		         	</tr>
		         </table>
			</div>
		</div>
		<script>
     	showmap("牛只信息管理 > 牛只信息概览");
     </script>
  </body>
</html>