<%@ page language="java" contentType="image/jpeg" import="java.util.*,java.awt.*,java.awt.image.*,java.io.*,javax.imageio.*" pageEncoding="UTF-8"%>
<%@page import="org.chonger.common.ConstantKey;"%>

<%

		int width = 80;
		int height = 40;
		
		String type=request.getParameter("type");
		String sessiongKey="";
		if("login".equals(type))sessiongKey=ConstantKey.LoginVcodeKey;
		else if("reg".equals(type))sessiongKey=ConstantKey.RegVcodeKey;
		else if("fg".equals(type))sessiongKey=ConstantKey.ForgetVcodeKey;
		response.setHeader("Pragma", "no-cache");
  		response.setHeader("Cache-Controll", "no-cache");
  		response.setIntHeader("Expires",0);
	  	
	  	BufferedImage bi = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
		Graphics g = bi.getGraphics();
		g.setColor(new Color(0XDCDCDC));
	  	g.fillRect(0,0,width,height);
		for(int i=0;i<20;i++){
		   int x=(int) (Math.random()*width);
		   int y=(int) (Math.random()*height);
		   int red=(int) (Math.random()*255);
		   int greed=(int) (Math.random()*255);		
		   int blue=(int) (Math.random()*255);
		   g.setColor(new Color(red,greed,blue));
		   g.drawOval(x, y, 1, 0);
		}
		String chars="0123456789abcdefghigklmnopqrstuvwxyz";
		char[] rands=new char[4];
		rands[0]=chars.charAt((int) (Math.random()*chars.length()));
  		rands[1]=chars.charAt((int) (Math.random()*chars.length()));
  		rands[2]=chars.charAt((int) (Math.random()*chars.length()));
  		rands[3]=chars.charAt((int) (Math.random()*chars.length()));
		g.setColor(Color.black);
		g.setFont(new Font(null,Font.ITALIC|Font.BOLD,18));
		g.drawString(" "+rands[0],3,25);
  		g.drawString(" "+rands[1],20,20);
  		g.drawString(" "+rands[2],35,24);
  		g.drawString(" "+rands[3],50,28);
		g.dispose(); 
		session.setAttribute(sessiongKey,""+rands[0]+rands[1]+rands[2]+rands[3]);
		OutputStream stream=response.getOutputStream();
		ImageIO.write(bi, "JPEG", stream); 
		stream.flush();
		stream.close();
		stream=null;
		response.flushBuffer();  
		out.clear();  
		out = pageContext.pushBody();  
 %>

