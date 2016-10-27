package com.sai.domain;

public class Cart {
	 private int cart_id;
	 private int course_id;
	 private int couple_id;
	 private String regdate;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public int getCouple_id() {
		return couple_id;
	}
	public void setCouple_id(int couple_id) {
		this.couple_id = couple_id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	 
	 
}
