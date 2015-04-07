package org.chonger.utils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;

import com.opensymphony.xwork2.util.ValueStack;

/**
 * 翻页辅助
 * @author Daniel
 * @modify 2014-04-30@Daniel	1:添加当总页数为0时不显示分页。
 */
public class PageTag extends javax.servlet.jsp.tagext.TagSupport {
	
	private String page;//page对象名称
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	
	private int count=5;//页码每组个数
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		if(count<=0)
			count=5;
		this.count = count;
	}
	
	private int index=0;//当前页面定位
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	
	private RollPage pageObj=null;//实体对象
	
	@Override
	public int doEndTag() throws JspException {
		
		return Tag.EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		Object obj=null;
		ValueStack vs = (ValueStack)pageContext.getRequest().getAttribute("struts.valueStack"); 
		if(page.startsWith("#"))
			obj=pageContext.getSession().getAttribute(page.substring(1));
		else if(page.startsWith("%"))
		{			 
			obj=vs.findValue(page.substring(1));
		}
		else
			obj=pageContext.getRequest().getAttribute(page);
		
		if(obj!=null&&obj instanceof RollPage)
		{
			pageObj=(RollPage)obj;
			int pageNowPageNum=pageObj.getNowPageNum();
			int pageMaxPageNum=pageObj.getMaxPageNum();
			
			//如果无分页，则结束
			if(pageObj.getCount()==0)
				return Tag.SKIP_BODY;
				
			
			//属性
			pageContext.setAttribute("pageMaxNum", pageMaxPageNum);
			pageContext.setAttribute("pageNowNum", pageNowPageNum);
			pageContext.setAttribute("pageSize", pageObj.getPageSize());
			pageContext.setAttribute("dataCount", pageObj.getCount());
			pageContext.setAttribute("IsFirst", pageObj.getNowPageNum()==pageObj.getMinPageNum());
			pageContext.setAttribute("IsLast", pageObj.getNowPageNum()==pageObj.getMaxPageNum());
			
			
			//显示页码属性，对页码进行分组
			int gValue=pageMaxPageNum/count;
			int gValue1=pageMaxPageNum%count;
			if(gValue==0||(gValue==1&&gValue1==0))//不足
			{
				//刚好一组，定位无效
				pageContext.setAttribute("HasUpGroup", false);
				pageContext.setAttribute("HasDnGroup", false);
				pageContext.setAttribute("pageIndex", pageObj.getMinPageNum());
				pageContext.setAttribute("pageMaxIndex", pageMaxPageNum);
			}
			else
			{
				//依据定位计算分页
				// 3 0  1
				if(index<=0)index=count/2+count%2;//当前页居中显示
				
				if(pageNowPageNum-index<=0)//前无分组
					pageContext.setAttribute("HasUpGroup", false);
				else
					pageContext.setAttribute("HasUpGroup", true);
				
				if(pageNowPageNum+(count-index)>=pageMaxPageNum)//尾无分页
					pageContext.setAttribute("HasDnGroup", false);
				else
					pageContext.setAttribute("HasDnGroup", true);
				
				int beginIndex=pageNowPageNum-index+1;
				if(pageNowPageNum<=index)beginIndex=pageObj.getMinPageNum();
				if(pageNowPageNum+(count-index)>=pageMaxPageNum)beginIndex=pageMaxPageNum-count+1;
				pageContext.setAttribute("pageIndex",beginIndex);
				
				int endIndex=beginIndex+count-1;
				if(endIndex>=pageMaxPageNum)endIndex=pageMaxPageNum;
				pageContext.setAttribute("pageMaxIndex", endIndex);
			}
			
//			int minShowPageNum=count/2+count%2+1;
//			int maxShowPageNum=pageObj.getMaxPageNum()-(count/2);
//			
//			
//			if(minShowPageNum>=maxShowPageNum)//无分页
//			{
//				
//				
//			}
//			else//计算起始页
//			{
//				if(pageNowPageNum<=minShowPageNum)
//				{
//					pageContext.setAttribute("HasUpGroup", false);
//					pageContext.setAttribute("HasDnGroup", true);
//					pageContext.setAttribute("pageIndex", pageObj.getMinPageNum());
//					pageContext.setAttribute("pageMaxIndex",(pageObj.getMinPageNum()+count));
//				}
//				else if(pageNowPageNum>=maxShowPageNum)
//				{
//					pageContext.setAttribute("HasUpGroup", true);
//					pageContext.setAttribute("HasDnGroup", false);
//					pageContext.setAttribute("pageIndex", (maxShowPageNum-count));
//					pageContext.setAttribute("pageMaxIndex",pageMaxPageNum);
//				}
//				else
//				{
//					pageContext.setAttribute("HasUpGroup", true);
//					pageContext.setAttribute("HasDnGroup", true);
//					minShowPageNum=(pageNowPageNum-count/2);
//					pageContext.setAttribute("pageIndex",minShowPageNum );
//					pageContext.setAttribute("pageMaxIndex",(minShowPageNum+count));
//				}
//			}
			
//			pageContext.getRequest().setAttribute("pageMaxNum", pageObj.getMaxPageNum());
//			pageContext.getRequest().setAttribute("pageNowNum", pageObj.getNowPageNum());
//			pageContext.getRequest().setAttribute("pageSize", pageObj.getPageSize());
//			
//			pageContext.getRequest().setAttribute("IsFirst", pageObj.getNowPageNum()==pageObj.getMinPageNum());
//			//vs.setValue("IsFirst", pageObj.getNowPageNum()==pageObj.getMinPageNum());
//			pageContext.getRequest().setAttribute("IsLast", pageObj.getNowPageNum()==pageObj.getMaxPageNum());
			
		}
		else return Tag.SKIP_BODY;
		
		return Tag.EVAL_BODY_INCLUDE;
	}
	
	
}
