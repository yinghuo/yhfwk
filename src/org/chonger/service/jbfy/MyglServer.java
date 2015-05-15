package org.chonger.service.jbfy;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.jbfy.MYXX;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title MyglServer.java 免疫信息管理业务逻辑
* @package org.chonger.service.jbfy
* @author Daniel
* @create 2015-5-15 
 */
@Service
@Transactional
public class MyglServer {
	@Autowired
	private CommonDAO<MYXX> dao;
}
