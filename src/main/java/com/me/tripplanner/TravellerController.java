package com.me.tripplanner;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.dao.TravellerDAO;
import com.me.dao.UserDAO;
import com.me.pojo.Traveller;
import com.me.pojo.User;

@Controller
public class TravellerController {

	@InitBinder("user")
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(null);
	}

	@RequestMapping(value = "/traveller/createPost", method = RequestMethod.GET)
	public ModelAndView craetePost(ModelAndView mv) {
		mv.addObject("traveller", new Traveller());
		mv.setViewName("traveller-createPost");
		return mv;
	}

	@RequestMapping(value = "/traveller/createPost", method = RequestMethod.POST)
	public ModelAndView postJob(ModelAndView mv, @ModelAttribute("job") @Validated Traveller traveller,
			BindingResult result, HttpServletRequest request, TravellerDAO empDao) throws Exception {
		if (result.hasErrors()) {
			mv.addObject("traveller", traveller);
			mv.setViewName("traveller-createPost");
			return mv;
		}
		HttpSession session = request.getSession(false);
		if (session != null) {
			User u = (User) session.getAttribute("userSession");
			if (u == null) {
				mv.addObject("message", "Kindly Login to post a Job");
				mv.setViewName("error");
			} else {
				traveller.setUsers(u);
				traveller = empDao.jobPosting(traveller);
				if (traveller != null) {
					mv.addObject("message", "Job has been posted successfully!");
					mv.setViewName("traveller");
				} else {
					mv.addObject("message", "Some issue occurred while posting the job.Kindly try again !");
					mv.setViewName("postJob");
				}
			}
		}
		return mv;
	}

	@RequestMapping(value = "/traveller/otherPosts", method = RequestMethod.GET)
	public ModelAndView viewAllJobs(HttpServletRequest request, TravellerDAO studentDao) throws Exception {
		User users = (User) request.getSession().getAttribute("userSession");
		try {
			List<Traveller> jobDetails = studentDao.listAllJobs();
			return new ModelAndView("traveller-otherPosts", "allJobs", jobDetails);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("student-message", "message", "Error occured while retrieving jobs");
		}

	}

	@RequestMapping(value = "/traveller/viewDetail", method = RequestMethod.GET)
	public ModelAndView viewDetails(HttpServletRequest request, TravellerDAO studentDao) throws Exception {
		User users = (User) request.getSession().getAttribute("userSession");
		try {
			List<Traveller> jobDetails = studentDao.listAllJobs();
			return new ModelAndView("traveller-otherPosts", "allJobs", jobDetails);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("student-message", "message", "Error occured while retrieving jobs");
		}

	}

	@RequestMapping(value = "/traveller/myPosts", method = RequestMethod.GET)
	public ModelAndView getAllAppliedJobs(ModelAndView mv, HttpServletRequest request, Traveller application,
			TravellerDAO studentDao) throws Exception {
		HttpSession session = request.getSession(false);
		User u;
		if (session != null) {
			u = (User) session.getAttribute("userSession");
			if (u == null) {
				mv.addObject("message", "Kindly Login to post a Job");
				mv.setViewName("unauthorizedaccess");
			} else {
				List<Traveller> app = studentDao.listAllAppliedJobs(u);
				mv.addObject("jobs", app);
				mv.setViewName("traveller-myPosts");

			}
		}
		return mv;
	}

	@RequestMapping(value = "/traveller/viewDetails", method = RequestMethod.GET)
	public ModelAndView viewProfile(HttpServletRequest request, TravellerDAO travellerDAO) throws Exception {
		try {
			User users = (User) request.getSession().getAttribute("userSession");
			String postIdString = request.getParameter("postId");
			int postId = Integer.parseInt(postIdString);
			List<Traveller> viewDetails = travellerDAO.getPostDetails(postId);

			System.out.println("Detailss" + viewDetails);
			ModelAndView modelAndView = new ModelAndView("traveller-viewDetail");
			modelAndView.addObject("postDetails", viewDetails);
			modelAndView.setViewName("traveller-viewDetail");
			return modelAndView;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("home", "message", "Error occured while retrieving jobs");
		}
	}

	@RequestMapping(value = "/traveller/deleteApplication", method = RequestMethod.GET)
	public ModelAndView deleteApplication(ModelAndView mv, HttpServletRequest request, TravellerDAO studentDao)
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
				mv.setViewName("traveller");
			}
		}
		return mv;
	}
	
	@RequestMapping(value = "/traveller/updateApplication", method = RequestMethod.GET)
	public ModelAndView updateApplication(ModelAndView mv, HttpServletRequest request, TravellerDAO studentDao)
			throws Exception {
		try {
			User users = (User) request.getSession().getAttribute("userSession");
			String postIdString = request.getParameter("jobId");
			int postId = Integer.parseInt(postIdString);
			Traveller viewDetails = studentDao.updateApplication(postId);
			ModelAndView modelAndView = new ModelAndView("traveller-viewDetail");
			modelAndView.addObject("postDetails", viewDetails);
			modelAndView.setViewName("traveller-updatePost");
			return modelAndView;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("home", "message", "Error occured while retrieving jobs");
		}
		
	}
	
	@RequestMapping(value = "/traveller/updateApplication", method = RequestMethod.POST)
	public ModelAndView updateApplicationPost(ModelAndView mv,@ModelAttribute("Traveller") @Validated Traveller jobDetails,  HttpServletRequest request, TravellerDAO studentDao)
			throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null) {
		User u = (User) session.getAttribute("userSession");
		if (u == null) {
		mv.addObject("message", "Login to view Job");
		mv.setViewName("travellerMessage");
		} else {
			String postIdString = request.getParameter("id");
			int postId = Integer.parseInt(postIdString);
			
			jobDetails.setPostId(postId);
		//	int postId = Integer.parseInt(postIdString);
			
			studentDao.updateJob(jobDetails);
		List<Traveller> list = studentDao.listAllJobs();
		mv.addObject("list", list);
		mv.addObject("message", "The job updated !");
		mv.setViewName("travellerMessage");



		}



		}
		return mv;
		}
		
	
}
