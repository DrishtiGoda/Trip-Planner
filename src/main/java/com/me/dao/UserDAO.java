package com.me.dao;

import org.springframework.stereotype.Component;

import com.me.pojo.User;

import org.hibernate.HibernateException;
import org.hibernate.Query;

@Component
public class UserDAO extends DAO {

	public User findByUserName(String email) throws Throwable {
		try {

			begin();
			Query q = getSession().createQuery("from Users where username = :e");
			q.setString("e", email);
			q.setMaxResults(1);

			User u = (User) q.uniqueResult();

			commit();
			return u;

		} catch (HibernateException e) {
			rollback();
			throw new Exception("Exception while getting user with email " + email + " : " + e.getMessage());
		}

	}

	public User register(User u) throws Throwable {
		try {
			begin();
			
			User newUser = new User(u.getUsername(), u.getPassword(), u.getFirstName(), u.getLastName(), u.getRole(), u.getEmail(), u.getAddress(), u.getPhone());
			getSession().save(newUser);
			commit();
			close();
			return u;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Exception while creating user: " + e.getMessage());
		}
	}

	public User getUser(String email, String password) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("from User where email= :email and password= :password");
			q.setString("email", email);
			q.setString("password", password);
			User user = (User) q.uniqueResult();
			commit();
			return user;
		} catch (HibernateException e) {
			rollback();
			throw new Exception("Could not get user " + email, e);
		}
	}
}

