package org.chonger.entity.jbfy;


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
 * 消毒登记信息实体类
 * 
 * @author Daniel
 * @create 2015-05-15
 * @version 1.0
 */
@Entity
@Table(name = "xddjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class XDXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "xdrq")
	private Date xdrq;//消毒日期
	
	@Column(name = "xdqy")
	private String xdqy;//消毒区域
	
	@Column(name = "yjmc")
	private String yjmc;//药剂名称
	
	@Column(name = "syjl")
	private String syjl;//使用数量
	
	@Column(name = "zzs")
	private String zzs;//制造商
	
	@Column(name = "ph")
	private String ph;//批号
	
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
	
	public String getXdqy()
	{
		return this.xdqy;
	}
	public void setXdqy(String value)
	{
		this.xdqy = value;
	}
	public String getYjmc()
	{
		return this.yjmc;
	}
	public void setYjmc(String value)
	{
		this.yjmc = value;
	}
	
	public Date getXdrq() {
		return xdrq;
	}
	public void setXdrq(Date xdrq) {
		this.xdrq = xdrq;
	}
	public String getSyjl() {
		return syjl;
	}
	public void setSyjl(String syjl) {
		this.syjl = syjl;
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
