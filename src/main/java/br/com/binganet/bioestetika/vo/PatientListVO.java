package br.com.binganet.bioestetika.vo;

import br.com.binganet.bioestetika.model.Patient;
import java.util.List;

public class PatientListVO {
	
	private int pagesCount;
    private long totalPatients;

    private String actionMessage;
    private String searchMessage;

    private List<Patient> Patients;

    public PatientListVO() {
    }

    public PatientListVO(int pages, long totalPatients, List<Patient> Patients) {
        this.pagesCount = pages;
        this.Patients = Patients;
        this.totalPatients = totalPatients;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Patient> getPatients() {
        return Patients;
    }

    public void setPatients(List<Patient> Patients) {
        this.Patients = Patients;
    }

    public long getTotalPatients() {
        return totalPatients;
    }

    public void setTotalPatients(long totalPatients) {
        this.totalPatients = totalPatients;
    }

    public String getActionMessage() {
        return actionMessage;
    }

    public void setActionMessage(String actionMessage) {
        this.actionMessage = actionMessage;
    }

    public String getSearchMessage() {
        return searchMessage;
    }

    public void setSearchMessage(String searchMessage) {
        this.searchMessage = searchMessage;
    }
	
}
