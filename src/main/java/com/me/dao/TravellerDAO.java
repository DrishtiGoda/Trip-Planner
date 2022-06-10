package com.me.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.me.pojo.Traveller;
import com.me.pojo.User;

public class TravellerDAO extends DAO {

	public Traveller jobPosting(Traveller job) throws Exception {
		try {
			begin();
			getSession().save(job);
			commit();
			close();
			return job;
		} catch (Exception e) {
			rollback();
			throw new Exception("Could not post job " + e);
		}
	}

	public List<Traveller> listAllJobs() throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("from Traveller");

			List<Traveller> list = q.list();
			commit();
			return list;
		} catch (Exception e) {
			rollback();
			throw new Exception("Error while getting jobs" + e.getMessage());
		}
	}

	public List<Traveller> listAllAppliedJobs(User user) throws Exception {
		try {
			begin();
			// Criteria c = getSession().createCriteria(Traveller.class);
			// c.add(Restrictions.eq("user", user));
			Query q = getSession().createQuery("from Traveller where userId = '" + user.getUserId() + "'");
			List<Traveller> list = q.list();
			commit();
			return list;
		} catch (Exception e) {
			rollback();
			throw new Exception(
					"Error while fetching Job Application details for User - " + user.getUserId() + " : " + e);
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
	
	public Traveller updateApplication(int id) throws Exception {
		try {

			begin();
			Criteria c = getSession().createCriteria(Traveller.class);
			c.add(Restrictions.eq("postId", id));
			c.setMaxResults(1);
			Traveller workEx = (Traveller) c.uniqueResult();
			commit();
			close();
			return workEx;
		} catch (Exception e) {
			rollback();

			throw new Exception("Error while deleting Job Application : " + e);
		}
	}

	public List<Traveller> getPostDetails(int id) throws Exception {
		try {
			begin();
			Query q = getSession().createQuery("from Traveller where postId='" + id + "'");
			List<Traveller> result = q.list();
			commit();
			return result;
		} catch (Exception e) {
			rollback();
			throw new Exception("Error while getting Test Score" + e);
		}
	}
	public Traveller updateJob(Traveller jobDetails) throws Exception {
		try {
		begin();
		Query query = getSession().createQuery(
		"update Traveller set title = :t , countryOfTravel = :c ,travelledFrom = :type , monthOfVisit	 = :country , firstDay	 = :state , secondDay = :industry where postId = :id");
		query.setString("t", jobDetails.getTitle());
		query.setString("c", jobDetails.getCountryOfTravel());
		query.setString("type", jobDetails.getTravelledFrom());
		query.setString("country", jobDetails.getMonthOfVisit());
		query.setString("state", jobDetails.getFirstDay());
		query.setString("industry", jobDetails.getSecondDay());
		query.setInteger("id", jobDetails.getPostId());
		query.executeUpdate();
		commit();
		return jobDetails;
		} catch (Exception e) {
		rollback();
		throw new Exception("Error while updating job!!!" + jobDetails.getPostId() + " : " + e);
		}
		}


}
