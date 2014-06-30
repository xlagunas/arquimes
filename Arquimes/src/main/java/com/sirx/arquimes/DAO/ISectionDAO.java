package com.sirx.arquimes.DAO;

import java.util.List;

import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.Model.Section;


public interface ISectionDAO {
	public long insert(Section section);
	public Section load(long idSection);
	public void delete(long idSection);
	public List<Content> getContentsBySection(int sectionType);
	//public int deleteContentFromSection(Content c,Section section);
}
