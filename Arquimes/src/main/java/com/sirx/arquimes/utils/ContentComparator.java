package com.sirx.arquimes.utils;

import java.util.Comparator;

import com.sirx.arquimes.Model.Content;

public class ContentComparator implements Comparator<Content>{

	public int compare(Content c1, Content c2) {
		return c2.getPrioritat() - c1.getPrioritat();
	}

}
