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
 * 免疫登记信息实体类
 * 
 * @author Daniel
 * @create 2015-05-15
 * @version 1.0
 */
@Entity
@Table(name = "mydjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class MYXX
{
	@Id
	@Column(name = "xh")
	private String xh;//数据序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场比那好
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "myrq")
	private Date myrq;//免疫日期
	
	@Column(name = "myxm")
	private String myxm;//免疫项目
	
	@Column(name = "ymmc")
	private String ymmc;//疫苗名称
	
	@Column(name = "syjl")
	private String syjl;//使用剂量
	
	@Column(name = "ph")
	private String ph;//批号
	
	@Column(name = "zzs")
	private String zzs;//制造商
	
	@Column(name = "jg")
	private String jg;//结果 
	
	@Column(name = "sy")
	private String sy;//兽医
	
	@Column(name = "bz")
	private String bz;//备注
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="nzbh",insertable = false, updatable = false)
	private NZJBXX nzjbxx;
	
	public NZJBXX getNzjbxx() {
		return nzjbxx;
	}

	public void setNzjbxx(NZJBXX nzjbxx) {
		this.nzjbxx = nzjbxx;
	}

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
	public Date getMyrq() {
		return myrq;
	}
	public void setMyrq(Date myrq) {
		this.myrq = myrq;
	}
	public String getMyxm()
	{
		return this.myxm;
	}
	public void setMyxm(String value)
	{
		this.myxm = value;
	}
	public String getYmmc()
	{
		return this.ymmc;
	}
	public void setYmmc(String value)
	{
		this.ymmc = value;
	}
	public String getSyjl()
	{
		return this.syjl;
	}
	public void setSyjl(String value)
	{
		this.syjl = value;
	}
	public String getPh()
	{
		return this.ph;
	}
	public void setPh(String value)
	{
		this.ph = value;
	}
	public String getZzs()
	{
		return this.zzs;
	}
	public void setZzs(String value)
	{
		this.zzs = value;
	}
	public String getJg()
	{
		return this.jg;
	}
	public void setJg(String value)
	{
		this.jg = value;
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
