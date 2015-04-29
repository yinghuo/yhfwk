package org.chonger.entity.fzgl;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 妊娠监测信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "rsjcdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class RSJCXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "jcrq")
	private Date jcrq;//检查日期
	
	@Column(name = "jclx")
	private String jclx;//检查类型
	
	@Column(name = "jcjg")
	private String jcjg;//检查结果
	
	@Column(name = "jcy")
	private String jcy;//检查人
	
	@Column(name = "jcfs")
	private String jcfs;//检查方式
	
	@Column(name = "tszt")
	private String tszt;//胎儿状况
	
	@Column(name = "nzxb")
	private String nzxb;//牛只性别
	
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

	public Date getJcrq() {
		return jcrq;
	}

	public void setJcrq(Date jcrq) {
		this.jcrq = jcrq;
	}

	public String getJclx() {
		return jclx;
	}

	public void setJclx(String jclx) {
		this.jclx = jclx;
	}

	public String getJcjg() {
		return jcjg;
	}

	public void setJcjg(String jcjg) {
		this.jcjg = jcjg;
	}

	public String getJcy() {
		return jcy;
	}

	public void setJcy(String jcy) {
		this.jcy = jcy;
	}

	public String getJcfs() {
		return jcfs;
	}

	public void setJcfs(String jcfs) {
		this.jcfs = jcfs;
	}

	public String getTszt() {
		return tszt;
	}

	public void setTszt(String tszt) {
		this.tszt = tszt;
	}

	public String getNzxb() {
		return nzxb;
	}

	public void setNzxb(String nzxb) {
		this.nzxb = nzxb;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
}
