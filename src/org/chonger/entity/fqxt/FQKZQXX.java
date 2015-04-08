package org.chonger.entity.fqxt;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 发情控制器信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "fqkzqxx")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FQKZQXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "kzqbh")
	private String kzqbh;//控制器编号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "kzqzt")
	private int kzqzt;//控制器状态
	
	@Column(name = "sfty")
	private int sfty;//是否停用
	
	@Column(name = "ljxx")
	private String ljxx;//连接信息
	
	@Column(name = "bz")
	private String bz;//备注

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public String getKzqbh() {
		return kzqbh;
	}

	public void setKzqbh(String kzqbh) {
		this.kzqbh = kzqbh;
	}

	public String getNcbh() {
		return ncbh;
	}

	public void setNcbh(String ncbh) {
		this.ncbh = ncbh;
	}

	public int getKzqzt() {
		return kzqzt;
	}

	public void setKzqzt(int kzqzt) {
		this.kzqzt = kzqzt;
	}

	public int getSfty() {
		return sfty;
	}

	public void setSfty(int sfty) {
		this.sfty = sfty;
	}

	public String getLjxx() {
		return ljxx;
	}

	public void setLjxx(String ljxx) {
		this.ljxx = ljxx;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
}
