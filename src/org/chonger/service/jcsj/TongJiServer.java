package org.chonger.service.jcsj;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NCTJXX;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title TongJiServer.java 护蹄修蹄信息管理业务逻辑
* @package org.chonger.service.jcsj
* @author Daniel
* @create 2015-7-25 
 */
@Service
@Transactional
public class TongJiServer {
	
	@Autowired
	private CommonDAO<NCTJXX> dao;
	
	/**
	 * 根据牛场序号获取牛场的统计信息
	 * @param ncxh
	 * @retrun NCTJXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NCTJXX getTjxx(String ncxh)
	{
		String hql="from NCTJXX model where model.ncxh = '"+ncxh+"'";
		List<NCTJXX> rlist=dao.find(hql);
		if(rlist!=null&&rlist.size()>0)
		{
			return rlist.get(0);
		}
		return null;
	}
	
	/**
	 * 查询参数牧场比较展示的牧场信息
	 * @param tjxx
	 * @retrun NCTJXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NCTJXX findSTjxx(NCTJXX tjxx)
	{
		//查找检出率和参配率都大于本牧场的信息
		String sql="from NCTJXX model where model.fq30jcl > '"+tjxx.getFq30jcl()+"' and model.cpl30 > '"+tjxx.getCpl30()+"'";
		return null;
	}
}
