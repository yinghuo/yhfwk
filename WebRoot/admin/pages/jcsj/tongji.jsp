<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  		<tr>
     		<th></th>
       		<th colspan="2">本牧场(<s:property value="tjxx.zts"/>头)</th>
         	<th colspan="2">同规模牧场(<s:property value="stjxx.zts"/>头)</th>
         	<th></th>
   		</tr>
   		<tr>
   			<th>项目</th>
   			<th>数量</th>
   			<th>检出率（30日）</th>
   			<th>数量</th>
   			<th>检出率（30日）</th>
   			<th>改进方案</th>
   		</tr>
   		<tr>
   			<td>30日发情</td>
   			<td><s:property value="tjxx.fq30"/></td>
   			<td><s:property value="tjxx.fq30jcl"/>%</td>
   			<td>0</td>
   			<td>0%</td>
   			<td><a href="#" >详情</a></td>
   		</tr>
   		<tr>
   			<td>当日发情</td>
   			<td><s:property value="tjxx.fq1"/></td>
   			<td><s:property value="tjxx.fq1jcl"/>%</td>
   			<td>0</td>
   			<td>0%</td>
   			<td><a href="#" >详情</a></td>
   		</tr>
   		<tr>
   			<td>最后发情时间</td>
   			<td><s:date name="tjxx.fq0t" format="yyyy-MM-dd HH:mm:ss"/></td>
   			<td> -- </td>
   			<td>0</td>
   			<td> -- </td>
   			<td><a href="#" >详情</a></td>
   		</tr>
      </table>
      
  	<div style="height:20px;">&nbsp;</div>
  	
  	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  		<tr>
     		<th></th>
       		<th colspan="2">本牧场(<s:property value="tjxx.zts"/>头)</th>
         	<th colspan="2">同规模牧场(0头)</th>
         	<th></th>
   		</tr>
   		<tr>
   			<th>项目</th>
   			<th>数量</th>
   			<th>参配率（30日）</th>
   			<th>数量</th>
   			<th>参配率（30日）</th>
   			<th>改进方案</th>
   		</tr>
   		<tr>
   			<td>出生牛犊(30日)</td>
   			<td><s:property value="tjxx.cd30"/></td>
   			<td><s:property value="tjxx.cpl30"/>%</td>
   			<td>0</td>
   			<td>0%</td>
   			<td><a href="#" >详情</a></td>
   		</tr>
  	</table>
  	
  	<div style="height:20px;">&nbsp;</div>
  	
  	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  		<tr>
     		<th></th>
       		<th>本牧场(0头)</th><!-- 大育成牛+泌乳牛 -->
         	<th>同规模牧场(0头)</th>
   		</tr>
   		<tr>
   			<th>项目</th>
   			<th>数量</th>
   			<th>数量</th>
   		</tr>
   		<tr>
   			<td>上一日总产奶量</td>
   			<td>0 Kg</td><!-- 整个牛群总产量 -->
   			<td>0 Kg</td>
   		</tr>
   		<tr>
   			<td>单产状元</td>
   			<td>0 Kg</td><!-- 牛号+上一日总产量 -->
   			<td>0 Kg</td>
   		</tr>
  	</table>
  	
  	<script type="text/javascript">
  		showmap("我的基础数据> 统计信息");
  		
  	</script>
  </body>
</html>