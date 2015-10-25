package br.com.binganet.bioestetika.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pa_patient")
public class Patient {
	
	@Id
    @GeneratedValue
    @Column(name="papat_rowid")
	private int id;
	
	@Column(name="papat_name", length=50)
    private String name;
	
	@Column(name="papat_nasc")
	private Date dob;
	
	@Column(name="papat_mobilephone")
	private String mobilephone;
	
	@Column(name="papat_zipcode")
	private String zipcode;
	
	@Column(name="papat_address")
	private String address;
	
	@Column(name="papat_email")
	private String email;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getMobilephone() {
		return mobilephone;
	}

	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
}
