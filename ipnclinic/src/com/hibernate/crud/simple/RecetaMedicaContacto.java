package com.hibernate.crud.simple;

public class RecetaMedicaContacto {

	private int idreceta;
	private int idpaciente;
	private int idcita;
	private int iddoc;
	private String fecha_exp;
	private String desc_rec;
	private int medicina;
	
	
	public int getIdreceta() {
		return idreceta;
	}
	public void setIdreceta(int idreceta) {
		this.idreceta = idreceta;
	}
	public int getIdpaciente() {
		return idpaciente;
	}
	public void setIdpaciente(int idpaciente) {
		this.idpaciente = idpaciente;
	}
	public int getIdcita() {
		return idcita;
	}
	public void setIdcita(int idcita) {
		this.idcita = idcita;
	}
	public int getIddoc() {
		return iddoc;
	}
	public void setIddoc(int iddoc) {
		this.iddoc = iddoc;
	}
	public String getFecha_exp() {
		return fecha_exp;
	}
	public void setFecha_exp(String fecha_exp) {
		this.fecha_exp = fecha_exp;
	}
	public String getDesc_rec() {
		return desc_rec;
	}
	public void setDesc_rec(String desc_rec) {
		this.desc_rec = desc_rec;
	}
	public int getMedicina() {
		return medicina;
	}
	public void setMedicina(int medicina) {
		this.medicina = medicina;
	}
	
}
