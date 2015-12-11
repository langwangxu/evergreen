package org.anran.model;

import java.io.Serializable;

import javax.persistence.*;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * The persistent class for the account database table.
 * 
 */
@Entity
@NamedQuery(name="Account.findAll", query="SELECT a FROM Account a")
public class Account implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private int consumerNum;

	private String consumeTime;

	private int dinnerType;

	private String memo;
	
	private String createTime;
	
	private String updateTime;

	//bi-directional many-to-one association to Vip
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="vipId")
	private Vip vip = new Vip();

	public Account() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getConsumerNum() {
		return this.consumerNum;
	}

	public void setConsumerNum(int consumerNum) {
		this.consumerNum = consumerNum;
	}

	public String getConsumeTime() {
		return this.consumeTime;
	}

	public void setConsumeTime(String consumeTime) {
		this.consumeTime = consumeTime;
	}

	public int getDinnerType() {
		return this.dinnerType;
	}

	public void setDinnerType(int dinnerType) {
		this.dinnerType = dinnerType;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Vip getVip() {
		return this.vip;
	}

	public void setVip(Vip vip) {
		this.vip = vip;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
}