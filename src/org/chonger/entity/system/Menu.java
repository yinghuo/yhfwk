package org.chonger.entity.system;

import java.util.LinkedList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "yh_system_menus")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Menu {
	
	public Menu()
	{
		child=new LinkedList<Menu>();
	}
	
	@Id
	@Column(name = "FBM_ID")
	private String mid=null;
	@Column(name = "FBM_NAME")
	private String mname=null;
	@Column(name = "FBM_TITLE")
	private String mtitle=null;
	@Column(name = "FBM_ACTION")
	private String maction=null;
	@Column(name = "FBM_STATUS")
	private int mstatus=0;
	@Column(name = "FBM_LEVEL")
	private int mlevel=0;
	@Column(name = "FBM_PARENTID")
	private String mparentid;
	@Column(name = "FBM_SEQ")
	private int mseq=0;
	@Column(name = "FBM_TYPE")
	private int mtype=0;
	
	//关联关系实现Tree
	@Transient
	public LinkedList<Menu> child;
	
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getMaction() {
		return maction;
	}
	public void setMaction(String maction) {
		this.maction = maction;
	}
	public int getMstatus() {
		return mstatus;
	}
	public void setMstatus(int mstatus) {
		this.mstatus = mstatus;
	}
	public int getMlevel() {
		return mlevel;
	}
	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}
	public String getMparentid() {
		return mparentid;
	}
	public void setMparentid(String mparentid) {
		this.mparentid = mparentid;
	}
	public int getMseq() {
		return mseq;
	}
	public void setMseq(int mseq) {
		this.mseq = mseq;
	}
	public int getMtype() {
		return mtype;
	}
	public void setMtype(int mtype) {
		this.mtype = mtype;
	}
	public LinkedList<Menu> getChild() {
		return child;
	}
	public void setChild(LinkedList<Menu> child) {
		this.child = child;
	}
}
