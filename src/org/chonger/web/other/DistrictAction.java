package org.chonger.web.other;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.other.District;
import org.chonger.service.other.DistrictManager;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

/** *
 * Title：行政区域编码 1.0
 * Description：行政区域编码 1.0
 * 
 * @fileName DistrictAction
 * @create 2014-03-11 
 * @author Daniel
 * @version 1.0
 */

@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results( { 
		@Result(name = "success", type = "json",params = { "root", "dictricts" }),
		@Result(name = "error", type = "json",params = { "root", "error" }),
		@Result(name = "test", location = "/demo/PageDemo.jsp")
})
public class DistrictAction extends ActionSupport  {
	@Autowired
	private DistrictManager manager;
	public void setManager(DistrictManager manager) {
		this.manager = manager;
	}
	
	private List<District> dictricts=new ArrayList<District>();
	public List<District> getDictricts() {
		return dictricts;
	}
	private Map<String,String> error=new LinkedHashMap<String,String>();
	public Map<String, String> getError() {
		return error;
	}

	/**
	 * 
	 * @return
	 */
	public String getAllProvince()
	{
		//http://localhost/trust/other/district!getAllProvince.action
		dictricts=manager.getAllProvince();
		return "success";
	}
	private String code;
	public void setCode(String code) {
		this.code = code;
	}
	public String getCityByProvinceId()
	{
		if(code.length()>=6)
		{
			dictricts=manager.getCityByProvinceCode(code);
		}
		return "success";
	}
}
