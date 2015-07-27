<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/highcharts/highcharts.js"></script>
  </head>
  <body>
 	
 	<div id="charA" style="float:left;margin-top:20px;"></div>
 	
 	<div id="listA" style="float:left;margin-left:10px;margin-top:20px;">
 		
 	</div>
 	
 	<div style="float:left;margin-left:50px;margin-top:20px;">
 		<h3>牛群繁殖信息</h3>
 		<table style="margin-top:10px">
 			<tr>
 				<td class="ta-r">成母牛总数：</td>
 				<td id="a">0 头</td>
 			</tr>
 			<tr>
 				<td class="ta-r">泌乳牛数：</td>
 				<td id="m">0 头</td>
 			</tr>
 			<tr>
 				<td class="ta-r">干奶牛数：</td>
 				<td id="g">0 头</td>
 			</tr>
 		</table>
 	</div>
 	<script type="text/javascript">
     	showmap("我的基础数据> 牛群概貌");
     	
     	var jsonData=new Array();
     	
     	/*jsonData[0]=new Array();
     	jsonData[0][0]="哺乳犊牛";
     	jsonData[0][1]=20;
     	jsonData[1]=new Array();
     	jsonData[1][0]="断奶犊牛";
     	jsonData[1][1]=10;*/
     	
     	//"[['哺乳犊牛',20],['断奶犊牛',10],['育成牛',30]]"
     	
     	var chartA;     	
     	function createChart(data)
     	{
	     	$("#charA").highcharts({
	     		chart: {
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: '我的所有牛只总览'
	            },
	            tooltip: {
	        	    pointFormat: '{series.name}: <b>{point.y}头</b>'
	            },
	            plotOptions: {
	                pie: {
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: false
	                    },
	                    showInLegend: true
	                }
	            },
	            series: [{
	                type: 'pie',
	                name: '牛只数量',
	                data: data
	            }]
	     	});
     	}
     	
     	function createList(icount, data,tcount)
     	{
     		var str = "<h3>牛群状况</h3><table style='margin-top:10px'>";
     		var str_table = "";
     		var iZNS = 0;
     		for(var i=0;i<data.length;i++)
			{
     			str_table += "<tr><td class='ta-r'>"+data[i][0]+"：</td><td class='ta-r'>"+data[i][1]+" 头</td></tr>";
     			iZNS = iZNS + data[i][1];
			}
     		str += "<tr><td class='ta-r'>存栏总数：</td><td class='ta-r'>"+icount+" 头</td></tr>";
     		str += str_table;
     		str += "<tr><td class='ta-r'>淘汰牛只：</td><td class='ta-r'>"+tcount+" 头</td></tr>";
     		str += "</table>";
     		document.getElementById("listA").innerHTML = str;
     	}
     	
     	$.ajax({
     		url:"${pageContext.request.contextPath}/master/nzgl/nzxx!loadType.action?t="+new Date().getTime(),
      		type:"get",
          	dataType:"json",
     		success:function(data){
          		if(data)
          		{
          			//data=JSON.parse(data);
          			
					if(data["error"]==0)
					{
						var iCount = 0;
						iCount = data["icount"];
						var tcount=data["tcount"];
						//遍历列表
						data=data["data"];
						jsonData=new Array();
						for(var i=0;i<data.length;i++)
						{
							jsonData[i]=new Array();
							jsonData[i][0]=data[i][0];
							jsonData[i][1]=data[i][1];
						}
						
						createList(iCount, jsonData,tcount);
						createChart(jsonData);
					}          			
          			else
          			{
          				alert(data["msg"]);
          			}
          		}	
        	}
     	});
     	
     	$.ajax({
     		url:"${pageContext.request.contextPath}/master/nzgl/nzxx!loadCount.action?t="+new Date().getTime(),
       		type:"get",
       		dataType:"json",
     		success:function(data){
          		if(data)
          		{
          			if(data["error"]==0)
					{
						$("#a").html(data["a"]+" 头");
						$("#m").html(data["m"]+" 头");
						$("#g").html(data["g"]+" 头");
					}
          		}
          	}
          });
     	
    </script>
    <!-- [
                    ['哺乳犊牛',20],
                    ['断奶犊牛',10],
                    {
                        name: '育成牛',
                        y: 30,
                        sliced: true,
                        selected: true
                    },
                    ['青年牛',   13],
                    ['泌乳牛',     15],
                    ['干奶牛',   17],
                    ['留养公牛',   8] -->
  </body>
 </html>
