package org.chonger.utils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;
/**
 * 翻页页码辅助
 * @author Daniel
 *
 */
public class PageNumTag extends TagSupport {
	
	
	private int pageNum;
	private int pageIndex;
	private int pageMaxIndex;
	
	@Override
	public int doAfterBody() throws JspException {
		if(pageIndex<=pageMaxIndex){
			pageContext.setAttribute("pageIndex", pageIndex);
			pageContext.setAttribute("IsNow", pageIndex==pageNum);
			pageIndex++;
			return EVAL_BODY_AGAIN;
		}
		return Tag.SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		return Tag.EVAL_PAGE;
	}
	
	@Override
	public int doStartTag() throws JspException {
		//获取当前页面
		Object obj=pageContext.getAttribute("pageNowNum");
		if(obj==null)return Tag.SKIP_BODY;
		pageNum=Integer.parseInt(obj.toString());//获取当前页
		
		pageIndex=Integer.parseInt(pageContext.getAttribute("pageIndex").toString());
		pageMaxIndex=Integer.parseInt(pageContext.getAttribute("pageMaxIndex").toString());//获取最大页数

		pageContext.setAttribute("pageIndex", pageIndex);
		pageContext.setAttribute("IsNow", pageIndex==pageNum);
		pageIndex++;
		
		return Tag.EVAL_BODY_INCLUDE;
	}
	
}
