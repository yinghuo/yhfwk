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
 * 检疫登记信息实体类
 * 
 * @author Daniel
 * @create 2015-05-15
 * @version 1.0
 */
@Entity
@Table(name = "jydjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JYXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "jyrq")
	private Date jyrq;//检疫日期
	
	@Column(name = "jyyl")
	private int jyyl;//检疫月龄
	
	@Column(name = "jyxm")
	private String jyxm;//检疫项目
	
	@Column(name = "ymmc")
	private String ymmc;//疫苗名称
	
	@Column(name = "jylx")
	private String jylx;//检疫类型
	
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

	public String getNzbh() {
		return nzbh;
	}

	public void setNzbh(String nzbh) {
		this.nzbh = nzbh;
	}
	
	public Date getJyrq() {
		return jyrq;
	}
	public void setJyrq(Date jyrq) {
		this.jyrq = jyrq;
	}
	public int getJyyl()
	{
		return this.jyyl;
	}
	public void setJyyl(int value)
	{
		this.jyyl = value;
	}
	public String getJyxm()
	{
		return this.jyxm;
	}
	public void setJyxm(String value)
	{
		this.jyxm = value;
	}
	public String getYmmc()
	{
		return this.ymmc;
	}
	public void setYmmc(String value)
	{
		this.ymmc = value;
	}
	public String getJylx()
	{
		return this.jylx;
	}
	public void setJylx(String value)
	{
		this.jylx = value;
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
