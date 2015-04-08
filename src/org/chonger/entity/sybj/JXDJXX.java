package org.chonger.entity.sybj;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 疾病登记信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "jbdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JXDJXX {
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "fbrq")
	private String fbrq;//发病日期
	
	@Column(name = "jbzl")
	private String jbzl;//疾病种类
	
	@Column(name = "jbmc")
	private String jbmc;//疾病名称
	
	@Column(name = "zyzz")
	private String zyzz;//主要症状
	
	@Column(name = "fbyy")
	private String fbyy;//发病原因
	
	@Column(name = "yzcd")
	private String yzcd;//严重程度
	
	@Column(name = "czqk")
	private String czqk;//处置情况
	
	@Column(name = "fsqn")
	private boolean fsqn;//是否弃奶
	
	@Column(name = "yyrq")
	private Date yyrq;//用药日期
	
	@Column(name = "yflj")
	private double yflj;//药费累计
	
	@Column(name = "yycs")
	private int yycs;//用药次数
	
	@Column(name = "jsxyrq")
	private String jsxyrq;//结束休药日期
	
	@Column(name = "sys")
	private String sys;//兽医师
	
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

	public String getFbrq() {
		return fbrq;
	}

	public void setFbrq(String fbrq) {
		this.fbrq = fbrq;
	}

	public String getJbzl() {
		return jbzl;
	}

	public void setJbzl(String jbzl) {
		this.jbzl = jbzl;
	}

	public String getJbmc() {
		return jbmc;
	}

	public void setJbmc(String jbmc) {
		this.jbmc = jbmc;
	}

	public String getZyzz() {
		return zyzz;
	}

	public void setZyzz(String zyzz) {
		this.zyzz = zyzz;
	}

	public String getFbyy() {
		return fbyy;
	}

	public void setFbyy(String fbyy) {
		this.fbyy = fbyy;
	}

	public String getYzcd() {
		return yzcd;
	}

	public void setYzcd(String yzcd) {
		this.yzcd = yzcd;
	}

	public String getCzqk() {
		return czqk;
	}

	public void setCzqk(String czqk) {
		this.czqk = czqk;
	}

	public boolean isFsqn() {
		return fsqn;
	}

	public void setFsqn(boolean fsqn) {
		this.fsqn = fsqn;
	}

	public Date getYyrq() {
		return yyrq;
	}

	public void setYyrq(Date yyrq) {
		this.yyrq = yyrq;
	}

	public double getYflj() {
		return yflj;
	}

	public void setYflj(double yflj) {
		this.yflj = yflj;
	}

	public int getYycs() {
		return yycs;
	}

	public void setYycs(int yycs) {
		this.yycs = yycs;
	}

	public String getJsxyrq() {
		return jsxyrq;
	}

	public void setJsxyrq(String jsxyrq) {
		this.jsxyrq = jsxyrq;
	}

	public String getSys() {
		return sys;
	}

	public void setSys(String sys) {
		this.sys = sys;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
}
