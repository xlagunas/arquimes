package com.sirx.arquimes.Arquimes.navegacioWeb;

import java.util.Calendar;

import com.opensymphony.xwork2.ActionSupport;
import com.sirx.arquimes.utils.MailSender;

public class ContactForm extends ActionSupport{
	private String contactName;
	private String mail;
	private String content;
	
	public ContactForm() {
	}
	
	
	public String getContactName() {
		return contactName;
	}


	public void setContactName(String contactName) {
		this.contactName = contactName;
	}


	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String execute(){
		String body = "***************************************************************************"+
				"\nCorreu Generat Automaticament desde la web d'Arquimes\n" +
				"Nom del Contacte: "+getContactName()+".\n"+
				"Direcci— de correu: "+getMail()+".\n"+
				"***************************************************************************\n\n"+
				getContent();
		MailSender ms = new MailSender(body);
		ms.start();
		
		return "success";
	}

}
