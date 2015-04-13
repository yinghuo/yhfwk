package org.chonger.entity.jbxx;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 牛场信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "ncjbxxb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class NCJBXX {
	@Id
	@Column(name = "ncbh")	
	private String ncbh;//牛场编号
	
	@Column(name = "ncmc")
	private String ncmc;//牛场名称
	
	@Column(name = "ncxz")
	private String ncxz;//牛场性质
	
	@Column(name = "ncdz")
	private String ncdz;//牛场地址
	
	@Column(name = "ssqy")
	private String ssqy;//牛场所属区域
	
	@Column(name = "snqy")
	private String snqy;//收奶企业
	
	@Column(name = "fzr")
	private String fzr;//负责人
	
	@Column(name = "fzrdh")
	private String fzrdh;//负责人电话
	
	@Column(name = "lxr")
	private String lxr;//联系人
	
	@Column(name = "lxrdh")
	private String lxrdh;//联系人电话
	
	@Column(name = "pzy")
	private String pzy;//配种员
	
	@Column(name = "pzydh")
	private String pzhdg;//配种员电话
	
	@Column(name = "fqxtsybz")
	private String fqxtsybz;//发情系统使用标志
	
	@Column(name = "kssysj")
	private Date kssysj;//开始使用时间
	
	@Column(name = "tzsysj")
	private Date tzsysj;//到期使用时间
	
	@Column(name = "lxyx")
	private String lxyx;//联系邮箱
	
	@Column(name = "kddz")
	private String kddz;//快递地址
	
	@Column(name = "bz")
	private String bz;//备注
	
	@OneToMany(mappedBy="ncjbxx",fetch = FetchType.LAZY)
	private List<JSJBXX> jsxxList;
	
	public List<JSJBXX> getJsxxList() {
		return jsxxList;
	}

	public void setJsxxList(List<JSJBXX> jsxxList) {
		this.jsxxList = jsxxList;
	}

	public String getNcbh() {
		return ncbh;
	}

	public void setNcbh(String ncbh) {
		this.ncbh = ncbh;
	}

	public String getNcmc() {
		return ncmc;
	}

	public void setNcmc(String ncmc) {
		this.ncmc = ncmc;
	}

	public String getNcxz() {
		return ncxz;
	}

	public void setNcxz(String ncxz) {
		this.ncxz = ncxz;
	}

	public String getNcdz() {
		return ncdz;
	}

	public void setNcdz(String ncdz) {
		this.ncdz = ncdz;
	}

	public String getSsqy() {
		return ssqy;
	}

	public void setSsqy(String ssqy) {
		this.ssqy = ssqy;
	}

	public String getSnqy() {
		return snqy;
	}

	public void setSnqy(String snqy) {
		this.snqy = snqy;
	}

	public String getFzr() {
		return fzr;
	}

	public void setFzr(String fzr) {
		this.fzr = fzr;
	}

	public String getFzrdh() {
		return fzrdh;
	}

	public void setFzrdh(String fzrdh) {
		this.fzrdh = fzrdh;
	}

	public String getLxr() {
		return lxr;
	}

	public void setLxr(String lxr) {
		this.lxr = lxr;
	}

	public String getLxrdh() {
		return lxrdh;
	}

	public void setLxrdh(String lxrdh) {
		this.lxrdh = lxrdh;
	}

	public String getPzy() {
		return pzy;
	}

	public void setPzy(String pzy) {
		this.pzy = pzy;
	}

	public String getPzhdg() {
		return pzhdg;
	}

	public void setPzhdg(String pzhdg) {
		this.pzhdg = pzhdg;
	}

	public String getFqxtsybz() {
		return fqxtsybz;
	}

	public void setFqxtsybz(String fqxtsybz) {
		this.fqxtsybz = fqxtsybz;
	}

	public Date getKssysj() {
		return kssysj;
	}

	public void setKssysj(Date kssysj) {
		this.kssysj = kssysj;
	}

	public Date getTzsysj() {
		return tzsysj;
	}

	public void setTzsysj(Date tzsysj) {
		this.tzsysj = tzsysj;
	}

	public String getLxyx() {
		return lxyx;
	}

	public void setLxyx(String lxyx) {
		this.lxyx = lxyx;
	}

	public String getKddz() {
		return kddz;
	}

	public void setKddz(String kddz) {
		this.kddz = kddz;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
}
