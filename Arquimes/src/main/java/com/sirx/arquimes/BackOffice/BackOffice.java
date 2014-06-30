package com.sirx.arquimes.BackOffice;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.sirx.arquimes.Bl.SectionManager;
import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Section;

public class BackOffice extends ActionSupport implements Action {
	private SectionManager sm;
	private Logger log = LoggerFactory.getLogger(BackOffice.class);
	private String username;
	private String password;

	private Content content;
	private Section section;

	public BackOffice() {
		sm = new SectionManager();
	}

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String addProject() {

		return "addNewProject";
	}

	public String Login() {
		if (ActionContext.getContext().getSession().containsKey("LoginToken"))
			return "menu";

		return Action.LOGIN;
	}

	public String checkUser() {
		if (username.equals("Admin") && password.equals("admin")) {
			ActionContext.getContext().getSession().put("LoginToken", username);
			return "menu";
		} else
			return Action.LOGIN;
	}

	// Portada es el tipus Section.Intro
	public String portada() {
		log.info("Carregant secci— Section.SECTION_INICI");
		section = this.sm.getSectionByType(Section.SECTION_INICI);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setHasContents(false);
			section.setSectionType(Section.SECTION_INICI);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_INICI TROBADA");
		System.out.println(section.getImages().size());
		return "portada";
	}

	public String estudi() {
		log.info("Carregant secci— Section.SECTION_ESTUDI");
		section = this.sm.getSectionByType(Section.SECTION_ESTUDI);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setHasContents(false);
			section.setSectionType(Section.SECTION_ESTUDI);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_ESTUDI TROBADA");
		System.out.println(section.getImages().size());
		return "estudi";
	}
	
	public String actualitat(){
		log.info("Carregant secci— Section.SECTION_ACTUALITAT");
		section = this.sm.getSectionByType(Section.SECTION_ACTUALITAT);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setHasContents(true);
			section.setSectionType(Section.SECTION_ACTUALITAT);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_ACTUALITAT TROBADA");
		System.out.println(section.getImages().size());
		return "actualitat";
	}

	/*public String projectes() {
		log.info("Carregant secci— Section.SECTION_PROJECTES");
		section = this.sm.getSectionByType(Section.SECTION_PROJECTES);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setSectionType(Section.SECTION_PROJECTES);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_PROJECTES TROBADA");
		return "projectes";
	}*/

	public String urbanisme() {
		log.info("Carregant secci— Section.SECTION_URBANISME");
		section = this.sm.getSectionByType(Section.SECTION_URBANISME);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setHasContents(true);
			section.setSectionType(Section.SECTION_URBANISME);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_URBANISME TROBADA");
		System.out.println(section.getImages().size());
		return "urbanisme";
	}
	
	public String enCurs() {
		log.info("Carregant secci— Section.SECTION_ENCURS");
		section = this.sm.getSectionByType(Section.SECTION_ENCURS);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setHasContents(true);
			section.setSectionType(Section.SECTION_ENCURS);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_ENCURS TROBADA");
		System.out.println(section.getImages().size());
		return "enCurs";
	}

	public String individual() {
		log.info("Carregant secci— Section.SECTION_INDIVIDUAL");
		section = this.sm.getSectionByType(Section.SECTION_INDIVIDUAL);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setHasContents(true);
			section.setSectionType(Section.SECTION_INDIVIDUAL);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_INDIVIDUAL TROBADA");
		System.out.println(section.getImages().size());
		return "individual";
	}

	public String colectiu() {
		log.info("Carregant secci— Section.SECTION_COLECTIU");
		section = this.sm.getSectionByType(Section.SECTION_COLECTIU);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setHasContents(true);
			section.setSectionType(Section.SECTION_COLECTIU);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_COLECTIU TROBADA");
		System.out.println(section.getImages().size());
		return "colectiu";
	}

	public String publicacions() {
		log.info("Carregant secci— Section.SECTION_PUBLICACIONS");
		section = this.sm.getSectionByType(Section.SECTION_PUBLICACIONS);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setHasContents(true);
			section.setSectionType(Section.SECTION_PUBLICACIONS);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_PUBLICACIONS TROBADA");
		System.out.println(section.getImages().size());
		return "publicacions";	
	}

	public String contacte() {
		log.info("Carregant secci— Section.SECTION_CONTACTE");
		section = this.sm.getSectionByType(Section.SECTION_CONTACTE);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setHasContents(false);
			section.setSectionType(Section.SECTION_CONTACTE);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_CONTACTE TROBADA");
		return "contacte";
	}
	public String serveis() {
		log.info("Carregant secci— Section.SECTION_SERVEIS");
		section = this.sm.getSectionByType(Section.SECTION_SERVEIS);
		if (section == null) {
			log.warn("Seccio no trobada, procedint a crear-la");
			section = new Section();
			section.setHasContents(false);
			section.setSectionType(Section.SECTION_SERVEIS);
			section.setId(sm.insert(section));
			log.info("Accedint a la seccio: " + section.getId());
		} else
			log.info("Seccio SECTION_CONTACTE TROBADA");
		return "serveis";
	}
	
	public String logout(){
		if (ActionContext.getContext().getSession().containsKey("LoginToken")){
			ActionContext.getContext().getSession().remove("LoginToken");
			
			this.addActionMessage("Canvis enmagatzemats correctament");
		}
		return"login";
		
		
	}

	public String execute() {
		return "SUCCESS";
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

}
