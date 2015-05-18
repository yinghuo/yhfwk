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
 * 妊检初检信息实体类
 * 
 * @author Daniel
 * @create 2015-05-18
 * @version 1.0
 */
@Entity
@Table(name = "rjcjdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class RJCJXX {
	
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "cjrq")
	private Date cjrq;//初检日期
	
	@Column(name = "cjjg")	
	private int cjjg;//初检结果，已孕、未孕、待查
	
	@Column(name = "cjy")
	private String cjy;//初检员
	
	@Column(name = "cjfs")
	private int cjfs;//直肠、孕酮、超声、其他
	
	@Column(name = "bz")
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

	public Date getCjrq() {
		return cjrq;
	}

	public void setCjrq(Date cjrq) {
		this.cjrq = cjrq;
	}

	public int getCjjg() {
		return cjjg;
	}

	public void setCjjg(int cjjg) {
		this.cjjg = cjjg;
	}

	public String getCjy() {
		return cjy;
	}

	public void setCjy(String cjy) {
		this.cjy = cjy;
	}

	public int getCjfs() {
		return cjfs;
	}

	public void setCjfs(int cjfs) {
		this.cjfs = cjfs;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
	
	
}

