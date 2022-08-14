package com.codingdojo.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codingdojo.soloproject.models.Ideas;
import com.codingdojo.soloproject.repositories.IdeaRepository;


@Service
public class IdeasService {
	
	@Autowired
	private IdeaRepository iRepo;
	
	public Ideas findByID(Long id) {
		Optional<Ideas> potentialIdea = iRepo.findById(id);
		if(potentialIdea.isPresent()) {
			return potentialIdea.get();
		}else {
			return null;
		}
	}	
	public List<Ideas> all(){
		return iRepo.findAll();
	}
	public Ideas update(Ideas ideas) {
		return iRepo.save(ideas);
	}
	
	public Ideas create(Ideas ideas) {
		return iRepo.save(ideas);
	}
	public void deleteIdeas(Long id) {
		Optional<Ideas> optionalIdeas = iRepo.findById(id);
		if(optionalIdeas.isPresent()) {
			iRepo.deleteById(id);
		}
		
	}
}
