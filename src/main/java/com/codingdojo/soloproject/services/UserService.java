package com.codingdojo.soloproject.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.soloproject.models.LoginUser;
import com.codingdojo.soloproject.models.User;
import com.codingdojo.soloproject.repositories.UserRepository;


@Service
public class UserService {
	@Autowired
	private UserRepository uRepo;
	
	@Autowired
	private UserRepository userRep;

    public User register(User newUser, BindingResult result) {
    	Optional<User> potentialUser = userRep.findByEmail(newUser.getEmail());
        	if(potentialUser.isPresent()) {
        		result.rejectValue("email","Unique","An account with this email already exist!");
        	} 
        	if(!newUser.getPassword().equals(newUser.getConfirm())) {
        	result.rejectValue("password","Matches", "Passwords must match.");	
        	}
        	if(result.hasErrors()) {
        		return null;        		
        	}
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			
			newUser=uRepo.save(newUser);
			System.out.println("New User created: " + newUser.getId());
			return newUser;
    }
    public User login(LoginUser newLoginObject, BindingResult result) {
    	Optional<User> potentialUser = userRep.findByEmail(newLoginObject.getEmail());
    	if(!potentialUser.isPresent()) {
    		result.rejectValue("email","no account", "Your account was not found");
    		return null;
    	}
    	User user = potentialUser.get();
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	if(result.hasErrors()) {
    		return null;
    	}
        return user;
    }
public User findByEmail(String email) {
		Optional<User> result = uRepo.findByEmail(email);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	public User findById(Long id) {
		Optional<User> result = uRepo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
}
