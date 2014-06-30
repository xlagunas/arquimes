package com.sirx.arquimes.DAO;

import java.util.List;

import com.sirx.arquimes.Model.Content;

public interface IContentDAO {

	public long insert(Content c);
	public Content load(long idContent);
	public void delete(long idContent);
}
