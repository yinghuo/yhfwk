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
			<%//发情信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="120">发情时间</th>
						<th width="120">发情类型</th>
						<th width="120">发现方式</th>
						<th width="100">发现人</th>
						<th width="120">是否配种</th>
					</tr>
					<s:iterator value="nz.fqdjxxList" status="status" id="fqxx">
						<tr>
							<td><s:date name="#fqxx.fqsj" format="yyyy年MM月dd日" /></td>
							<td><y:EnumLabel enumName="FQLX" value="${fqxx.fqlx}" /></td>
							<td><y:EnumLabel enumName="FXFS" value="${fqxx.fxfs}" /></td>
							<td><s:property value="#fqxx.fxr" /></td>
							<td><y:EnumLabel enumName="SFPZ" value="${fqxx.sfpz}" /></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<%//配种信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="120">发情时间</th>
						<th width="120">配种时间</th>
						<th width="120">冻精编号</th>
						<th width="120">冻精类型</th>
						<th width="100">配种员</th>
					</tr>
					<s:iterator value="nz.pzdjxxList" status="status" id="pzxx">
						<tr>
							<td><s:date name="#pzxx.fqsj" format="yyyy年MM月dd日" /></td>
							<td><s:date name="#pzxx.pzsj" format="yyyy年MM月dd日" /></td>
							<td><s:property value="#pzxx.djbh" /></td>
							<td><s:property value="#pzxx.djlx" /></td>
							<td><s:property value="#pzxx.pzy" /></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<%//初检信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="120">初检日期</th>
						<th width="120">初检结果</th>
						<th width="120">初检员</th>
						<th width="120">初检方式</th>
					</tr>
					<s:iterator value="nz.rjcjxxList" status="status" id="cjxx">
						<tr>
							<td><s:date name="#cjxx.cjrq" format="yyyy年MM月dd日" /></td>
							<td><y:EnumLabel enumName="CJJG" value="${cjxx.cjjg}" /></td>
							<td><s:property value="#cjxx.cjy"/></td>
							<td><y:EnumLabel enumName="CJFS" value="${cjxx.cjfs}" /></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<%//复检信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="120">复检日期</th>
						<th width="120">复检结果</th>
						<th width="120">复检员</th>
					</tr>
					<s:iterator value="nz.rjfjxxList" status="status" id="fjxx">
						<tr>
							<td><s:date name="#fjxx.fjrq" format="yyyy年MM月dd日" /></td>
							<td><s:property value="#fjxx.fjjg"/></td>
							<td><s:property value="#fjxx.fjy"/></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<%//流产信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="120">流产日期</th>
						<th width="120">流产原因</th>
						<th width="120">胎儿类型</th>
						<th width="200">发现人</th>
              			<th width="200">发现方式</th>
					</tr>
					<s:iterator value="nz.lcdjxxList" status="status" id="lcxx">
						<tr>
							<td><s:date name="#lcxx.lcrq" format="yyyy年MM月dd日" /></td>
							<td><s:property value="#lcxx.lcyy"/></td>
							<td><s:property value="#lcxx.telx"/></td>
							<td><s:property value="#lcxx.fxr"/></td>
							<td><s:property value="#lcxx.fxfs"/></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<%//产犊信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="120">产犊时间</th>
						<th width="120">产犊类型</th>
						<th width="120">产犊难易</th>
						<th width="200">胎位</th>
              			<th width="200">接产员</th>
              			<th width="200">胎儿数量</th>
					</tr>
					<s:iterator value="nz.cddjxxList" status="status" id="cdxx">
						<tr>
							<td><s:date name="#cdxx.cdsj" format="yyyy年MM月dd日" /></td>
							<td><s:property value="#cdxx.cdlx"/></td>
							<td><y:EnumLabel enumName="CDNYCD" value="${cdxx.cdny}"/></td>
							<td><y:EnumLabel enumName="CDTW" value="${cdxx.tw}"/></td>
							<td><s:property value="#cdxx.jcy"/></td>
							<td><s:property value="#cdxx.tesl"/></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<%//干奶信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="120">干奶日期</th>
						<th width="120">干奶方法</th>
						<th width="120">使用药物</th>
						<th width="200">兽医</th>
					</tr>
				</table>
			</div>
			<%//产奶信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="120">挤奶日期</th>
						<th width="120">早班产量</th>
						<th width="120">午班产量</th>
						<th width="200">晚班产量</th>
              			<th width="200">总产量</th>
					</tr>
					<s:iterator value="nz.gtcnxxList" status="status" id="cnxx">
						<tr>
							<td><s:date name="#cnxx.jnrq" format="yyyy年MM月dd日" /></td>
							<td><s:property value="#cnxx.scl"/></td>
							<td><s:property value="#cnxx.xcl"/></td>
							<td><s:property value="#cnxx.wcl"/></td>
							<td><s:property value="#cnxx.scl+#cnxx.xcl+#cnxx.wcl"/></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<%//疾病信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="200">发病日期</th>
		              	<th width="200">疾病种类</th>
		              	<th width="200">疾病名称</th>
		              	<th width="200">主要症状</th>
		              	<th width="200">发病原因</th>
		              	<th width="200">严重程度</th>
		              	<th width="200">处置情况</th>
		              	<th width="200">是否弃奶</th>
		              	<th width="200">兽医</th>
					</tr>
				</table>
			</div>
			<%//免疫信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="200">免疫日期</th>
						<th width="200">免疫项目</th>
						<th width="200">疫苗名称</th>
						<th width="200">使用剂量</th>
						<th width="200">批号</th>
						<th width="200">制造商</th>
						<th width="200">结果</th>
						<th width="200">兽医</th>
					</tr>
				</table>
			</div>
			<%//检疫信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="200">检疫日期</th>
						<th width="200">检疫月龄</th>
						<th width="200">检疫项目</th>
						<th width="200">疫苗名称</th>
						<th width="200">检疫类型</th>
						<th width="200">使用剂量</th>
						<th width="200">批号</th>
						<th width="200">制造商</th>
						<th width="200">结果</th>
						<th width="200">兽医</th>
					</tr>
				</table>
			</div>
			<%//驱虫信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="200">驱虫日期</th>
						<th width="200">驱虫方法</th>
						<th width="200">药物名称</th>
						<th width="200">使用剂量</th>
						<th width="200">批号</th>
						<th width="200">制造商</th>
						<th width="200">驱虫效果</th>
						<th width="200">兽医</th>
					</tr>
				</table>
			</div>
			<%//护蹄修蹄信息 %>
			<div class="tab-view">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
					<tr>
						<th width="200">修蹄日期</th>
						<th width="200">左前肢</th>
						<th width="200">左后肢</th>
						<th width="200">右前肢</th>
						<th width="200">右后肢</th>
						<th width="200">兽医</th>
					</tr>
				</table>
			</div>
		</div>
		</tab>
		<script>
     	showmap("牛只信息管理 > 牛只信息概览");
     </script>
  </body>
</html>