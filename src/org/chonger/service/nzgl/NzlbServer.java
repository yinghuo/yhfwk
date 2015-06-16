package org.chonger.service.nzgl;

import java.util.Date;
import java.util.List;

import org.chonger.common.ConstantEnum;
import org.chonger.common.ConstantEnum.NZLB;
import org.chonger.common.ConstantEnum.NZLBZT;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZLBXX;
import org.chonger.utils.DateTimeUtil;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 关于牛只类别的计算类
 * @author Daniel
 * @date Jun 1, 2015 4:32:31 PM
 * @version V1.0
 *
 */
@Service
@Transactional
public class NzlbServer {
	
	public static final int beginday=2;//默认提前两天发送
	
	@Autowired
	private NzxxServer nzServer;
	
	@Autowired
	private CommonDAO<NZLBXX> dao;
	
	/**
	 * 根据类型的编号获取类型信息
	 * @param id
	 * @retrun NZLBXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NZLBXX getNzlbxxById(String id)
	{
		List<NZLBXX> resultList=dao.find("from NZLBXX model where model.xh = '"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public void saveOrUpdate(NZLBXX lbxx,String nzxxId)
	{
		if(StringUtil.IsEmpty(lbxx.getXh()))
		{
			lbxx.setXh(nzxxId);
			dao.save(lbxx);
		}
		else
		{
			dao.saveOrUpdate(lbxx);
		}
	}
}
