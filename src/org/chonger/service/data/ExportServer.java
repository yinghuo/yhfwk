package org.chonger.service.data;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title ExportServer.java 导出数据业务逻辑
* @package org.chonger.service.data
* @author Daniel
* @create 2015-5-19
 */
@Service
@Transactional
public class ExportServer {
	
	/**圈舍信息模板表头*/
	public static final String[] JSXXColumnNames=new String[]{"圈舍编号","圈舍名称","圈舍类型","备注信息"};
	/**员工信息模板表头*/
	public static final String[] YGXXColumnNames=new String[]{"员工编号","员工名称","员工类别","证件号码","联系电话","联系地址","备注信息"};
}
