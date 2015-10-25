package br.com.binganet.bioestetika.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import br.com.binganet.bioestetika.model.Role;

@Entity
@Table(name="ss_user")
public class User {
	
	@Id
    @GeneratedValue
    @Column(name="ssusr_rowid")
    private int id;
	
	@Column(name="ssusr_email")
	private String email;
	
	@Column(name="ssusr_name", length=50)
    private String name;
	
	@Column(name="ssusr_enabled")
    private String enabled;
	
	@Column(name="ssusr_password")
    private String password;
    
    @Enumerated(EnumType.STRING)
    @Column(name="ssusr_role")
    private Role role;
    
}