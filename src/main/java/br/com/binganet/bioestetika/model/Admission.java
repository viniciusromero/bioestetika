package br.com.binganet.bioestetika.model;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="pa_admission")
public class Admission {
	
	@Id
    @GeneratedValue
    @Column(name="paadm_rowid")
	private int id;
	
	@Column(name="paadm_admdate")
	private Date admdate;
	
	@Column(name="paadm_admtime")
	private Time admtime;
	
	@Column(name="paadm_dischgdate")
	private Date dischgdate;
	
	@Column(name="paadm_dischgtime")
	private Time dischgtime;
	
	@Column(name="paadm_observations", length=500)
	private String observations;
		
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="paadm_patient_dr")
	private Patient patient;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getAdmdate() {
		return admdate;
	}

	public void setAdmdate(Date admdate) {
		this.admdate = admdate;
	}

	public Time getAdmtime() {
		return admtime;
	}

	public void setAdmtime(Time admtime) {
		this.admtime = admtime;
	}

	public Date getDischgdate() {
		return dischgdate;
	}

	public void setDischgdate(Date dischgdate) {
		this.dischgdate = dischgdate;
	}

	public Time getDischgtime() {
		return dischgtime;
	}

	public void setDischgtime(Time dischgtime) {
		this.dischgtime = dischgtime;
	}

	public String getObservations() {
		return observations;
	}

	public void setObservations(String observations) {
		this.observations = observations;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	
	
}
