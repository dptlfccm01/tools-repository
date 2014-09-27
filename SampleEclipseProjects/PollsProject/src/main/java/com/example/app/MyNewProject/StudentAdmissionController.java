package com.example.app.MyNewProject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.util.Map;
import javax.servlet.http.*;

@Controller
public class StudentAdmissionController {

	@RequestMapping(value="admissionForm.html", method = RequestMethod.GET)
	public ModelAndView getAdmissionForm() {
		ModelAndView model = new ModelAndView("AdmissionForm");
		return model;
	}
	
	@RequestMapping(value="submitAdmissionForm.html", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@RequestParam("studentName") String name, @RequestParam("studentHobby") String hobby){
		ModelAndView model = new ModelAndView("AdmissionSuccess");
		model.addObject("msg", "Details submitted by you: Name : "+name+", Hobby: "+hobby);
		return model;
	}
	
	
}
