package org.chonger.entity.system;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 系统用户实体
 * 
 * @author Daniel
 * @create 2014-05-21
 * @version 1.0
 */
@Entity
@Table(name = "yh_system_users")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class User implements Cloneable {
	@Id
	@Column(name = "U_ID")
	private String uid=null;
	
	@Column(name = "U_NAME")
	private String uname;
	
	@Column(name = "U_PASSWORD")
	private String upassword;
	
	@Column(name = "U_FACEIMAGE")
	private String ufaceimage;
	
	@Column(name = "U_TYPE")
	private int utype;
	
	@Column(name = "U_RULEID")
	private String uroleid;
	
	@Column(name="U_LOGINNAME")
	private String uloginname;
	
	@Column(name="U_Tid")
	private String utid;
	
	//上次登录时间
	@Column(name="U_lASTIME")
	private Date ulastlogintime;
	
	//本次登陆时间
	@Column(name="U_NOWTIME")
	private Date unowlogintime;
		
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "U_RULEID",insertable = false, updatable = false)
	private Role role;
	
	@OneToOne(mappedBy="user")
	private UserInfo userInfo;
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getUloginname() {
		return uloginname;
	}

	public void setUloginname(String uloginname) {
		this.uloginname = uloginname;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpassword() {
		return upassword;
	}

	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}

	public String getUfaceimage() {
		return ufaceimage;
	}

	public void setUfaceimage(String ufaceimage) {
		this.ufaceimage = ufaceimage;
	}

	public int getUtype() {
		return utype;
	}

	public void setUtype(int utype) {
		this.utype = utype;
	}

	public String getUroleid() {
		return uroleid;
	}

	public void setUroleid(String uroleid) {
		this.uroleid = uroleid;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public Object clone() throws CloneNotSupportedException {
		
		return super.clone();
	}

	public String getUtid() {
		return utid;
	}

	public void setUtid(String utid) {
		this.utid = utid;
	}

	public Date getUlastlogintime() {
		return ulastlogintime;
	}

	public void setUlastlogintime(Date ulastlogintime) {
		this.ulastlogintime = ulastlogintime;
	}

	public Date getUnowlogintime() {
		return unowlogintime;
	}

	public void setUnowlogintime(Date unowlogintime) {
		this.unowlogintime = unowlogintime;
	}

}
