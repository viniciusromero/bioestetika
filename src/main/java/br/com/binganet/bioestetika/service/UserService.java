package br.com.binganet.bioestetika.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.binganet.bioestetika.model.User;
import br.com.binganet.bioestetika.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
    private UserRepository userRepository;
 
    public User findByName(String name){
        return userRepository.findByName(name);
    }
    
}