package org.chonger.entity.jbfy;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import jxl.write.DateTime;

import org.chonger.entity.nqgl.NZJBXX;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 护蹄修蹄登记信息实体类
 * 
 * @author Daniel
 * @create 2015-05-15
 * @version 1.0
 */
@Entity
@Table(name = "htxtdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class HTXTXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "xtrq")
	private Date xtrq;//修蹄日期
	
	@Column(name = "zq")
	private int zq;//左前肢
	
	@Column(name = "yq")
	private int yq;//右前肢
	
	@Column(name = "zh")
	private int zh;//左后肢
	
	@Column(name = "yh")
	private int yh;//右后肢
	
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
	
	public Date getXtrq() {
		return xtrq;
	}
	public void setXtrq(Date xtrq) {
		this.xtrq = xtrq;
	}
	public int getZq()
	{
		return this.zq;
	}
	public void setZq(int value)
	{
		this.zq = value;
	}
	public int getYq()
	{
		return this.yq;
	}
	public void setYq(int value)
	{
		this.yq = value;
	}
	public int getZh()
	{
		return this.zh;
	}
	public void setZh(int value)
	{
		this.zh = value;
	}
	public int getYh()
	{
		return this.yh;
	}
	public void setYh(int value)
	{
		this.yh = value;
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
