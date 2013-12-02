package com.hibernate.crud.simple;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;

public class StudentInsertHibernate {

	public void saveStudent(StudentContact student)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(student);
			transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public static void main(String[] args) {
		
		StudentInsertHibernate sh = new StudentInsertHibernate();
		
		StudentContact student = new StudentContact();
		student.setStudent_mobile_number(11223344);
		student.setStudent_email_id("testhibernate@mail.com");
		sh.saveStudent(student);
	}

}
