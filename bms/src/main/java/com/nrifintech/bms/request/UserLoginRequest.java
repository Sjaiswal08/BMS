package com.nrifintech.bms.request;

import javax.validation.constraints.Pattern;

public class UserLoginRequest {

	@Pattern(regexp = "^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$", message = "Username must be 8-20 characters long with allowed characters - a-z, A-Z, 0-9, ., _")
	private String email;

	@Pattern(regexp = "^{3,20}$", message = "Password must be 3-20 characters long")
	private String password;

	public String getUsername() {
		return email;
	}

	public void setUsername(String username) {
		this.email = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
