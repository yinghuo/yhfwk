package org.chonger.entity.fzgl;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 产犊登记信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "cddjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class CDDJXX
{
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "cdsj")
	private Date cdsj;//产犊时间
	
	@Column(name = "cdlx")
	private String cdlx;//产犊类型
	
	@Column(name = "cdny")
	private String cdny;//产犊难易
	
	@Column(name = "tw")
	private String tw;//胎位
	
	@Column(name = "jcy")
	private String jcy;//接产员
	
	@Column(name = "tesl")
	private int tesl;//胎儿数量
	
	@Column(name = "jbq")
	private String jbq;//计步器
	
	@Column(name = "xzr")
	private String xzr;//协助人
	
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

	public String getNzbh() {
		return nzbh;
	}

	public void setNzbh(String nzbh) {
		this.nzbh = nzbh;
	}

	public Date getCdsj() {
		return cdsj;
	}

	public void setCdsj(Date cdsj) {
		this.cdsj = cdsj;
	}

	public String getCdlx() {
		return cdlx;
	}

	public void setCdlx(String cdlx) {
		this.cdlx = cdlx;
	}

	public String getCdny() {
		return cdny;
	}

	public void setCdny(String cdny) {
		this.cdny = cdny;
	}

	public String getTw() {
		return tw;
	}

	public void setTw(String tw) {
		this.tw = tw;
	}

	public String getJcy() {
		return jcy;
	}

	public void setJcy(String jcy) {
		this.jcy = jcy;
	}

	public int getTesl() {
		return tesl;
	}

	public void setTesl(int tesl) {
		this.tesl = tesl;
	}

	public String getJbq() {
		return jbq;
	}

	public void setJbq(String jbq) {
		this.jbq = jbq;
	}

	public String getXzr() {
		return xzr;
	}

	public void setXzr(String xzr) {
		this.xzr = xzr;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
}
