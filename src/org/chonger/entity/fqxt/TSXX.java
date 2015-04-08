package org.chonger.entity.fqxt;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 提示信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "xxtsgl")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class TSXX
{
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "sjhm")
	private String sjhm;//手机号码
	
	@Column(name = "tslx")
	private String tslx;//提示类型
	
	@Column(name = "tsnr")
	private String tsnr;//提示内容
	
	@Column(name = "sfts")
	private boolean sfts;//提否提示
	
	@Column(name = "bz")
	private String bz;//备注

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public String getNcbh() {
		return ncbh;
	}

	public void setNcbh(String ncbh) {
		this.ncbh = ncbh;
	}

	public String getSjhm() {
		return sjhm;
	}

	public void setSjhm(String sjhm) {
		this.sjhm = sjhm;
	}

	public String getTslx() {
		return tslx;
	}

	public void setTslx(String tslx) {
		this.tslx = tslx;
	}

	public String getTsnr() {
		return tsnr;
	}

	public void setTsnr(String tsnr) {
		this.tsnr = tsnr;
	}

	public boolean isSfts() {
		return sfts;
	}

	public void setSfts(boolean sfts) {
		this.sfts = sfts;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

}
