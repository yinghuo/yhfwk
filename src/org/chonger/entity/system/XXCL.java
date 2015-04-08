package org.chonger.entity.system;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "xtcl")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class XXCL
{
	@Id
	@Column(name = "dmid")
	private String dmid;//常量ID
	
	@Column(name = "dmlb")
	private String dmlb;//常量类别
	
	@Column(name = "dmbh")
	private String dmbh;//常量编号
	
	@Column(name = "dmmc")
	private String dmmc;//常量名称
	
	@Column(name = "srdm")
	private String srdm;//输入代码
	
	@Column(name = "dmms")
	private String dmms;//常量描述
	
	@Column(name = "bz")
	private String bz;//备注

	public String getDmid()
	{
		return this.dmid;
	}
	public void setDmid(String value)
	{
		this.dmid = value;
	}
	public String getDmlb()
	{
		return this.dmlb;
	}
	public void setDmlb(String value)
	{
		this.dmlb = value;
	}
	public String getDmbh()
	{
		return this.dmbh;
	}
	public void setDmbh(String value)
	{
		this.dmbh = value;
	}
	public String getDmmc()
	{
		return this.dmmc;
	}
	public void setDmmc(String value)
	{
		this.dmmc = value;
	}
	public String getSrdm()
	{
		return this.srdm;
	}
	public void setSrdm(String value)
	{
		this.srdm = value;
	}
	public String getDmms()
	{
		return this.dmms;
	}
	public void setDmms(String value)
	{
		this.dmms = value;
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
