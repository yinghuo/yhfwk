package org.chonger.entity.nqgl;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.chonger.entity.cngl.GTCNXX;
import org.chonger.entity.jbxx.JSJBXX;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 牛只基本信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "nzjbxx")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class NZJBXX {
	@Id
	@Column(name = "xh")
	/**序号*/
	private String xh;

	@Column(name = "nzbh")
	/**牛只编号*/
	private String nzbh;
	
	@Column(name = "ncbh")
	/**牛场编号*/
	private String ncbh;
	
	@Column(name = "ebbh")
	/**电子耳标编号*/
	private String ebbh;
	
	@Column(name = "jbqbh")
	/**计步器编号*/
	private String jbqbh;
	
	@Column(name = "csrq")
	/**出生日期*/
	private Date csrq;
	
	@Column(name = "xb")
	/**性别(0母1公)*/
	private int xb;
	
	@Column(name = "lb")
	/**类别(哺乳犊牛/断奶犊牛/育成牛/青年牛/泌乳牛/干奶牛/留养公牛)*/
	private String lb;
	
	@Column(name = "rqlx")
	/**入群类型(自繁/购买)*/
	private String rqlx;
	
	@Column(name = "yl")
	/**月龄*/
	private int yl;
	
	@Column(name = "csz")
	/**出生重*/
	private double csz;
	
	@Column(name = "js")
	/**圈舍*/
	private String js;
	
	@Column(name = "pz")
	/**品种*/
	private String pz;
	
	@Column(name = "ms")
	/**毛色*/
	private String ms;
	
	@Column(name = "tc")
	/**胎次*/
	private int tc;
	
	@Column(name = "cdrq")
	/**产犊日期*/
	private Date cdrq;
	
	@Column(name = "fqh")
	/**父亲号*/
	private String fqh;
	
	@Column(name = "mqh")
	/**母亲号*/
	private String mqh;
	
	@Column(name = "mrzt")
	/**泌乳状态*/
	private String mrzt;
	
	@Column(name = "fzzt")
	/**繁殖状态*/
	private String fzzt;
	
	@Column(name = "bz")
	/**备注*/
	private String bz;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="js",insertable = false, updatable = false)
	private JSJBXX jsjbxx;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<NZZSXX> zsxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<GTCNXX> gtcnxxList;
	
	@OneToOne(mappedBy="nzjbxx")
	private NZLCXX nzlcxx;
	
	public JSJBXX getJsjbxx() {
		return jsjbxx;
	}

	public void setJsjbxx(JSJBXX jsjbxx) {
		this.jsjbxx = jsjbxx;
	}

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public String getNzbh() {
		return nzbh;
	}

	public void setNzbh(String nzbh) {
		this.nzbh = nzbh;
	}

	public String getNcbh() {
		return ncbh;
	}

	public void setNcbh(String ncbh) {
		this.ncbh = ncbh;
	}

	public String getEbbh() {
		return ebbh;
	}

	public void setEbbh(String ebbh) {
		this.ebbh = ebbh;
	}

	public String getJbqbh() {
		return jbqbh;
	}

	public void setJbqbh(String jbqbh) {
		this.jbqbh = jbqbh;
	}

	public Date getCsrq() {
		return csrq;
	}

	public void setCsrq(Date csrq) {
		this.csrq = csrq;
	}

	public int getXb() {
		return xb;
	}

	public void setXb(int xb) {
		this.xb = xb;
	}

	public String getLb() {
		return lb;
	}

	public void setLb(String lb) {
		this.lb = lb;
	}

	public String getRqlx() {
		return rqlx;
	}

	public void setRqlx(String rqlx) {
		this.rqlx = rqlx;
	}

	public int getYl() {
		return yl;
	}

	public void setYl(int yl) {
		this.yl = yl;
	}

	public double getCsz() {
		return csz;
	}

	public void setCsz(double csz) {
		this.csz = csz;
	}

	public String getJs() {
		return js;
	}

	public void setJs(String js) {
		this.js = js;
	}

	public String getPz() {
		return pz;
	}

	public void setPz(String pz) {
		this.pz = pz;
	}

	public String getMs() {
		return ms;
	}

	public void setMs(String ms) {
		this.ms = ms;
	}

	public int getTc() {
		return tc;
	}

	public void setTc(int tc) {
		this.tc = tc;
	}

	public Date getCdrq() {
		return cdrq;
	}

	public void setCdrq(Date cdrq) {
		this.cdrq = cdrq;
	}

	public String getFqh() {
		return fqh;
	}

	public void setFqh(String fqh) {
		this.fqh = fqh;
	}

	public String getMqh() {
		return mqh;
	}

	public void setMqh(String mqh) {
		this.mqh = mqh;
	}

	public String getMrzt() {
		return mrzt;
	}

	public void setMrzt(String mrzt) {
		this.mrzt = mrzt;
	}

	public String getFzzt() {
		return fzzt;
	}

	public void setFzzt(String fzzt) {
		this.fzzt = fzzt;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public List<NZZSXX> getZsxxList() {
		return zsxxList;
	}

	public void setZsxxList(List<NZZSXX> zsxxList) {
		this.zsxxList = zsxxList;
	}

	public NZLCXX getNzlcxx() {
		return nzlcxx;
	}

	public void setNzlcxx(NZLCXX nzlcxx) {
		this.nzlcxx = nzlcxx;
	}

	public List<GTCNXX> getGtcnxxList() {
		return gtcnxxList;
	}

	public void setGtcnxxList(List<GTCNXX> gtcnxxList) {
		this.gtcnxxList = gtcnxxList;
	}
}
