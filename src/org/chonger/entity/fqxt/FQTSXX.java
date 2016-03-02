package org.chonger.entity.fqxt;


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
 * 发情提示信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "fqtsxx")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FQTSXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "jbqbh")
	private String jbqbh;//计步器编号
	
	@Column(name = "ncbh")
	private String ncbh;//农场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "tslx")
	private String tslx;//提示类型
	
	@Column(name = "tsms")
	private String tsms;//提示描述
	
	@Column(name = "sfqr")
	private int sffq;//是否发情 0未确认、1确认发情、2确认未发情
	
	@Column(name = "shy")
	private String shy;
	
	@Column(name = "bz")
	private String bz;//备注
	
	@Column(name = "fqid")
	private String fqid;//发情编号
	
	public String getFqid() {
		return fqid;
	}

	public void setFqid(String fqid) {
		this.fqid = fqid;
	}

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

	public String getJbqbh() {
		return jbqbh;
	}

	public void setJbqbh(String jbqbh) {
		this.jbqbh = jbqbh;
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

	public String getTslx() {
		return tslx;
	}

	public void setTslx(String tslx) {
		this.tslx = tslx;
	}

	public String getTsms() {
		return tsms;
	}

	public void setTsms(String tsms) {
		this.tsms = tsms;
	}

	public int getSffq() {
		return sffq;
	}

	public void setSffq(int sffq) {
		this.sffq = sffq;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getShy() {
		return shy;
	}

	public void setShy(String shy) {
		this.shy = shy;
	}

}
