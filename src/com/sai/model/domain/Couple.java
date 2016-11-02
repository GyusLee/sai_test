package com.sai.model.domain;

public class Couple {

	private int couple_id;
	private String m_email;
	private String f_email;
	private String couple_regdate;

	public int getCouple_id() {
		return couple_id;
	}

	public void setCouple_id(int couple_id) {
		this.couple_id = couple_id;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getF_email() {
		return f_email;
	}

	public void setF_email(String f_email) {
		this.f_email = f_email;
	}

	public String getCouple_regdate() {
		return couple_regdate;
	}

	public void setCouple_regdate(String couple_regdate) {
		this.couple_regdate = couple_regdate;
	}
}
