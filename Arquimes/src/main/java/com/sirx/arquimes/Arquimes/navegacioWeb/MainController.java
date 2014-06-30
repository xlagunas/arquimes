/*
 * $Id: HelloWorld.java 739661 2009-02-01 00:06:00Z davenewton $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package com.sirx.arquimes.Arquimes.navegacioWeb;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionSupport;
import com.sirx.arquimes.Bl.SectionManager;
import com.sirx.arquimes.Model.Section;

/**
 * <code>Set welcome message.</code>
 */
public class MainController extends ActionSupport {
	private Section section;
	private SectionManager sm;

	public MainController() {
		sm = new SectionManager();
	}

	public String execute() throws Exception {
		return SUCCESS;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

	public SectionManager getSm() {
		return sm;
	}

	public void setSm(SectionManager sm) {
		this.sm = sm;
	}

	public String publicacions() {
		section = sm.getSectionByType(Section.SECTION_PUBLICACIONS);
		return "publicacions";
	}

	public String contacte() {
		section = sm.getSectionByType(Section.SECTION_CONTACTE);
		return "contacte";
	}

	public String estudi() {
		section = sm.getSectionByType(Section.SECTION_ESTUDI);
		return "estudi";
	}

	public String urbanisme() {
		section = sm.getSectionByType(Section.SECTION_URBANISME);
		return "urbanisme";
	}

	public String individual() {
		section = sm.getSectionByType(Section.SECTION_INDIVIDUAL);
		return "individual";
	}

	public String colectiu() {
		section = sm.getSectionByType(Section.SECTION_COLECTIU);
		return "colectiu";
	}

	public String enCurs() {
		section = sm.getSectionByType(Section.SECTION_ENCURS);
		return "encurs";
	}

	public String serveis() {
		section = sm.getSectionByType(Section.SECTION_SERVEIS);
		return "serveis";
	}

	public String intro() {
		section = sm.getSectionByType(Section.SECTION_INICI);
		return "intro";
	}
	
	public String actualitat(){
		section = sm.getSectionByType(Section.SECTION_ACTUALITAT);
		return "actualitat";
	}
}
