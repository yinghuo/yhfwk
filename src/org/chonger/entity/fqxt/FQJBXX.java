package org.chonger.entity.fqxt;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 发情记步信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "fqjbxx")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FQJBXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "jbqbh")
	private String jbqbh;//计步器编号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "kzqbh")
	private String kzqbh;//控制器编号
	
	@Column(name = "kssj")
	private Date kssj;//开始时间
	
	@Column(name = "jssj")
	private Date jssj;//结束时间
	
	@Column(name = "ljxx")
	private int ljxx;//累计信息
	
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

	public String getKzqbh() {
		return kzqbh;
	}

	public void setKzqbh(String kzqbh) {
		this.kzqbh = kzqbh;
	}

	public Date getKssj() {
		return kssj;
	}

	public void setKssj(Date kssj) {
		this.kssj = kssj;
	}

	public Date getJssj() {
		return jssj;
	}

	public void setJssj(Date jssj) {
		this.jssj = jssj;
	}

	public int getLjxx() {
		return ljxx;
	}

	public void setLjxx(int ljxx) {
		this.ljxx = ljxx;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
}
