package br.com.binganet.bioestetika.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import br.com.binganet.bioestetika.model.Anamenese;

public interface AnameneseRepository extends PagingAndSortingRepository<Anamenese, Integer>{
	
	Page<Anamenese> findByAdmissionId(Pageable pageable, int admissionId);
	
}

