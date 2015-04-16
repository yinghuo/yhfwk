package org.chonger.entity.jbxx;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.chonger.entity.nqgl.NZJBXX;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 圈舍基本信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "jsxxb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class JSJBXX {
	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "jsbh")
	private String jsbh;//圈舍编号
	
	@Column(name = "jsmc")
	private String jsmc;//圈舍名称
	
	@Column(name = "jslb")
	private String jslb;//圈舍类别
	
	@Column(name = "bz")
	private String bz;//备注
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="ncbh",insertable = false, updatable = false)
	private NCJBXX ncjbxx;
	
	@OneToMany(mappedBy="jsjbxx",fetch = FetchType.LAZY)
	private List<NZJBXX> nzxxList;
	
	public List<NZJBXX> getNzxxList() {
		return nzxxList;
	}

	public void setNzxxList(List<NZJBXX> nzxxList) {
		this.nzxxList = nzxxList;
	}

	public NCJBXX getNcjbxx() {
		return ncjbxx;
	}

	public void setNcjbxx(NCJBXX ncjbxx) {
		this.ncjbxx = ncjbxx;
	}

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

	public String getJsbh() {
		return jsbh;
	}

	public void setJsbh(String jsbh) {
		this.jsbh = jsbh;
	}

	public String getJsmc() {
		return jsmc;
	}

	public void setJsmc(String jsmc) {
		this.jsmc = jsmc;
	}

	public String getJslb() {
		return jslb;
	}

	public void setJslb(String jslb) {
		this.jslb = jslb;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
}
