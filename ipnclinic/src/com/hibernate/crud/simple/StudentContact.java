package com.hibernate.crud.simple;

public class StudentContact {

	private long student_id;
	private long student_mobile_number;
	private String student_email_id;
	
	public long getStudent_id() {
		return student_id;
	}

	public void setStudent_id(long student_id) {
		this.student_id = student_id;
	}

	public long getStudent_mobile_number() {
		return student_mobile_number;
	}

	public void setStudent_mobile_number(long student_mobile_number) {
		this.student_mobile_number = student_mobile_number;
	}

	public String getStudent_email_id() {
		return student_email_id;
	}

	public void setStudent_email_id(String student_email_id) {
		this.student_email_id = student_email_id;
	}
}
