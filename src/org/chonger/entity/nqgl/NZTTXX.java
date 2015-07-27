package org.chonger.entity.nqgl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 牛只淘汰信息实体类
 * 
 * @author Daniel
 * @create 2015-07-25
 * @version 1.0
 */
@Entity
@Table(name = "nzttjdb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class NZTTXX {
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzxh")
	private String nzxh;//牛只编号
	
	@Column(name = "ttrq")
	private Date ttrq;//淘汰日期
	
	@Column(name = "ttyy")
	private String ttyy;//淘汰原因
	
	@Column(name = "jsr")
	private String jsr;//经手人
	
	@Column(name = "bz")
	private String bz;//备注
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "nzxh",insertable = false, updatable = false)
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

	public String getNzxh() {
		return nzxh;
	}

	public void setNzxh(String nzxh) {
		this.nzxh = nzxh;
	}

	public Date getTtrq() {
		return ttrq;
	}

	public void setTtrq(Date ttrq) {
		this.ttrq = ttrq;
	}

	public String getTtyy() {
		return ttyy;
	}

	public void setTtyy(String ttyy) {
		this.ttyy = ttyy;
	}

	public String getJsr() {
		return jsr;
	}

	public void setJsr(String jsr) {
		this.jsr = jsr;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
}
