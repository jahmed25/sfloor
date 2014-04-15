package com.sfloor.dao;

import java.io.Serializable;
import java.util.List;

public interface GenericDAO<T> {

	 List<T> loadAll();
	
	 void save(T domain);
	
	 void update(T domain);
	
	 void delete(T domain);
	
	 T get(Serializable id);
	 
	 T load(Serializable id);
	
}
