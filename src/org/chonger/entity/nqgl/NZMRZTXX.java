package org.chonger.entity.nqgl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 牛只泌乳状态信息
 * 
 * @author Daniel
 * @create 2015-05-30
 * @version 1.0
 */
@Entity
@Table(name = "nzmrztxx")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class NZMRZTXX {
	@Id
	@Column(name = "xh")
	/**序号*/
	private String xh;
	
	@Column(name = "sj")
	/*时间*/
	private Date sj;
	
	@Column(name="tssj")
	/*提示时间*/
	private Date tssj;
	
	@Column(name = "zt")
	/*状态*/
	private int zt;
	
	@Column(name="day")
	/*天数*/
	private int day;
	
	@Column(name="tid")
	/*关联目标的id*/
	private String tid;
		
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "xh")
	private NZJBXX nzxx;
	
	public NZJBXX getNzxx() {
		return nzxx;
	}

	public void setNzxx(NZJBXX nzxx) {
		this.nzxx = nzxx;
	}

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public int getZt() {
		return zt;
	}

	public void setZt(int zt) {
		this.zt = zt;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public Date getSj() {
		return sj;
	}

	public void setSj(Date sj) {
		this.sj = sj;
	}

	public Date getTssj() {
		return tssj;
	}

	public void setTssj(Date tssj) {
		this.tssj = tssj;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}
}
