package org.chonger.entity.fzgl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 产犊登记信息实体类
 * 
 * @author Daniel
 * @create 2015-05-17
 * @version 1.0
 */
@Entity
@Table(name = "gndjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class GNDJXX {
	
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "gnrq")
	private Date gnrq;//干奶日期
	
	@Column(name = "gnff")
	private String gnff;//干奶方法
	
	@Column(name = "syyw")
	private String syyw;//使用药物
	
	@Column(name = "sy")
	private String sy;//兽医
	
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

	public String getNzbh() {
		return nzbh;
	}

	public void setNzbh(String nzbh) {
		this.nzbh = nzbh;
	}

	public Date getGnrq() {
		return gnrq;
	}

	public void setGnrq(Date gnrq) {
		this.gnrq = gnrq;
	}

	public String getGnff() {
		return gnff;
	}

	public void setGnff(String gnff) {
		this.gnff = gnff;
	}

	public String getSyyw() {
		return syyw;
	}

	public void setSyyw(String syyw) {
		this.syyw = syyw;
	}

	public String getSy() {
		return sy;
	}

	public void setSy(String sy) {
		this.sy = sy;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
	
}
