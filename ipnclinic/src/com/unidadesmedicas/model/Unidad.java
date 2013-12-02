package com.unidadesmedicas.model;

public class Unidad {

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getNombreunidad() {
		return nombreunidad;
	}

	public void setNombreunidad(String nombreunidad) {
		this.nombreunidad = nombreunidad;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getServicios() {
		return servicios;
	}

	public void setServicios(String servicios) {
		this.servicios = servicios;
	}

	public String getDescuento() {
		return descuento;
	}

	public void setDescuento(String descuento) {
		this.descuento = descuento;
	}

	public String getConsul_disp() {
		return consul_disp;
	}

	public void setConsul_disp(String consul_disp) {
		this.consul_disp = consul_disp;
	}

	public String getConsul_rel() {
		return consul_rel;
	}

	public void setConsul_rel(String consul_rel) {
		this.consul_rel = consul_rel;
	}

	public String getCantidad_consultada() {
		return cantidad_consultada;
	}

	public void setCantidad_consultada(String cantidad_consultada) {
		this.cantidad_consultada = cantidad_consultada;
	}

	public String getSubespecialidad() {
		return subespecialidad;
	}

	public void setSubespecialidad(String subespecialidad) {
		this.subespecialidad = subespecialidad;
	}

	private int userid;
	private String nombreunidad;
	private String direccion;
	private String servicios;
	private String descuento;
	private String cantidad_consultada;
	private String consul_disp;
	private String subespecialidad;
	private String consul_rel;

	@Override
	public String toString() {
		return "User [userid=" + userid + ",  nombreunidad;=" + nombreunidad
				+ ", direccion=" + direccion + ",  direccion=" + direccion
				+ ", servicios=" + servicios + ", descuento=" + descuento
				+ ", consul_disp=" + consul_disp + ", subespecialidad="
				+ subespecialidad + ", consul_rel=" + consul_rel + "]";
	}
}