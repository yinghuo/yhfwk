package org.chonger.entity.cngl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.chonger.entity.nqgl.NZJBXX;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 个体产奶信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "gtcndjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class GTCNXX {
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "jnrq")
	private Date jnrq;//挤奶日期
	
	@Column(name = "bc")
	private String bc;//班次
	
	@Column(name = "scl")
	private double scl=0;//上午产量
	
	@Column(name = "xcl")
	private double xcl=0;//下午产量
	
	@Column(name = "wcl")
	private double wcl=0;//晚上产量
	
	@Column(name = "rc")
	private double rc;//日产
	
	@Column(name="src")
	private double src;//上日产
	
	@Column(name = "ce")
	private double ce;//差额
	
	@Column(name = "bz")
	private String bz;//备注
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="nzbh",insertable = false, updatable = false)
	private NZJBXX nzjbxx;
	
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

	public Date getJnrq() {
		return jnrq;
	}

	public void setJnrq(Date jnrq) {
		this.jnrq = jnrq;
	}

	public String getBc() {
		return bc;
	}

	public void setBc(String bc) {
		this.bc = bc;
	}

	public double getScl() {
		return scl;
	}

	public void setScl(double scl) {
		this.scl = scl;
	}

	public double getXcl() {
		return xcl;
	}

	public void setXcl(double xcl) {
		this.xcl = xcl;
	}

	public double getWcl() {
		return wcl;
	}

	public void setWcl(double wcl) {
		this.wcl = wcl;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public NZJBXX getNzjbxx() {
		return nzjbxx;
	}

	public void setNzjbxx(NZJBXX nzjbxx) {
		this.nzjbxx = nzjbxx;
	}

	public double getRc() {
		return rc;
	}

	public void setRc(double rc) {
		this.rc = rc;
	}

	public double getCe() {
		return ce;
	}

	public void setCe(double ce) {
		this.ce = ce;
	}

	public double getSrc() {
		return src;
	}

	public void setSrc(double src) {
		this.src = src;
	}
	
}
