package org.chonger.entity.jbfy;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 驱虫登记信息实体类
 * 
 * @author Daniel
 * @create 2015-05-15
 * @version 1.0
 */
@Entity
@Table(name = "qcdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class QCXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "qcrq")
	private Date qcrq;//驱虫日期
	
	@Column(name = "qcff")
	private String qcff;//驱虫方法
	
	@Column(name = "ywmc")
	private String ywmc;//药物名称
	
	@Column(name = "syjl")
	private String syjl;//使用剂量
	
	@Column(name = "zzs")
	private String zzs;//制造商
	
	@Column(name = "ph")
	private String ph;//批号
	
	@Column(name = "qcxg")
	private String qcxg;//驱虫效果
	
	@Column(name = "sy")
	private String sy;//兽医
	
	@Column(name = "bz")
	private String bz;//备注

	public String getXh()
	{
		return this.xh;
	}
	public void setXh(String value)
	{
		this.xh = value;
	}
	public String getNcbh()
	{
		return this.ncbh;
	}
	public void setNcbh(String value)
	{
		this.ncbh = value;
	}
	public String getNzbh()
	{
		return this.nzbh;
	}
	public void setNzbh(String value)
	{
		this.nzbh = value;
	}
	
	public Date getQcrq() {
		return qcrq;
	}
	public void setQcrq(Date qcrq) {
		this.qcrq = qcrq;
	}
	public String getQcff()
	{
		return this.qcff;
	}
	public void setQcff(String value)
	{
		this.qcff = value;
	}
	public String getYwmc()
	{
		return this.ywmc;
	}
	public void setYwmc(String value)
	{
		this.ywmc = value;
	}
	public String getSyjl()
	{
		return this.syjl;
	}
	public void setSyjl(String value)
	{
		this.syjl = value;
	}
	public String getZzs()
	{
		return this.zzs;
	}
	public void setZzs(String value)
	{
		this.zzs = value;
	}
	public String getPh()
	{
		return this.ph;
	}
	public void setPh(String value)
	{
		this.ph = value;
	}
	public String getQcxg()
	{
		return this.qcxg;
	}
	public void setQcxg(String value)
	{
		this.qcxg = value;
	}
	public String getSy()
	{
		return this.sy;
	}
	public void setSy(String value)
	{
		this.sy = value;
	}
	public String getBz()
	{
		return this.bz;
	}
	public void setBz(String value)
	{
		this.bz = value;
	}

}
