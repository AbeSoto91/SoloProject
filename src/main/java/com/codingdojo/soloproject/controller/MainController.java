package com.codingdojo.soloproject.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.soloproject.models.Ideas;
import com.codingdojo.soloproject.models.LoginUser;
import com.codingdojo.soloproject.models.User;
import com.codingdojo.soloproject.services.IdeasService;
import com.codingdojo.soloproject.services.UserService;


@Controller
public class MainController {
	@Autowired
	private UserService uServe;
	@Autowired
	private IdeasService iServe;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		 model.addAttribute("newLogin", new LoginUser());
		 return "login.jsp";
	}
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
		User user = uServe.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
            return "login.jsp";
		}
		session.setAttribute("userId", user.getId());
	    
        return "redirect:/home";
	}
	@PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
		User user= uServe.login(newLogin, result);
		if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "login.jsp";
        }
		session.setAttribute("userId", user.getId());
	    
        return "redirect:/home";
    }
	@GetMapping("/home")
    public String home(Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	User user= uServe.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("ideas", user.getIdeas());
    	model.addAttribute("user", user);
    	return "home.jsp";
    }
	@GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
	@GetMapping("/newIdea")
    public String newIdea(@ModelAttribute("ideas") Ideas ideas, Model model, HttpSession session) {
    	
    	User user = uServe.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	
    	return "addidea.jsp";
    }
	@PostMapping("/showIdea")
    public String showIdea(@Valid @ModelAttribute("ideas") Ideas ideas, BindingResult result) {

    	if (result.hasErrors()) {
    		return "addidea.jsp";
    	}
    	
    	iServe.create(ideas);
    	
    	return "redirect:/home";
	}
	@GetMapping("/showIdea/{id}/edit")
    public String edit(Model model, @PathVariable("id") Long id, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	Ideas ideas = iServe.findByID(id);
    	model.addAttribute("ideas", ideas);
    	
    	return "edit.jsp";
	}
	@GetMapping("/showIdea/{id}")
    public String showPage(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Ideas ideas = iServe.findByID(id);
    	model.addAttribute("ideas", ideas);
    	model.addAttribute("user", uServe.findById((Long)session.getAttribute("userId")));
    	
    	return "details.jsp";
    }
	@PutMapping("/showIdea/{id}")
    public String updateIdea(@Valid @ModelAttribute("ideas") Ideas ideas, BindingResult result, Model model) {
    	
    	if (result.hasErrors()) {
    		return "edit.jsp";
    	}
    	
    	System.out.println("Idea to be saved to DB: " + ideas.getId());

        iServe.update(ideas);
        
    	
    	return "redirect:/home";
    }
	@DeleteMapping("/showIdea/delete/{id}")
	public String destroy(@PathVariable("id")Long id) {
		iServe.deleteIdeas(id);
		return "redirect:/home";
	}

}
