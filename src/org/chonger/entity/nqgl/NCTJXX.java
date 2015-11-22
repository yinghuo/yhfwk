package org.chonger.entity.nqgl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 牛场统计信息实体类
 * 
 * @author Daniel
 * @create 2015-07-25
 * @version 1.0
 */
@Entity
@Table(name = "nctjxx")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class NCTJXX {
	@Id
	@Column(name = "ncxh")
	/**牛场序号*/
	private String ncxh;
	
	@Column(name = "zts")
	/**牛场总头数，统计 大育成牛和泌乳牛的个数*/
	private int zts;
	
//	@Transient
//	private int ycn;
//	
//	@Transient
//	private int mrn;
	
	@Column(name = "fq30")
	/**30天发情个数*/
	private int fq30;
	
	@Column(name = "fq30jcl")
	/**30天发情检出率*/
	private double fq30jcl;
	
	@Column(name = "fq1")
	/**当天发情个数*/
	private int fq1;
	
	@Column(name = "fq1jcl")
	/**当天发情检出率*/
	private double fq1jcl;
	
	@Column(name = "fq0t")
	/**最后发情时间*/
	private Date fq0t;
	
	@Column(name = "cd30")
	/**产犊30天*/
	private int cd30;
	
	@Column(name = "cpl30")
	/**参配率30天*/
	private double cpl30;
	
	@Column(name = "cnz")
	/**上一天产奶重量*/
	private double cnz;
	
	@Column(name = "cn1num")
	/**产奶最多的牛只编号*/
	private String cn1num;
	
	@Column(name = "cn1value")
	/**产奶最多的产奶量*/
	private double cn1value;

	public String getNcxh() {
		return ncxh;
	}

	public void setNcxh(String ncxh) {
		this.ncxh = ncxh;
	}

	public int getZts() {
		return zts;
	}

	public void setZts(int zts) {
		this.zts = zts;
	}

	public int getFq30() {
		return fq30;
	}

	public void setFq30(int fq30) {
		this.fq30 = fq30;
	}

	public int getFq1() {
		return fq1;
	}

	public void setFq1(int fq1) {
		this.fq1 = fq1;
	}

	public Date getFq0t() {
		return fq0t;
	}

	public void setFq0t(Date fq0t) {
		this.fq0t = fq0t;
	}

	public int getCd30() {
		return cd30;
	}

	public void setCd30(int cd30) {
		this.cd30 = cd30;
	}

	public double getCpl30() {
		return cpl30;
	}

	public void setCpl30(double cpl30) {
		this.cpl30 = cpl30;
	}

	public double getCnz() {
		return cnz;
	}

	public void setCnz(double cnz) {
		this.cnz = cnz;
	}

	public String getCn1num() {
		return cn1num;
	}

	public void setCn1num(String cn1num) {
		this.cn1num = cn1num;
	}

	public double getCn1value() {
		return cn1value;
	}

	public void setCn1value(double cn1value) {
		this.cn1value = cn1value;
	}

	public double getFq30jcl() {
		return fq30jcl;
	}

	public void setFq30jcl(double fq30jcl) {
		this.fq30jcl = fq30jcl;
	}

	public double getFq1jcl() {
		return fq1jcl;
	}

	public void setFq1jcl(double fq1jcl) {
		this.fq1jcl = fq1jcl;
	}

//	public int getYcn() {
//		return ycn;
//	}
//
//	public void setYcn(int ycn) {
//		this.ycn = ycn;
//	}
//
//	public int getMrn() {
//		return mrn;
//	}
//
//	public void setMrn(int mrn) {
//		this.mrn = mrn;
//	}
	
	
}
