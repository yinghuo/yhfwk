package org.chonger.entity.jbfy;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 用药记录信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "yyjlb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class YYJLXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "yycs")
	private int yycs;//用药次数
	
	@Column(name = "yyrq")
	private Date yyrq;//用药日期
	
	@Column(name = "yysy")
	private String yysy;//用药兽医
	
	@Column(name = "yyff")
	private String yyff;//用药方法
	
	@Column(name = "ypmc")
	private String ypmc;//药品名称
	
	@Column(name = "ypgg")
	private String ypgg;//药品规格
	
	@Column(name = "ypdw")
	private String ypdw;//药品单位

	@Column(name = "ypdj")
	private double ypdj;//药品单价
	
	@Column(name = "ypsl")
	private double ypsl;//药品数量
	
	@Column(name = "ypfy")
	private double ypfy;//药品费用
	
	@Column(name = "xyq")
	private String xyq;//休药期
	
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

	public int getYycs() {
		return yycs;
	}

	public void setYycs(int yycs) {
		this.yycs = yycs;
	}

	public Date getYyrq() {
		return yyrq;
	}

	public void setYyrq(Date yyrq) {
		this.yyrq = yyrq;
	}

	public String getYysy() {
		return yysy;
	}

	public void setYysy(String yysy) {
		this.yysy = yysy;
	}

	public String getYyff() {
		return yyff;
	}

	public void setYyff(String yyff) {
		this.yyff = yyff;
	}

	public String getYpmc() {
		return ypmc;
	}

	public void setYpmc(String ypmc) {
		this.ypmc = ypmc;
	}

	public String getYpgg() {
		return ypgg;
	}

	public void setYpgg(String ypgg) {
		this.ypgg = ypgg;
	}

	public String getYpdw() {
		return ypdw;
	}

	public void setYpdw(String ypdw) {
		this.ypdw = ypdw;
	}

	public double getYpdj() {
		return ypdj;
	}

	public void setYpdj(double ypdj) {
		this.ypdj = ypdj;
	}

	public double getYpsl() {
		return ypsl;
	}

	public void setYpsl(double ypsl) {
		this.ypsl = ypsl;
	}

	public double getYpfy() {
		return ypfy;
	}

	public void setYpfy(double ypfy) {
		this.ypfy = ypfy;
	}

	public String getXyq() {
		return xyq;
	}

	public void setXyq(String xyq) {
		this.xyq = xyq;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
}
