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
import javax.persistence.Transient;

import org.chonger.entity.cngl.GTCNXX;
import org.chonger.entity.fqxt.FQTSXX;
import org.chonger.entity.fqxt.JBQXX;
import org.chonger.entity.fzgl.CDDJXX;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.fzgl.GNDJXX;
import org.chonger.entity.fzgl.LCXX;
import org.chonger.entity.fzgl.PZDJXX;
import org.chonger.entity.fzgl.RJCJXX;
import org.chonger.entity.fzgl.RJFJXX;
import org.chonger.entity.jbfy.HTXTXX;
import org.chonger.entity.jbfy.JBXX;
import org.chonger.entity.jbfy.JYXX;
import org.chonger.entity.jbfy.MYXX;
import org.chonger.entity.jbfy.QCXX;
import org.chonger.entity.jbxx.JSJBXX;
import org.chonger.utils.DateTimeUtil;
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
	
	@Column(name="rqsj")
	private Date rqsj;
	
	//@Column(name = "yl")
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
	private int mrzt=-1;
	
	@Column(name = "fzzt")
	/**繁殖状态*/
	private int fzzt=-1;
	
	/**牛只状态  */
	@Column(name="nzzt")
	private int nzzt=0;
	
	/**牛只情期*/
	@Column(name="qq")
	private int qq=0;
	
	/**最后配种时间*/
	@Column(name="zhpzrq")
	private Date zhpzrq;
	
	@Column(name = "bz")
	/**备注*/
	private String bz;
	
	/**配孕天数*/
	@Column(name="pyts")
	private int pyts;
	
	/**胎间距*/
	@Column(name="tjj")
	private int tjj;
	
	/**繁殖状态序号*/
	@Column(name="fzztxh")
	private String fzztxh;
	
	/**泌乳状态序号*/
	@Column(name="mrztxh")
	private String mrztxh;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="js",insertable = false, updatable = false)
	private JSJBXX jsjbxx;
	
	@OneToOne
	@JoinColumn(name = "fzztxh",insertable = false, updatable = false)
	private NZFZZTXX nzfzzt;
	
	@OneToOne
	@JoinColumn(name = "mrztxh",insertable = false, updatable = false)
	private NZMRZTXX nzmrzt;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<NZZSXX> zsxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<GTCNXX> gtcnxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<FQDJXX> fqdjxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<PZDJXX> pzdjxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<RJCJXX> rjcjxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<RJFJXX> rjfjxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<CDDJXX> cddjxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<LCXX> lcdjxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<FQTSXX> fqtsxxList;
	
	@OneToOne(mappedBy="nzjbxx")
	private JBQXX jbqxx;	
	
	@OneToOne(mappedBy="nzjbxx")
	private NZLCXX nzlcxx;	
	
	//添加其他模块信息汇总
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<GNDJXX> gnxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<JBXX> jbxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<MYXX> myxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)	
	private List<JYXX> jyxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<QCXX> qcxxList;
	
	@OneToMany(mappedBy="nzjbxx",fetch = FetchType.LAZY)
	private List<HTXTXX> htxtList;
	
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
	
	@Transient
	public int getYl() {
		//计算月龄
		if(this.getCsrq()!=null)
			yl=(yl=DateTimeUtil.getMonthNow(this.getCsrq()))<0?0:yl;
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

	public int getMrzt() {
		return mrzt;
	}

	public void setMrzt(int mrzt) {
		this.mrzt = mrzt;
	}

	public int getFzzt() {
		return fzzt;
	}

	public void setFzzt(int fzzt) {
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

	public Date getRqsj() {
		return rqsj;
	}

	public void setRqsj(Date rqsj) {
		this.rqsj = rqsj;
	}

	public int getNzzt() {
		return nzzt;
	}

	public void setNzzt(int nzzt) {
		this.nzzt = nzzt;
	}

	public List<FQDJXX> getFqdjxxList() {
		return fqdjxxList;
	}

	public void setFqdjxxList(List<FQDJXX> fqdjxxList) {
		this.fqdjxxList = fqdjxxList;
	}

	public List<PZDJXX> getPzdjxxList() {
		return pzdjxxList;
	}

	public void setPzdjxxList(List<PZDJXX> pzdjxxList) {
		this.pzdjxxList = pzdjxxList;
	}

	public List<CDDJXX> getCddjxxList() {
		return cddjxxList;
	}

	public void setCddjxxList(List<CDDJXX> cddjxxList) {
		this.cddjxxList = cddjxxList;
	}

	public List<LCXX> getLcdjxxList() {
		return lcdjxxList;
	}

	public void setLcdjxxList(List<LCXX> lcdjxxList) {
		this.lcdjxxList = lcdjxxList;
	}

	public List<RJCJXX> getRjcjxxList() {
		return rjcjxxList;
	}

	public void setRjcjxxList(List<RJCJXX> rjcjxxList) {
		this.rjcjxxList = rjcjxxList;
	}

	public List<RJFJXX> getRjfjxxList() {
		return rjfjxxList;
	}

	public void setRjfjxxList(List<RJFJXX> rjfjxxList) {
		this.rjfjxxList = rjfjxxList;
	}

	public NZFZZTXX getNzfzzt() {
		return nzfzzt;
	}

	public void setNzfzzt(NZFZZTXX nzfzzt) {
		this.nzfzzt = nzfzzt;
	}

	public NZMRZTXX getNzmrzt() {
		return nzmrzt;
	}

	public void setNzmrzt(NZMRZTXX nzmrzt) {
		this.nzmrzt = nzmrzt;
	}

	public int getQq() {
		return qq;
	}

	public void setQq(int qq) {
		this.qq = qq;
	}

	public List<FQTSXX> getFqtsxxList() {
		return fqtsxxList;
	}

	public void setFqtsxxList(List<FQTSXX> fqtsxxList) {
		this.fqtsxxList = fqtsxxList;
	}

	public Date getZhpzrq() {
		return zhpzrq;
	}

	public void setZhpzrq(Date zhpzrq) {
		this.zhpzrq = zhpzrq;
	}

	public int getPyts() {
		return pyts;
	}

	public void setPyts(int pyts) {
		this.pyts = pyts;
	}

	public int getTjj() {
		return tjj;
	}

	public void setTjj(int tjj) {
		this.tjj = tjj;
	}

	public JBQXX getJbqxx() {
		return jbqxx;
	}

	public void setJbqxx(JBQXX jbqxx) {
		this.jbqxx = jbqxx;
	}

	public String getFzztxh() {
		return fzztxh;
	}

	public void setFzztxh(String fzztxh) {
		this.fzztxh = fzztxh;
	}

	public String getMrztxh() {
		return mrztxh;
	}

	public void setMrztxh(String mrztxh) {
		this.mrztxh = mrztxh;
	}

	public List<GNDJXX> getGnxxList() {
		return gnxxList;
	}

	public void setGnxxList(List<GNDJXX> gnxxList) {
		this.gnxxList = gnxxList;
	}

	public List<JBXX> getJbxxList() {
		return jbxxList;
	}

	public void setJbxxList(List<JBXX> jbxxList) {
		this.jbxxList = jbxxList;
	}

	public List<MYXX> getMyxxList() {
		return myxxList;
	}

	public void setMyxxList(List<MYXX> myxxList) {
		this.myxxList = myxxList;
	}

	public List<JYXX> getJyxxList() {
		return jyxxList;
	}

	public void setJyxxList(List<JYXX> jyxxList) {
		this.jyxxList = jyxxList;
	}

	public List<QCXX> getQcxxList() {
		return qcxxList;
	}

	public void setQcxxList(List<QCXX> qcxxList) {
		this.qcxxList = qcxxList;
	}

	public List<HTXTXX> getHtxtList() {
		return htxtList;
	}

	public void setHtxtList(List<HTXTXX> htxtList) {
		this.htxtList = htxtList;
	}

	
}
