package org.chonger.entity.nqgl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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
	
	@Column(name = "nzbh")
	/**牛只编号*/
	private String nzbh;
	
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
