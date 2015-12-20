package org.chonger.service.fqxt;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fqxt.FQKZQXX;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title KZQXXServer.java 控制器业务逻辑
* @package org.chonger.service.fqxt
* @author Daniel
* @create 2015-12-14 
 */
@Service
@Transactional
public class KZQXXServer {
	
	@Autowired
	private CommonDAO<FQKZQXX> dao;
	
	
}
