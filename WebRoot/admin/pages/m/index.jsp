<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mstyle.css">
  <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/timer.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/highcharts/highcharts.js"></script>
  <script type="text/javascript">
  
  </script>
  <title></title>
</head>
<body>
    <div class="header">
    	<div class="lights fl">
    		<div>
    			<img src="${pageContext.request.contextPath}/images/BallRed.png" class="device" width="48" height="48"/>
    			设备连接
    		</div>
    		<div>
    			<img src="${pageContext.request.contextPath}/images/BallGreen.png" class="wan" width="48" height="48"/>
    			网络连接
    		</div>
    	</div>
    	<div class="title fl">
    		北京创捷世纪科技有限公司
    	</div>
    	<div id="logo-time" class="timer fr"></div>
    	<script>
    		var myTimer=new timer("logo-time");
        	myTimer.start();
    	</script>
    	<div class="tel fr">
    		服务电话：010-51957160/13716205488
    	</div>
    </div>
   
    <div id="conotent" class="content">
  		<div id="chart" class="w025 fl">
  		</div>
  		<div id="info" class="w045 fl">
  			<div class="title1">牧场信息提示</div>
  			<ul class="ultable" style="margin:0px 10px;">
  				<li class="tc1 fl">序号</li>
  				<li class="tc1 fl">牛只编号</li>
  				<li class="tc1 fl">圈舍</li>
  				<li class="tc1 fl">胎次</li>
  				<li class="tc3 fl">时间</li>
  				<li class="tc1 fl">提示</li>
  				<li class="tc2 fl">最佳配种 </li>
  			</ul>
  			<div id="info-content" class="info-content">
  				<ul id="info-content-list" class="ultable" style="margin:0px 10px;">
	  				<%-- <li class="bline"><span class="tc1">1</span><span class="tc1">XN001</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li>
	  				<li class="bline"><span class="tc1">2</span><span class="tc1">XN002</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li>
	  				<li class="bline"><span class="tc1">3</span><span class="tc1">XN003</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li>
	  				<li class="bline msg-info"><span class="tc1">4</span><span class="tc1">XN004</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">疑似发情</span><span class="tc1"></span></li>
	  				<li class="bline"><span class="tc1">5</span><span class="tc1">XN005</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li>
	  				<li class="bline msg-info"><span class="tc1">6</span><span class="tc1">XN006</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">疑似发情</span><span class="tc1"></span></li>
	  				<li class="bline msg-error"><span class="tc1">7</span><span class="tc1">XN007</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">异常</span><span class="tc1"></span></li>
	  				<li class="bline msg-error"><span class="tc1">8</span><span class="tc1">XN008</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">异常</span><span class="tc1"></span></li>
	  				<li class="bline"><span class="tc1">9</span><span class="tc1">XN009</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li>
	  				<li class="bline"><span class="tc1">10</span><span class="tc1">XN010</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li>
	  				<li class="bline"><span class="tc1">11</span><span class="tc1">XN011</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li>
	  				<li class="bline"><span class="tc1">12</span><span class="tc1">XN012</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li>
	  				<li class="bline"><span class="tc1">13</span><span class="tc1">XN013</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li>
	  				<li class="bline"><span class="tc1">14</span><span class="tc1">XN014</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li>
	  				<li class="bline"><span class="tc1">15</span><span class="tc1">XN015</span><span class="tc1">南2</span><span class="tc1">0</span><span class="tc3">2016-2-19 10:12:23</span><span class="tc1">发情</span><span class="tc1"></span></li> --%>
	  			</ul>
  			</div>
  		</div>
  		<div id="device" class="w03 fl">
  			<div class="title1">设备监控信息</div>
  			<ul class="ultable" style="margin:0px 10px;">
  				<li class="tc1 fl">序号</li>
  				<li class="tc2 fl">牛只编号</li>
  				<li class="tc2 fl">计步器号</li>
  				<li class="tc2 fl">圈舍</li>
  				<li class="tc3 fl">状态</li>
  			</ul>
  			<div id="device-content" class="device-content">
  				<ul id="device-content-list" class="ultable" style="margin:0px 10px;">
	  				<%-- <li class="bline"><span class="tc1">1</span><span class="tc2">XN001</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">发情未配</span></li>
	  				<li class="bline"><span class="tc1">2</span><span class="tc2">XN002</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">已配</span></li>
	  				<li class="bline"><span class="tc1">3</span><span class="tc2">XN003</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">发情待确认</span></li>
	  				<li class="bline"><span class="tc1">4</span><span class="tc2">XN004</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">发情未配</span></li>
	  				<li class="bline"><span class="tc1">5</span><span class="tc2">XN005</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">监控中</span></li>
	  				<li class="bline"><span class="tc1">6</span><span class="tc2">XN006</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">发情未配</span></li>
	  				<li class="bline"><span class="tc1">7</span><span class="tc2">XN007</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">未发情</span></li>
	  				<li class="bline"><span class="tc1">8</span><span class="tc2">XN008</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">未发情</span></li>
	  				<li class="bline"><span class="tc1">9</span><span class="tc2">XN009</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">未发情</span></li>
	  				<li class="bline"><span class="tc1">10</span><span class="tc2">XN010</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">未发情</span></li>
	  				<li class="bline"><span class="tc1">11</span><span class="tc2">XN011</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">未发情</span></li>
	  				<li class="bline"><span class="tc1">12</span><span class="tc2">XN012</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">未发情</span></li>
	  				<li class="bline"><span class="tc1">13</span><span class="tc2">XN013</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">未发情</span></li>
	  				<li class="bline"><span class="tc1">14</span><span class="tc2">XN014</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">未发情</span></li>
	  				<li class="bline"><span class="tc1">15</span><span class="tc2">XN015</span><span class="tc2">3320</span><span class="tc2">南2</span><span class="tc3">未发情</span></li> --%>
	  			</ul>
  			</div>
  		</div>
  		<div style="clear:both;height:1px;"></div>
    </div>
    <div style="clear:both;height:1px;"></div>
    <div id="adpanel" class="ad">
    	<img class="ad-img" src="${pageContext.request.contextPath}/images/ad/gg1.jpg">
    	<img class="ad-img" src="${pageContext.request.contextPath}/images/ad/gg2.jpg">
    	<img class="ad-img" src="${pageContext.request.contextPath}/images/ad/gg1.jpg">
    </div>
    <div class="footer">
    	<div style="height:20%;"></div>
    	<span style="">授权企业：<s:property value="#session.uncxx.ncmc"/></span>
    	<span class="fr" style="margin-right:20px;">有<span id="count" style="color:#990033;margin:0px 3px;font-weight:bold">00000000</span>个牧场在使用本系统,有<span id="jbqcount" style="color:#990033;margin:0px 3px;font-weight:bold">00000000</span>个计步器正在服役。</span>
    </div>
    <script type="text/javascript">
    	var contentHeight=$("#conotent").height();
    	$("#chart").css("height",contentHeight);
    	$("#info").css("height",contentHeight);
    	$("#device").css("height",contentHeight);
    	
    	var adHeight=$("#adpanel").height();
    	$(".ad-img").css("height",adHeight);
    	$(".ad-img").css("width","33%");
    	
    	$.ajax({
			url:"${pageContext.request.contextPath}/info!count.action?t="+new Date().getTime(),
			type:"get",
			timeout:1200000,
			success:function(data){
				if(data)
				{
					var count=data["count"];
					if(count)
					{
						var countStr="";
						for(var i=0;i<8-count.length;i++)
							countStr+="0";
						countStr+=count;
						
						$("#count").html(countStr);
					}
				}
			}
		});
    	
    	
    	//图形
    	function createChart(data)
     	{
	     	$("#chart").highcharts({
	     		chart: {
	                plotBackgroundColor: null,
	                plotBorderWidth: null,
	                plotShadow: false
	            },
	            title: {
	                text: ''
	            },
	            plotOptions: {
	                pie: {
	                    allowPointSelect: false,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: true,
	                        /* formatter:function(){
	                        	return this.series;
	                        } */
	                        format:"{point.name}:{y}"
	                    },
	                    showInLegend: false
	                }
	            },
	            series: [{
	                type: 'pie',
	                name: '牛只数量',
	                data: data
	            }]
	     	});
     	}
    	
    	$.ajax({
     		url:"${pageContext.request.contextPath}/master/nzgl/nzxx!loadType.action?t="+new Date().getTime(),
      		type:"get",
          	dataType:"json",
     		success:function(data){
          		if(data)
          		{
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
						
						createChart(jsonData);
					}          			
          			else
          			{
          				alert(data["msg"]);
          			}
          		}	
        	}
     	});
    	
    	//加载数据
    	function loadDeviceInfo(){
    		$.ajax({
         		url:"${pageContext.request.contextPath}/m/m!device.action?t="+new Date().getTime(),
          		type:"get",
              	dataType:"json",
         		success:function(data){
              		if(data)
              		{
    					if(data["error"]==0)
    					{
    						var control=$("#device-content-list");
    						if(data["data"].length>0)control.html("");
    						for(var i=0,j=data["data"].length;i<j;i++){
    							var item = data["data"][i];
    							var html='<li class="bline"><span class="tc1">'+(i+1)+'</span><span class="tc2">'+item.nz+'</span><span class="tc2">'+item.num+'</span><span class="tc2">'+item.js+'</span><span class="tc3">'+item.zt+'</span></li>';
    							control.append(html);
    						}
    					}          			
              			else
              			{
              				alert(data["msg"]);
              			}
              		}	
            	}
         	});
    	}
    	
    	function loadInfo(){
    		$.ajax({
         		url:"${pageContext.request.contextPath}/m/m!info.action?t="+new Date().getTime(),
          		type:"get",
              	dataType:"json",
         		success:function(data){
              		if(data)
              		{
    					if(data["error"]==0)
    					{
    						var control=$("#info-content-list");
    						if(data["data"].length>0)control.html("");
    						for(var i=0,j=data["data"].length;i<j;i++){
    							var item = data["data"][i];
    							
    							var css="",msg="";
    							if(item.zt==0){
    								css="msg-info";
    								msg="疑似发情";
    							}else if(item.zt==1){
    								css="";
    								msg="已发情";
    							}else if(item.zt==2){
    								css="";
    								msg="未发情";
    							}
    							
    							var html='<li class="bline '+css+'"><span class="tc1">'+(i+1)+'</span><span class="tc1">'+item.nz+'</span><span class="tc1">'+item.js+'</span><span class="tc1">'+item.tc+'</span><span class="tc3">'+item.sj+'</span><span class="tc1">'+msg+'</span><span class="tc1">'+item.pz+'</span></li>';
    							control.append(html);
    						}
    					}          			
              			else
              			{
              				alert(data["msg"]);
              			}
              		}	
            	}
         	});
    	}
    	

    	loadDeviceInfo();
    	loadInfo();
    	
    	var loadDeviceTimer=setInterval(function(){
    		loadDeviceInfo();
    		loadInfo();
    	}, 1000*60);
    	
    	
    	//滚动
    	$(function() { 
			var $info = $("#info-content"); 
			var infoScrollTimer; 
			$info.hover(function() { 
				clearInterval(infoScrollTimer); 
			},function() { 
				infoScrollTimer = setInterval(function() { 
					scrollNews($info); 
				}, 2000); 
			}).trigger("mouseleave"); 
			
			var $device = $("#device-content"); 
			var deviceScrollTimer; 
			$device.hover(function() { 
				clearInterval(deviceScrollTimer); 
			},function() { 
				deviceScrollTimer = setInterval(function() { 
					scrollNews($device); 
				}, 3000); 
			}).trigger("mouseleave");
			
			function scrollNews(obj) { 
				var $self = obj.find("ul"); 
				
				if($self.find("li").length<15)return;
				
				var lineHeight = $self.find("li:first").height(); 
				$self.animate({ 
					"marginTop": -lineHeight + "px" 
				}, 600, function() { 
					$self.css({ 
						marginTop: 0 
					}).find("li:first").appendTo($self); 
				}); 
			} 
		})
    </script>
</body>

</html>
   
 