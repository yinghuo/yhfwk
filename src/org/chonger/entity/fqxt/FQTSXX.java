package org.chonger.entity.fqxt;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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
	
	@Column(name = "nsbh")
	private String nsbh;//牛舍编号
	
	@Column(name = "tslx")
	private String tslx;//提示类型
	
	@Column(name = "tsms")
	private String tsms;//提示描述
	
	@Column(name = "sffq")
	private boolean sffq;//是否发情
	
	@Column(name = "jcr")
	private String jcr;//检测人
	
	@Column(name = "jcsj")//监测时间
	private Date jcsj;
	
	@Column(name = "jcjg")
	private String jcjg;//监测结果
	
	@Column(name = "zjpzsj")
	private Date zjpzsj;//最佳配种时间
	
	@Column(name = "sfpz")
	private boolean sfpz;//是否配种
	
	@Column(name = "pzr")
	private String pzr;//配种人
	
	@Column(name = "pzsj")
	private Date pzsj;//配种时间
	
	@Column(name = "bz")
	private String bz;//备注

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

	public String getNsbh() {
		return nsbh;
	}

	public void setNsbh(String nsbh) {
		this.nsbh = nsbh;
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

	public boolean isSffq() {
		return sffq;
	}

	public void setSffq(boolean sffq) {
		this.sffq = sffq;
	}

	public String getJcr() {
		return jcr;
	}

	public void setJcr(String jcr) {
		this.jcr = jcr;
	}

	public Date getJcsj() {
		return jcsj;
	}

	public void setJcsj(Date jcsj) {
		this.jcsj = jcsj;
	}

	public String getJcjg() {
		return jcjg;
	}

	public void setJcjg(String jcjg) {
		this.jcjg = jcjg;
	}

	public Date getZjpzsj() {
		return zjpzsj;
	}

	public void setZjpzsj(Date zjpzsj) {
		this.zjpzsj = zjpzsj;
	}

	public boolean isSfpz() {
		return sfpz;
	}

	public void setSfpz(boolean sfpz) {
		this.sfpz = sfpz;
	}

	public String getPzr() {
		return pzr;
	}

	public void setPzr(String pzr) {
		this.pzr = pzr;
	}

	public Date getPzsj() {
		return pzsj;
	}

	public void setPzsj(Date pzsj) {
		this.pzsj = pzsj;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

}
