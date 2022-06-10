package com.me.tripplanner;

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

import com.me.dao.UserDAO;
import com.me.pojo.User;


@Controller
public class UserController {

	@InitBinder("user")
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(null);
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView displayRegistration(ModelAndView mv) {
		mv.addObject("user", new User());
		mv.setViewName("register");
		return mv;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerUser(ModelAndView mv, @ModelAttribute("user") @Validated User users,
			BindingResult result, UserDAO userDao, HttpServletRequest request) throws Throwable {
		if (result.hasErrors()) {
			mv.addObject("user", users);
			mv.setViewName("register");
			return mv;
		}
		User existingUser;
		String role = request.getParameter("role");
		users = userDao.register(users);

		mv.addObject("emailId", users.getEmail());
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView displayLogin(ModelAndView mv) {
		mv.addObject("user", new User());
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView getUser(ModelAndView mv, @ModelAttribute("user") @Validated User users, BindingResult result,
			UserDAO userDao, HttpServletRequest request) throws Throwable {
		HttpSession session = (HttpSession) request.getSession();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User existingUser;
		try {
			existingUser = userDao.getUser(email, password);
			if (existingUser != null) {
				
					if (existingUser.getRole().equalsIgnoreCase("ROLE_TRAVELLER")) {
						mv.addObject("user", existingUser);
						mv.setViewName("traveller-otherPosts");
						//mv.addObject("role", "traveller");
						session.setAttribute("userSession", existingUser);

						} else if(existingUser.getRole().equalsIgnoreCase("ROLE_ADMIN")) {
						mv.addObject("user", existingUser);
						mv.setViewName("admin");
						//mv.addObject("role", "admin");
						session.setAttribute("userSession", existingUser);
						}
				
			} else {
				mv.addObject("error", "Incorrect credentials !! Kindly Login with correct credentials");
				mv.setViewName("login");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", "Sorry for the inconvience. There is some issue !!");
			mv.setViewName("message");
		}
		return mv;
	}

}
