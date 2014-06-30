package com.sirx.arquimes.Model;

import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity(name = "Content")
@Inheritance(strategy = InheritanceType.JOINED)
public class Content {

	private long id;
	private List<Image> images;
	private Calendar dateAdded;
	private InternationalText header;
	private InternationalText content;
	private boolean isVisible;
	private int prioritat;


	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public InternationalText getContent() {
		return content;
	}

	public void setContent(InternationalText content) {
		this.content = content;
	}

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public InternationalText getHeader() {
		return header;
	}

	public void setHeader(InternationalText header) {
		this.header = header;
	}

	public Content() {
	}

	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public Calendar getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(Calendar dateAdded) {
		this.dateAdded = dateAdded;
	}

	public boolean isVisible() {
		return isVisible;
	}

	public void setVisible(boolean isVisible) {
		this.isVisible = isVisible;
	}

	public int getPrioritat() {
		return prioritat;
	}

	public void setPrioritat(int prioritat) {
		this.prioritat = prioritat;
	}

}
