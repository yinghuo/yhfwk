package org.chonger.service.other;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.other.District;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
/**
 * 行政区域编码业务管理类
 * 
 * @author Daniel
 * @create 2014-03-11 
 * @version 1.0
 */
public class DistrictManager {

	@Autowired
	private CommonDAO<District> dao;


	/**
	 * 获取全国的直辖市、省、自治区、计划单列市
	 * 
	 * @return
	 */
	public List<District> getAllProvince() {
		//
		List<District> resultLst = null;
		resultLst = dao
				.createQuery(
						"select model.code,model.name from District model where model.level='1'")
				.list();
		return resultLst;
	}

	public List<District> getCityByProvinceCode(String code) {
		List<District> resultLst = null;
		resultLst = dao.createQuery(
				"select model.code,model.name from District model where parent_code='"
						+ code + "'").list();
		return resultLst;
	}

}
