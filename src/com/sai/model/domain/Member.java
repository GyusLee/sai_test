package com.sai.model.domain;

import org.springframework.web.multipart.MultipartFile;

public class Member {

	private String m_email;
	private int m_id;
	private String m_name;
	private String m_nickname;
	private String m_gender;
	private String m_regdate;
	private String img;
	private String p_email;
	private MultipartFile myProfile;
	
	private int couple_id;
	private int isAdmin;
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getP_email() {
		return p_email;
	}
	public void setP_email(String p_email) {
		this.p_email = p_email;
	}
	public MultipartFile getMyProfile() {
		return myProfile;
	}
	public void setMyProfile(MultipartFile myProfile) {
		this.myProfile = myProfile;
	}
	public int getCouple_id() {
		return couple_id;
	}
	public void setCouple_id(int couple_id) {
		this.couple_id = couple_id;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

}
