package com.sirx.arquimes.Interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.sirx.arquimes.BackOffice.BackOffice;
import com.sirx.arquimes.BackOffice.LoginForm;

public class AutenticationInterceptor implements Interceptor {

	public AutenticationInterceptor() {
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
	}

	public void init() {
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		if (ActionContext.getContext().getSession().containsKey("LoginToken")){
			if (invocation.getAction() instanceof LoginForm)
				return "menu";
			return invocation.invoke();
		}
		else
			if (invocation.getAction() instanceof LoginForm)
				return invocation.invoke();
			return "login";
	}

}
