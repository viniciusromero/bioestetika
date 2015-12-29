package br.com.binganet.bioestetika.vo;

import java.util.List;

import br.com.binganet.bioestetika.model.Anamenese;

public class AnameneseListVO {
	
	private int pagesCount;
    private long totalAnameneses;

    private String actionMessage;
    private String searchMessage;

    private List<Anamenese> Anameneses;

    public AnameneseListVO() {
    }

    public AnameneseListVO(int pages, long totalAnameneses, List<Anamenese> Anameneses) {
        this.pagesCount = pages;
        this.Anameneses = Anameneses;
        this.totalAnameneses = totalAnameneses;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Anamenese> getAdmissions() {
        return Anameneses;
    }

    public void setAdmissions(List<Anamenese> Anameneses) {
        this.Anameneses = Anameneses;
    }

    public long getTotalAnameneses() {
        return totalAnameneses;
    }

    public void setTotalAnameneses(long totalAnameneses) {
        this.totalAnameneses = totalAnameneses;
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
