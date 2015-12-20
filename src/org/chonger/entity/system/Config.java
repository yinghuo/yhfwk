package org.chonger.entity.system;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "yh_system_config")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Config {
	
	@Id
	@Column(name = "id")
	private String id;
	
	@Column(name = "domain")
	private String domain;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "value")
	private String value;
	
	@Column(name = "bz")
	private String bz;
	
	@Column(name = "ncbh")
	private String ncbh;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getNcbh() {
		return ncbh;
	}
	public void setNcbh(String ncbh) {
		this.ncbh = ncbh;
	}
}
