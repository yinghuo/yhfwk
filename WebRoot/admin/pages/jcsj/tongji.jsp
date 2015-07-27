<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  		<tr>
     		<th></th>
       		<th colspan="2">本牧场(5头)</th>
         	<th colspan="2">同规模牧场(5头)</th>
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
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   		</tr>
   		<tr>
   			<td>当日发情</td>
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   		</tr>
   		<tr>
   			<td>最后发情时间</td>
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   		</tr>
      </table>
      
  	<div style="height:20px;">&nbsp;</div>
  	
  	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  		<tr>
     		<th></th>
       		<th colspan="2">本牧场(5头)</th><!-- 大育成牛+泌乳牛 -->
         	<th colspan="2">同规模牧场(5头)</th>
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
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   			<td>1</td>
   		</tr>
  	</table>
  	
  	<div style="height:20px;">&nbsp;</div>
  	
  	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  		<tr>
     		<th></th>
       		<th>本牧场(5头)</th><!-- 大育成牛+泌乳牛 -->
         	<th>同规模牧场(5头)</th>
   		</tr>
   		<tr>
   			<th>项目</th>
   			<th>数量</th>
   			<th>数量</th>
   		</tr>
   		<tr>
   			<td>上一日总产奶量</td>
   			<td>整个牛群总产量</td>
   			<td>1</td>
   		</tr>
   		<tr>
   			<td>单产状元</td>
   			<td>牛号+上一天总产量</td>
   			<td>牛号+上一天总产量</td>
   		</tr>
  	</table>
  	
  	<script type="text/javascript">
  		showmap("我的基础数据> 统计信息");
  		
  	</script>
  </body>
</html>