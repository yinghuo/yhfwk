<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
 <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.SuperSlide.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/frame.js"></script>
  <script type="text/javascript">
  $(function(){
      $(".sideMenu").slide({
         titCell:"h3", 
         targetCell:"ul",
         defaultIndex:0, 
         effect:'slideDown', 
         delayTime:'500' , 
         trigger:'click', 
         triggerTime:'150', 
         defaultPlay:true, 
         returnDefault:false,
         easing:'easeInQuint',
         endFun:function(){
              scrollWW();
         }
       });
      $(window).resize(function() {
          scrollWW();
      });
  });
  
  function scrollWW(){
    if($(".side").height()<$(".sideMenu").height()){
       $(".scroll").show();
       var pos = $(".sideMenu ul:visible").position().top-38;
       $('.sideMenu').animate({top:-pos});
    }else{
       $(".scroll").hide();
       $('.sideMenu').animate({top:0});
       n=1;
    }
  } 

	var n=1;
	function menuScroll(num){
	  var Scroll = $('.sideMenu');
	  var ScrollP = $('.sideMenu').position();
	  /*alert(n);
	  alert(ScrollP.top);*/
	  if(num==1){
	     Scroll.animate({top:ScrollP.top-38});
	     n = n+1;
	  }else{
	    if (ScrollP.top > -38 && ScrollP.top != 0) { ScrollP.top = -38; }
	    if (ScrollP.top<0) {
	      Scroll.animate({top:38+ScrollP.top});
	    }else{
	      n=1;
	    }
	    if(n>1){
	      n = n-1;
	    }
	  }
	}
  </script>
  <title>欢迎使用牧场管理系统</title>
</head>
<body>
    <div class="top">
      <div id="top_t">
        <div id="logo" class="fl"></div>
        <div id="photo_info" class="fr">
          <div id="photo" class="fl">
            <a href="#"><img src="${pageContext.request.contextPath}/images/a.png" alt="" width="60" height="60"></a>
          </div>
          <div id="base_info" class="fr">
            <div class="help_info">
              <a href="1" id="hp">&nbsp;</a>
              <a href="2" id="gy">&nbsp;</a>
              <a href="3" id="out">&nbsp;</a>
            </div>
            <div class="info_center">
              admin
              <span id="nt">通知</span><span><a href="#" id="notice">3</a></span>
            </div>
          </div>
        </div>
      </div>
      <div id="side_here">
        <div id="side_here_l" class="fl"></div>
        <div id="here_area" class="fl">当前位置：<span id="NavMap"></span></div>
      </div>
    </div>
    <div class="side">
        <div class="sideMenu" style="margin:0 auto">
          <h3>基础数据</h3>
          <ul>
            <li class="on" url="/master/ncgl/ncgl.action">牧场信息管理</li>
            <li url="/master/jsgl/jsgl.action">圈舍信息管理</li>
          </ul>
          <h3>牛只管理</h3>
          <ul>
            <li url="/master/nzgl/nzxx.action">牛只信息管理</li>
            <li url="/master/nzgl/zsxx.action">转舍记录查询</li>
            <li>离场记录查询</li>
          </ul>
          <h3>发情管理</h3>
          <ul>
            <li>发情信息管理</li>
          </ul>
          <h3>繁殖管理</h3>
          <ul>
            <li>发情登记</li>
            <li>配种登记</li>
            <li>妊检登记</li>
            <li url="/master/fzgl/cddj.action">产犊登记</li>
            <li>流产登记</li>
          </ul>
          <h3>产奶登记</h3>
          <ul>
            <li>个体产奶登记</li>
          </ul>
          <h3>兽医保健</h3>
          <ul>
            <li>疾病等级</li>
          </ul>
       </div>
    </div>
    <div class="main">
       <iframe name="right" id="rightMain" src="" frameborder="no" scrolling="auto" width="100%" height="auto" allowtransparency="true"></iframe>
    </div>
    <div class="bottom">
      <div id="bottom_bg" style="text-align:left;padding-left:10px;">版权</div>
    </div>
    <div class="scroll">
          <a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(1);"></a>
          <a href="javascript:;" class="next" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(2);"></a>
    </div>
    <script>
		$(".sideMenu ul li").on("click",function(){
			var page=$(this).attr("url");
			var url="";
			if(typeof(page)!="undefined")
			{
				url="http://"+document.domain+"${pageContext.request.contextPath}"+page;
			}
			else
			{
				url="http://"+document.domain+"${pageContext.request.contextPath}/admin/pages/nopage.jsp";
			}
			$("#rightMain").attr("src",url);
			//css
			$(".sideMenu ul li").removeClass("on");
			$(this).addClass("on");
		});
		//触发
		$(".on").trigger("click");
    </script>
</body>

</html>
   
 