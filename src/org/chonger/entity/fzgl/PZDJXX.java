package org.chonger.entity.fzgl;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.chonger.entity.nqgl.NZJBXX;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 配种登记信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "pzdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class PZDJXX
{
	public int getSjzt() {
		return sjzt;
	}

	public void setSjzt(int sjzt) {
		this.sjzt = sjzt;
	}

	@Id
	@Column(name = "xh")
	private String xh;//序号
	
	@Column(name = "ncbh")
	private String ncbh;//牛场编号
	
	@Column(name = "nzbh")
	private String nzbh;//牛只编号
	
	@Column(name = "pzsj")
	private Date pzsj;//配种时间
	
	@Column(name = "djbh")
	private String djbh;//冻精编号
	
	@Column(name = "djlx")
	private String djlx;//冻精类型
	
	@Column(name = "pzy")
	private String pzy;//配种员
	
	@Column(name = "fqsj")
	private Date fqsj;//发情时间
	
	@Column(name = "fqlx")
	private String fqlx;//发情类型
	
	@Column(name = "fxfs")
	private String fxfs;//发现方式
	
	@Column(name = "fxr")
	private String fxr;//发现人
	
	@Column(name = "sl")
	private int sl;//数量
	
	@Column(name = "bz")
	private String bz;//备注
	
	@Column(name = "sjzt")
	private int sjzt;//数据状态 0 显示 1隐藏
	
	@Transient
	private String fqid;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="nzbh",insertable = false, updatable = false)
	private NZJBXX nzjbxx;
	
	public NZJBXX getNzjbxx() {
		return nzjbxx;
	}

	public void setNzjbxx(NZJBXX nzjbxx) {
		this.nzjbxx = nzjbxx;
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

	public String getNzbh() {
		return nzbh;
	}

	public void setNzbh(String nzbh) {
		this.nzbh = nzbh;
	}

	public Date getPzsj() {
		return pzsj;
	}

	public void setPzsj(Date pzsj) {
		this.pzsj = pzsj;
	}

	public String getDjbh() {
		return djbh;
	}

	public void setDjbh(String djbh) {
		this.djbh = djbh;
	}

	public String getDjlx() {
		return djlx;
	}

	public void setDjlx(String djlx) {
		this.djlx = djlx;
	}

	public String getPzy() {
		return pzy;
	}

	public void setPzy(String pzy) {
		this.pzy = pzy;
	}

	public Date getFqsj() {
		return fqsj;
	}

	public void setFqsj(Date fqsj) {
		this.fqsj = fqsj;
	}

	public String getFqlx() {
		return fqlx;
	}

	public void setFqlx(String fqlx) {
		this.fqlx = fqlx;
	}

	public String getFxfs() {
		return fxfs;
	}

	public void setFxfs(String fxfs) {
		this.fxfs = fxfs;
	}

	public String getFxr() {
		return fxr;
	}

	public void setFxr(String fxr) {
		this.fxr = fxr;
	}

	public int getSl() {
		return sl;
	}

	public void setSl(int sl) {
		this.sl = sl;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getFqid() {
		return fqid;
	}

	public void setFqid(String fqid) {
		this.fqid = fqid;
	}

}
