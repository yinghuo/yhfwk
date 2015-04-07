<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--生产验证码图片-->
 <%@ page contentType="image/jpeg" %>
 <%@ page import="java.awt.*" %>
  <%@ page import="javax.imageio.*" %>
  <%@ page import="java.awt.image.*" %>
  <%@ page import="javax.servlet.http.*"%>
<jsp:useBean id="image" scope="page" class="com.legendshop.business.makeCertPic" />   
　　<%
  String str=image.getCertPic(0,0,response.getOutputStream());
  session.setAttribute("certCode", str);
   out.clear();
 out = pageContext.pushBody(); 
 %>   			
