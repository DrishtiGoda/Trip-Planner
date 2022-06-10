package com.me.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.logging.Logger;
import java.util.logging.Level;

@Component
public class DAO {

	private static final ThreadLocal sessionThread = new ThreadLocal();
	private static final SessionFactory sessionFactory = buildSessionFactory();
	private static final Logger log = Logger.getAnonymousLogger();

	@Autowired
	protected DAO() {
	}

	public static Session getSession() {

		Session session = (Session) DAO.sessionThread.get();

		if (session == null) {
			session = sessionFactory.openSession();
			DAO.sessionThread.set(session);
		}
		return session;
	}

	protected void begin() {
		getSession().beginTransaction();
	}

	protected void commit() {
		getSession().getTransaction().commit();
	}

	public static void close() {
		getSession().close();
		DAO.sessionThread.set(null);
	}

	private static SessionFactory buildSessionFactory() {
		try {
			return new AnnotationConfiguration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	protected void rollback() {
		try {
			getSession().getTransaction().rollback();
		} catch (HibernateException e) {
			log.log(Level.WARNING, "Cannot rollback", e);
		}
		try {
			getSession().close();
		} catch (HibernateException e) {
			log.log(Level.WARNING, "Cannot close", e);
		}
		DAO.sessionThread.set(null);
	}
}
