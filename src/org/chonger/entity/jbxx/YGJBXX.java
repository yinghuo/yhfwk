package org.chonger.entity.jbxx;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 员工基本信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "ygxxb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class YGJBXX {
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "ygbh")
	private String ygbh;//员工编号
	
	@Column(name = "ygmc")
	private String ygmc;//员工名称
	
	@Column(name = "zjhm")
	private String zjhm;//证件号码
	
	@Column(name = "lxdh")
	private String lxdh;//联系电话
	
	@Column(name = "lxdz")
	private String lxdz;//联系地址
	
	@Column(name = "yglb")
	private String yglb;//员工类别
	
	@Column(name = "scbz")
	private int scbz;//删除标志
	
	@Column(name = "bz")
	private String bz;//备注

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public String getNcbh() {
		return ncbh;
	}

	public void setNcbh(String ncbh) {
		this.ncbh = ncbh;
	}

	public String getYgbh() {
		return ygbh;
	}

	public void setYgbh(String ygbh) {
		this.ygbh = ygbh;
	}

	public String getYgmc() {
		return ygmc;
	}

	public void setYgmc(String ygmc) {
		this.ygmc = ygmc;
	}

	public String getZjhm() {
		return zjhm;
	}

	public void setZjhm(String zjhm) {
		this.zjhm = zjhm;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getLxdz() {
		return lxdz;
	}

	public void setLxdz(String lxdz) {
		this.lxdz = lxdz;
	}

	public String getYglb() {
		return yglb;
	}

	public void setYglb(String yglb) {
		this.yglb = yglb;
	}

	public int getScbz() {
		return scbz;
	}

	public void setScbz(int scbz) {
		this.scbz = scbz;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
}
