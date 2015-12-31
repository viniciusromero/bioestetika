package br.com.binganet.bioestetika.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;
import java.sql.Time;

@Entity
@Table(name="pa_anamenese")
public class Anamenese {
	
	@Id
    @GeneratedValue
    @Column(name="anamn_rowid")
	private int id;
	
	@Column(name="anamn_currentmedsbl")
	private boolean currentmedsbl; 
	
	@Column(name="anamn_currentmeds")
	private String currentmeds;
	
	@Column(name="anamn_allergiesbl")
	private boolean allergiesbl;
	
	@Column(name="anamn_allergies")
	private String allergies;
	
	@Column(name="anamn_patcardio")
	private boolean patcardio; 
	
	@Column(name="anamn_patneuro")
	private boolean patneuro; 
	
	@Column(name="anamn_patpulmo")
	private boolean patpulmo;
	
	@Column(name="anamn_patderma")
	private boolean patderma;
	
	@Column(name="anamn_patendo")
	private boolean patendo;
	
	@Column(name="anamn_pathobserv")
	private String pathobserv;
	
	@Column(name="anamn_bodychangesova")
	private boolean bodychangesova;
	
	@Column(name="anamn_bodychangeskidn")
	private boolean bodychangeskidn;
	
	@Column(name="anamn_bodychangesvariz")
	private boolean bodychangesvariz;
	
	@Column(name="anamn_bodychangeshipe")
	private boolean bodychangeshipe;
	
	@Column(name="anamn_bodychangeshipo")
	private boolean bodychangeshipo;
	
	@Column(name="anamn_bodychangesdiab")
	private boolean bodychangesdiab;
	
	@Column(name="anamn_bodychangescirur")
	private boolean bodychangescirur; 
	
	@Column(name="anamn_bodychangesobserv")
	private String bodychangesobserv; 
	
	@Column(name="anamn_pregnant")
	private boolean pregnant; 
	
	@Column(name="anamn_puberty")
	private boolean puberty; 
	
	@Column(name="anamn_menopause")
	private boolean menopause; 
	
	@Column(name="anamn_tpm")
	private boolean tpm; 
	
	@Column(name="anamn_birthcontrol")
	private boolean birthcontrol; 
	
	@Column(name="anamn_fibroids")
	private boolean fibroids; 
	
	@Column(name="anamn_lactation")
	private boolean lactation; 
	
	@Column(name="anamn_neoplasia")
	private boolean neoplasia; 
	
	@Column(name="anamn_womenobs")
	private String womenobs; 
	
	@Column(name="anamn_weight")
	private int weight; 
	
	@Column(name="anamn_height")
	private int height; 
	
	@Column(name="anamn_imc")
	private int imc; 
	
	@Column(name="anamn_gynoid")
	private boolean gynoid;
	
	@Column(name="anamn_android")
	private boolean android;
	
	@Column(name="anamn_athletic")
	private boolean athletic;
	
	@Column(name="anamn_leptossimic")
	private boolean leptossimic;
	
	@Column(name="anamn_picnico")
	private boolean picnico;
	
	@Column(name="anamn_foodtype")
	private String foodtype; 
	
	@Column(name="anamn_smoker")
	private boolean smoker; 
	
	@Column(name="anamn_alcoholic")
	private boolean alcoholic; 
	
	@Column(name="anamn_alcoholicfreq")
	private String alcoholicfreq; 
	
	@Column(name="anamn_water")
	private boolean water; 
	
	@Column(name="anamn_waterfreq")
	private String waterfreq; 
	
	@Column(name="anamn_dailyposition")
	private String dailyposition; 
	
	@Column(name="anamn_constipation")
	private boolean constipation; 
	
	@Column(name="anamn_hourssplet")
	private String hourssplet;
	
	@Column(name="anamn_cosmetics")
	private boolean cosmetics; 
	
	@Column(name="anamn_cosmeticsfreq")
	private String cosmeticsfreq;
	
	@Column(name="anamn_physicact")
	private boolean physicact; 
	
	@Column(name="anamn_physicactfreq")
	private String physicactfreq;
	
	@Column(name="anamn_hldgI")
	private boolean hldgI;
	
	@Column(name="anamn_hldgII")
	private boolean hldgII;
	
	@Column(name="anamn_hldgIII")
	private boolean hldgIII;
	
	@Column(name="anamn_hldgIV")
	private boolean hldgIV;
	
	@Column(name="anamn_hldgregions")
	private String hldgregions;
	
	@Column(name="anamn_consistensytough")
	private boolean consistensytough;
	
	@Column(name="anamn_consistensyflaccid")
	private boolean consistensyflaccid;
	
	@Column(name="anamn_consistensyedematous")
	private boolean consistensyedematous;
	
	@Column(name="anamn_nodules")
	private boolean nodules; 
	
	@Column(name="anamn_atrphicdep")
	private boolean atrphicdep; 
	
	@Column(name="anamn_palpain")
	private boolean palpain; 
	
	@Column(name="anamn_localfat")
	private boolean localfat; 
	
	@Column(name="anamn_regionfat")
	private String regionfat;
	
	@Column(name="anamn_flabs")
	private String flabs;
	
	@Column(name="anamn_regionflabs")
	private String regionflabs;
	
	@Column(name="anamn_aesthctreatbl")
	private boolean aesthctreatbl; 
	
	@Column(name="anamn_aesthctreat")
	private String aesthctreat;
	
	@Column(name="anamn_aesthccomplains")
	private String aesthccomplains;
	
	@Column(name="anamn_proptreat")
	private String proptreat;
	
	@Column(name="anamn_sessionum")
	private int sessionum;
	
	@Column(name="anamn_sessionfreq")
	private String sessionfreq;
	
	@Column(name="anamn_description")
	private String description;
	
	@Column(name="anamn_updatedate")
	private Date updatedate;
	
	@Column(name="anamn_updatetime")
	private Time updatetime;
	
	@Column(name="anamn_createdate")
	private Date createdate;
	
	@Column(name="anamn_createtime")
	private Time createtime;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="anamn_admission_dr")
	private Admission admission;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isCurrentmedsbl() {
		return currentmedsbl;
	}

	public void setCurrentmedsbl(boolean currentmedsbl) {
		this.currentmedsbl = currentmedsbl;
	}

	public String getCurrentmeds() {
		return currentmeds;
	}

	public void setCurrentmeds(String currentmeds) {
		this.currentmeds = currentmeds;
	}

	public boolean isAllergiesbl() {
		return allergiesbl;
	}

	public void setAllergiesbl(boolean allergiesbl) {
		this.allergiesbl = allergiesbl;
	}

	public String getAllergies() {
		return allergies;
	}

	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}

	public boolean isPatcardio() {
		return patcardio;
	}

	public void setPatcardio(boolean patcardio) {
		this.patcardio = patcardio;
	}

	public boolean isPatneuro() {
		return patneuro;
	}

	public void setPatneuro(boolean patneuro) {
		this.patneuro = patneuro;
	}

	public boolean isPatpulmo() {
		return patpulmo;
	}

	public void setPatpulmo(boolean patpulmo) {
		this.patpulmo = patpulmo;
	}

	public boolean isPatderma() {
		return patderma;
	}

	public void setPatderma(boolean patderma) {
		this.patderma = patderma;
	}

	public boolean isPatendo() {
		return patendo;
	}

	public void setPatendo(boolean patendo) {
		this.patendo = patendo;
	}

	public String getPathobserv() {
		return pathobserv;
	}

	public void setPathobserv(String pathobserv) {
		this.pathobserv = pathobserv;
	}

	public boolean isBodychangesova() {
		return bodychangesova;
	}

	public void setBodychangesova(boolean bodychangesova) {
		this.bodychangesova = bodychangesova;
	}

	public boolean isBodychangeskidn() {
		return bodychangeskidn;
	}

	public void setBodychangeskidn(boolean bodychangeskidn) {
		this.bodychangeskidn = bodychangeskidn;
	}

	public boolean isBodychangesvariz() {
		return bodychangesvariz;
	}

	public void setBodychangesvariz(boolean bodychangesvariz) {
		this.bodychangesvariz = bodychangesvariz;
	}

	public boolean isBodychangeshipe() {
		return bodychangeshipe;
	}

	public void setBodychangeshipe(boolean bodychangeshipe) {
		this.bodychangeshipe = bodychangeshipe;
	}

	public boolean isBodychangeshipo() {
		return bodychangeshipo;
	}

	public void setBodychangeshipo(boolean bodychangeshipo) {
		this.bodychangeshipo = bodychangeshipo;
	}

	public boolean isBodychangesdiab() {
		return bodychangesdiab;
	}

	public void setBodychangesdiab(boolean bodychangesdiab) {
		this.bodychangesdiab = bodychangesdiab;
	}

	public boolean isBodychangescirur() {
		return bodychangescirur;
	}

	public void setBodychangescirur(boolean bodychangescirur) {
		this.bodychangescirur = bodychangescirur;
	}

	public String getBodychangesobserv() {
		return bodychangesobserv;
	}

	public void setBodychangesobserv(String bodychangesobserv) {
		this.bodychangesobserv = bodychangesobserv;
	}

	public boolean isPregnant() {
		return pregnant;
	}

	public void setPregnant(boolean pregnant) {
		this.pregnant = pregnant;
	}

	public boolean isPuberty() {
		return puberty;
	}

	public void setPuberty(boolean puberty) {
		this.puberty = puberty;
	}

	public boolean isMenopause() {
		return menopause;
	}

	public void setMenopause(boolean menopause) {
		this.menopause = menopause;
	}

	public boolean isTpm() {
		return tpm;
	}

	public void setTpm(boolean tpm) {
		this.tpm = tpm;
	}

	public boolean isBirthcontrol() {
		return birthcontrol;
	}

	public void setBirthcontrol(boolean birthcontrol) {
		this.birthcontrol = birthcontrol;
	}

	public boolean isFibroids() {
		return fibroids;
	}

	public void setFibroids(boolean fibroids) {
		this.fibroids = fibroids;
	}

	public boolean isLactation() {
		return lactation;
	}

	public void setLactation(boolean lactation) {
		this.lactation = lactation;
	}

	public boolean isNeoplasia() {
		return neoplasia;
	}

	public void setNeoplasia(boolean neoplasia) {
		this.neoplasia = neoplasia;
	}

	public void setWomenobs(String womenobs) {
		this.womenobs = womenobs;
	}
	
	public String getWomenobs() {
		return womenobs;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getImc() {
		return imc;
	}

	public void setImc(int imc) {
		this.imc = imc;
	}

	

	public boolean isGynoid() {
		return gynoid;
	}

	public void setGynoid(boolean gynoid) {
		this.gynoid = gynoid;
	}

	public boolean isAndroid() {
		return android;
	}

	public void setAndroid(boolean android) {
		this.android = android;
	}

	public boolean isAthletic() {
		return athletic;
	}

	public void setAthletic(boolean athletic) {
		this.athletic = athletic;
	}

	public boolean isLeptossimic() {
		return leptossimic;
	}

	public void setLeptossimic(boolean leptossimic) {
		this.leptossimic = leptossimic;
	}

	public boolean isPicnico() {
		return picnico;
	}

	public void setPicnico(boolean picnico) {
		this.picnico = picnico;
	}

	public String getFoodtype() {
		return foodtype;
	}

	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}

	public boolean isSmoker() {
		return smoker;
	}

	public void setSmoker(boolean smoker) {
		this.smoker = smoker;
	}

	public boolean isAlcoholic() {
		return alcoholic;
	}

	public void setAlcoholic(boolean alcoholic) {
		this.alcoholic = alcoholic;
	}

	public String getAlcoholicfreq() {
		return alcoholicfreq;
	}

	public void setAlcoholicfreq(String alcoholicfreq) {
		this.alcoholicfreq = alcoholicfreq;
	}

	public boolean isWater() {
		return water;
	}

	public void setWater(boolean water) {
		this.water = water;
	}

	public String getWaterfreq() {
		return waterfreq;
	}

	public void setWaterfreq(String waterfreq) {
		this.waterfreq = waterfreq;
	}

	public String getDailyposition() {
		return dailyposition;
	}

	public void setDailyposition(String dailyposition) {
		this.dailyposition = dailyposition;
	}

	public boolean isConstipation() {
		return constipation;
	}

	public void setConstipation(boolean constipation) {
		this.constipation = constipation;
	}

	public String getHourssplet() {
		return hourssplet;
	}

	public void setHourssplet(String hourssplet) {
		this.hourssplet = hourssplet;
	}

	public boolean isCosmetics() {
		return cosmetics;
	}

	public void setCosmetics(boolean cosmetics) {
		this.cosmetics = cosmetics;
	}

	public String getCosmeticsfreq() {
		return cosmeticsfreq;
	}

	public void setCosmeticsfreq(String cosmeticsfreq) {
		this.cosmeticsfreq = cosmeticsfreq;
	}

	public boolean isPhysicact() {
		return physicact;
	}

	public void setPhysicact(boolean physicact) {
		this.physicact = physicact;
	}

	public String getPhysicactfreq() {
		return physicactfreq;
	}

	public void setPhysicactfreq(String physicactfreq) {
		this.physicactfreq = physicactfreq;
	}

	public boolean isHldgI() {
		return hldgI;
	}

	public void setHldgI(boolean hldgI) {
		this.hldgI = hldgI;
	}

	public boolean isHldgII() {
		return hldgII;
	}

	public void setHldgII(boolean hldgII) {
		this.hldgII = hldgII;
	}

	public boolean isHldgIII() {
		return hldgIII;
	}

	public void setHldgIII(boolean hldgIII) {
		this.hldgIII = hldgIII;
	}

	public boolean isHldgIV() {
		return hldgIV;
	}

	public void setHldgIV(boolean hldgIV) {
		this.hldgIV = hldgIV;
	}

	public String getHldgregions() {
		return hldgregions;
	}

	public void setHldgregions(String hldgregions) {
		this.hldgregions = hldgregions;
	}

	

	public boolean isConsistensytough() {
		return consistensytough;
	}

	public void setConsistensytough(boolean consistensytough) {
		this.consistensytough = consistensytough;
	}

	public boolean isConsistensyflaccid() {
		return consistensyflaccid;
	}

	public void setConsistensyflaccid(boolean consistensyflaccid) {
		this.consistensyflaccid = consistensyflaccid;
	}

	public boolean isConsistensyedematous() {
		return consistensyedematous;
	}

	public void setConsistensyedematous(boolean consistensyedematous) {
		this.consistensyedematous = consistensyedematous;
	}

	public boolean isNodules() {
		return nodules;
	}

	public void setNodules(boolean nodules) {
		this.nodules = nodules;
	}

	public boolean isAtrphicdep() {
		return atrphicdep;
	}

	public void setAtrphicdep(boolean atrphicdep) {
		this.atrphicdep = atrphicdep;
	}

	public boolean isPalpain() {
		return palpain;
	}

	public void setPalpain(boolean palpain) {
		this.palpain = palpain;
	}

	public boolean isLocalfat() {
		return localfat;
	}

	public void setLocalfat(boolean localfat) {
		this.localfat = localfat;
	}

	public String getRegionfat() {
		return regionfat;
	}

	public void setRegionfat(String regionfat) {
		this.regionfat = regionfat;
	}

	public String getFlabs() {
		return flabs;
	}

	public void setFlabs(String flabs) {
		this.flabs = flabs;
	}

	public String getRegionflabs() {
		return regionflabs;
	}

	public void setRegionflabs(String regionflabs) {
		this.regionflabs = regionflabs;
	}

	public boolean isAesthctreatbl() {
		return aesthctreatbl;
	}

	public void setAesthctreatbl(boolean aesthctreatbl) {
		this.aesthctreatbl = aesthctreatbl;
	}

	public String getAesthctreat() {
		return aesthctreat;
	}

	public void setAesthctreat(String aesthctreat) {
		this.aesthctreat = aesthctreat;
	}

	public String getAesthccomplains() {
		return aesthccomplains;
	}

	public void setAesthccomplains(String aesthccomplains) {
		this.aesthccomplains = aesthccomplains;
	}

	public String getProptreat() {
		return proptreat;
	}

	public void setProptreat(String proptreat) {
		this.proptreat = proptreat;
	}

	public int getSessionum() {
		return sessionum;
	}

	public void setSessionum(int sessionum) {
		this.sessionum = sessionum;
	}

	public String getSessionfreq() {
		return sessionfreq;
	}

	public void setSessionfreq(String sessionfreq) {
		this.sessionfreq = sessionfreq;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public Time getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Time updatetime) {
		this.updatetime = updatetime;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Time getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Time createtime) {
		this.createtime = createtime;
	}

	public Admission getAdmission() {
		return admission;
	}

	public void setAdmission(Admission admission) {
		this.admission = admission;
	}		
	
}
