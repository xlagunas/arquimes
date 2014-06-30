package com.sirx.arquimes.BackOffice;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sirx.arquimes.utils.PropertyManager;

public class LoginForm extends ActionSupport implements Action {
	private String username;
	private String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String execute() throws Exception {
		if (ActionContext.getContext().getSession().containsKey("LoginToken"))
			return "menu";
		if (this.getUsername() != null && this.getPassword() != null) {
			PropertyManager pm = PropertyManager.getInstance();
			if (username.equals(pm.getLoginUser()) && password.equals(pm.getLoginPass())) {
				ActionContext.getContext().getSession()
						.put("LoginToken", username);
				return "menu";
			}
			else
				addActionError("Login o usuari incorrectes");
				
				return "input";
		}
		return "input";
	}
	
	public void validate(){
		if ("".equals(getUsername()))
			addFieldError("username", "username requerit");
		if ("".equals(getPassword()))
			addFieldError("password", "password requerit");
	}

}
