package com.me.tripplanner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.dao.AdminDAO;
import com.me.dao.TravellerDAO;
import com.me.pojo.Traveller;
import com.me.pojo.User;


@Controller
public class AdminController {

@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView viewAllJobs(HttpServletRequest request, AdminDAO studentDao) throws Exception {
		//User users = (User) request.getSession().getAttribute("userSession");
		try {
			List<Traveller> jobDetails = studentDao.listAllJobs();
			
			return new ModelAndView("admin", "allJobs", jobDetails);
		} catch (Exception e) {
			
			return new ModelAndView("student-message", "message", "Error occured while retrieving jobs");
		}

}

@RequestMapping(value = "/admin/deletePost", method = RequestMethod.GET)
public ModelAndView deleteApplication(ModelAndView mv, HttpServletRequest request, AdminDAO studentDao)
		throws Exception {
	HttpSession session = request.getSession(false);
	User u;
	if (session != null) {
		u = (User) session.getAttribute("userSession");
		if (u == null) {
			mv.addObject("message", "Kindly Login to post a Job");
			mv.setViewName("unauthorizedaccess");
		} else {

			int id = Integer.parseInt(request.getParameter("jobId"));
			studentDao.deleteApplication(id);

			mv.addObject("message", "Your Application has been withdrawn");
			mv.setViewName("message");
		}
	}
	return mv;
}
}