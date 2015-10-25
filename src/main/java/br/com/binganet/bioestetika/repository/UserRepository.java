package br.com.binganet.bioestetika.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.binganet.bioestetika.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {
	
	User findByName(String name);
	
    
}
