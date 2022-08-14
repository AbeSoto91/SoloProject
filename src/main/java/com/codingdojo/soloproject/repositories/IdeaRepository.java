package com.codingdojo.soloproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.soloproject.models.Ideas;

@Repository

public interface IdeaRepository extends CrudRepository<Ideas, Long>{
	List<Ideas> findAll();

}
