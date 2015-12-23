package br.com.binganet.bioestetika.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import br.com.binganet.bioestetika.model.Patient;

public interface PatientRepository extends PagingAndSortingRepository<Patient, Integer> {
    Page<Patient> findByNameLike(Pageable pageable, String name);
    Patient findById(int id);
}
