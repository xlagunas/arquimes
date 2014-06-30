package com.sirx.arquimes.Arquimes.navegacioWeb;

import com.opensymphony.xwork2.ActionSupport;
import com.sirx.arquimes.Bl.SectionManager;
import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Section;

public class SingleContent extends ActionSupport{
	
	private int idSection;
	private long idContent;
	private Content content;
	private Section section;
	
	public Content getContent() {
		return content;
	}
	public void setContent(Content content) {
		this.content = content;
	}
	public Section getSection() {
		return section;
	}
	public void setSection(Section section) {
		this.section = section;
	}
	public int getIdSection() {
		return idSection;
	}
	public void setIdSection(int idSection) {
		this.idSection = idSection;
	}
	public long getIdContent() {
		return idContent;
	}
	public void setIdContent(long idContent) {
		this.idContent = idContent;
	}
	private SectionManager sm =null;
	
	public SingleContent() {
		sm = new SectionManager();
	}
	public String execute(){
		section = sm.getSectionByType(this.getIdSection());
		for (Content c : section.getElements()) {
			if (c.getId() == this.getIdContent()){
				this.setContent(c);
				break;
			}
		}
		
		return "success";
	}

}
