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
import org.chonger.utils.DateTimeUtil;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * 发情登记信息实体类
 * 
 * @author Daniel
 * @create 2015-03-08
 * @version 1.0
 */
@Entity
@Table(name = "fqdjb")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FQDJXX
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
	
	@Column(name = "fqsj")
	private Date fqsj;//发情时间
	
	@Column(name="pzsj")
	private Date pzsj;//配种时间
	
	@Column(name="pzsj1")
	private Date pzsj1;//配种时间1
	
	@Column(name = "fqlx")
	private String fqlx;//发情类型
	
	@Column(name = "fxfs")
	private String fxfs;//发现方式
	
	@Column(name = "fxr")
	private String fxr;//发现人
	
	@Column(name = "shy")
	private String shy;//审核员
	
	@Column(name = "sfpz")
	private int sfpz;//是否配种
	
	@Column(name = "wpyy")
	private String wpyy;//未配原因
	
	@Column(name = "bz")
	private String bz;//备注
	
	@Column(name = "sjzt")
	private int sjzt;//数据状态 0 显示 1隐藏
	
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

	public Date getFqsj() {
		return fqsj;
	}
	
	//添加+处理
//	public void setFqsj(String fqsj) {
//		System.out.println("发情时间："+fqsj);
//		if(fqsj!=null && fqsj.length() > 0){
//			fqsj = fqsj.replaceAll("+", " ");
//			this.fqsj = DateTimeUtil.parseDate2YMDHMS(fqsj);
//		}else{
//			this.fqsj = null;
//		}
//	}
	
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

	public String getShy() {
		return shy;
	}

	public void setShy(String shy) {
		this.shy = shy;
	}

	public int getSfpz() {
		return sfpz;
	}

	public void setSfpz(int sfpz) {
		this.sfpz = sfpz;
	}

	public String getWpyy() {
		return wpyy;
	}

	public void setWpyy(String wpyy) {
		this.wpyy = wpyy;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public Date getPzsj() {
		return pzsj;
	}

	public void setPzsj(Date pzsj) {
		this.pzsj = pzsj;
	}

	public Date getPzsj1() {
		return pzsj1;
	}

	public void setPzsj1(Date pzsj1) {
		this.pzsj1 = pzsj1;
	}
	
}
