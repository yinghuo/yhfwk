package org.chonger.entity.fzgl;

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
 * 妊检复检信息实体类
 * 
 * @author Daniel
 * @create 2015-05-18
 * @version 1.0
 */
@Entity
@Table(name = "rjfjdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class RJFJXX {
	
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "fjrq")
	private Date fjrq;//复检日期
	
	@Column(name = "fjjg")
	private String fjjg;//复检结果
	
	@Column(name = "fjy")
	private String fjy;//复检员
	
	@Column(name = "tezk")
	private String tezk;//胎儿状况
	
	@Column(name="nzxb")
	private int nzxb;//牛只性别
	
	@Column(name="bz")
	private String bz;//备注

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="nzbh",insertable = false, updatable = false)
	private NZJBXX nzjbxx;
	
	public NZJBXX getNzjbxx() {
		return nzjbxx;
	}

	public void setNzjbxx(NZJBXX nzjbxx) {
		this.nzjbxx = nzjbxx;
	}
	
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

	public Date getFjrq() {
		return fjrq;
	}

	public void setFjrq(Date fjrq) {
		this.fjrq = fjrq;
	}

	public String getFjjg() {
		return fjjg;
	}

	public void setFjjg(String fjjg) {
		this.fjjg = fjjg;
	}

	public String getFjy() {
		return fjy;
	}

	public void setFjy(String fjy) {
		this.fjy = fjy;
	}

	public String getTezk() {
		return tezk;
	}

	public void setTezk(String tezk) {
		this.tezk = tezk;
	}

	public int getNzxb() {
		return nzxb;
	}

	public void setNzxb(int nzxb) {
		this.nzxb = nzxb;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
	
	
}
