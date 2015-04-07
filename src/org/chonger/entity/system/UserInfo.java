package org.chonger.entity.system;

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
 * 系统用户详细实体
 * 
 * @author Daniel
 * @create 2014-05-21
 * @version 1.0
 */
@Entity
@Table(name = "yh_system_users_info")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class UserInfo {
	@Id
	@Column(name = "U_ID")
	private String uid=null;
	
	@Column(name = "U_SEX")
	private int sex;
	
	@Column(name = "U_PHONENUM")
	private String phonenum=null;
	
	@Column(name = "U_IDNAME")
	private String idname=null;
	
	@Column(name = "U_IDNUM")
	private String idnum=null;
	
	@Column(name="U_DISTRICTID")
	private String districtid;
	
	@Column(name = "U_EMAIL")
	private String email;
	
	/**
	 * 信息完整度
	 */
	@Column(name="U_INTEGRITY")
	private double uintegrity;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "U_ID")
	private User user;
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getIdname() {
		return idname;
	}

	public void setIdname(String idname) {
		this.idname = idname;
	}

	public String getIdnum() {
		return idnum;
	}

	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}

	public String getDistrictid() {
		return districtid;
	}

	public void setDistrictid(String districtid) {
		this.districtid = districtid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getUintegrity() {
		return uintegrity;
	}

	public void setUintegrity(double uintegrity) {
		this.uintegrity = uintegrity;
	}
}
