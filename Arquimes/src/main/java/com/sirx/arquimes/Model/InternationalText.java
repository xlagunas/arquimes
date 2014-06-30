package com.sirx.arquimes.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "internationalization")
public class InternationalText {
	long id;
	private String es_ES;
	private String ca_CA;
	private String en_EN;
	private String fr_FR;

	public InternationalText() {
		super();
	}

	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	@Lob
	public String getEs_ES() {
		return es_ES;
	}

	public void setEs_ES(String es_ES) {
		this.es_ES = es_ES;
	}
	@Lob
	public String getCa_CA() {
		return ca_CA;
	}

	public void setCa_CA(String ca_CA) {
		this.ca_CA = ca_CA;
	}
	@Lob
	public String getEn_EN() {
		return en_EN;
	}

	public void setEn_EN(String en_EN) {
		this.en_EN = en_EN;
	}
	@Lob
	public String getFr_FR() {
		return fr_FR;
	}

	public void setFr_FR(String fr_FR) {
		this.fr_FR = fr_FR;
	}

}
