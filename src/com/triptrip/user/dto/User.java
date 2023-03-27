package com.triptrip.user.dto;

public class User {
	private int id;
	private String name;
	private String auth_id;
	private String auth_pw;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuth_id() {
		return auth_id;
	}

	public void setAuth_id(String auth_id) {
		this.auth_id = auth_id;
	}

	public String getAuth_pw() {
		return auth_pw;
	}

	public void setAuth_pw(String auth_pw) {
		this.auth_pw = auth_pw;
	}

}
