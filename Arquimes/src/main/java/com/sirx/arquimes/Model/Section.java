package com.sirx.arquimes.Model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class Section {

	public static final int SECTION_ESTUDI 			= 1;
	public static final int SECTION_PROJECTES 		= 2;
	public static final int SECTION_PUBLICACIONS 	= 3;
	public static final int SECTION_ENCURS 			= 4;
	public static final int SECTION_SERVEIS 		= 5;
	public static final int SECTION_CONTACTE	 	= 6;
	public static final int SECTION_NONE 			= 7;
	public static final int SECTION_INICI			= 8;
	public static final int SECTION_URBANISME 		= 9;
	public static final int SECTION_INDIVIDUAL 		= 10;
	public static final int SECTION_COLECTIU 		= 11;
	public static final int SECTION_ACTUALITAT 		= 12;
	

	private List<Content> elements;
	private long id;
	private List<Image> images;
	private int sectionType;
	private boolean hasContents;
	//private boolean isVisible (si en un futur volen poder afegir seccions)

	public Section() {

	}
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(cascade = CascadeType.ALL)
	public List<Content> getElements() {
		return elements;
	}

	public void setElements(List<Content> elements) {
		this.elements = elements;
	}

	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public int getSectionType() {
		return sectionType;
	}

	public void setSectionType(int sectionName) {
		this.sectionType = sectionName;
	}
	public boolean isHasContents() {
		return hasContents;
	}
	public void setHasContents(boolean hasContents) {
		this.hasContents = hasContents;
	}

}
