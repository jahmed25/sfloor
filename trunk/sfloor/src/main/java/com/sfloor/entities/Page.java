package com.sfloor.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonAutoDetect;


@JsonAutoDetect
@Entity
@Table(name="page")
public class Page implements Serializable {
	
	@Id
	@GeneratedValue
	@Column(name="PAGEID")
	private Integer id;
	
	@Column(name="PAGENAME")
	private String pageName;
	
	@Column(name="ACTPAGENAME")
	private String actPageName;
	
	@Column(name="DESCRIPTION")
	private String desc;
	
	public Page() {}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getActPageName() {
		return actPageName;
	}

	public void setActPageName(String actPageName) {
		this.actPageName = actPageName;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}
