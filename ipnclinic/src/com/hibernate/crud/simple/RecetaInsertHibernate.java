package com.hibernate.crud.simple;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;

public class RecetaInsertHibernate {

	public void salvareceta(RecetaMedicaContacto receta)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(receta);
			transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public static void main(String[] args) {
		
		RecetaInsertHibernate sh = new RecetaInsertHibernate();
		
		RecetaMedicaContacto receta = new RecetaMedicaContacto();
		receta.setIdreceta(1);
		receta.setIdpaciente(1);
		receta.setIdcita(1);
		receta.setIddoc(21);
		receta.setFecha_exp("2013-12-01");
		receta.setDesc_rec("Tomar diariamente 1 cucharada de:");
		receta.setMedicina(1);
		
		sh.salvareceta(receta);
	}

}
