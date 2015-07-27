<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
 <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.SuperSlide.js"></script>
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
	
	function endShow(value)
	{
		$("#NavMap").html(value);
	}
	
	function selectMenu(id)
	{
		$(".sideMenu ul li").removeClass("on");
		$("#"+id).addClass("on");
	}
	function logout()
	{
		$.ajax({
			url:"${pageContext.request.contextPath}/login!logout.action?t="+new Date().getTime(),
			type:"get",
			success:function(data){
				window.location.href="${pageContext.request.contextPath}";
			}
		});
	}
	
	function about()
	{
		$("#rightMain").attr("src","about.jsp");
		$(".sideMenu ul li").removeClass("on");
	}
	
	function me()
	{
		$("#rightMain").attr("src","profile.jsp");
		$(".sideMenu ul li").removeClass("on");
	}
	
  </script>
  <title>欢迎使用智能云牧场管理系统</title>
</head>
<body>
    <div class="top">
      <div id="top_t">
        <div id="logo" class="fl">
        	
        </div>
        <div id="photo_info" class="fr">
          <div id="photo" class="fl">
            <a href="#" onclick="me()"><img src="${pageContext.request.contextPath}/images/a.png" alt="" width="60" height="60"></a>
          </div>
          <div id="base_info" class="fr">
            <div class="help_info">
              <a href="#" id="hp">&nbsp;</a>
              <a href="#" onclick="about()" id="gy">&nbsp;</a>
              <a href="#" onclick="logout()" id="out">&nbsp;</a>
            </div>
            <div class="info_center">
              <s:property value="#session.urole"/>
              <span id="nt">通知</span><span><a href="#" id="notice">0</a></span>
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
        <s:iterator value="#session._sys_mymenus" id="element" status="st">
        	<h3><s:property value="mname"></s:property></h3>
        	<ul>
        		<s:iterator value="child" id="child" status="stchild">
        			<li id="<s:property value="mid"></s:property>" url="<s:property value="maction"></s:property>"><s:property value="mname"></s:property></li>
        		</s:iterator>
        	</ul>
        </s:iterator>
       </div>
    </div>
    <div class="main">
       <iframe name="right" id="rightMain" src="" frameborder="no" scrolling="auto" width="100%" height="auto" allowtransparency="true"></iframe>
    </div>
    <div class="bottom">
      <div id="bottom_bg" style="text-align:left;padding-left:10px;">系统授权企业牧场：<s:property value="#session.uncxx.ncmc"/></div>
    </div>
    <div class="scroll">
          <a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(1);"></a>
          <a href="javascript:;" class="next" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(2);"></a>
    </div>
    <script>
    	var first=$(".sideMenu ul li").get(0);
    	$(first).addClass("on");
		$(".sideMenu ul li").on("click",function(){
			var page=$(this).attr("url");
			var url="";
			if(typeof(page)!="undefined"&&page!=""&&page!="#")
			{
				url="http://"+window.location.host+"${pageContext.request.contextPath}"+page;
			}
			else
			{
				url="http://"+window.location.host+"${pageContext.request.contextPath}/admin/pages/nopage.jsp";
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
   
 