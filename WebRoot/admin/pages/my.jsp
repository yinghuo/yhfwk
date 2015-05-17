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
 	
 	<script type="text/javascript">
     	showmap("我的基础数据> 牛群概貌");
     	
     	var chartA;
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
                data: [
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
                    ['留养公牛',   8]
                ]
            }]
     	});
     	
    </script>
  </body>
 </html>
