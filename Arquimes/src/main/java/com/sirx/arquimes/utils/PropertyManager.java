package com.sirx.arquimes.utils;
import java.util.ResourceBundle;

public class PropertyManager {
    private final static String WIN="win";
    private final static String UNIX="unix";
	
	private static PropertyManager instance;
	private ResourceBundle rb;
	
	private PropertyManager() {
		this.rb = ResourceBundle.getBundle("struts");
	}
	
	public static PropertyManager getInstance() {
		if (instance==null) {
			instance = new PropertyManager();
		}
		return instance;
	}
	
	public String getValue(String name) {
		return rb.getString(name);
	}
	
	public String getImageRepo(){
		return this.getValue("imageRepo");
	}
	
	public String getMailAccount(){
		return this.getValue("mailAccount");
	}
	public String getMailPassword(){
		return this.getValue("mailPassword");
	}
	
	public String getLoginUser(){
		return this.getValue("loginUser");

	}
	public String getLoginPass(){
		return this.getValue("loginPass");
	}
}