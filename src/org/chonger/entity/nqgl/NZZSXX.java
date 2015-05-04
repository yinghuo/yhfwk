package org.chonger.entity.nqgl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.chonger.entity.jbxx.JSJBXX;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 牛只转舍信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "nzzsdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class NZZSXX {
	@Id
	@Column(name = "xh")
	/**序号*/
	private String xh;
	
	@Column(name = "ncbh")
	/**牛场编号*/
	private String ncbh;
	
	@Column(name = "nzxh")
	/**牛只序号*/
	private String nzxh;
	
	@Column(name = "zsrq")
	/**转舍日期*/
	private Date zsrq;
	
	@Column(name = "zcjs")
	/**转出圈舍*/
	private String zcjs;
	
	@Column(name = "zrjs")
	/**转入圈舍*/
	private String zrjs;
	
	@Column(name = "jsr")
	/**经手人*/
	private String jsr;
	
	@Column(name = "bz")
	/**备注*/
	private String bz;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="nzxh",insertable = false, updatable = false)
	private NZJBXX nzjbxx;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="zcjs",insertable = false, updatable = false)
	private JSJBXX zcjsxx;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="zrjs",insertable = false, updatable = false)
	private JSJBXX zrjsxx;
	
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

	public NZJBXX getNzjbxx() {
		return nzjbxx;
	}

	public void setNzjbxx(NZJBXX nzjbxx) {
		this.nzjbxx = nzjbxx;
	}

	public JSJBXX getZcjsxx() {
		return zcjsxx;
	}

	public void setZcjsxx(JSJBXX zcjsxx) {
		this.zcjsxx = zcjsxx;
	}

	public JSJBXX getZrjsxx() {
		return zrjsxx;
	}

	public void setZrjsxx(JSJBXX zrjsxx) {
		this.zrjsxx = zrjsxx;
	}

	public Date getZsrq() {
		return zsrq;
	}

	public void setZsrq(Date zsrq) {
		this.zsrq = zsrq;
	}

	public String getZcjs() {
		return zcjs;
	}

	public void setZcjs(String zcjs) {
		this.zcjs = zcjs;
	}

	public String getZrjs() {
		return zrjs;
	}

	public void setZrjs(String zrjs) {
		this.zrjs = zrjs;
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
