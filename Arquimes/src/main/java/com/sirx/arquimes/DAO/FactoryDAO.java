package com.sirx.arquimes.DAO;

public class FactoryDAO {

	public FactoryDAO() {
		
	}
	public static IContentDAO getContentDAO(){
		return new ContentDAO();
	}
	
	public static ISectionDAO getSectionDAO(){
		return new SectionDAO();
	}

}
