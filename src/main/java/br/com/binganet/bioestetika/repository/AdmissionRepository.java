package br.com.binganet.bioestetika.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import br.com.binganet.bioestetika.model.Admission;

public interface AdmissionRepository extends PagingAndSortingRepository<Admission, Integer>{

	Page<Admission> findByPatientId(Pageable pageable, Integer patientId);

}
