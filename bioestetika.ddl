create sequence ssusr_seq;

CREATE TABLE ss_user
(
  ssusr_rowid integer NOT NULL DEFAULT default nextval('ssusr_seq'),
  ssusr_email text NOT NULL,
  ssusr_name character varying(50) NOT NULL,
  ssusr_enabled boolean NOT NULL,
  ssusr_password character varying(50) NOT NULL,
  ssusr_role character varying(10) NOT NULL,
  CONSTRAINT ss_user_pkey PRIMARY KEY (ssusr_rowid)
);

alter sequence ssusr_seq owned by ss_user.ssusr_rowid;


create sequence papat_seq;

CREATE TABLE pa_patient
(
  papat_rowid integer NOT NULL DEFAULT default nextval('papat_seq'),
  papat_name character varying(50) NOT NULL,
  papat_mobilephone character varying(50),
  papat_address character varying(50),
  papat_email character varying(50) NOT NULL,
  papat_nasc date,
  CONSTRAINT pa_patient_pkey PRIMARY KEY (papat_rowid)
);

alter sequence papat_seq owned by pa_patient.papat_rowid;

create sequence paadm_seq;

CREATE TABLE pa_admission
(
  paadm_rowid integer NOT NULL DEFAULT default nextval('paadm_seq'),
  paadm_admdate date NOT NULL,
  paadm_admtime time without time zone NOT NULL,
  paadm_observations character varying(500),
  paadm_dischgdate date,
  paadm_dischgtime time without time zone,
  paadm_patient_dr integer,
  CONSTRAINT pa_admission_pkey PRIMARY KEY (paadm_rowid),
  CONSTRAINT pa_admission_patient FOREIGN KEY (paadm_patient_dr)
      REFERENCES pa_patient (papat_rowid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

alter sequence paadm_seq owned by pa_admission.paadm_rowid;

create sequence anamn_seq;

CREATE TABLE pa_anamenese
(
  anamn_rowid integer NOT NULL DEFAULT nextval('anamn_seq'),
  anamn_currentmedsbl boolean,
  anamn_currentmeds text,
  anamn_allergiesbl boolean,
  anamn_allergies text,
  anamn_pathobserv text,
  anamn_bodychanges text,
  anamn_bodychangesobserv text,
  anamn_pregnant boolean,
  anamn_puberty boolean,
  anamn_menopause boolean,
  anamn_tpm boolean,
  anamn_birthcontrol boolean,
  anamn_fibroids boolean,
  anamn_lactation boolean,
  anamn_neoplasia boolean,
  anamn_weight integer,
  anamn_height integer,
  anamn_imc integer,
  anamn_gynoid boolean,
  anamn_android boolean,
  anamn_athletic boolean,
  anamn_leptossimic boolean,
  anamn_picnico boolean,
  anamn_foodtype text,
  anamn_smoker boolean,
  anamn_alcoholic boolean,
  anamn_alcoholicfreq text,
  anamn_water boolean,
  anamn_waterfreq text,
  anamn_dailyposition text,
  anamn_constipation boolean,
  anamn_hourssplet text,
  anamn_cosmetics boolean,
  anamn_cosmeticsfreq text,
  anamn_physicact boolean,
  anamn_physicactfreq text,
  anamn_hldgregions text,
  anamn_nodules boolean,
  anamn_atrphicdep boolean,
  anamn_palpain boolean,
  anamn_localfat boolean,
  anamn_regionfat text,
  anamn_flabs text,
  anamn_regionflabs text,
  anamn_aesthctreatbl boolean,
  anamn_aesthctreat text,
  anamn_aesthccomplains text,
  anamn_proptreat text,
  anamn_sessionum integer,
  anamn_sessionfreq text,
  anamn_description text,
  anamn_createdate date,
  anamn_createtime time without time zone,
  anamn_updatedate timestamp without time zone,
  anamn_updatetime time without time zone,
  anamn_admission_dr integer,
  anamn_patcardio boolean,
  anamn_patderma boolean,
  anamn_patendo boolean,
  anamn_patneuro boolean,
  anamn_patpulmo boolean,
  anamn_bodychangescirur boolean,
  anamn_bodychangesdiab boolean,
  anamn_bodychangeshipe boolean,
  anamn_bodychangeshipo boolean,
  anamn_bodychangeskidn boolean,
  anamn_bodychangesova boolean,
  anamn_bodychangesvariz boolean,
  anamn_hldgi boolean,
  anamn_hldgii boolean,
  anamn_hldgiii boolean,
  anamn_hldgiv boolean,
  anamn_consistensyedematous boolean,
  anamn_consistensyflaccid boolean,
  anamn_consistensytough boolean,
  anamn_womenobs character varying(255),
  CONSTRAINT anamn_admission_dr FOREIGN KEY (anamn_admission_dr)
      REFERENCES pa_admission (paadm_rowid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

alter sequence anamn_seq owned by pa_anamenese.anamn_rowid;

CREATE INDEX fki_anamn_admission_dr
  ON pa_anamenese
  USING btree
  (anamn_admission_dr);
