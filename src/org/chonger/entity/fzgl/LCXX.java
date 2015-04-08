package org.chonger.entity.fzgl;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 流产信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "lcdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class LCXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "lcrq")
	private Date lcrq;//流产日期
	
	@Column(name = "lcyy")
	private String lcyy;//流产原因
	
	@Column(name = "telx")
	private String telx;//胎儿类型
	
	@Column(name = "fxr")
	private String fxr;//发现人
	
	@Column(name = "fxfs")
	private String fxfs;//发现方式
	
	@Column(name = "hsr")
	private String hsr;//核实人
	
	@Column(name = "lczr")
	private String lczr;//流产证人
	
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

	public Date getLcrq() {
		return lcrq;
	}

	public void setLcrq(Date lcrq) {
		this.lcrq = lcrq;
	}

	public String getLcyy() {
		return lcyy;
	}

	public void setLcyy(String lcyy) {
		this.lcyy = lcyy;
	}

	public String getTelx() {
		return telx;
	}

	public void setTelx(String telx) {
		this.telx = telx;
	}

	public String getFxr() {
		return fxr;
	}

	public void setFxr(String fxr) {
		this.fxr = fxr;
	}

	public String getFxfs() {
		return fxfs;
	}

	public void setFxfs(String fxfs) {
		this.fxfs = fxfs;
	}

	public String getHsr() {
		return hsr;
	}

	public void setHsr(String hsr) {
		this.hsr = hsr;
	}

	public String getLczr() {
		return lczr;
	}

	public void setLczr(String lczr) {
		this.lczr = lczr;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
}
