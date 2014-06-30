package com.sirx.arquimes.Arquimes.navegacioWeb;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LocaleChange extends ActionSupport {

	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		return Action.SUCCESS;
	}

}
