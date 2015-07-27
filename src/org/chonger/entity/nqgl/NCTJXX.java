package org.chonger.entity.nqgl;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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
	
	@Column(name = "fq30")
	/**30天发情个数*/
	private int fq30;
	
	@Column(name = "fq1")
	/**当天发情个数*/
	private int fq1;
	
	@Column(name = "fq0t")
	/**最后发情时间*/
	private Date fq0t;
	
	
	
}
