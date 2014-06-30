package com.sirx.arquimes.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;

@Entity
@Table(name="images")

public class Image {

	private long id;
	private String url;
	private boolean visible;
	private int orderPosition;
	
	
	public int getOrderPosition() {
		return orderPosition;
	}
	public void setOrderPosition(int orderPosition) {
		this.orderPosition = orderPosition;
	}
	
	public boolean isVisible() {
		return visible;
	}
	public void setVisible(boolean visible) {
		this.visible = visible;
	}
	public Image() {
	}
	@javax.persistence.Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	
}
