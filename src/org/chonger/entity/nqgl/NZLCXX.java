package org.chonger.entity.nqgl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.chonger.entity.jbxx.NCJBXX;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 牛只离场信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "nzlcdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class NZLCXX {
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzxh")
	private String nzxh;//牛只编号
	
	@Column(name = "pz")
	private String pz;//品种
	
	@Column(name = "js")
	private String js;//圈舍
	
	@Column(name = "nl")
	private String nl;//年龄
	
	@Column(name = "lqrq")
	private Date lqrq;//离群日期
	
	@Column(name = "lqlx")
	private String lqlx;//离群类型
	
	@Column(name = "lqtz")
	private String lqtz;//离群体重
	
	@Column(name = "lqyy")
	private String lqyy;//离群原因
	
	@Column(name = "qx")
	private String qx;//去向
	
	@Column(name = "jsr")
	private String jsr;//经手人
	
	@Column(name = "bz")
	private String bz;//备注
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "nzxh",insertable = false, updatable = false)
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

	public String getNzxh() {
		return nzxh;
	}

	public void setNzxh(String nzxh) {
		this.nzxh = nzxh;
	}

	public String getPz() {
		return pz;
	}

	public void setPz(String pz) {
		this.pz = pz;
	}

	public String getJs() {
		return js;
	}

	public void setJs(String js) {
		this.js = js;
	}

	public String getNl() {
		return nl;
	}

	public void setNl(String nl) {
		this.nl = nl;
	}

	public Date getLqrq() {
		return lqrq;
	}

	public void setLqrq(Date lqrq) {
		this.lqrq = lqrq;
	}

	public String getLqlx() {
		return lqlx;
	}

	public void setLqlx(String lqlx) {
		this.lqlx = lqlx;
	}

	public String getLqtz() {
		return lqtz;
	}

	public void setLqtz(String lqtz) {
		this.lqtz = lqtz;
	}

	public String getLqyy() {
		return lqyy;
	}

	public void setLqyy(String lqyy) {
		this.lqyy = lqyy;
	}

	public String getQx() {
		return qx;
	}

	public void setQx(String qx) {
		this.qx = qx;
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

	public NZJBXX getNzjbxx() {
		return nzjbxx;
	}

	public void setNzjbxx(NZJBXX nzjbxx) {
		this.nzjbxx = nzjbxx;
	}
}
