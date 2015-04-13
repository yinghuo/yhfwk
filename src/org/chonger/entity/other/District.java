package org.chonger.entity.other;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "district")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
/**
 * 行政区域编码的实体类
 * 
 * @author Daniel
 * @create 2014-03-11 
 * @version 1.0
 */
public class District {
	@Id
	@Column(name = "code")
	private String code;
	@Column(name = "region")
	private int regionid;
	@Column(name = "name")
	private String name;
	@Column(name = "parent_code")
	private String parent_code;
	@Column(name = "x_location")
	private String x_location;
	@Column(name = "y_location")
	private String y_location;
	@Column(name = "level")
	private int level;
	@Column(name = "remark")
	private String remark;
	@Column(name = "type")
	private int type;
	@Column(name = "show")
	private int show;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getShow() {
		return show;
	}

	public void setShow(int show) {
		this.show = show;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParent_code() {
		return parent_code;
	}

	public void setParent_code(String parent_code) {
		this.parent_code = parent_code;
	}

	public String getX_location() {
		return x_location;
	}

	public void setX_location(String x_location) {
		this.x_location = x_location;
	}

	public String getY_location() {
		return y_location;
	}

	public void setY_location(String y_location) {
		this.y_location = y_location;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getRegionid() {
		return regionid;
	}

	public void setRegionid(int regionid) {
		this.regionid = regionid;
	}
}
