package org.chonger.entity.system;

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
 * 系统角色实体
 * 
 * @author Daniel
 * @create 2014-05-21
 * @version 1.0
 */
@Entity
@Table(name = "yh_system_roles")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Role {
	@Id
	@Column(name = "R_ID")
	private String rid=null;
	
	@Column(name = "R_Typeid")
	private int  rtype;
	
	@Column(name = "R_NAME")
	private String rname=null;
	
	@Column(name = "R_ICO")
	private String rico=null;
	
	@Column(name = "R_MIDS")
	private String rmids=null;
	
	@Column(name = "R_STATUS")
	private String rstatus=null;
	
	@Column(name = "R_REMARK")
	private String rremark=null;
	
	@Column(name="R_defaultstatus")
	private int rdefault;
	
	@OneToMany(mappedBy="role",fetch = FetchType.LAZY)
	private List<User> user;
	
	public List<User> getUser() {
		return user;
	}

	public void setUser(List<User> user) {
		this.user = user;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRico() {
		return rico;
	}

	public void setRico(String rico) {
		this.rico = rico;
	}

	public String getRmids() {
		return rmids;
	}

	public void setRmids(String rmids) {
		this.rmids = rmids;
	}

	public String getRstatus() {
		return rstatus;
	}

	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}

	public String getRremark() {
		return rremark;
	}

	public void setRremark(String rremark) {
		this.rremark = rremark;
	}

	public int getRtype() {
		return rtype;
	}

	public void setRtype(int rtype) {
		this.rtype = rtype;
	}

	public int getRdefault() {
		return rdefault;
	}

	public void setRdefault(int rdefault) {
		this.rdefault = rdefault;
	}
}
