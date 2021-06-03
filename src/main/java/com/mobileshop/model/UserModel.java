package com.mobileshop.model;

import java.sql.Date;

public class UserModel {
	
	private String userId;//mÃ£ nhÃ¢n viÃªn
	private String position;//chá»©c vá»¥
	private String name;//há»� vÃ  tÃªn
	private Date dob;// ngÃ y thÃ¡ng nÄƒm sinh
	private Boolean gender;//giá»›i tÃ­nh
	private String address;//Ä‘á»‹a chá»‰
	private String phoneNumber;//sá»‘ Ä‘iá»‡n thoáº¡i
	private String email;//email
	private String note;//ghi chÃº
	private String pass;//máº­t kháº©u
	
	private int roleId;// quyá»�n 0: admin 1: nhÃ¢n viÃªn 2: ngÆ°á»�i dÃ¹ng
	
	public UserModel() {
		super();
	}
	public UserModel(String userId, String position, String name, Date dob, Boolean gender, String address,
			String phoneNumber, String email, String note, int roleId, String pass) {
		super();
		this.userId = userId;
		this.position = position;
		this.name = name;
		this.dob = dob;
		this.gender = gender;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.note = note;
		this.roleId = roleId;
		this.pass = pass;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Boolean getGender() {
		return gender;
	}
	public void setGender(Boolean gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.note = pass;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	@Override
	public String toString() {
		return "UsersModel ["
				+ "userId=" + userId 
				+ ", position=" + position 
				+ ", name=" + name 
				+ ", dob=" + dob 
				+ ", gender=" + gender 
				+ ", address=" + address 
				+ ", phoneNumber=" + phoneNumber 
				+ ", email=" + email 
				+ ", note=" + note 
				+ ", pass=" + pass 
				+ ", roleId=" + roleId 
				+"]";
	}
}
