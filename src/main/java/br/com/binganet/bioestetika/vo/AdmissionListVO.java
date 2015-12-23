package br.com.binganet.bioestetika.vo;

import java.util.List;

import br.com.binganet.bioestetika.model.Admission;

public class AdmissionListVO {
	
	private int pagesCount;
    private long totalAdmissions;

    private String actionMessage;
    private String searchMessage;

    private List<Admission> Admissions;

    public AdmissionListVO() {
    }

    public AdmissionListVO(int pages, long totalAdmissions, List<Admission> Admissions) {
        this.pagesCount = pages;
        this.Admissions = Admissions;
        this.totalAdmissions = totalAdmissions;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Admission> getAdmissions() {
        return Admissions;
    }

    public void setAdmissions(List<Admission> Admissions) {
        this.Admissions = Admissions;
    }

    public long getTotalAdmissions() {
        return totalAdmissions;
    }

    public void setTotalAdmissions(long totalAdmissions) {
        this.totalAdmissions = totalAdmissions;
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
