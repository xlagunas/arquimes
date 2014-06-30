package com.sirx.arquimes.utils;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class MailSender extends Thread{
	private String senderAccount;
	private String passAccount;
	private String bodyMessage;
	
	
	
	public MailSender(String bodyMessage) {
		super();
		this.senderAccount = PropertyManager.getInstance().getMailAccount();
		this.passAccount = PropertyManager.getInstance().getMailPassword();
		this.bodyMessage = bodyMessage;
	}



	public void run(){
		 Email email = new SimpleEmail();
		    try {
		    email.setSmtpPort(587);
		    email.setAuthenticator(new DefaultAuthenticator(senderAccount,passAccount));
		    email.setDebug(false);
		    email.setHostName("smtp.gmail.com");
				email.setFrom(senderAccount);
			
		    email.setSubject("Mail de contacte d'Arquimes");
		    email.setMsg(bodyMessage);
		    email.addTo(senderAccount);
		    email.setTLS(true);
		    email.send();
		    } catch (EmailException e) {
		    	System.out.println("Hi ha hagut un error al enviar el correu");
		    	e.printStackTrace();
			}
		    System.out.println("Mail sent!");
	}

}
