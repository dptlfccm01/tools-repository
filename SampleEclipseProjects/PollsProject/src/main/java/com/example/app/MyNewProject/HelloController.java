package com.example.app.MyNewProject;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController{

	@RequestMapping("/hello/user/{location}")
	public ModelAndView HelloWorld(@PathVariable Map<String, String> pathVars){
	
		String locationString = pathVars.get("location");
		System.out.println("OUT> "+locationString);
		
		ModelAndView modelandview = new ModelAndView("hello");
		modelandview.addObject("now", new String("Hello worldsss location: "+locationString));
		return modelandview;
	}
	
	

}
