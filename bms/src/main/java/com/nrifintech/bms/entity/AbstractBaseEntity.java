package com.nrifintech.bms.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@MappedSuperclass
public class AbstractBaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@CreationTimestamp
	@Column(name = "createdat", updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdAt;

	@UpdateTimestamp
	@Column(name = "updatedat", updatable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedAt;

}