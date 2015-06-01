package org.chonger.entity.nqgl;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import jxl.write.DateTime;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 牛只类别信息
 * 
 * @author Daniel
 * @create 2015-05-30
 * @version 1.0
 */
@Entity
@Table(name = "nzlbxx")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class NZLBXX {
	@Id
	@Column(name = "xh")
	/**序号*/
	private String xh;
	
	@Column(name = "sj")
	/*时间*/
	private DateTime sj;
	
	@Column(name = "lb")
	/*类别*/
	private int lb;
	
	@Column(name="day")
	/*天数*/
	private int day;
	
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

	public int getLb() {
		return lb;
	}

	public void setLb(int lb) {
		this.lb = lb;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public DateTime getSj() {
		return sj;
	}

	public void setSj(DateTime sj) {
		this.sj = sj;
	}
}
