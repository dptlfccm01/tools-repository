package com.example.app.validator;

import org.springframework.validation.Validator;
import org.springframework.validation.Errors;

import com.example.app.domain.Login;


public class LoginValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Login.class.equals(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		// TODO Auto-generated method stub
		Login login = (Login) obj;
		if(login == null){
			errors.rejectValue("username", "Error", null, "Value required");
		}
		else{
			if(login.getUsername().equals("")){
				errors.rejectValue("username", "error", "Value is too low");
			}
		}
	}



}
