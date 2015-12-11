package org.anran.model;

import java.io.Serializable;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnore;

import flexjson.JSON;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the vip database table.
 * 
 */
@Entity
@NamedQuery(name="Vip.findAll", query="SELECT v FROM Vip v")
public class Vip implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String birth;
	
	private String card;

	private String email;

	private String memo;

	private String name;

	private String phone;

	private String createTime;
	
	private String updateTime;

	@OneToMany(mappedBy="vip", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Account> accounts;

	public Vip() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBirth() {
		return this.birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getCard() {
		return this.card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public List<Account> getAccounts() {
		return this.accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}

/*	public Account addAccount(Account account) {
		getAccounts().add(account);
		account.setVip(this);

		return account;
	}

	public Account removeAccount(Account account) {
		getAccounts().remove(account);
		account.setVip(null);

		return account;
	}
*/

}