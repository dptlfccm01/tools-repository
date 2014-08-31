package com.example.app.MyNewProject;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.*;
import org.springframework.web.servlet.view.RedirectView;

import com.example.app.domain.Login;

import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@SuppressWarnings("deprecation")
public class LoginController extends SimpleFormController {

	public ModelAndView onSubmit(Object command) throws ServletException{
		
		String username = ((Login) command).getUsername();
		
		return new ModelAndView(new RedirectView(getSuccessView()));
		
	}
		
	

}
