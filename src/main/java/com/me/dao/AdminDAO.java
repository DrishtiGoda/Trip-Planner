package com.me.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.me.pojo.Traveller;
import com.me.pojo.User;

@Component
public class AdminDAO extends DAO {
	public List<Traveller> listAllJobs() throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("from Traveller");

			List<Traveller> list = q.list();
			System.out.println("list size==========="+ list.size());
			commit();
			return list;
		} catch (Exception e) {
			rollback();
			throw new Exception("Error while getting jobs" + e.getMessage());
		}
	}
	public void deleteApplication(int id) throws Exception {
		try {

			begin();
			Query q = getSession().createQuery("delete from Traveller where postId = :id");
			q.setParameter("id", id);
			// q.setParameter("user", user);
			q.executeUpdate();
			commit();
			close();
		} catch (Exception e) {
			rollback();

			throw new Exception("Error while deleting Job Application : " + e);
		}
	}

}