package com.personalmedico.model;

public class User {

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidomaterno() {
		return apellidomaterno;
	}

	public void setApellidomaterno(String apellidomaterno) {
		this.apellidomaterno = apellidomaterno;
	}

	public String getApellidopaterno() {
		return apellidopaterno;
	}

	public void setApellidopaterno(String apellidopaterno) {
		this.apellidopaterno = apellidopaterno;
	}

	public String getEspecialidad() {
		return especialidad;
	}

	public void setEspecialidad(String especialidad) {
		this.especialidad = especialidad;
	}

	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getSubespecialidad() {
		return subespecialidad;
	}

	public void setSubespecialidad(String subespecialidad) {
		this.subespecialidad = subespecialidad;
	}

	public String getConsultorio_rel() {
		return consultorio_rel;
	}

	public void setConsultorio_rel(String consultorio_rel) {
		this.consultorio_rel = consultorio_rel;
	}
	
	public String getUser_med() {
		return user_med;
	}

	public void setUser_med(String user_med) {
		this.user_med = user_med;
	}

	public String getPass_med() {
		return pass_med;
	}

	public void setPass_med(String pass_med) {
		this.pass_med = pass_med;
	}



	private int userid;
	private String nombre;
	private String apellidomaterno;
	private String apellidopaterno;
	private String especialidad;
	private String cedula;
	private String tipo;
	private String subespecialidad;
	private String consultorio_rel;
	private String user_med;
	private String pass_med;

	@Override
	public String toString() {
		return "User [userid=" + userid + ",  apellidopaterno;="
				+ apellidopaterno + ", apellidomaterno=" + apellidomaterno
				+ ",  especialidad=" + especialidad + ", cedula=" + cedula
				+ ", tipo=" + tipo + ", subespecialidad=" + subespecialidad
				+ ", consultorio_rel=" + consultorio_rel + user_med + pass_med
				+ "]";
	}
}